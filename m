Return-Path: <linux-ppp+bounces-503-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAPUOgUp1mkUBggAu9opvQ
	(envelope-from <linux-ppp+bounces-503-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 12:08:05 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3593BA53E
	for <lists+linux-ppp@lfdr.de>; Wed, 08 Apr 2026 12:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 630E63096947
	for <lists+linux-ppp@lfdr.de>; Wed,  8 Apr 2026 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAF03B6C19;
	Wed,  8 Apr 2026 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="uC9n03h6"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BE3B47EF
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642697; cv=fail; b=LQXov4Jg6G42/b6cqZKzyVD0LuNqacmd1c6AP7HPJlFJz8Htx7QdScuDF5AS1QLSrez8Zat1ru/dX6fPLIBXGcGZfPjY3XlIFCcpvIMIMC5U4kQ+KcyewBc+FIz3CLcdCmoQvQ3JSVlpTOalI6pWFjG4CD5KWBnBFs4Qd4nMb6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642697; c=relaxed/simple;
	bh=LImdsS4EBJCH+IoSQme0lgHzwK8ltPIxsfZLeJ2o6mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=do+dRsJS88DwpDC1+mYJAClwtSqPOSyzmJGm55RMsGVlAdN5MFGA6b0MOhfqpu6cKn3NefJcleUz/YymQny/Rqwi3T5mmWS1Q8jYZdsPh6WevjaCZWbRvyA/JJQecHORL3JLdRGpdDwqLWG7EEUIPotKNU2QNYuuTXVetv6yFGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=uC9n03h6; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J6Qn22664259
	for <linux-ppp@vger.kernel.org>; Wed, 8 Apr 2026 03:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=LImdsS4EBJCH+IoSQme0lgHzwK8ltPIxsfZLeJ2o6mA=; b=uC9n03h6SVUe
	hWAfrascRtYfkoAsbcv3RtUH/fcDchxFuVDA3y2rArFOctax/Ss4OuaQQYTZykNK
	Uw1tDh1AjRsTfkFVKZ9UZIwoV12RYx7l39uKq5p173qJLVpjhHR/5hnorUrUCGz8
	RPG/d+615E0rEiUP94X7VSHrx6aKNKQttfvtR46AEQgIc5PaLGrj1/My/+/W44gN
	M2JyF02wLLMfsULZ72G1UT/eQdq0JL0qHol4AQrW5QAuMHDbIoKrSt88kJLc3KLv
	1bjxQ7BU8j3J58+CCY7z5Mbe8VxdE8ocsG8uTsx5XkrXI1IZv/TgV4dtP/jZEqtS
	umavwRejJQ==
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dcmsua2ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-ppp@vger.kernel.org>; Wed, 08 Apr 2026 03:04:46 -0700 (PDT)
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a127cf57dcso3416454e87.3
        for <linux-ppp@vger.kernel.org>; Wed, 08 Apr 2026 03:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642685; cv=none;
        d=google.com; s=arc-20240605;
        b=cczUtWW0sLpXWH7qcBCm/+grZXTv+U/xA3WZ1D9Dp3xAC8ZEJm2QvFvLRxfOF+z/OC
         AN+kHkBZZ4Dy6ApzFk7e+iqO4BxsbQkTGIHNYNFUIsPwJD3r3Sgcoi3WfdU8LBCu73QF
         xn31cnCGGKDcPbSS71bPaP7/4I+SCeOXNijZju/+n88Rzjzq5LTYcA/rV6uVp6sHlHUj
         DpkuPkuwzg+k1uagr7+5Abln2KiNf8KUY2dXUzlZ0Wr/buM2NOxN4EVMf3ULj/U/CNmg
         wL+aym2f0ftnPkdw4fOsMXa4vJ7Nz5KbA2kJznFbpMPoEPkgOIlENdh7Jw50jJuuqmoY
         aqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=xjIuCParSu9CSR5m55xubcB5M2VEMdE3nmLeLU8GNS0=;
        fh=6et50EDErwwhRCsUP6zXN4Z8tuG+zSgT7O8UNrrRDeY=;
        b=KmoDXpFLkGCBjUcPkB3Dg6YRMIbnK6EcsQ/jIQiWkGxG4g0TSX/zF2dtiSGvrHChV6
         b4oT5kheNEnhWf5cx22bnpaoF5qXb3yuaHjJg4buV0XDfkIs7rqx3kjZE6SsY4N1u3S8
         CDYjE31OsO2TiCJH+2+dW8eSKZowdpWeGydq7v172Ic8avR+kwqPUrhHBqatS8EVnO4X
         wcaYIPgcpQvxyFQgh0AhoZUec3IbgZ/+KbV6kRFNDKJF5DW9rk4ygCPpZG3PLFTR7y4T
         Op2dbPKZpfrMuuT04C3tyWHaof1yo/N8DUtmpBiXfPxO8bSEZm5lz2jQtu2veqFZuSJp
         4m6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642685; x=1776247485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjIuCParSu9CSR5m55xubcB5M2VEMdE3nmLeLU8GNS0=;
        b=Qz9fAhUUBWEW/GIuM5Af/vqLNgPhZLtOow5jdiUO1wXa9Du0XV/g1NAfAAiGJ3CB4m
         +GHQFDcABKiK0hooqZ7Iq3eVLFBdUFXqKDrCG58U57zpoCU5TEpwgU0+KhRlY/GHzwQZ
         sJcDWYHiZTFGW+dhgCcgyJIAfgObuvEvEuza0SRU+BGPQRzqxIh+yLaGCz0YIA8XU9K+
         mviJDTHPb3czzAwV8Z4ZEP29jPSJc+YVcN+OQfSeh4fDzanoP9cDO4rqzqx2wnYxuf/L
         scOWL8/mb6fe0V46nFsTC8uNMIAEyRFLvMvEPP/rwg5ReBfUD1Scj/z9GE3YoazqwRdK
         NPsA==
X-Forwarded-Encrypted: i=1; AJvYcCVHlfgcE0OIz28zpJ+W/kf46eb/g9vt3IJ7jb9GcQkhTrTs+pxwFqpOme2yd94AEleB56Evub2duYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UKPMYc/R4BMdnt/RYVNrj2bIyIrl71hySDY0XogZsyd4pyX9
	wxtLKQwJ8xXz5wafd0OARFrzZxMAqh+WlutMZTiEKvX2apXVvohlxNusv1PtKp6FqMRbM3UsFGq
	VPH7X+TNt2Km3SghAvsETUm8MwbUpYhxsMdpiaMwH5wqgjpH5tM5pePkYY4ue7piluIgHRHmkB5
	36IgSZ6Xo6iF/yQTMqJVr88cn7wE+5bJ/x1UU=
X-Gm-Gg: AeBDieuwXSMs2ASkbei60MDxb+IB5B9m3jcKQAgvHYQJzJUIZKpvShjUudjn9W+w8KX
	VN7eLxxKmqmwAPWCkLAaX0nf5HIWn+7t9qkqwowKB0BI8OQm+JoZfVG7hBmmbPGwFVG7MQekh1c
	oW2an6K25k1+6wbpzxsQAx9AlzyoUfHiS9jEWQ3t1HB+cJsDJEDd3yci56k9fK7U2ThzU6QR7tB
	1Si
X-Received: by 2002:a05:6512:31ce:b0:5a2:b3dd:7a63 with SMTP id 2adb3069b0e04-5a33755a340mr7058210e87.10.1775642684747;
        Wed, 08 Apr 2026 03:04:44 -0700 (PDT)
X-Received: by 2002:a05:6512:31ce:b0:5a2:b3dd:7a63 with SMTP id
 2adb3069b0e04-5a33755a340mr7058192e87.10.1775642684193; Wed, 08 Apr 2026
 03:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408042345.1011-1-hataegu0826@gmail.com> <59d11588-0af2-42e6-a030-83240a0a5512@linux.dev>
In-Reply-To: <59d11588-0af2-42e6-a030-83240a0a5512@linux.dev>
From: Matteo Croce <teknoraver@meta.com>
Date: Wed, 8 Apr 2026 12:04:08 +0200
X-Gm-Features: AQROBzAFK9EWsSUTTo0J4NshMGXs5dGf1gLa7-P3Q4BqcYcPdeddvYSXGmPFGQc
Message-ID: <CALnesNoaASYCS-6EJZ8UmJb6VsnKKis2uWQP333Fx_RJmrjD+w@mail.gmail.com>
Subject: Re: [PATCH] ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Taegu Ha <hataegu0826@gmail.com>, netdev@vger.kernel.org,
        linux-ppp@vger.kernel.org, gnault@redhat.com, jaco@uls.co.za,
        richardbgobert@gmail.com, ericwouds@gmail.com,
        Cyrill Gorcunov <gorcunov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DC6uOYEVxBY4_RNgTqpZgJQ86JOyOk8F
X-Authority-Analysis: v=2.4 cv=fIYJG5ae c=1 sm=1 tr=0 ts=69d6283e cx=c_pps
 a=GG3J4tSt4DzqLn8s52yoAw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=Ol1KDzRFfyqdv8hK7gAA:9 a=QEXdDO2ut3YA:10 a=9R8SQkHTFvfJQMtf_-xA:22
X-Proofpoint-ORIG-GUID: DC6uOYEVxBY4_RNgTqpZgJQ86JOyOk8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MiBTYWx0ZWRfX1gEcr8LH9RNU
 sGEh3Wd/gyRDuddJsYtzaEiOGITPF1MMfHxs2DSLajFOKP3jq+DKwX34X2wHJsXCMFhKa2HaC2z
 kaHP9QOFTz8AkEc7nU++CtWzA5P15k716eMVUw7mZmrrgp162Z77IEv8VEjmEnJAIyA1wT6KEFW
 FYZd8UrMPB04S3Wk8UIpprEGwGTInjDZ5aS1PxU5kPHj2dn5BZ2SXvS8crmqnMV1DROnot+4RxC
 LXFkb5XQPW8tIJv2RhM+g7zmvWhyxiESPJXU+VRcOSiqtR7YeB9KauRykHxA5HiqgWk/GbwLsD2
 uMvbUHvQkssf3M4HDEyBNYpbCili0iRymN7bsEgRsADj9LhuWccO3PcvDJfrNPDc4Pl50OABHFS
 bmQWp+v2ueZjzsldDolnm+0P5papvAmmDMGpim168fFUeWVPc2jPvBWulZ4NZrON07KM43Q8l6n
 rAjgwq1/+SltUb0wPOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,redhat.com,uls.co.za];
	TAGGED_FROM(0.00)[bounces-503-lists,linux-ppp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[meta.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teknoraver@meta.com,linux-ppp@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ppp];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:dkim]
X-Rspamd-Queue-Id: AF3593BA53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 8:28=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.d=
ev> wrote:
>
> >
> Hi,
>
> Added Cc: Cyrill, and Matteo
>
> On 2026/4/8 12:23, Taegu Ha wrote:
> > /dev/ppp open is currently authorized against file->f_cred->user_ns,
> > while unattached administrative ioctls operate on current->nsproxy->net=
_ns.
> >
> > As a result, a local unprivileged user can create a new user namespace
> > with CLONE_NEWUSER, gain CAP_NET_ADMIN only in that new user namespace,
> > and still issue PPPIOCNEWUNIT, PPPIOCATTACH, or PPPIOCATTCHAN against
> > an inherited network namespace.
> >
> > Require CAP_NET_ADMIN in the user namespace that owns the target network
> > namespace before handling these unattached PPP administrative ioctls.
> >
> > This preserves normal pppd operation in the network namespace it is
> > actually privileged in, while rejecting the userns-only inherited-netns
> > case.
> >
> > Fixes: 273ec51dd7ce ("net: ppp_generic - introduce net-namespace functi=
onality v2")
>
> For fixes, you should set the target tree to "net" in the patch subject,
> using:
>

LGTM as long as it's still possible to start a pppd from within a user
an network namespace.

Regards,
--=20
Matteo Croce

