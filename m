Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F19619D9C5
	for <lists+linux-ppp@lfdr.de>; Fri,  3 Apr 2020 17:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403936AbgDCPJ3 (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Fri, 3 Apr 2020 11:09:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35134 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403795AbgDCPJ3 (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Fri, 3 Apr 2020 11:09:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id k21so7340546ljh.2
        for <linux-ppp@vger.kernel.org>; Fri, 03 Apr 2020 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cAFaeYGDsmE0AxmDecGH5t00dSCChyNPMxpb40DBw3k=;
        b=XBcI5MxwNnJ76eut0zJybL83q+C3zWRNFAPLVHv6fzXsu+/WiIb8t1+9M9tsn7PWXo
         6xmUpU6fuoEiTpReR42yW3EDfo46YPiiHKReOiEsLQ8n/o/V0DtHnqC2dbMq09DTkfKw
         cy3er7Prft50IEGokePMDB0EuG8sG+NiYW8OeCjnHVkEzd9Dk4sZOzs+UVpJ/ed0GOhP
         Sw38xNauu+ozzLeztDSvgI7FOwX6rNPPkFXGrowE1T1XjAqWQptLpBVQPHHBCVXtNbQL
         Du3bh1ZE66c4xMhIfGH3BI7SyN3Ze1d6VyTr74WruTKUw7+tF2hDRwfoH4DUguJDSszn
         RhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cAFaeYGDsmE0AxmDecGH5t00dSCChyNPMxpb40DBw3k=;
        b=r6/8rHo5A+Ceg/eXYU0GU8ClcrFubrnFQmwZ7zA1ltALZjnGn/Rc4znkTUCH716E5w
         /ltFsgvUjpmyz8WPpxezJnQJuNZoR0KiWqj7g/jcY5G3cViC4wQ2ZgkPgiMgxLsaIhTN
         6o+yvnRSbh0vfilH/HePPlTSgif3mboXEi4I8zuUkL73PW6Fx4ouUXpG+tzQgCtMcuhh
         JYX96Ec0lG1fBpyVUKN7xOxYzYBQKCEc5ChHNHfqaRhVpAo6hgegGVnBPBKxxK7WQQ3d
         4iTmQ2Jh4eHFd6gPiKxLEsjDpjK54S+SZ7ma/tuttc9SZgdL05rrRy9cOjUQusRI3Ro0
         +vQA==
X-Gm-Message-State: AGi0PuYTuhNBYKHBJpnDdpseR9H8luZmVOVYzNGzk8dDLekOiV8B1uJ2
        jZrEfAZ3yNdR37TKW0QnaE+crXRCVpznXl4uBNpGL9Ws
X-Google-Smtp-Source: APiQypJk4OjQGtYyr3qREX2/G13wBEC2xaq7cJBNNWub6olh7mBbGmtDWkgQiW2XK8D3Jq0DZDNGnopuBprvxbNmSS0=
X-Received: by 2002:a2e:8ec2:: with SMTP id e2mr4972671ljl.252.1585926565101;
 Fri, 03 Apr 2020 08:09:25 -0700 (PDT)
MIME-Version: 1.0
From:   Eivind Naess <enaess@gmail.com>
Date:   Fri, 3 Apr 2020 08:09:11 -0700
Message-ID: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
Subject: [PATCH] Adding EAP-MSCHAPv2 support
To:     linux-ppp@vger.kernel.org
Cc:     thomas@omerzu.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).

Author: Thomas Omerzu <thomas@omerzu.de>
Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
Bug: https://github.com/paulusmack/ppp/issues/138
Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
Pull Request: https://github.com/paulusmack/ppp/pull/139
Last-Update: 2020-02-24
Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.
---
 pppd/eap.c | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 pppd/eap.h |  12 +++++
 2 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/pppd/eap.c b/pppd/eap.c
index 082e953..7b63452 100644
--- a/pppd/eap.c
+++ b/pppd/eap.c
@@ -64,6 +64,9 @@
 #include "pathnames.h"
 #include "md5.h"
 #include "eap.h"
+#ifdef CHAPMS
+#include "chap_ms.h"
+#endif

 #ifdef USE_SRP
 #include <t_pwd.h>
@@ -1302,6 +1305,47 @@ int len, id;
 }
 #endif /* USE_SRP */

+#if CHAPMS
+/*
+ * Format and send an CHAPV2-Challenge EAP Response message.
+ */
+static void
+eap_chapv2_response(esp, id, chapid, response, user, user_len)
+eap_state *esp;
+u_char id;
+u_char chapid;
+u_char *response;
+char *user;
+int user_len;
+{
+    u_char *outp;
+    int msglen;
+
+    outp = outpacket_buf;
+
+    MAKEHEADER(outp, PPP_EAP);
+
+    PUTCHAR(EAP_RESPONSE, outp);
+    PUTCHAR(id, outp);
+    esp->es_client.ea_id = id;
+    msglen = EAP_HEADERLEN + 6 * sizeof (u_char) +
MS_CHAP2_RESPONSE_LEN + user_len;
+    PUTSHORT(msglen, outp);
+    PUTCHAR(EAPT_MSCHAPV2, outp);
+    PUTCHAR(CHAP_RESPONSE, outp);
+    PUTCHAR(chapid, outp);
+    PUTCHAR(0, outp);
+    /* len */
+    PUTCHAR(5 + user_len +MS_CHAP2_RESPONSE_LEN, outp);
+    /* len response */
+    PUTCHAR(MS_CHAP2_RESPONSE_LEN, outp)
+    BCOPY(response, outp, MS_CHAP2_RESPONSE_LEN);
+    INCPTR(MS_CHAP2_RESPONSE_LEN, outp);
+    BCOPY(user, outp, user_len);
+
+    output(esp->es_unit, outpacket_buf, PPP_HDRLEN + msglen);
+}
+#endif
+
 /*
  * eap_request - Receive EAP Request message (client mode).
  */
@@ -1461,6 +1505,97 @@ int len;
             esp->es_client.ea_namelen);
         break;

+#ifdef CHAPMS
+    case EAPT_MSCHAPV2:
+        if (len < 1) {
+            error("EAP: received short MSCHAPv2");
+            /* Bogus request; wait for something real. */
+            return;
+        }
+        unsigned char chopcode;
+        GETCHAR(chopcode, inp);
+        len--;
+        dbglog("EAP: CHAP opcode %d", chopcode);
+
+        if (chopcode==CHAP_CHALLENGE) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            unsigned char vsize;
+            GETCHAR(vsize, inp);
+            len-=4;
+
+            dbglog("EAP: chapid %d mssize %d vsize %d inplen %d,
challen %d", chapid, mssize, vsize, len, MS_CHAP2_PEER_CHAL_LEN);
+
+            unsigned char *rchallenge = calloc(1, MS_CHAP2_PEER_CHAL_LEN);
+            BCOPY(inp, rchallenge, MS_CHAP2_PEER_CHAL_LEN);
+            INCPTR(MS_CHAP2_PEER_CHAL_LEN,inp);
+
+            /*
+             * Get the secret for authenticating ourselves with
+             * the specified host.
+             */
+            if (!get_secret(esp->es_unit, esp->es_client.ea_name,
+                rhostname, secret, &secret_len, 0)) {
+                dbglog("EAP: no CHAP secret for auth to %q", rhostname);
+                eap_send_nak(esp, id, EAPT_SRP);
+                break;
+            }
+
+            char *user = calloc(1, esp->es_client.ea_namelen + 1);
+            memcpy(user, esp->es_client.ea_name, esp->es_client.ea_namelen);
+            *(user + esp->es_client.ea_namelen) = '\0';
+            dbglog("EAP: user %s, user_len %d", user,
esp->es_client.ea_namelen);
+
+            /* mschapv2 response */
+            unsigned char response[49];
+            unsigned char authResponse[41];
+            ChapMS2(rchallenge, NULL, user, secret, secret_len, response,
+                    authResponse, MS_CHAP2_AUTHENTICATEE);
+
+            eap_chapv2_response(esp, id, chapid, response,
esp->es_client.ea_name, esp->es_client.ea_namelen);
+
+            free(user);
+            free(rchallenge);
+
+        } else if (chopcode==CHAP_SUCCESS) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            len-=3;
+            dbglog("EAP: chapid %d mssize %d inplen %d", chapid, mssize, len );
+            dbglog("Chap authentication succeeded: %.*v", len, inp);
+            u_char response[1];
+            response[0]=CHAP_SUCCESS;
+            eap_send_response(esp, id, EAPT_MSCHAPV2, response, 1);
+
+        } else if (chopcode==CHAP_FAILURE) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            len-=3;
+            dbglog("EAP: chapid %d mssize %d inplen %d", chapid, mssize, len );
+            dbglog("Chap authentication failed: %.*v", len, inp);
+            u_char response[1];
+            response[0]=CHAP_FAILURE;
+            eap_send_response(esp, id, EAPT_MSCHAPV2, response, 1);
+            goto client_failure; /* force termination */
+
+        } else {
+
+            dbglog("EAP: Unknown CHAP opcode %d", chopcode);
+            eap_send_nak(esp, id, EAPT_SRP);
+        }
+
+        break;
+#endif /* CHAPMS */
+
 #ifdef USE_SRP
     case EAPT_SRP:
         if (len < 1) {
@@ -1706,16 +1841,16 @@ int len;
     }
     return;

-#ifdef USE_SRP
 client_failure:
     esp->es_client.ea_state = eapBadAuth;
     if (esp->es_client.ea_timeout > 0) {
         UNTIMEOUT(eap_client_timeout, (void *)esp);
     }
     esp->es_client.ea_session = NULL;
+#ifdef USE_SRP
     t_clientclose(tc);
-    auth_withpeer_fail(esp->es_unit, PPP_EAP);
 #endif /* USE_SRP */
+    auth_withpeer_fail(esp->es_unit, PPP_EAP);
 }

 /*
@@ -2154,7 +2289,9 @@ static char *eap_typenames[] = {
     "OTP", "Generic-Token", NULL, NULL,
     "RSA", "DSS", "KEA", "KEA-Validate",
     "TLS", "Defender", "Windows 2000", "Arcot",
-    "Cisco", "Nokia", "SRP"
+    "Cisco", "Nokia", "SRP", NULL,
+    "TTLS", "RAS", "AKA", "3COM", "PEAP",
+    "MSCHAPv2"
 };

 static int
diff --git a/pppd/eap.h b/pppd/eap.h
index 199d184..083ccfc 100644
--- a/pppd/eap.h
+++ b/pppd/eap.h
@@ -59,6 +59,18 @@ extern "C" {
 #define    EAPT_NOKIACARD        18    /* Nokia IP smart card */
 #define    EAPT_SRP        19    /* Secure Remote Password */
 /* 20 is deprecated */
+#define    EAPT_TTLS        21    /* EAP Tunneled TLS Authentication
Protocol RFC5281 */
+#define    EAPT_RAS        22    /* Remote Access Service */
+#define    EAPT_AKA        23    /* EAP method for 3rd Generation
Authentication and Key Agreement RFC4187 */
+#define    EAPT_3COM        24    /* EAP-3Com Wireless */
+#define    EAPT_PEAP        25    /* Protected EAP */
+#define    EAPT_MSCHAPV2        26    /* EAP-MSCHAPv2
RFC-draft-kamath-pppext-eap-mschapv2-02 */
+
+/* OpCodes for MSCHAPv2 */
+#define CHAP_CHALLENGE    1
+#define CHAP_RESPONSE    2
+#define CHAP_SUCCESS    3
+#define CHAP_FAILURE    4

 /* EAP SRP-SHA1 Subtypes */
 #define    EAPSRP_CHALLENGE    1    /* Request 1 - Challenge */
-- 
2.20.1
