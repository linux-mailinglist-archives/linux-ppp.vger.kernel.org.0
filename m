Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09C0682303
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Jan 2023 04:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjAaDuV (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 30 Jan 2023 22:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjAaDuV (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 30 Jan 2023 22:50:21 -0500
X-Greylist: delayed 455 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Jan 2023 19:50:17 PST
Received: from attila.bofh.it (attila.bofh.it [85.94.204.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2A3DBDC
        for <linux-ppp@vger.kernel.org>; Mon, 30 Jan 2023 19:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.it;
 i=@linux.it; q=dns/txt; s=attila; t=1675136557; h=date : to : subject
 : message-id : mime-version : content-type : from : from;
 bh=Ay7Xrhik9XxgHZkSBkTgQanxEX3Kz2OuHh0CcyUHVvs=;
 b=csFRLHlWlGYmB0L/u084Yiye/kPCIKqUCnUzCe6SurRXtuew2kpJ4PKW7+mox6F4HASYK
 YWGK3HQmLBZuybbo+4mmERjoU6ajZGIpMQ5itBLpp6tvE+04pX98VFAlhlZz7v9EozoDW1v
 i/uG7CGMnWGDCKVthC7VARSHOFp8dZI=
Received: by attila.bofh.it (Postfix, from userid 10)
        id 49A7117C08C2; Tue, 31 Jan 2023 04:42:37 +0100 (CET)
Received: by bongo.bofh.it (Postfix, from userid 1000)
        id E9F09529735; Tue, 31 Jan 2023 04:42:33 +0100 (CET)
Date:   Tue, 31 Jan 2023 04:42:33 +0100
To:     linux-ppp@vger.kernel.org
Subject: [PATCH] pppd: implement logging the LCP RTT
Message-ID: <Y9iOKUPqFn9zhnGa@bongo.bofh.it>
Mail-Followup-To: md@Linux.IT, linux-ppp@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FswkALvSmag/zzuy"
Content-Disposition: inline
From:   Marco d'Itri <md@Linux.IT>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NEUTRAL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org


--FswkALvSmag/zzuy
Content-Type: multipart/mixed; boundary="qStKayzJexdx1Vlt"
Content-Disposition: inline


--qStKayzJexdx1Vlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch adds the lcp-rtt-file configuration option, which instructs
pppd to add a timestamp to the data section of each LCP echo request
frame and then log their round trip time and any detected packet loss
to a circular buffer in that file.

Other programs then can asynchronously read the file and report
statistics about the line.

I am attaching as examples a simple program which dumps the content of=20
the log file and a Prometheus exporter which can be run as a CGI.

This feature was inspired by a similar one in a commercial PPP
implementation, but I have never actually seen that and I do not know
how it actually works or it was implemented.

Signed-off-by: Marco d'Itri <md@linux.it>

--=20
ciao,
Marco

--qStKayzJexdx1Vlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lcp_rtt
Content-Transfer-Encoding: quoted-printable

--- a/pppd/lcp.c
+++ b/pppd/lcp.c
@@ -47,6 +47,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#include <fcntl.h>
+#include <string.h>
+#include <time.h>
+#include <arpa/inet.h>
+#include <sys/mman.h>
=20
 #include "pppd-private.h"
 #include "options.h"
@@ -67,12 +72,18 @@
=20
 static void lcp_delayed_up(void *);
=20
+#define LCP_RTT_MAGIC 0x19450425
+#define LCP_RTT_HEADER_LENGTH 4
+#define LCP_RTT_FILE_SIZE 8192
+#define LCP_RTT_ELEMENTS (LCP_RTT_FILE_SIZE / sizeof(u_int32_t) - LCP_RTT_=
HEADER_LENGTH) / 2
+
 /*
  * LCP-related command-line options.
  */
 int	lcp_echo_interval =3D 0; 	/* Interval between LCP echo-requests */
 int	lcp_echo_fails =3D 0;	/* Tolerance to unanswered echo-requests */
 bool	lcp_echo_adaptive =3D 0;	/* request echo only if the link was idle */
+char	*lcp_rtt_file =3D NULL;	/* measure the RTT of LCP echo-requests */
 bool	lax_recv =3D 0;		/* accept control chars in asyncmap */
 bool	noendpoint =3D 0;		/* don't send/accept endpoint discriminator */
=20
@@ -152,6 +163,8 @@ static struct option lcp_option_list[] =3D
       "Set time in seconds between LCP echo requests", OPT_PRIO },
     { "lcp-echo-adaptive", o_bool, &lcp_echo_adaptive,
       "Suppress LCP echo requests if traffic was received", 1 },
+    { "lcp-rtt-file", o_string, &lcp_rtt_file,
+      "Write to this file the RTT of LCP echo requests", OPT_PRIO },
     { "lcp-restart", o_int, &lcp_fsm[0].timeouttime,
       "Set time in seconds between LCP retransmissions", OPT_PRIO },
     { "lcp-max-terminate", o_int, &lcp_fsm[0].maxtermtransmits,
@@ -197,6 +210,8 @@ lcp_options lcp_hisoptions[NUM_PPP];	/*
 static int lcp_echos_pending =3D 0;	/* Number of outstanding echo msgs */
 static int lcp_echo_number   =3D 0;	/* ID number of next echo frame */
 static int lcp_echo_timer_running =3D 0;  /* set if a timer is running */
+static int lcp_rtt_file_fd =3D 0;		/* fd for the opened LCP RTT file */
+static volatile u_int32_t *lcp_rtt_buffer =3D NULL; /* the mmap'ed LCP RTT=
 file */
=20
 static u_char nak_buffer[PPP_MRU];	/* where we construct a nak packet */
=20
@@ -2226,6 +2241,61 @@ LcpEchoTimeout (void *arg)
 }
=20
 /*
+ * lcp_rtt_update_buffer - log the RTT of the received LCP echo-request
+ *
+ * The header section at the beginning of lcp_rtt_file contains
+ * LCP_RTT_HEADER_LENGTH fields, each a u_int32_t in network byte order:
+ * [0] LCP_RTT_MAGIC
+ * [1] status (1: the file is open and is being written)
+ * [2] index of the most recently updated element
+ * [3] the value of the lcp-echo-interval parameter
+ *
+ * The header is followed by a ring buffer of LCP_RTT_ELEMENTS elements, e=
ach
+ * containing a pair of u_int32_t in network byte order with this content:
+ * [0] UNIX timestamp
+ * [1] bits 24-31: the number of lost LCP echo replies
+ *     bits 0-23:  the measured RTT in microseconds
+ *
+ * Consumers of lcp_rtt_file are expected to:
+ * - read the complete file of arbitrary lenght
+ * - check the magic number
+ * - process the data elements starting at the index
+ * - discard the last data element, i.e. the one preceding the element
+ *   referenced by the index
+ * - ignore any elements with a timestamp of 0
+ */
+static void
+lcp_rtt_update_buffer (unsigned long rtt)
+{
+    volatile u_int32_t *const ring_buffer =3D lcp_rtt_buffer
+	+ LCP_RTT_HEADER_LENGTH;
+    unsigned int next_entry, lost;
+
+    /* choose the next entry where the data will be stored */
+    if (ntohl(lcp_rtt_buffer[2]) >=3D (LCP_RTT_ELEMENTS - 1) * 2)
+	next_entry =3D 0;				/* go back to the beginning */
+    else
+	next_entry =3D ntohl(lcp_rtt_buffer[2]) + 2;	/* use the next one */
+
+    /* update the data element */
+    /* storing the timestamp in an *unsigned* long allows dates up to 2106=
 */
+    ring_buffer[next_entry] =3D htonl((u_int32_t) time(NULL));
+    lost =3D lcp_echos_pending - 1;
+    if (lost > 0xFF)
+	lost &=3D 0xFF;		/* truncate the lost packets to 256 */
+    if (rtt > 0xFFFFFF)
+	rtt &=3D 0xFFFFFF;	/* truncate the RTT to 16777216 */
+    /* use bits 24-31 for the lost packets and bits 0-23 for the RTT */
+    ring_buffer[next_entry + 1] =3D htonl((u_int32_t) ((lost << 24) + rtt)=
);
+
+    /* update the pointer to the (just updated) most current data element =
*/
+    lcp_rtt_buffer[2] =3D htonl(next_entry);
+
+    if (msync(lcp_rtt_buffer, LCP_RTT_FILE_SIZE, MS_ASYNC) < 0)
+	error("msync() for %s failed: %m", lcp_rtt_file);
+}
+
+/*
  * LcpEchoReply - LCP has received a reply to the echo
  */
=20
@@ -2246,6 +2316,30 @@ lcp_received_echo_reply (fsm *f, int id,
 	return;
     }
=20
+    if (lcp_rtt_file_fd && len >=3D 16) {
+	long lcp_rtt_magic;
+
+	/*
+	 * If the magic word is found at the beginning of the data section
+	 * of the frame then read the timestamp which follows and subtract
+	 * it from the current time to compute the round trip time.
+	 */
+	GETLONG(lcp_rtt_magic, inp);
+	if (lcp_rtt_magic =3D=3D LCP_RTT_MAGIC) {
+	    struct timespec ts;
+	    unsigned long req_sec, req_nsec, rtt;
+
+	    clock_gettime(CLOCK_MONOTONIC, &ts);
+	    GETLONG(req_sec, inp);
+	    GETLONG(req_nsec, inp);
+	    /* compute the RTT in microseconds */
+	    rtt =3D (ts.tv_sec - req_sec) * 1000000
+		+ (ts.tv_nsec / 1000 - req_nsec / 1000);
+	    /* log the RTT */
+	    lcp_rtt_update_buffer(rtt);
+	}
+    }
+
     /* Reset the number of outstanding echo frames */
     lcp_echos_pending =3D 0;
 }
@@ -2258,7 +2352,7 @@ static void
 LcpSendEchoRequest (fsm *f)
 {
     u_int32_t lcp_magic;
-    u_char pkt[4], *pktp;
+    u_char pkt[16], *pktp;
=20
     /*
      * Detect the failure of the peer at this point.
@@ -2293,11 +2387,68 @@ LcpSendEchoRequest (fsm *f)
         lcp_magic =3D lcp_gotoptions[f->unit].magicnumber;
 	pktp =3D pkt;
 	PUTLONG(lcp_magic, pktp);
+
+	/* Put a timestamp in the data section of the frame */
+	if (lcp_rtt_file_fd) {
+	    struct timespec ts;
+
+	    PUTLONG(LCP_RTT_MAGIC, pktp);
+	    clock_gettime(CLOCK_MONOTONIC, &ts);
+	    PUTLONG((u_int32_t)ts.tv_sec, pktp);
+	    PUTLONG((u_int32_t)ts.tv_nsec, pktp);
+	}
+
         fsm_sdata(f, ECHOREQ, lcp_echo_number++ & 0xFF, pkt, pktp - pkt);
 	++lcp_echos_pending;
     }
 }
=20
+static void
+lcp_rtt_open_file (void)
+{
+    if (!lcp_rtt_file)
+	return;
+
+    lcp_rtt_file_fd =3D open(lcp_rtt_file, O_RDWR | O_CREAT, 0644);
+    if (lcp_rtt_file_fd < 0) {
+	error("Can't open the RTT log file %s: %m", lcp_rtt_file);
+	lcp_rtt_file_fd =3D 0;
+	return;
+    }
+
+    if (ftruncate(lcp_rtt_file_fd, LCP_RTT_FILE_SIZE) < 0)
+	fatal("ftruncate() of %s failed: %m", lcp_rtt_file);
+    lcp_rtt_buffer =3D mmap(0, LCP_RTT_FILE_SIZE, PROT_READ | PROT_WRITE,
+	    MAP_SHARED, lcp_rtt_file_fd, 0);
+    if (lcp_rtt_buffer =3D=3D MAP_FAILED)
+	fatal("mmap() of %s failed: %m", lcp_rtt_file);
+
+    /* initialize the ring buffer */
+    if (lcp_rtt_buffer[0] !=3D htonl(LCP_RTT_MAGIC)) {
+	memset(lcp_rtt_buffer, 0, LCP_RTT_FILE_SIZE);
+	lcp_rtt_buffer[0] =3D htonl(LCP_RTT_MAGIC);
+    }
+
+    lcp_rtt_buffer[3] =3D htonl(lcp_echo_interval);
+    lcp_rtt_buffer[1] =3D htonl(1); /* status: LCP up, file opened */
+}
+
+static void
+lcp_rtt_close_file (void)
+{
+    if (!lcp_rtt_file_fd)
+	return;
+
+    lcp_rtt_buffer[1] =3D htonl(0); /* status: LCP down, file closed */
+
+    if (munmap(lcp_rtt_buffer, LCP_RTT_FILE_SIZE) < 0)
+	error("munmap() of %s failed: %m", lcp_rtt_file);
+    if (close(lcp_rtt_file_fd) < 0)
+	error("close() of %s failed: %m", lcp_rtt_file);
+    lcp_rtt_buffer =3D NULL;
+    lcp_rtt_file_fd =3D 0;
+}
+
 /*
  * lcp_echo_lowerup - Start the timer for the LCP frame
  */
@@ -2311,6 +2462,9 @@ lcp_echo_lowerup (int unit)
     lcp_echos_pending      =3D 0;
     lcp_echo_number        =3D 0;
     lcp_echo_timer_running =3D 0;
+
+    /* Open the file where the LCP RTT data will be logged */
+    lcp_rtt_open_file();
  =20
     /* If a timeout interval is specified then start the timer */
     if (lcp_echo_interval !=3D 0)
@@ -2330,4 +2484,7 @@ lcp_echo_lowerdown (int unit)
         UNTIMEOUT (LcpEchoTimeout, f);
         lcp_echo_timer_running =3D 0;
     }
+
+    /* Close the file containing the LCP RTT data */
+    lcp_rtt_close_file();
 }
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -637,6 +637,9 @@ Set the maximum number of LCP terminate-
 Set the LCP restart interval (retransmission timeout) to \fIn\fR
 seconds (default 3).
 .TP
+.B lcp\-rtt\-file \fIfilename
+Sets the file where the RTT of LCP echo-request frames will be logged.
+.TP
 .B linkname \fIname\fR
 Sets the logical name of the link to \fIname\fR.  Pppd will create a
 file named \fBppp\-\fIname\fB.pid\fR in /var/run (or /etc/ppp on some

--qStKayzJexdx1Vlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lcp_rtt_dump

#!/usr/bin/perl
# vim: shiftwidth=4 tabstop=4
#
# This program dumps to standard output the content of the file written
# by pppd's lcp-rtt-file configuration option.
#
# Copyright (C) Marco d'Itri <md@linux.it>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

use v5.14;
use warnings;
use autodie;

use POSIX qw(strftime);

{
	my $data = read_data($ARGV[0] || '/run/ppp-rtt.data');
	die "The data file is invalid!\n" if not $data;
	dump_data($data);
}

sub dump_data {
	my ($s) = @_;

	say "status:   $s->{status}";
	say "interval: $s->{echo_interval}";
	say "position: $s->{position}";
	say 'elements: ' . scalar(@{ $s->{data} });
	say '';

	foreach (my $i= 0; $i < @{ $s->{data} }; $i++) {
		my $date = strftime('%F %T', localtime($s->{data}->[$i]->[0]));
		print "$i\t$date\t$s->{data}->[$i]->[1]\t$s->{data}->[$i]->[2]\n";
	}
}

sub read_data {
	my ($file) = @_;

	my $data;
	open(my $fh, '<', $file);
	binmode($fh);
	my $bytes_read;
	do {
		$bytes_read = sysread($fh, $data, 8192, length($data));
	} while ($bytes_read == 8192);
	close($fh);

	my ($magic, $status, $position, $echo_interval, $rest)
		= unpack('NNNN a*', $data);
	return undef if $magic != 0x19450425;

	# the position is relative to the C array, not to the logical entries
	$position /= 2;

	my @rawdata = unpack('(N C a3)*', $rest);
	my @data;
	while (my ($time, $loss, $rtt) = splice(@rawdata, 0, 3)) {
		push(@data, [ $time, unpack('N', "\000$rtt"), $loss ]);
	}

	if (0) {
	# rearrange the list in chronological order
	if ($position == $#data) {
		@data = @data[1 .. $#data];
	} elsif ($position == 0) {
		@data = @data[0 .. $#data-1];
	} else {
		@data = (@data[$position+2 .. $#data], @data[0 .. $position]);
	}
	@data = grep { $_->[0] } @data;
	}

	return {
		status			=> $status,
		echo_interval	=> $echo_interval,
		position 		=> $position,
		data			=> \@data,
	};
}


--qStKayzJexdx1Vlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lcp_rtt_exporter
Content-Transfer-Encoding: quoted-printable

#!/usr/bin/perl
# vim: shiftwidth=3D4 tabstop=3D4
#
# This CGI program is a Prometheus exporter for pppd's lcp-rtt-file feature.
#
# Copyright (C) Marco d'Itri <md@linux.it>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or=20
# (at your option) any later version.

use v5.14;
use warnings;
use autodie;

use List::Util qw(sum max min);

{
	my $data =3D read_data('/run/ppp-rtt.data');
	my $stats =3D compute_statistics($data, 60);

	my $s =3D metrics($stats);

	print "Content-type: text/plain\n\n$s";
	exit;
}

sub metrics {
	my ($stats) =3D @_;

	my $s =3D <<END;
# TYPE lcp_rtt_status gauge
# HELP LCP RTT status
lcp_rtt_status $stats->{status}
END
	foreach (qw(average min max loss)) {
		next if not exists $stats->{$_};
		$s .=3D <<END;
# TYPE lcp_rtt_$_ gauge
# HELP LCP RTT $_
lcp_rtt_$_ $stats->{$_}
END
	}

	return $s;
}

sub compute_statistics {
	my ($data, $length) =3D @_;

	my $cutoff =3D time() - $length;
	my @e =3D grep { $_->[0] >=3D $cutoff } @{ $data->{data} };
	return { status =3D> -1 } if not @e; # no data

	my $average =3D (sum map { $_->[1] } @e) / scalar(@e);
	my $min =3D min map { $_->[1] } @e;
	my $max =3D max map { $_->[1] } @e;
	my $loss =3D sum map { $_->[2] } @e;

	return {
		status	=3D> $data->{status},
		average	=3D> $average,
		min		=3D> $min,
		max		=3D> $max,
		loss	=3D> $loss,
	};
}

sub read_data {
	my ($file) =3D @_;

	my $data;
	open(my $fh, '<', $file);
	binmode($fh);
	my $bytes_read;
	do {
		$bytes_read =3D sysread($fh, $data, 8192, length($data));
	} while ($bytes_read =3D=3D 8192);
	close($fh);

	my ($magic, $status, $position, $echo_interval, $rest)
		=3D unpack('NNNN a*', $data);
	return undef if $magic !=3D 0x19450425;

	# the position is relative to the C array, not to the logical entries
	$position /=3D 2;

	my @rawdata =3D unpack('(N C a3)*', $rest);
	my @data;
	while (my ($time, $loss, $rtt) =3D splice(@rawdata, 0, 3)) {
		push(@data, [ $time, unpack('N', "\000$rtt"), $loss ]);
	}

	# rearrange the list in chronological order
	if ($position =3D=3D $#data) {
		@data =3D @data[1 .. $#data];
	} elsif ($position =3D=3D 0) {
		@data =3D @data[0 .. $#data-1];
	} else {
		@data =3D (@data[$position+2 .. $#data], @data[0 .. $position]);
	}
	@data =3D grep { $_->[0] } @data;

	return {
		status			=3D> $status,
		echo_interval	=3D> $echo_interval,
		position 		=3D> $position,
		data			=3D> \@data,
	};
}


--qStKayzJexdx1Vlt--

--FswkALvSmag/zzuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQnKUXNg20437dCfobLPsM64d7XgQUCY9iOKQAKCRDLPsM64d7X
geoVAQC1FKTYx6DNBx3ZrQDpPtdbAVbaUebEyLzp0u1fdB/J6AEApD+RcUe09fep
iL4vSTKJkKMbOxICjVekPeXBa56TiwA=
=d/IB
-----END PGP SIGNATURE-----

--FswkALvSmag/zzuy--
