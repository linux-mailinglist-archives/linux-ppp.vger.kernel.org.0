Return-Path: <linux-ppp+bounces-341-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D7B27577
	for <lists+linux-ppp@lfdr.de>; Fri, 15 Aug 2025 04:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7D8D166DC3
	for <lists+linux-ppp@lfdr.de>; Fri, 15 Aug 2025 02:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E551C8611;
	Fri, 15 Aug 2025 02:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8DCrLtq"
X-Original-To: linux-ppp@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F44A935;
	Fri, 15 Aug 2025 02:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755223733; cv=none; b=h/a0n2VyVbDi3Z9E9gx6WfVRPYD9MXSTDKz/fIZ6WFhACUi83h5wY39EJmuvFYofHkcTEgS6NLy4Zb1pBpKTrxAP76JVi2fCOcdrvFeCWqHFIvuJK+5nyBhD0OxzjVVcCJHPWLttokXBEMj0ypcTpdalzy3P/Q1OMBL0LYDyy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755223733; c=relaxed/simple;
	bh=FNXnIg8fVlwFNPLB5QhtFOXM6wY9vg2/Oo3hwRXvnFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WgB1weFtXQ5HKtn6kfWfPWITH2lS6RCn7soQRh0JMkimNYQdPPC+bvewjD+QRiYGphWXiQ4ZOXI8ck/xszW55CDxI7cbGtvQh+3IksmK2iVjv3DoKnDfHU/rJksAfpsQw2k+TyEIWUnTMcHg+sjRrAA1Dczrls2LZVEn2J7qxFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8DCrLtq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E56C4CEED;
	Fri, 15 Aug 2025 02:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755223733;
	bh=FNXnIg8fVlwFNPLB5QhtFOXM6wY9vg2/Oo3hwRXvnFw=;
	h=From:To:Cc:Subject:Date:From;
	b=D8DCrLtq72WpFIIgOwVBHddnIBgEEDD0ed5U3QBKIq0suD6inGhC7jUG/XzRcW8Bi
	 AiUoWQDHyjHwHF1OIIr+bN/X790xpwQmxqyxyCo9whQpY/OdJeh4JvOMP2vGEvuvC+
	 SV9NyuZquezuds2IZGHc9GL2CzUOwkMwTbICJA3tF8ctuQG/3SVlvslJVKyHicOe5I
	 fz2oyinLvpPB2OcOZyQn4dxWP+5uGV4TYOXWxxKloFk/TRWBosW80FHFbj8dpa5hD5
	 pkZZHiTAIjwylbXur+rMBpOi8qHd0FcXY4EBmbGP2OcppQOeatA6AQBBA6aG8BYqme
	 lc+CXff5GDc4w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH net-next] ppp: mppe: Use SHA-1 library instead of crypto_shash
Date: Thu, 14 Aug 2025 19:07:05 -0700
Message-ID: <20250815020705.23055-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that a SHA-1 library API is available, use it instead of
crypto_shash.  This is simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/ppp/Kconfig    |   3 +-
 drivers/net/ppp/ppp_mppe.c | 108 +++++++------------------------------
 2 files changed, 19 insertions(+), 92 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index 8c9ed1889d1af..a1806b4b84beb 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -83,13 +83,12 @@ config PPP_FILTER
 	  If unsure, say N.
 
 config PPP_MPPE
 	tristate "PPP MPPE compression (encryption)"
 	depends on PPP
-	select CRYPTO
-	select CRYPTO_SHA1
 	select CRYPTO_LIB_ARC4
+	select CRYPTO_LIB_SHA1
 	help
 	  Support for the MPPE Encryption protocol, as employed by the
 	  Microsoft Point-to-Point Tunneling Protocol.
 
 	  See http://pptpclient.sourceforge.net/ for information on
diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index bcc1eaedf58fb..630cbf71c147b 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -41,11 +41,11 @@
  *                    MOD_DEC_USAGE_COUNT/MOD_INC_USAGE_COUNT which are
  *                    deprecated in 2.6
  */
 
 #include <crypto/arc4.h>
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 #include <linux/err.h>
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -53,11 +53,10 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/ppp_defs.h>
 #include <linux/ppp-comp.h>
-#include <linux/scatterlist.h>
 #include <linux/unaligned.h>
 
 #include "ppp_mppe.h"
 
 MODULE_AUTHOR("Frank Cusack <fcusack@fcusack.com>");
@@ -65,35 +64,19 @@ MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
 MODULE_VERSION("1.0.2");
 
 #define SHA1_PAD_SIZE 40
-
-/*
- * kernel crypto API needs its arguments to be in kmalloc'd memory, not in the module
- * static data area.  That means sha_pad needs to be kmalloc'd.
- */
-
-struct sha_pad {
-	unsigned char sha_pad1[SHA1_PAD_SIZE];
-	unsigned char sha_pad2[SHA1_PAD_SIZE];
-};
-static struct sha_pad *sha_pad;
-
-static inline void sha_pad_init(struct sha_pad *shapad)
-{
-	memset(shapad->sha_pad1, 0x00, sizeof(shapad->sha_pad1));
-	memset(shapad->sha_pad2, 0xF2, sizeof(shapad->sha_pad2));
-}
+static const u8 sha_pad1[SHA1_PAD_SIZE] = { 0 };
+static const u8 sha_pad2[SHA1_PAD_SIZE] = { [0 ... SHA1_PAD_SIZE - 1] = 0xF2 };
 
 /*
  * State for an MPPE (de)compressor.
  */
 struct ppp_mppe_state {
 	struct arc4_ctx arc4;
-	struct shash_desc *sha1;
-	unsigned char *sha1_digest;
+	unsigned char sha1_digest[SHA1_DIGEST_SIZE];
 	unsigned char master_key[MPPE_MAX_KEY_LEN];
 	unsigned char session_key[MPPE_MAX_KEY_LEN];
 	unsigned keylen;	/* key length in bytes             */
 	/* NB: 128-bit == 16, 40-bit == 8! */
 	/* If we want to support 56-bit,   */
@@ -128,20 +111,18 @@ struct ppp_mppe_state {
  * Key Derivation, from RFC 3078, RFC 3079.
  * Equivalent to Get_Key() for MS-CHAP as described in RFC 3079.
  */
 static void get_new_key_from_sha(struct ppp_mppe_state * state)
 {
-	crypto_shash_init(state->sha1);
-	crypto_shash_update(state->sha1, state->master_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad1,
-			    sizeof(sha_pad->sha_pad1));
-	crypto_shash_update(state->sha1, state->session_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad2,
-			    sizeof(sha_pad->sha_pad2));
-	crypto_shash_final(state->sha1, state->sha1_digest);
+	struct sha1_ctx ctx;
+
+	sha1_init(&ctx);
+	sha1_update(&ctx, state->master_key, state->keylen);
+	sha1_update(&ctx, sha_pad1, sizeof(sha_pad1));
+	sha1_update(&ctx, state->session_key, state->keylen);
+	sha1_update(&ctx, sha_pad2, sizeof(sha_pad2));
+	sha1_final(&ctx, state->sha1_digest);
 }
 
 /*
  * Perform the MPPE rekey algorithm, from RFC 3078, sec. 7.3.
  * Well, not what's written there, but rather what they meant.
@@ -169,43 +150,19 @@ static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
  * Allocate space for a (de)compressor.
  */
 static void *mppe_alloc(unsigned char *options, int optlen)
 {
 	struct ppp_mppe_state *state;
-	struct crypto_shash *shash;
-	unsigned int digestsize;
 
 	if (optlen != CILEN_MPPE + sizeof(state->master_key) ||
 	    options[0] != CI_MPPE || options[1] != CILEN_MPPE ||
 	    fips_enabled)
-		goto out;
+		return NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state == NULL)
-		goto out;
-
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash))
-		goto out_free;
-
-	state->sha1 = kmalloc(sizeof(*state->sha1) +
-				     crypto_shash_descsize(shash),
-			      GFP_KERNEL);
-	if (!state->sha1) {
-		crypto_free_shash(shash);
-		goto out_free;
-	}
-	state->sha1->tfm = shash;
-
-	digestsize = crypto_shash_digestsize(shash);
-	if (digestsize < MPPE_MAX_KEY_LEN)
-		goto out_free;
-
-	state->sha1_digest = kmalloc(digestsize, GFP_KERNEL);
-	if (!state->sha1_digest)
-		goto out_free;
+		return NULL;
 
 	/* Save keys. */
 	memcpy(state->master_key, &options[CILEN_MPPE],
 	       sizeof(state->master_key));
 	memcpy(state->session_key, state->master_key,
@@ -215,34 +172,20 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 	 * We defer initial key generation until mppe_init(), as mppe_alloc()
 	 * is called frequently during negotiation.
 	 */
 
 	return (void *)state;
-
-out_free:
-	kfree(state->sha1_digest);
-	if (state->sha1) {
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-	}
-	kfree(state);
-out:
-	return NULL;
 }
 
 /*
  * Deallocate space for a (de)compressor.
  */
 static void mppe_free(void *arg)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
-	if (state) {
-		kfree(state->sha1_digest);
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-		kfree_sensitive(state);
-	}
+
+	kfree_sensitive(state);
 }
 
 /*
  * Initialize (de)compressor state.
  */
@@ -647,42 +590,27 @@ static struct compressor ppp_mppe = {
 	.decomp_stat    = mppe_comp_stats,
 	.owner          = THIS_MODULE,
 	.comp_extra     = MPPE_PAD,
 };
 
-/*
- * ppp_mppe_init()
- *
- * Prior to allowing load, try to load the arc4 and sha1 crypto
- * libraries.  The actual use will be allocated later, but
- * this way the module will fail to insmod if they aren't available.
- */
-
 static int __init ppp_mppe_init(void)
 {
 	int answer;
-	if (fips_enabled || !crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
-		return -ENODEV;
 
-	sha_pad = kmalloc(sizeof(struct sha_pad), GFP_KERNEL);
-	if (!sha_pad)
-		return -ENOMEM;
-	sha_pad_init(sha_pad);
+	if (fips_enabled)
+		return -ENODEV;
 
 	answer = ppp_register_compressor(&ppp_mppe);
 
 	if (answer == 0)
 		printk(KERN_INFO "PPP MPPE Compression module registered\n");
-	else
-		kfree(sha_pad);
 
 	return answer;
 }
 
 static void __exit ppp_mppe_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_mppe);
-	kfree(sha_pad);
 }
 
 module_init(ppp_mppe_init);
 module_exit(ppp_mppe_cleanup);

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1


