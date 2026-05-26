Return-Path: <linux-ppp+bounces-592-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qSDREX36FGpcSAcAu9opvQ
	(envelope-from <linux-ppp+bounces-592-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 03:42:21 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BC5CF795
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 03:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8191B300DE11
	for <lists+linux-ppp@lfdr.de>; Tue, 26 May 2026 01:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0132BDC23;
	Tue, 26 May 2026 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w2eB7PzJ"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC148280A58;
	Tue, 26 May 2026 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779759736; cv=none; b=DsvRnJeJJ2a+Ba6QPopI1Zvoe5qDt6aJqh7Iqn43/FF8XxJu4eNEtwYHsmRkOorH7N8G5TYjqOuPfnbi21Evas0uqUKb2stSH5uad2Ee9jg6et5cWPnfOYTOsikhLAlH/KabltJqpWrWAcwJUKB/2uCIG/7CjVXn3w82az7z378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779759736; c=relaxed/simple;
	bh=3k+4/prxIu3sSF4ZXZ5KU7C6MaPJice3RG6ToJs2Y08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlenHliWvondw/5JUoN8F+4IbqA2cfR0jSewCxyiwcKadUB7zuEdpDwdM5ygnHGHW6NdRAbl+YA/1QBVFWgNq/mG8T0AOjGmXs76cJXvVhFLmjl6xx6qKG3M8BgIw5sKRNZ5T+BRVu/GtMOIPhp6kYaNFUfNLIblDcSIiouUYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w2eB7PzJ; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779759731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdRbc9N0KyI+C4TfluCvSP2H+w3ISxsXMdimQER6nhk=;
	b=w2eB7PzJGG9hF8oYI4k8BAZeQagLmrggi2rM1C3ng19DbH3ROA+yjA7a3ZW6sKBsa6ji6R
	5ZVLcydv+0EWfxtqsAVjIipurUqpSzAGxQ/RGuC379DHTkkNmQNmhGK8u95wg37dpf6Pqp
	3Qcwr+VHglyDu495mlEBmVK4aPoM1+I=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthieu Baerts <matttbe@kernel.org>
Subject: [PATCH net-next] selftests: net: add socat syslog for PPPoL2TP
Date: Tue, 26 May 2026 09:41:47 +0800
Message-ID: <20260526014152.532505-1-qingfang.deng@linux.dev>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-592-lists,linux-ppp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 506BC5CF795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As done in pppoe.sh, start socat as the syslog listener. In case the
test fails, dump its log to see what's going on.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 tools/testing/selftests/net/ppp/pppol2tp.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
index 5b592785f1f9..96786267ccc7 100755
--- a/tools/testing/selftests/net/ppp/pppol2tp.sh
+++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
@@ -9,10 +9,12 @@ OUTER_IP_SERVER="172.16.1.1"
 OUTER_IP_CLIENT="172.16.1.2"
 
 PPPOL2TP_DIR=$(mktemp -d /tmp/pppol2tp.XXXXXX)
+PPPOL2TP_LOG="$PPPOL2TP_DIR/l2tp.log"
 
 # shellcheck disable=SC2329
 cleanup() {
 	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
 	rm -rf "$PPPOL2TP_DIR"
 }
 
@@ -31,6 +33,10 @@ ip -netns "$NS_CLIENT" link set "$VETH_CLIENT" up
 ip -netns "$NS_SERVER" address add dev "$VETH_SERVER" "$OUTER_IP_SERVER" peer "$OUTER_IP_CLIENT"
 ip -netns "$NS_CLIENT" address add dev "$VETH_CLIENT" "$OUTER_IP_CLIENT" peer "$OUTER_IP_SERVER"
 
+# Start socat as syslog listener
+socat -v -u UNIX-RECV:/dev/log OPEN:/dev/null > "$PPPOL2TP_LOG" 2>&1 &
+SOCAT_PID=$!
+
 # Generate configuration files
 cat > "$PPPOL2TP_DIR/l2tp-server.conf" <<EOF
 [global]
@@ -80,6 +86,15 @@ ppp_test_connectivity
 
 log_test "PPPoL2TP"
 
+# Dump syslog messages if the test failed
+if [ "$RET" -ne 0 ]; then
+	while read -r _sign _date _time len _from _to
+	do      len=${len##*=}
+		read -n "$len" -r LINE
+		echo "$LINE"
+	done < "$PPPOL2TP_LOG"
+fi
+
 # Recursion test
 RET=0
 # Delete route to LNS IP
-- 
2.43.0


