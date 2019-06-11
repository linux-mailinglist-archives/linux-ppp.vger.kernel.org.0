Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B50DF418AD
	for <lists+linux-ppp@lfdr.de>; Wed, 12 Jun 2019 01:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407950AbfFKXJy (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Tue, 11 Jun 2019 19:09:54 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43091 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407945AbfFKXJy (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Tue, 11 Jun 2019 19:09:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so4697091wru.10
        for <linux-ppp@vger.kernel.org>; Tue, 11 Jun 2019 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTEZv0K1lF9tA5eNEQyGpuRSHV9usD2RVcNmVJMhy6c=;
        b=H1abtSRnx6N5T81k0VGsqn+9tRmk4pAbxzr3lRfQ+j4SmDl1RkrvCAE7BPiJf2lBJZ
         10kB5jUCvqgiByC3idIosbVez/e4+1xGGu3jbhAVoM16jnfoy6s+pSuZL+7LL4UMU7DF
         l7WVxRmklXxwDEqB70kmfZIM6nJrt/2gAS0srMegbNXaTOkpQjE3XpM4z4Sft9BYjOa4
         DWouJqSTlzOUS8WLONrOzU6zqEevcM596K8N8yvHeE9uzRP2jYSyE6XRIZy6ngUElYiM
         4gNqfrB0OWs2ndVVGIm4kmrxS7bMBTEW4MqWSPOhk2JcOswRG1FlM5n52JChODddugc+
         28oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTEZv0K1lF9tA5eNEQyGpuRSHV9usD2RVcNmVJMhy6c=;
        b=jpNZS+LlMhyumAI+Iu/OddzGEcSYd4TDkb442ir9euLI6vscMJ++bSQTcaXCBJBmKA
         QRDbjsWQs5CydCySdzeuXo0HiaPEkvfTi8X2tzkk8tbS+AohYANrqTYuYOXBT3k90X96
         nKz1SBaswIPi2wYJ2+33EOtEzk/Io5Gu2pIk69XBwnGIqtGreklalWDGcl9qNCVMwuen
         r6vc2+GmXKWJL3/tUdz7OljluTCUY/oJ+7BU1sFni2uskN3OOgQVuDcWcZ8GGKaU1JRG
         MAu/NrNrgcsmvDIbJIGZ84uJ9o/MQAz2vcwpgsublkVCXnR5QkZpMvzXTAjAbF9e+RpP
         EUow==
X-Gm-Message-State: APjAAAVDUMtdpl7zxAS3VlJsuMrscFXBd+gc6mPQGTZvKfniPS/pey0U
        aNDfviXNSzuhCtvM9st4iCKJIg==
X-Google-Smtp-Source: APXvYqyWkd+gPYYLCQryzFYO6QGy4fdxARQcia0hJe9jAKbAYrXm05U33E/acrw9mpr8Tx0if9y7qg==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr11440352wru.203.1560294591558;
        Tue, 11 Jun 2019 16:09:51 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:24bb:7f31:25fe:43a7])
        by smtp.gmail.com with ESMTPSA id g11sm10827813wrq.89.2019.06.11.16.09.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 16:09:50 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-crypto@vger.kernel.org
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Subject: [PATCH v4 6/7] ppp: mppe: switch to RC4 library interface
Date:   Wed, 12 Jun 2019 01:09:37 +0200
Message-Id: <20190611230938.19265-7-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611230938.19265-1-ard.biesheuvel@linaro.org>
References: <20190611230938.19265-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

The MPPE code uses the sync skcipher to invoke the ecb(arc4) skcipher,
of which only a single generic C code implementation exists. This means
that going through all the trouble of using scatterlists etc buys us
very little, and we're better off just invoking the arc4 library directly.

Note that the SHA1 shash used by this driver has several accelerated
implementations for various architectures, so retaining that part does
make sense.

Cc: linux-ppp@vger.kernel.org
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/net/ppp/Kconfig    |  3 +-
 drivers/net/ppp/ppp_mppe.c | 97 +++-----------------
 2 files changed, 15 insertions(+), 85 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index bf395df3bb37..1a2e2f7629f3 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -87,8 +87,7 @@ config PPP_MPPE
 	depends on PPP
 	select CRYPTO
 	select CRYPTO_SHA1
-	select CRYPTO_ARC4
-	select CRYPTO_ECB
+	select CRYPTO_LIB_ARC4
 	---help---
 	  Support for the MPPE Encryption protocol, as employed by the
 	  Microsoft Point-to-Point Tunneling Protocol.
diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index ff61dd8748de..de3b57d09d0c 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -42,9 +42,10 @@
  *                    deprecated in 2.6
  */
 
+#include <crypto/arc4.h>
 #include <crypto/hash.h>
-#include <crypto/skcipher.h>
 #include <linux/err.h>
+#include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -65,13 +66,6 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
 MODULE_VERSION("1.0.2");
 
-static unsigned int
-setup_sg(struct scatterlist *sg, const void *address, unsigned int length)
-{
-	sg_set_buf(sg, address, length);
-	return length;
-}
-
 #define SHA1_PAD_SIZE 40
 
 /*
@@ -95,7 +89,7 @@ static inline void sha_pad_init(struct sha_pad *shapad)
  * State for an MPPE (de)compressor.
  */
 struct ppp_mppe_state {
-	struct crypto_sync_skcipher *arc4;
+	struct arc4_ctx arc4;
 	struct shash_desc *sha1;
 	unsigned char *sha1_digest;
 	unsigned char master_key[MPPE_MAX_KEY_LEN];
@@ -154,24 +148,11 @@ static void get_new_key_from_sha(struct ppp_mppe_state * state)
  */
 static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
 {
-	struct scatterlist sg_in[1], sg_out[1];
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, state->arc4);
-
-	skcipher_request_set_sync_tfm(req, state->arc4);
-	skcipher_request_set_callback(req, 0, NULL, NULL);
-
 	get_new_key_from_sha(state);
 	if (!initial_key) {
-		crypto_sync_skcipher_setkey(state->arc4, state->sha1_digest,
-					    state->keylen);
-		sg_init_table(sg_in, 1);
-		sg_init_table(sg_out, 1);
-		setup_sg(sg_in, state->sha1_digest, state->keylen);
-		setup_sg(sg_out, state->session_key, state->keylen);
-		skcipher_request_set_crypt(req, sg_in, sg_out, state->keylen,
-					   NULL);
-		if (crypto_skcipher_encrypt(req))
-    		    printk(KERN_WARNING "mppe_rekey: cipher_encrypt failed\n");
+		arc4_setkey(&state->arc4, state->sha1_digest, state->keylen);
+		arc4_crypt(&state->arc4, state->session_key, state->sha1_digest,
+			   state->keylen);
 	} else {
 		memcpy(state->session_key, state->sha1_digest, state->keylen);
 	}
@@ -181,9 +162,7 @@ static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
 		state->session_key[1] = 0x26;
 		state->session_key[2] = 0x9e;
 	}
-	crypto_sync_skcipher_setkey(state->arc4, state->session_key,
-				    state->keylen);
-	skcipher_request_zero(req);
+	arc4_setkey(&state->arc4, state->session_key, state->keylen);
 }
 
 /*
@@ -196,7 +175,8 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 	unsigned int digestsize;
 
 	if (optlen != CILEN_MPPE + sizeof(state->master_key) ||
-	    options[0] != CI_MPPE || options[1] != CILEN_MPPE)
+	    options[0] != CI_MPPE || options[1] != CILEN_MPPE ||
+	    fips_enabled)
 		goto out;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
@@ -204,12 +184,6 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 		goto out;
 
 
-	state->arc4 = crypto_alloc_sync_skcipher("ecb(arc4)", 0, 0);
-	if (IS_ERR(state->arc4)) {
-		state->arc4 = NULL;
-		goto out_free;
-	}
-
 	shash = crypto_alloc_shash("sha1", 0, 0);
 	if (IS_ERR(shash))
 		goto out_free;
@@ -250,7 +224,6 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 		crypto_free_shash(state->sha1->tfm);
 		kzfree(state->sha1);
 	}
-	crypto_free_sync_skcipher(state->arc4);
 	kfree(state);
 out:
 	return NULL;
@@ -266,8 +239,7 @@ static void mppe_free(void *arg)
 		kfree(state->sha1_digest);
 		crypto_free_shash(state->sha1->tfm);
 		kzfree(state->sha1);
-		crypto_free_sync_skcipher(state->arc4);
-		kfree(state);
+		kzfree(state);
 	}
 }
 
@@ -366,10 +338,7 @@ mppe_compress(void *arg, unsigned char *ibuf, unsigned char *obuf,
 	      int isize, int osize)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, state->arc4);
 	int proto;
-	int err;
-	struct scatterlist sg_in[1], sg_out[1];
 
 	/*
 	 * Check that the protocol is in the range we handle.
@@ -420,21 +389,7 @@ mppe_compress(void *arg, unsigned char *ibuf, unsigned char *obuf,
 	ibuf += 2;		/* skip to proto field */
 	isize -= 2;
 
-	/* Encrypt packet */
-	sg_init_table(sg_in, 1);
-	sg_init_table(sg_out, 1);
-	setup_sg(sg_in, ibuf, isize);
-	setup_sg(sg_out, obuf, osize);
-
-	skcipher_request_set_sync_tfm(req, state->arc4);
-	skcipher_request_set_callback(req, 0, NULL, NULL);
-	skcipher_request_set_crypt(req, sg_in, sg_out, isize, NULL);
-	err = crypto_skcipher_encrypt(req);
-	skcipher_request_zero(req);
-	if (err) {
-		printk(KERN_DEBUG "crypto_cypher_encrypt failed\n");
-		return -1;
-	}
+	arc4_crypt(&state->arc4, obuf, ibuf, isize);
 
 	state->stats.unc_bytes += isize;
 	state->stats.unc_packets++;
@@ -480,10 +435,8 @@ mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *obuf,
 		int osize)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
-	SYNC_SKCIPHER_REQUEST_ON_STACK(req, state->arc4);
 	unsigned ccount;
 	int flushed = MPPE_BITS(ibuf) & MPPE_BIT_FLUSHED;
-	struct scatterlist sg_in[1], sg_out[1];
 
 	if (isize <= PPP_HDRLEN + MPPE_OVHD) {
 		if (state->debug)
@@ -610,19 +563,7 @@ mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *obuf,
 	 * Decrypt the first byte in order to check if it is
 	 * a compressed or uncompressed protocol field.
 	 */
-	sg_init_table(sg_in, 1);
-	sg_init_table(sg_out, 1);
-	setup_sg(sg_in, ibuf, 1);
-	setup_sg(sg_out, obuf, 1);
-
-	skcipher_request_set_sync_tfm(req, state->arc4);
-	skcipher_request_set_callback(req, 0, NULL, NULL);
-	skcipher_request_set_crypt(req, sg_in, sg_out, 1, NULL);
-	if (crypto_skcipher_decrypt(req)) {
-		printk(KERN_DEBUG "crypto_cypher_decrypt failed\n");
-		osize = DECOMP_ERROR;
-		goto out_zap_req;
-	}
+	arc4_crypt(&state->arc4, obuf, ibuf, 1);
 
 	/*
 	 * Do PFC decompression.
@@ -637,14 +578,7 @@ mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *obuf,
 	}
 
 	/* And finally, decrypt the rest of the packet. */
-	setup_sg(sg_in, ibuf + 1, isize - 1);
-	setup_sg(sg_out, obuf + 1, osize - 1);
-	skcipher_request_set_crypt(req, sg_in, sg_out, isize - 1, NULL);
-	if (crypto_skcipher_decrypt(req)) {
-		printk(KERN_DEBUG "crypto_cypher_decrypt failed\n");
-		osize = DECOMP_ERROR;
-		goto out_zap_req;
-	}
+	arc4_crypt(&state->arc4, obuf + 1, ibuf + 1, isize - 1);
 
 	state->stats.unc_bytes += osize;
 	state->stats.unc_packets++;
@@ -654,8 +588,6 @@ mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *obuf,
 	/* good packet credit */
 	state->sanity_errors >>= 1;
 
-out_zap_req:
-	skcipher_request_zero(req);
 	return osize;
 
 sanity_error:
@@ -728,8 +660,7 @@ static struct compressor ppp_mppe = {
 static int __init ppp_mppe_init(void)
 {
 	int answer;
-	if (!(crypto_has_skcipher("ecb(arc4)", 0, CRYPTO_ALG_ASYNC) &&
-	      crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC)))
+	if (fips_enabled || !crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
 		return -ENODEV;
 
 	sha_pad = kmalloc(sizeof(struct sha_pad), GFP_KERNEL);
-- 
2.20.1

