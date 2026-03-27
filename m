Return-Path: <linux-ppp+bounces-455-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJY9NwD8xWmOEwUAu9opvQ
	(envelope-from <linux-ppp+bounces-455-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 04:39:44 +0100
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595D33EDA2
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 04:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B20E301F9F8
	for <lists+linux-ppp@lfdr.de>; Fri, 27 Mar 2026 03:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B8E36C5BE;
	Fri, 27 Mar 2026 03:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTyKlNOC"
X-Original-To: linux-ppp@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720636C0D3
	for <linux-ppp@vger.kernel.org>; Fri, 27 Mar 2026 03:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774582490; cv=none; b=bVPNj8iSmMk9+UPNL6MmhpAJhc8A54v16rK8VyZuLo/C+GMsVQwRpXBKSoCGnFnt8sqaVSAhjQJ7REhFJNJMWGsRWdwMkOztt1kR/EHmwomN6ZjYznrvAByo8znbva5SNc5O2fOeArc5sKrj2sW17ilCq7ncaCqR3RitOesA5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774582490; c=relaxed/simple;
	bh=YyHggGrYKFX25d1ZrTELFxsr5Vu0abAUxsmArjDmCWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/nJvDoqTaWPFS0n9KontcJqBSCWWDv9BJIV14SNE2lURigUtsXSGidjTYBdPnyb5+1DBhmOYw0w7Qdx+z7WZW93mgg6c8pa7TSyzKno9BJZjMdEbHQe1GhEYKh29EiWRfMJeqcZXeHcPz+DoKNm5QGCB27OVLwymcmWPkbguDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTyKlNOC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66b1019bb55so1069665a12.1
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 20:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774582487; x=1775187287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syKPPCVy2UJYMWZ8iCZgs0W23e8LeZHvZ2SrmBGYQzg=;
        b=DTyKlNOCcddBNzQF6yFdFi6z6pFtw+IuUBS+cv5HrZKecNFXJyY8a4VajRYwZ5Dwvm
         Zj/ZaVYTqwIurwKxS43cPkugz3+26sZjHNxiCFfx3WAdFnHCxQX2otq8KFKPjKraj6s1
         LGcNCe+rRvvebtnWAOAtaNoBOhICHSqyoG6DfLPdF0bnSl2fqHLRoBJQ+pbZtqy0x5eF
         nAbO0mu7uf0TFxXuFl5Ky6Dqvra+CfDShh46lhLiNCw/dLCftbcbrV9CESdn5N5QmXi4
         rmmaUkD0evGC0XvM9r/NBF8NsXdbxGLh+2ZBiHPzGRWmlfdtWOrJCY5jVrHK+8uKUsQQ
         brLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774582487; x=1775187287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syKPPCVy2UJYMWZ8iCZgs0W23e8LeZHvZ2SrmBGYQzg=;
        b=jT0fd2+RnkYEQOc9HkKYgCSdS89oMG/k8bdThLlnnAWmZ1rX2F/EOB/QWwNwCDffA+
         zeMcQlxsdtNIfXNptD1LqxNCbCqSjyfnIWLdz2gwfu3wqgz1N83WWUakgcFciUqdBITD
         pmEfJjXVEilW0+PI8va+O3nidatEnurpQoCt1yZAk60aw5TD3XAndFSbX+y0HufQEat1
         HjFQnQoQ25W+TgOfj7OwOCekuJ89b+Po02nRqmUHNvEBpgtTC1z0mdc5l95qMZm8Vpgr
         MYwlpY7sl4P2nMKXYyHWawfZqa2a2X4sE9HBn8Exs4H2an0mpBq6NvoZsMiTHFuFgUx8
         3ALg==
X-Forwarded-Encrypted: i=1; AJvYcCUnta4PUpCPyMk9G5/UPTt8zVQ2X23WULL54uHZ2bwPXO4Z5A0+JbPwkDZ8ODWUDF9IaZU0PvMfXQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCh1X7FXlbdI9tjIe8GdZq1kAj53N56c9OzV8zcJLZ9v+NvZUb
	JypSqRvT72CHAzvzZPcStdWg1z5wCggL0FOVgeKNJ9CcUOpHt1ww8fS6
X-Gm-Gg: ATEYQzxGziQgJolknpwZniNTa/FR3+7EbSOqqiULgdEXrXwg0rAptHHKI1m//J3NzuC
	q964NEGd0VhAvDuSemLktzVjuedXRv2AgSgbKKNx9w4YLNTVH43lDANTwrSS7u6cpAhGbiYASQp
	79MYdKfCnzzalRfXrZyslPrhyB26jyRuTwf/+SzV36fYhk2qIZssK87ISPIawI47haJdrH6ZQqQ
	uzldkQg3AAZBgB5qW2qvVUowKK6nED9qoWOmAgF3i0E9uQxjWxHtGa2LNFKelOGV8l9RuHCQGis
	NdlMB2oNGkStGmexnKRJmBFWcppTGoX47FriBf5+CRtDa0tnNu0Mu5NVtD4tpySzvVTgW6Q0STU
	JHxs6v3nn9nBzXBlx/WScd7Y2ITklmnHkq1flXMf9Vi87XCq5rU1n/RZeF2UOlE2dxrv30QbJ3i
	oXNqU=
X-Received: by 2002:a05:6402:43c7:b0:660:a2df:ad1 with SMTP id 4fb4d7f45d1cf-66b2855f52fmr468709a12.7.1774582486819;
        Thu, 26 Mar 2026 20:34:46 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e22:270f::3e4:18])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad5e3adf8sm1636110a12.2.2026.03.26.20.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:34:45 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Felix Maurer <fmaurer@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Antonio Quartulli <antonio@openvpn.net>,
	Petr Machata <petrm@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next v6] selftests: net: add tests for PPP
Date: Fri, 27 Mar 2026 11:34:19 +0800
Message-ID: <20260327033438.125135-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-455-lists,linux-ppp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dqfext@gmail.com,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-ppp];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pppoe.sh:url,ppp_common.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,enneenne.com:email,pppoe.so:url]
X-Rspamd-Queue-Id: 8595D33EDA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ping and iperf3 tests for ppp_async.c and pppoe.c.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v6: fix SC2329 scope
 https://lore.kernel.org/netdev/20260327024202.111655-1-dqfext@gmail.com/

 MAINTAINERS                                   |  1 +
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
 tools/testing/selftests/net/ppp/config        |  9 ++++
 tools/testing/selftests/net/ppp/ppp_async.sh  | 44 +++++++++++++++++++
 tools/testing/selftests/net/ppp/ppp_common.sh | 44 +++++++++++++++++++
 .../selftests/net/ppp/pppoe-server-options    |  2 +
 tools/testing/selftests/net/ppp/pppoe.sh      | 41 +++++++++++++++++
 8 files changed, 157 insertions(+)
 create mode 100644 tools/testing/selftests/net/ppp/Makefile
 create mode 100644 tools/testing/selftests/net/ppp/config
 create mode 100755 tools/testing/selftests/net/ppp/ppp_async.sh
 create mode 100644 tools/testing/selftests/net/ppp/ppp_common.sh
 create mode 100644 tools/testing/selftests/net/ppp/pppoe-server-options
 create mode 100755 tools/testing/selftests/net/ppp/pppoe.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2ffd9d37d5..b922e154b9e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21080,6 +21080,7 @@ PPP PROTOCOL DRIVERS AND COMPRESSORS
 L:	linux-ppp@vger.kernel.org
 S:	Orphan
 F:	drivers/net/ppp/ppp_*
+F:	tools/testing/selftests/net/ppp/
 
 PPS SUPPORT
 M:	Rodolfo Giometti <giometti@enneenne.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..65f84e8a0cf0 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -78,6 +78,7 @@ TARGETS += net/netfilter
 TARGETS += net/openvswitch
 TARGETS += net/ovpn
 TARGETS += net/packetdrill
+TARGETS += net/ppp
 TARGETS += net/rds
 TARGETS += net/tcp_ao
 TARGETS += nolibc
diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
new file mode 100644
index 000000000000..b39b0abadde6
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+top_srcdir = ../../../../..
+
+TEST_PROGS := \
+	ppp_async.sh \
+	pppoe.sh \
+# end of TEST_PROGS
+
+TEST_FILES := \
+	ppp_common.sh \
+	pppoe-server-options \
+# end of TEST_FILES
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/net/ppp/config b/tools/testing/selftests/net/ppp/config
new file mode 100644
index 000000000000..b45d25c5b970
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/config
@@ -0,0 +1,9 @@
+CONFIG_IPV6=y
+CONFIG_PACKET=y
+CONFIG_PPP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPPOE=m
+CONFIG_PPPOE_HASH_BITS_4=y
+CONFIG_VETH=y
diff --git a/tools/testing/selftests/net/ppp/ppp_async.sh b/tools/testing/selftests/net/ppp/ppp_async.sh
new file mode 100755
index 000000000000..9233dc656678
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_async.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ppp_common.sh
+
+# Temporary files for PTY symlinks
+TTY_DIR=$(mktemp -d /tmp/ppp.XXXXXX)
+TTY_SERVER="$TTY_DIR"/server
+TTY_CLIENT="$TTY_DIR"/client
+
+# shellcheck disable=SC2329
+cleanup() {
+	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
+	rm -fr "$TTY_DIR"
+}
+
+trap cleanup EXIT
+
+require_command socat
+ppp_common_init
+modprobe -q ppp_async
+
+# Create the virtual serial device
+socat -d PTY,link="$TTY_SERVER",rawer PTY,link="$TTY_CLIENT",rawer &
+SOCAT_PID=$!
+
+# Wait for symlinks to be created
+slowwait 5 [ -L "$TTY_SERVER" ]
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppd "$TTY_SERVER" 115200 \
+	"$IP_SERVER":"$IP_CLIENT" \
+	local noauth nodefaultroute debug
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd "$TTY_CLIENT" 115200 \
+	local noauth updetach nodefaultroute debug
+
+ppp_test_connectivity
+
+log_test "PPP async"
+
+exit "$EXIT_STATUS"
diff --git a/tools/testing/selftests/net/ppp/ppp_common.sh b/tools/testing/selftests/net/ppp/ppp_common.sh
new file mode 100644
index 000000000000..c72218813f95
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_common.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# shellcheck disable=SC2153
+
+source ../lib.sh
+
+IP_SERVER="192.168.200.1"
+IP_CLIENT="192.168.200.2"
+
+ppp_common_init() {
+	# Package requirements
+	require_command pppd
+	require_command iperf3
+
+	# Check for root privileges
+	if [ "$(id -u)" -ne 0 ];then
+		echo "SKIP: Need root privileges"
+		exit $ksft_skip
+	fi
+
+	# Namespaces
+	setup_ns NS_SERVER NS_CLIENT
+}
+
+ppp_check_addr() {
+	dev=$1
+	addr=$2
+	ns=$3
+	ip -netns "$ns" -4 addr show dev "$dev" 2>/dev/null | grep -q "$addr"
+	return $?
+}
+
+ppp_test_connectivity() {
+	slowwait 10 ppp_check_addr "ppp0" "$IP_CLIENT" "$NS_CLIENT"
+
+	ip netns exec "$NS_CLIENT" ping -c 3 "$IP_SERVER"
+	check_err $?
+
+	ip netns exec "$NS_SERVER" iperf3 -s -1 -D
+	wait_local_port_listen "$NS_SERVER" 5201 tcp
+
+	ip netns exec "$NS_CLIENT" iperf3 -c "$IP_SERVER" -Z -t 2
+	check_err $?
+}
diff --git a/tools/testing/selftests/net/ppp/pppoe-server-options b/tools/testing/selftests/net/ppp/pppoe-server-options
new file mode 100644
index 000000000000..66c8c9d319e9
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe-server-options
@@ -0,0 +1,2 @@
+noauth
+noipdefault
diff --git a/tools/testing/selftests/net/ppp/pppoe.sh b/tools/testing/selftests/net/ppp/pppoe.sh
new file mode 100755
index 000000000000..73e4ea957b43
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ppp_common.sh
+
+VETH_SERVER="veth-server"
+VETH_CLIENT="veth-client"
+
+# shellcheck disable=SC2329
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+require_command pppoe-server
+ppp_common_init
+modprobe -q pppoe
+
+# Create the veth pair
+ip link add "$VETH_SERVER" type veth peer name "$VETH_CLIENT"
+ip link set "$VETH_SERVER" netns "$NS_SERVER"
+ip link set "$VETH_CLIENT" netns "$NS_CLIENT"
+ip -netns "$NS_SERVER" link set "$VETH_SERVER" up
+ip -netns "$NS_CLIENT" link set "$VETH_CLIENT" up
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppoe-server -I "$VETH_SERVER" \
+	-L "$IP_SERVER" -R "$IP_CLIENT" -N 1 -q "$(command -v pppd)" \
+	-k -O "$(pwd)/pppoe-server-options"
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd \
+	local debug updetach noipdefault noauth nodefaultroute \
+	plugin pppoe.so nic-"$VETH_CLIENT"
+
+ppp_test_connectivity
+
+log_test "PPPoE"
+
+exit "$EXIT_STATUS"
-- 
2.43.0


