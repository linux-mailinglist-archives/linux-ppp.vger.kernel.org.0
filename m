Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DBB49F801
	for <lists+linux-ppp@lfdr.de>; Fri, 28 Jan 2022 12:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348080AbiA1LM7 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 28 Jan 2022 06:12:59 -0500
Received: from avasout-peh-002.plus.net ([212.159.14.18]:36739 "EHLO
        avasout-peh-002.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348016AbiA1LM7 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 28 Jan 2022 06:12:59 -0500
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jan 2022 06:12:58 EST
Received: from eridani.co.uk ([80.229.22.202])
        by smtp with ESMTP
        id DP4FnSaME62fnDP4HnsbUT; Fri, 28 Jan 2022 11:05:25 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=QMYL+iHL c=1 sm=1 tr=0 ts=61f3cdf5
 a=bO/0ZkoMyjkM0TH5D5b4lw==:117 a=bO/0ZkoMyjkM0TH5D5b4lw==:17
 a=IkcTkHD0fZMA:10 a=DghFqjY3_ZEA:10 a=uG_GEBPmjrQ0yI7iqjoA:9 a=QEXdDO2ut3YA:10
Received: from [192.168.96.218] (AlmaVM8.int.eridani.co.uk [192.168.96.218])
        by eridani.co.uk (8.14.4/8.14.4) with ESMTP id 20SB5NfG004766
        for <linux-ppp@vger.kernel.org>; Fri, 28 Jan 2022 11:05:23 GMT
X-Clacks-Overhead: "GNU Terry Pratchett"
Message-ID: <34c707f1-1200-c17b-436e-f820617d6a6e@matrixnetwork.co.uk>
Date:   Fri, 28 Jan 2022 11:05:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To:     linux-ppp@vger.kernel.org
From:   Michael McConnell <mike@matrixnetwork.co.uk>
Subject: [PATCH] Multi-factor authentication plugin hook
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNcOeT5rMfUVs704mHj8kTQ91Pgcz8EQsGUg3Z0Z35uMMGss0Y9kNz6f1uud2QZU7Jx3TlYsB0VAK/1RvZqKCDs/qVRyCS83h/Uw/lLBdituo6OGDgzM
 pJQ2ELOmfxvixAzl5JKZl82YXTFhbLldd/UqxVnvZNpymzaiMihZpfORYBfmKDVVF1yPcJuG1XwrwlqARvBFZCHsAI7fH3Cb6KQ=
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hi,

This patch introduces a plugin for MFA support for PPP servers.

This initial version has only been tested for CHAP logins, as that is
what we are using at work thus what I can test.  It is in production use
on our L2TP VPN server with a plugin that calls out to Duo.  It will
likely require expanding to cover all client-to-server authentication
paths.

The idea here is simple, for a MFA platform that just requires the
username being authenticated, this allows a plugin that will go off and
do this. Unlike the existing authentication hooks, this is enabled for
server-side use.

It won't work with those MFAs that require a one-time password to be 
entered in addition to the regular password, but does work for those 
that push an authentication request to an app on a mobile phone.

I am sharing this in the off-chance that it might be useful to somebody.

Michael McConnell
Fri 28 Jan 2022

diff -urN ppp-2.4.9.orig/pppd/auth.c ppp-2.4.9/pppd/auth.c
--- ppp-2.4.9.orig/pppd/auth.c  2021-01-04 23:06:37.000000000 +0000
+++ ppp-2.4.9/pppd/auth.c       2022-01-28 10:47:21.190270504 +0000
@@ -202,6 +202,9 @@

  int (*allowed_address_hook)(u_int32_t addr) = NULL;

+/* Hook for a plugin to perform MFA given the user/client name */
+int (*auth_mfa_hook) __P((char *mfauser)) = NULL;
+
  #ifdef HAVE_MULTILINK
  /* Hook for plugin to hear when an interface joins a multilink bundle */
  void (*multilink_join_hook)(void) = NULL;
@@ -1454,6 +1457,10 @@
      slprintf(user, sizeof(user), "%.*v", userlen, auser);
      *msg = "";

+    /* Try MFA, if the plugin returns nonzero we fail to authenticate */
+    if (auth_mfa_hook)
+      if ( (*auth_mfa_hook)(user) ) return UPAP_AUTHNAK;
+
      /*
       * Check if a plugin wants to handle this.
       */
@@ -1812,6 +1819,10 @@
             free_wordlist(addrs);
      }

+    /* Try MFA, if the plugin returns nonzero we fail to authenticate */
+    if (auth_mfa_hook)
+      if ( (*auth_mfa_hook)(client) ) return 0;
+
      len = strlen(secbuf);
      if (len > MAXSECRETLEN) {
         error("Secret for %s on %s is too long", client, server);
diff -urN ppp-2.4.9.orig/pppd/pppd.h ppp-2.4.9/pppd/pppd.h
--- ppp-2.4.9.orig/pppd/pppd.h  2021-01-04 23:06:37.000000000 +0000
+++ ppp-2.4.9/pppd/pppd.h       2022-01-28 10:47:21.192289610 +0000
@@ -767,6 +767,9 @@
  extern int (*eaptls_passwd_hook)(char *user, char *passwd);
  #endif

+/* Hook for a plugin to perform MFA given the user/client name */
+extern int (*auth_mfa_hook) __P((char *mfauser));
+
  /* Let a plugin snoop sent and received packets.  Useful for L2TP */
  extern void (*snoop_recv_hook)(unsigned char *p, int len);
  extern void (*snoop_send_hook)(unsigned char *p, int len);
