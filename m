Return-Path: <linux-ppp+bounces-93-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A097DBD7
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Sep 2024 08:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F0BCB21601
	for <lists+linux-ppp@lfdr.de>; Sat, 21 Sep 2024 06:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210DF143748;
	Sat, 21 Sep 2024 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="QNN3+lMN"
X-Original-To: linux-ppp@vger.kernel.org
Received: from qs51p00im-qukt01071502.me.com (qs51p00im-qukt01071502.me.com [17.57.155.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67574BF8
	for <linux-ppp@vger.kernel.org>; Sat, 21 Sep 2024 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726899946; cv=none; b=QpsvzQxeKX+URF1Jv1xDbxTMHOjmLitn6BPQr1gxaTdewxoORz1SbG6nrnc6k7UvnPTpK7XaNdKMhWOD5HNOeLJc0tB/e/cy0a4aOOMNefBUzTx22OdgATudcXKlcVFImTRXlk+li2OaRIlz/bhczksKvhP/QhAVMgl7dtNM8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726899946; c=relaxed/simple;
	bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=TfkWSfibgnDP+fdtGIIglVupXdZU/8Vzd2agd6h+iMPCXxdZNDwvGCuUYqDtJABVh5iA10Ew+DKHsR9TivrBKpk8R2ANDGpf/59a1/I+nZLrdQeRUMzEeXqkP92wUD0yyn7GCbo3js9tslyeC60vBYYSspt4MrIRWyxmkT3VIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=QNN3+lMN; arc=none smtp.client-ip=17.57.155.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1726899943;
	bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=QNN3+lMNrphQyf9yb5yQzQghqYuR4zONXP8RM2/3tUre3pq9l7Xlt2UKbdvthrVb7
	 qEjSTVINXipYCnn+Wz1ImT10R4Pu3eyGQRokGs0mbZhLoP/aeUI3/UXi6Tv+WW8UUy
	 /Flz8D2r8PSj8UwgTCIW92RscytgJFA9HEjGtxtQs8soi2Si52Epg+szkyQrB+cnU6
	 QA9KwLfnIigywmRAf9EMC+eJH48SfCaWbhsZkC6BH8Uv3UxVKcwo3HDBSaeg5EQcaq
	 RWZb07U73e1u2R0rBg2gB0ZReC4LoXbftCArXgi8YZWwkv9QDkng9Km6USrxPXazdK
	 sW8NO1iEarpQw==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071502.me.com (Postfix) with ESMTPSA id 8A789668018E
	for <linux-ppp@vger.kernel.org>; Sat, 21 Sep 2024 06:25:41 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Purnima Jain <drpj73@icloud.com>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Sat, 21 Sep 2024 11:55:37 +0530
Subject: =?utf-8?B?4KSq4KSf4KS1?=
Message-Id: <91E8B92B-41CE-41F2-B859-0DE806195145@icloud.com>
To: linux-ppp@vger.kernel.org
X-Mailer: iPhone Mail (19G82)
X-Proofpoint-ORIG-GUID: 3xPrdcxCCnykM_oMNGkZfqjdWwi45zBu
X-Proofpoint-GUID: 3xPrdcxCCnykM_oMNGkZfqjdWwi45zBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-21_02,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 adultscore=0 mlxscore=1 spamscore=1
 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0 mlxlogscore=217
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2409210046



Sent from my iPhone

