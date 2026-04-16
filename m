Return-Path: <linux-ppp+bounces-535-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNJsHZue4GlKkQAAu9opvQ
	(envelope-from <linux-ppp+bounces-535-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 10:32:27 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DE40B94E
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 10:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDD03180DDE
	for <lists+linux-ppp@lfdr.de>; Thu, 16 Apr 2026 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED7A3921C0;
	Thu, 16 Apr 2026 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IzYa+5vX"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B0839150D
	for <linux-ppp@vger.kernel.org>; Thu, 16 Apr 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328052; cv=none; b=F2mWJ4khkVs1/Vut0xWupxk/E3Db6q8k5CPAgm6N5qWFx/VlGxgOgSeB36As2104Sr5sSeAlPxxjuJ5X+NzBUWn6xZkeiXsYak8maF+U4LIKPNoF2FoVJ31f9NthEddE8MYui/Hgga7eTA/PtupmoL9hqTr6kwzKnVmthS0E/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328052; c=relaxed/simple;
	bh=O0kNZNME6liz/PDiFhx17G1oocdPgEZotIhQ2QvF/Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svUVPCmj0DzefaGIBS5SqaEgJvtIRowvk8hPsaioHkO8ZFAxXUnyzVXhhuA9/37U1obVW/PJS7BwpUKnuzKoHXK/RxlFmSlwoP6nchP6htoCJhrogwG9jOlgtEjpmQ5Z6VIku7mSvnh+rsRhj9U+MzJXOAHIYmS5v9Qz7VO96GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IzYa+5vX; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776328049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psV3t89J4TYPxkXy1/CDffDJ8IP5u3Jv6+y4DGwPsJ4=;
	b=IzYa+5vX+NubPHSqYuQNur+6QVDn2L8utATLZdFuy2xbwDKVEyhUc3rzmZL9Bm9FfvDfL2
	oJVZvPgDhtEIuNEoX69PGyBy11dCJoHv5peGPIQgSuqqwwcElr0vUiMU8daHOqbqC1U8uL
	1yEnstsXcUT4cFkWv/VutHtrwJ5D3wY=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>,
	linux-ppp@vger.kernel.org,
	Jaco Kroon <jaco@uls.co.za>,
	James Carlson <carlsonj@workingcode.com>,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [RFC net-next 3/3] docs: update ppp_generic.rst for API changes
Date: Thu, 16 Apr 2026 16:26:46 +0800
Message-ID: <20260416082656.86963-3-qingfang.deng@linux.dev>
In-Reply-To: <20260416082656.86963-1-qingfang.deng@linux.dev>
References: <20260416082656.86963-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-535-lists,linux-ppp=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-ppp];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D60DE40B94E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new ppp_channel_conf struct and ppp_channel lifecycle
management changes.

Assisted-by: Gemini:gemini-3-flash
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 Documentation/networking/ppp_generic.rst | 33 ++++++++++--------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/Documentation/networking/ppp_generic.rst b/Documentation/networking/ppp_generic.rst
index 5a10abce5964..8d63f997fb3f 100644
--- a/Documentation/networking/ppp_generic.rst
+++ b/Documentation/networking/ppp_generic.rst
@@ -124,18 +124,19 @@ presented to the start_xmit() function contain only the 2-byte
 protocol number and the data, and the skbuffs presented to ppp_input()
 must be in the same format.
 
-The channel must provide an instance of a ppp_channel struct to
-represent the channel.  The channel is free to use the ``private`` field
-however it wishes.  The channel should initialize the ``mtu`` and
-``hdrlen`` fields before calling ppp_register_channel() and not change
-them until after ppp_unregister_channel() returns.  The ``mtu`` field
-represents the maximum size of the data part of the PPP frames, that
-is, it does not include the 2-byte protocol number.
+The channel must provide an instance of a ppp_channel_conf struct to
+describe the channel during registration.  The generic layer will
+allocate a ppp_channel struct and return a pointer to it.  The
+ppp_channel struct is opaque to the channel driver.  The ``mtu`` field
+(if multilink is enabled) represents the maximum size of the data part
+of the PPP frames, that is, it does not include the 2-byte protocol
+number.  ppp_channel_update_mtu() can be called by the channel driver
+to update the ``mtu`` field once LCP MRU negotiation is complete.
 
 If the channel needs some headroom in the skbuffs presented to it for
 transmission (i.e., some space free in the skbuff data area before the
 start of the PPP frame), it should set the ``hdrlen`` field of the
-ppp_channel struct to the amount of headroom required.  The generic
+ppp_channel_conf struct to the amount of headroom required.  The generic
 PPP layer will attempt to provide that much headroom but the channel
 should still check if there is sufficient headroom and copy the skbuff
 if there isn't.
@@ -199,20 +200,12 @@ The PPP generic layer has been designed to be SMP-safe.  Locks are
 used around accesses to the internal data structures where necessary
 to ensure their integrity.  As part of this, the generic layer
 requires that the channels adhere to certain requirements and in turn
-provides certain guarantees to the channels.  Essentially the channels
-are required to provide the appropriate locking on the ppp_channel
-structures that form the basis of the communication between the
-channel and the generic layer.  This is because the channel provides
-the storage for the ppp_channel structure, and so the channel is
-required to provide the guarantee that this storage exists and is
-valid at the appropriate times.
+provides certain guarantees to the channels.  The generic layer manages
+the ppp_channel object, ensuring it exists and is valid while the
+channel is registered.
 
 The generic layer requires these guarantees from the channel:
 
-* The ppp_channel object must exist from the time that
-  ppp_register_channel() is called until after the call to
-  ppp_unregister_channel() returns.
-
 * No thread may be in a call to any of ppp_input(), ppp_input_error(),
   ppp_output_wakeup(), ppp_channel_index() or ppp_unit_number() for a
   channel at the time that ppp_unregister_channel() is called for that
@@ -453,4 +446,4 @@ an interface unit are:
   fragments is disabled.  This ioctl is only available if the
   CONFIG_PPP_MULTILINK option is selected.
 
-Last modified: 7-feb-2002
+Last modified: 16-apr-2026
-- 
2.43.0


