Return-Path: <linux-ppp-owner@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F39138AEE
	for <lists+linux-ppp@lfdr.de>; Mon, 13 Jan 2020 06:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgAMFdt (ORCPT <rfc822;lists+linux-ppp@lfdr.de>);
        Mon, 13 Jan 2020 00:33:49 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:42550 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgAMFds (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Mon, 13 Jan 2020 00:33:48 -0500
IronPort-SDR: Ea5tVrAORDtI2fzqLyZVeFl0gqWRk52eFe+imipKylzpWiy6fzdkaIv33ZpxoTBh4Mf+rBQ13P
 V1QKHg1wBGaw==
IronPort-PHdr: =?us-ascii?q?9a23=3AL5J4CxWSAgvit9wD81jAQNrLbY7V8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbByAt8tkgFKBZ4jH8fUM07OQ7/m7HzZesN3R7jgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrowjdrNcajIpmJ6o+yR?=
 =?us-ascii?q?bEo2ZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PW?=
 =?us-ascii?q?wt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WS?=
 =?us-ascii?q?in4qx2RhLklDsLOjgk+23RjcB+kb5Urwikpx1/2oLZfoaVNOBmfqPaZ9MVX3?=
 =?us-ascii?q?ZBUdhIWyNfBIOwdpcCD/YdPelCs4b9p0UBrR6gCgmqGOPj0yFHhnnv0aM91O?=
 =?us-ascii?q?QhFx/J3Qw5E90QtnTfsdH5OakOXeypyaXFyyjIYfFL1jfn8IXGfBAvoeuSU7?=
 =?us-ascii?q?xzbMTexlUgGQzeg1WMq4HqIy+Z2vgRv2SF6edrSOKhi3QgqwF0ujWh3Nkjip?=
 =?us-ascii?q?XXiYIP11vL9SJ5wIA6JdalT0N7ecCrEIdOuCGAOYp2RcUiQ25ztSY60b0Joo?=
 =?us-ascii?q?K0cDIWx5Qgwh7TcfyHc4uR7x/lSe2fIi94iWp7dL6ihRu+61Wsx+PgWsWuzl?=
 =?us-ascii?q?pHoTBJn9fMu30Lyhfd8NKISuFn8UekwTuP0gfT5fxaLk0sjqrbLoIhwqY3lp?=
 =?us-ascii?q?oOrUTPBi/2l1vyjK+Rbkgk//Kn6+XjYrX8uJCcM5N4hw7kPqQwncywHP43Mg?=
 =?us-ascii?q?YJX2id5+uwzqPs/VbhTLVLiP05jLXZvYjEKcgGpKO1GRJZ34g/5xqlETur38?=
 =?us-ascii?q?4UkHcHIV5dfRKIlYnpO1XAIPDiCve/hkyhkC91yPDaILLhGJvMLn/FkLfuZr?=
 =?us-ascii?q?t961VcxxEvwtxF+51UDbQBLOjzWk/yrNDYFAM2MxSow+b7D9VwzoceWWOJAq?=
 =?us-ascii?q?+EP6LeqEeI5vo3I+SXeo8VtyjyK+I/6/7tk3A5g1kdcret3ZcNb3C4BPtmcA?=
 =?us-ascii?q?2lZi/og9EcASISphIWUuPnkhuBXCRVanL0WLgztQs2EIa3MYCWfo2xjabJ4y?=
 =?us-ascii?q?C9EdUCfm1aB0qTFnHnd4aEQP0HQC2XK85l1DcDUO7yZZUm0ESWuRP30fJYKe?=
 =?us-ascii?q?zbsnkAuI7uzsdy4eL7lQo4/np/CMHb02LbHDI8pX8BWzJjhfM3mkd60FrWiv?=
 =?us-ascii?q?Agjg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgCcABxemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFI5dNAY0EDQ0ChR2CSQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgCcABxemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFI5dNA?=
 =?us-ascii?q?Y0EDQ0ChR2CSQQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="323807805"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 06:33:46 +0100
Received: (qmail 24485 invoked from network); 12 Jan 2020 05:00:21 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-ppp@vger.kernel.org>; 12 Jan 2020 05:00:21 -0000
Date:   Sun, 12 Jan 2020 06:00:20 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-ppp@vger.kernel.org
Message-ID: <1400584.460818.1578805221516.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-ppp-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

