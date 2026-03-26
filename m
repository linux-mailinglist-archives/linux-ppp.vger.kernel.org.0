Return-Path: <linux-ppp+bounces-445-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDNyO0PsxGm+5AQAu9opvQ
	(envelope-from <linux-ppp+bounces-445-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:20:19 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00F3312B5
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 09:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F351306B094
	for <lists+linux-ppp@lfdr.de>; Thu, 26 Mar 2026 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EB639891E;
	Thu, 26 Mar 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM+c+E7s"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B433AD513
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512708; cv=none; b=oaV/MhfQITyLJwqAkUz96Er7DTOr8teYv7wxkWCnee0iC3aZG4FN3RNoyhX8na4kzjL04K4PZ9U61vkRmoJW4SuHy1pBebv/F1lP0yMD/Z7eeevZM+b94rUavJ02PJpmiy+cr6kQz/34VehprxgxL1lEtNoraQmHsbFVIXXbPhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512708; c=relaxed/simple;
	bh=HYHW9Q6b8pBslqEf0ZSiMs39dOa8S6wj4vZ/YmVCrAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nw/nGK1CC1Svypz1stAi9jnc2UccO2Nyj1AklZUftodcHvKuATVlD1WR7B0miqN74WA14z82vwIRdBmAiJjd83jXHPoqc5tyNmgxHu3oE4dHP91QE60Ppk9vAvL2QQPWIFKg5Rpb5hVRExWdC7BTxX9oeHqckEly6gRlhjUMmVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM+c+E7s; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9841aecf72so81269866b.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512705; x=1775117505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK40iq5Ka5qBY785P0fngLXH8ht5EarxLaoQk9m0Whs=;
        b=sM+c+E7sFFFIGXK78LWYOdy3KGocbNthH79nNs894EN2gF9mxmeWwE0la39BcMBFbi
         eIYqiuAwVE8IuUlPAh4YP2r9Nr4vKS5t5cCzwgDfyyviIY5OVjiOMlGYUQuvSchAdTKH
         BeOb5XiU6Xqpz5webrShQEsfR2iZV6VmbytOqFm6jGoBdFSfM6lPuBSyLj7IFfIP7xm/
         Ht+8d/76lhXZo91Pj80tQEQr9bC2rwh8oUCpJomgS7bKUXldtyFrRZqYK/yxGMJKtpvO
         XKmqsZXdqaQk7soGyHXAPYDo2XoUrhDOvjZ7ZhcbpZr/Oiyp/Z4XeneWhn/dmsI6AD9u
         LOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512705; x=1775117505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fK40iq5Ka5qBY785P0fngLXH8ht5EarxLaoQk9m0Whs=;
        b=qBrK2ASNIbLmMTK3M5ucTWUs63gz48smOPGMCxiAxeUN/8hkcGKxZUKYCMQDhQ6CRs
         uGI5ShrEhWy5n+hMNGLZi/UgmVd9GL90lrzEGk0Ho6g3iXlM5+PV5WQlcOOfCsK88QXN
         ZLE+DL7wE9zESWTWmX0DH/BzJfPwSqkBiDKz1Vi2OfcMqTzXx7QqNL6F/A7X2SePRxDP
         D90fOIq38v980nonpTBooIKdwAgYYQReaSousXHNy2lPXbJ6hDqCJbDjU8P7XvUJgsuO
         a5QQIucWld/IBV919E94i8Z7huYxS4eU2lf2xC7fvpR6qnoFmslxBmkf4Xot1EiiebQ1
         VWtA==
X-Gm-Message-State: AOJu0Yzae5SP5PMjIiI+j55ZhUsxEqpEGcB0/2VtvqAko7DtVVcD6zBY
	P7X+5An4aQrwMB0mHuAWkDdmF4foHCpbU+TW64LY698x9e8EINFCa3rd
X-Gm-Gg: ATEYQzy806uqmznVM/Tv/o6rhN6/hTDI7E8QG4OdsnbFcNeKdRm5uTbxk0+95J+3fuH
	vLbnBRngESLSTqSwU6bJiX2Ze1d3wMZo+tPZNm8pIrDIOliarVxw0FotXpnSZJFzjE0YVLVfHQP
	3w+zhbmZezb8vxH8s6B54DLd9obFMJHnCNRcjPZEkEmuelK6Z9a774h1kCqrVfzGmKS+VyF9NKJ
	NL2cqX3muRShgiHTn09xaoVONfbMMKemJ/fK7KnOx75mrZSOlg8UsZsTrART8G1g6fqtupIAGjO
	Ge1mouAM92PEq+HCcM+fyDnIu8RIS4y9OovSujvWEKpyFVL+ivl7WsvHHLRgCUdg5ViiyJKzvsY
	1JUd5G7/zvpas6UXz24z7JUJ1i5ggWRH6IRLxHR/F268tyrZAtm/6iQXfajz91h9GbY00qHROZT
	gOpg==
X-Received: by 2002:a17:907:7b9d:b0:b98:8f24:b774 with SMTP id a640c23a62f3a-b9b0ef46a82mr448690766b.24.1774512704945;
        Thu, 26 Mar 2026 01:11:44 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e23:270f::3e4:5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267436sm82174666b.26.2026.03.26.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:44 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	Anubhav Singh <anubhavsinggh@google.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Subject: [RFC PATCH net-next v6 2/2] selftests: net: test PPPoE packets in gro.sh
Date: Thu, 26 Mar 2026 16:11:18 +0800
Message-ID: <20260326081127.61229-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326081127.61229-1-dqfext@gmail.com>
References: <20260326081127.61229-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-445-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,nvidia.com,gmail.com,nokia-bell-labs.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A00F3312B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PPPoE test-cases to the GRO selftest.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v6: new patch

I'm not sure if I should include all the existing IPv4/v6 tests for
PPPoE. There are tests that hardcode ETH_HLEN as the NH offset, which
are meant to test the L3 protocol, not the underlying protocol, and
changing all of them seems too invasive.

Comments welcome, thanks.
---
 tools/testing/selftests/drivers/net/config |  2 +
 tools/testing/selftests/drivers/net/gro.py | 25 +++++-
 tools/testing/selftests/net/lib/gro.c      | 97 ++++++++++++++++------
 3 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index 77ccf83d87e0..caaba209ba3e 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -7,4 +7,6 @@ CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETCONSOLE_EXTENDED_LOG=y
 CONFIG_NETDEVSIM=m
+CONFIG_PPP=y
+CONFIG_PPPOE=y
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 70709bf670c7..eb8306a8f4c4 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -186,8 +186,17 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
 
     dmac = _resolve_dmac(cfg, ipver)
 
-    base_args = [
-        f"--{protocol}",
+    if protocol.startswith("pppoe"):
+        base_args = [
+            f"--ipv{protocol[-1]}",
+            "--pppoe",
+        ]
+    else:
+        base_args = [
+            f"--{protocol}",
+        ]
+
+    base_args += [
         f"--dmac {dmac}",
         f"--smac {cfg.remote_dev['address']}",
         f"--daddr {cfg.addr_v[ipver]}",
@@ -322,6 +331,18 @@ def _gro_variants():
                 for test_name in ipv6_tests:
                     yield mode, protocol, test_name
 
+    for mode in ["sw"]:
+        for protocol in ["pppoev4", "pppoev6"]:
+            for test_name in common_tests:
+                yield mode, protocol, test_name
+
+            if protocol == "pppoev4":
+                for test_name in ipv4_tests:
+                    yield mode, protocol, test_name
+            elif protocol == "pppoev6":
+                for test_name in ipv6_tests:
+                    yield mode, protocol, test_name
+
 
 @ksft_variants(_gro_variants())
 def test(cfg, mode, protocol, test_name):
diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 3e611ae25f61..6148bcdff478 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -64,12 +64,14 @@
 #include <errno.h>
 #include <error.h>
 #include <getopt.h>
+#include <net/ethernet.h>
+#include <net/if.h>
 #include <linux/filter.h>
 #include <linux/if_packet.h>
+#include <linux/if_pppox.h>
 #include <linux/ipv6.h>
 #include <linux/net_tstamp.h>
-#include <net/ethernet.h>
-#include <net/if.h>
+#include <linux/ppp_defs.h>
 #include <netinet/in.h>
 #include <netinet/ip.h>
 #include <netinet/ip6.h>
@@ -92,11 +94,11 @@
 #define START_SEQ 100
 #define START_ACK 100
 #define ETH_P_NONE 0
-#define TOTAL_HDR_LEN (ETH_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
+#define TOTAL_HDR_LEN (ETH_HLEN + PPPOE_SES_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
 #define MSS (4096 - sizeof(struct tcphdr) - sizeof(struct ipv6hdr))
 #define MAX_PAYLOAD (IP_MAXPACKET - sizeof(struct tcphdr) - sizeof(struct ipv6hdr))
 #define NUM_LARGE_PKT (MAX_PAYLOAD / MSS)
-#define MAX_HDR_LEN (ETH_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
+#define MAX_HDR_LEN (ETH_HLEN + PPPOE_SES_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
 #define MIN_EXTHDR_SIZE 8
 #define EXT_PAYLOAD_1 "\x00\x00\x00\x00\x00\x00"
 #define EXT_PAYLOAD_2 "\x11\x11\x11\x11\x11\x11"
@@ -129,6 +131,7 @@ static int tcp_offset = -1;
 static int total_hdr_len = -1;
 static int ethhdr_proto = -1;
 static bool ipip;
+static bool pppoe;
 static uint64_t txtime_ns;
 static int num_flows = 4;
 static bool order_check;
@@ -148,12 +151,37 @@ static void vlog(const char *fmt, ...)
 	}
 }
 
+static void fill_pppoelayer(void *buf, int payload_len)
+{
+	struct pppoe_ppp_hdr {
+		struct pppoe_hdr eh;
+		__be16 proto;
+	} *ph = buf;
+	int ppp_payload_len;
+
+	ph->eh.type = 1;
+	ph->eh.ver = 1;
+	ph->eh.code = 0;
+	ph->eh.sid = htons(0x1234);
+
+	if (proto == PF_INET6) {
+		ph->proto = htons(PPP_IPV6);
+		ppp_payload_len = sizeof(struct ipv6hdr) + sizeof(struct tcphdr) + payload_len;
+	} else {
+		ph->proto = htons(PPP_IP);
+		ppp_payload_len = sizeof(struct iphdr) + sizeof(struct tcphdr) + payload_len;
+	}
+
+	ph->eh.length = htons(ppp_payload_len + sizeof(ph->proto));
+}
+
 static void setup_sock_filter(int fd)
 {
 	const int dport_off = tcp_offset + offsetof(struct tcphdr, dest);
 	const int ethproto_off = offsetof(struct ethhdr, h_proto);
 	int optlen = 0;
 	int ipproto_off, opt_ipproto_off;
+	int head_len = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
 	int next_off;
 
 	if (ipip)
@@ -162,7 +190,7 @@ static void setup_sock_filter(int fd)
 		next_off = offsetof(struct iphdr, protocol);
 	else
 		next_off = offsetof(struct ipv6hdr, nexthdr);
-	ipproto_off = ETH_HLEN + next_off;
+	ipproto_off = head_len + next_off;
 
 	/* Overridden later if exthdrs are used: */
 	opt_ipproto_off = ipproto_off;
@@ -178,7 +206,7 @@ static void setup_sock_filter(int fd)
 
 		/* same size for HBH and Fragment extension header types */
 		optlen = MIN_EXTHDR_SIZE;
-		opt_ipproto_off = ETH_HLEN + sizeof(struct ipv6hdr)
+		opt_ipproto_off = head_len + sizeof(struct ipv6hdr)
 			+ offsetof(struct ip6_ext, ip6e_nxt);
 	}
 
@@ -390,6 +418,10 @@ static void create_packet(void *buf, int seq_offset, int ack_offset,
 				  IPPROTO_IPIP);
 		fill_networklayer(buf + ETH_HLEN + sizeof(struct iphdr),
 				  payload_len, IPPROTO_TCP);
+	} else if (pppoe) {
+		fill_pppoelayer(buf + ETH_HLEN, payload_len);
+		fill_networklayer(buf + ETH_HLEN + PPPOE_SES_HLEN,
+				  payload_len, IPPROTO_TCP);
 	} else {
 		fill_networklayer(buf + ETH_HLEN, payload_len, IPPROTO_TCP);
 	}
@@ -501,7 +533,7 @@ static void send_flags(int fd, struct sockaddr_ll *daddr, int psh, int syn,
 static void send_data_pkts(int fd, struct sockaddr_ll *daddr,
 			   int payload_len1, int payload_len2)
 {
-	static char buf[ETH_HLEN + IP_MAXPACKET];
+	static char buf[ETH_HLEN + PPPOE_SES_HLEN + IP_MAXPACKET];
 
 	create_packet(buf, 0, 0, payload_len1, 0);
 	write_packet(fd, buf, total_hdr_len + payload_len1, daddr);
@@ -745,7 +777,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
 	memcpy(optpkt + tcp_offset + optlen, buf + tcp_offset,
 	       sizeof(struct tcphdr) + PAYLOAD_LEN);
 
-	iph = (struct iphdr *)(optpkt + ETH_HLEN);
+	iph = (struct iphdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 	iph->ihl = 5 + (optlen / 4);
 	iph->tot_len = htons(ntohs(iph->tot_len) + optlen);
 	iph->check = 0;
@@ -755,7 +787,7 @@ static void add_ipv4_ts_option(void *buf, void *optpkt)
 static void add_ipv6_exthdr(void *buf, void *optpkt, __u8 exthdr_type, char *ext_payload)
 {
 	struct ipv6_opt_hdr *exthdr = (struct ipv6_opt_hdr *)(optpkt + tcp_offset);
-	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN);
+	struct ipv6hdr *iph = (struct ipv6hdr *)(optpkt + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 	char *exthdr_payload_start = (char *)(exthdr + 1);
 
 	exthdr->hdrlen = 0;
@@ -908,7 +940,7 @@ static void send_ip_options(int fd, struct sockaddr_ll *daddr)
 static void send_fragment4(int fd, struct sockaddr_ll *daddr)
 {
 	static char buf[IP_MAXPACKET];
-	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN);
+	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 	int pkt_size = total_hdr_len + PAYLOAD_LEN;
 
 	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);
@@ -920,7 +952,8 @@ static void send_fragment4(int fd, struct sockaddr_ll *daddr)
 	 */
 	memset(buf + total_hdr_len, 'a', PAYLOAD_LEN * 2);
 	fill_transportlayer(buf + tcp_offset, PAYLOAD_LEN, 0, PAYLOAD_LEN * 2, 0);
-	fill_networklayer(buf + ETH_HLEN, PAYLOAD_LEN, IPPROTO_TCP);
+	fill_networklayer(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0),
+			  PAYLOAD_LEN, IPPROTO_TCP);
 	fill_datalinklayer(buf);
 
 	iph->frag_off = htons(0x6000); // DF = 1, MF = 1
@@ -934,7 +967,7 @@ static void send_changed_ttl(int fd, struct sockaddr_ll *daddr)
 {
 	int pkt_size = total_hdr_len + PAYLOAD_LEN;
 	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
-	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN);
+	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 
 	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);
 	write_packet(fd, buf, pkt_size, daddr);
@@ -951,8 +984,8 @@ static void send_changed_tos(int fd, struct sockaddr_ll *daddr)
 {
 	int pkt_size = total_hdr_len + PAYLOAD_LEN;
 	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
-	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN);
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buf + ETH_HLEN);
+	struct iphdr *iph = (struct iphdr *)(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 
 	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);
 	write_packet(fd, buf, pkt_size, daddr);
@@ -980,7 +1013,8 @@ static void send_changed_ECN(int fd, struct sockaddr_ll *daddr)
 
 	create_packet(buf, PAYLOAD_LEN, 0, PAYLOAD_LEN, 0);
 	if (proto == PF_INET) {
-		buf[ETH_HLEN + 1] ^= 0x2; // ECN set to 10
+		int ecn_off = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0) + 1;
+		buf[ecn_off] ^= 0x2; // ECN set to 10
 		iph->check = 0;
 		iph->check = checksum_fold(iph, sizeof(struct iphdr), 0);
 	} else {
@@ -995,7 +1029,7 @@ static void send_fragment6(int fd, struct sockaddr_ll *daddr)
 	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
 	static char extpkt[MAX_HDR_LEN + PAYLOAD_LEN +
 			   sizeof(struct ip6_frag)];
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buf + ETH_HLEN);
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buf + ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0));
 	struct ip6_frag *frag = (void *)(extpkt + tcp_offset);
 	int extlen = sizeof(struct ip6_frag);
 	int bufpkt_len = total_hdr_len + PAYLOAD_LEN;
@@ -1073,9 +1107,10 @@ static void recv_error(int fd, int rcv_errno)
 static void check_recv_pkts(int fd, int *correct_payload,
 			    int correct_num_pkts)
 {
-	static char buffer[IP_MAXPACKET + ETH_HLEN + 1];
-	struct iphdr *iph = (struct iphdr *)(buffer + ETH_HLEN);
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + ETH_HLEN);
+	static char buffer[IP_MAXPACKET + ETH_HLEN + PPPOE_SES_HLEN + 1];
+	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
+	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);
 	struct tcphdr *tcph;
 	bool bad_packet = false;
 	int tcp_ext_len = 0;
@@ -1092,7 +1127,7 @@ static void check_recv_pkts(int fd, int *correct_payload,
 
 	while (1) {
 		ip_ext_len = 0;
-		pkt_size = recv(fd, buffer, IP_MAXPACKET + ETH_HLEN + 1, 0);
+		pkt_size = recv(fd, buffer, sizeof(buffer), 0);
 		if (pkt_size < 0)
 			recv_error(fd, errno);
 
@@ -1134,9 +1169,10 @@ static void check_recv_pkts(int fd, int *correct_payload,
 
 static void check_capacity_pkts(int fd)
 {
-	static char buffer[IP_MAXPACKET + ETH_HLEN + 1];
-	struct iphdr *iph = (struct iphdr *)(buffer + ETH_HLEN);
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + ETH_HLEN);
+	static char buffer[IP_MAXPACKET + ETH_HLEN + PPPOE_SES_HLEN + 1];
+	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
+	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);
 	int num_pkt = 0, num_coal = 0, pkt_idx;
 	const char *fail_reason = NULL;
 	int flow_order[num_flows * 2];
@@ -1154,7 +1190,7 @@ static void check_capacity_pkts(int fd)
 
 	while (total_data < num_flows * CAPACITY_PAYLOAD_LEN * 2) {
 		ip_ext_len = 0;
-		pkt_size = recv(fd, buffer, IP_MAXPACKET + ETH_HLEN + 1, 0);
+		pkt_size = recv(fd, buffer, sizeof(buffer), 0);
 		if (pkt_size < 0)
 			recv_error(fd, errno);
 
@@ -1645,6 +1681,7 @@ static void parse_args(int argc, char **argv)
 		{ "ipv4", no_argument, NULL, '4' },
 		{ "ipv6", no_argument, NULL, '6' },
 		{ "ipip", no_argument, NULL, 'e' },
+		{ "pppoe", no_argument, NULL, 'p' },
 		{ "num-flows", required_argument, NULL, 'n' },
 		{ "rx", no_argument, NULL, 'r' },
 		{ "saddr", required_argument, NULL, 's' },
@@ -1671,6 +1708,9 @@ static void parse_args(int argc, char **argv)
 			proto = PF_INET;
 			ethhdr_proto = htons(ETH_P_IP);
 			break;
+		case 'p':
+			pppoe = true;
+			break;
 		case 'd':
 			addr4_dst = addr6_dst = optarg;
 			break;
@@ -1715,6 +1755,15 @@ int main(int argc, char **argv)
 	if (ipip) {
 		tcp_offset = ETH_HLEN + sizeof(struct iphdr) * 2;
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
+	} else if (pppoe) {
+		if (proto == PF_INET)
+			tcp_offset = ETH_HLEN + PPPOE_SES_HLEN + sizeof(struct iphdr);
+		else if (proto == PF_INET6)
+			tcp_offset = ETH_HLEN + PPPOE_SES_HLEN + sizeof(struct ipv6hdr);
+		else
+			error(1, 0, "Protocol family is not ipv4 or ipv6");
+		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
+		ethhdr_proto = htons(ETH_P_PPP_SES);
 	} else if (proto == PF_INET) {
 		tcp_offset = ETH_HLEN + sizeof(struct iphdr);
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
-- 
2.43.0


