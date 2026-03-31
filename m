Return-Path: <linux-ppp+bounces-466-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG+GGqR/y2kKIgYAu9opvQ
	(envelope-from <linux-ppp+bounces-466-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:02:44 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC0365B4E
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 10:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FB3C30382A9
	for <lists+linux-ppp@lfdr.de>; Tue, 31 Mar 2026 07:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E355F3D5666;
	Tue, 31 Mar 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhdyR2Y4"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C73BE164
	for <linux-ppp@vger.kernel.org>; Tue, 31 Mar 2026 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943698; cv=none; b=c+oDgLWkR/FGjIMAuMslmIZ642xaTETog3rDVo1jt2Qy3wm2yCseKkGXosmk8GQhOhFocqQGhSFyh/kbl3P4eVQjGL7IMeuw7nl9TYODyiR86jfR7likrFjauunrSii29DSemspAcds571E+7tPPo1c4klobkTnykr8TH+aZ8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943698; c=relaxed/simple;
	bh=5rBDUC5cYHdY+1pIOriXhYRIpO/C9pp5od6462pKwEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4hsq1jfXnC+7ScMd/vqSr72JQFhjRzLLVT+kJZGBkmdo3oOGrauqWYYgK+m7SWyxmvAl4DQumSRjYYkiZQa6wjtjBpDt87y2mnIWJLVi696pHx9qByQJ6ybUdMR0iWfisxVpaKK7248In9Cak+3P5VI0NHhgaCeH7LohhMFmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhdyR2Y4; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bb66db39dso3658273a12.0
        for <linux-ppp@vger.kernel.org>; Tue, 31 Mar 2026 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943692; x=1775548492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRlU1MXJnKrSea5cC1P8mFGQwko8gNNHu89pJ5ho6P4=;
        b=OhdyR2Y41IDuv0z9CVYVfeqFKe3Ev1uZM2qJFxVvdFnVPxLGFRCuw57qJ3aPPxMB4g
         XHobNFmXuneNkLj5S8P4nJkXzwKyyb3cG3VQ4nkaN1ZbMHjC+z02bWzO6LdPtCZLl2VB
         ls7mygAeyN4ubmNWF8RBDarwl/LiAsp3tk+2RhBFvCP5qR0EpiauqqVCuZuMomxODTGb
         bZV0miQwcOxcVVcdpC4tsgHGWHaBLOiKalegm+2xIOxRj+RDDOcSKp1EU0Zb4DqLHTVt
         ABmN6wsJ/isnJ69LyLGK5pWfz91HQEYChC1cUW0BoNIufbjpUNGazFTH9tXTcwjmncyx
         yGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943692; x=1775548492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRlU1MXJnKrSea5cC1P8mFGQwko8gNNHu89pJ5ho6P4=;
        b=jJ3u0uO+oa0vm8oAZLL24/wcvHZwpbb/c3GajsLdwwMn/hlOTnAkY7tqlKCxPtnGpE
         9qXw6bZF7ek62t+40C5twsu5jzHB3Qze+e4bG5QmcqM2RDnjaQmeiagr8x1g1zBNN+xL
         jWP5NAk86folKhQ/QY/AiP9uESe13iJbE5IYUPMhywsPiqRS+E9QHigDQmJmgUadyHIz
         4NuuxpljqzuZ7eO0LGPyPbw4/NCkx0jQxQQ/eb21PEDmeQ2wpjSqmmdW84YuS760ZdVM
         qVg9sRtbx3aPcdaDVIuNzylKAnO7j/xfoI90CosP3PuX/Qs8HZVavR9xSorYfXlHPBd1
         eEVg==
X-Gm-Message-State: AOJu0YztWrILb5akkECy2coL6NlUHyhYt7T1dp50SLTB5udV94Ea0oXR
	vFr9WZ40XVuc8lWIKLDrbR/VzPrzD9QCRycJZonDQyneqUk5ntyg2ep2F+UyYjOGND5Pjg==
X-Gm-Gg: ATEYQzxaULzLq8RB5uR/kpGMtu9m4bGorxfWQ9xRzhuo+bS7TJNylNhDdtyHAv+2+15
	+FH6ODM1PuZxs1Au0mfVRdH6J7ByBCC3tBtE/wG6n6eV6MAWlgVlD4ZXak+jRq2q9iKM2jd0K5J
	z7Yob7uI947Q9EqfYqWM/KhFtELHnl0tHXYPWGqmorFnnEwHk6XZW8+MHlS+FtevOi6TU6pbY86
	PiB9bIl735cmftoz8kQbpI0sxAmsd9e4Y0iaY5CM+LNGtbfaZcMKusncwuqtR4M+LmrvcOrJdYI
	/xeFJF5x7P5UldjgeJYEUUlAFBWosBEekKUkDz0YB9emZgZDdtDlDwo0MXudr1My+deyxc+oPYV
	9CYNr07zt/wa/GMw6UN8Xfu+EHaVIPsMV5YsC+xOmjZh7++JjZqNimDwKid2kpWcUDy8xgD38sx
	JhT0mSDY9EbMGwaCsBTA==
X-Received: by 2002:a17:907:d048:b0:b98:7f7:50f1 with SMTP id a640c23a62f3a-b9b507cad61mr1015080066b.27.1774943691739;
        Tue, 31 Mar 2026 00:54:51 -0700 (PDT)
Received: from gmail.com ([2408:820c:2708:af80:8182:8384:8586:8788])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9bfbfc63b3sm21407966b.37.2026.03.31.00.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:54:51 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Jaco Kroon <jaco@uls.co.za>
Cc: linux-ppp@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>,
	Dianne Skoll <dianne@skoll.ca>,
	James Carlson <carlsonj@workingcode.com>
Subject: Re: [PATCH net-next] pppoe: update Kconfig URLs
Date: Tue, 31 Mar 2026 15:54:04 +0800
Message-ID: <20260331075438.290119-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0aa6aa20-0e2a-48e9-8273-53b2fecd287b@uls.co.za>
References: <20260331033303.5664-1-dqfext@gmail.com> <0aa6aa20-0e2a-48e9-8273-53b2fecd287b@uls.co.za>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-466-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roaringpenguin.com:url,samba.org:url,skoll.ca:url]
X-Rspamd-Queue-Id: BECC0365B4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, 31 Mar 2026 08:21:40 +0200, Jaco Kroon wrote:
>
> On 2026/03/31 05:33, Qingfang Deng wrote:
> >
> > --- a/drivers/net/ppp/Kconfig
> > +++ b/drivers/net/ppp/Kconfig
> > @@ -122,11 +122,10 @@ config PPPOE
> >   	help
> >   	  Support for PPP over Ethernet.
> >   
> > -	  This driver requires the latest version of pppd from the CVS
> > -	  repository at cvs.samba.org.  Alternatively, see the
> > -	  RoaringPenguin package (<http://www.roaringpenguin.com/pppoe>)
> > -	  which contains instruction on how to use this driver (under
> > -	  the heading "Kernel mode PPPoE").
> > +	  This driver requires the latest version of pppd at
> > +	  <https://ppp.samba.org>.
> > +	  Alternatively, see the out-of-tree RP-PPPoE plugin at
> > +	  <https://dianne.skoll.ca/projects/rp-pppoe/>.
> 
> ppp now exclusively has the plugin code (originally from roaring penguin 
> I believe).  Latest version is no longer relevant, that plugin has been 
> available since at least a few versions back already (at least a decade, 
> probably closer to two).
>
> That same code has recently been dropped from rp-pppoe, which now 
> primarily focusses on pppoe-server, and relies on the plugin now part of 
> ppp package itself. rp-pppoe is only required if you're running a 
> pppoe-server, and I don't think rp-pppoe at this stage will function 
> without ppp.
> 
> Most people will never need rp-pppoe.

Thanks for the information.

I just checked pppd's changelog: version 2.4.2 or later has the PPPoE
plugin.

I can update the help message accordingly:

	  To work in client mode, pppd version 2.4.2 or later is
	  required. To work in server mode, the pppoe-server command
	  from the RP-PPPoE package is also required, available at
	  <https://dianne.skoll.ca/projects/rp-pppoe/>.

What do you think?

