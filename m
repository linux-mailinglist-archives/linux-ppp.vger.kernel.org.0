Return-Path: <linux-ppp+bounces-546-lists+linux-ppp=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-ppp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI7ACBdZ8GlQSAEAu9opvQ
	(envelope-from <linux-ppp+bounces-546-lists+linux-ppp=lfdr.de@vger.kernel.org>)
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 08:52:07 +0200
X-Original-To: lists+linux-ppp@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48247E48B
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 08:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16E530AB454
	for <lists+linux-ppp@lfdr.de>; Tue, 28 Apr 2026 06:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6789361DD9;
	Tue, 28 Apr 2026 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dpMn0R8B"
X-Original-To: linux-ppp@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FBE355F57;
	Tue, 28 Apr 2026 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777358878; cv=none; b=NUhTHM2HL7npmlKIVpcgABKS5FJt9PI0szHs9BZBf6TTVuJr8LqUYLPfAazQzzMSabm5zKDemXXsGO8WYM3jvC2jcmo8wwGakXBjoClp6U7BOAxlHVzDo/MVStudxn/I9lKCPTXr31SbSCqYK0sdtqGodXrORzuaeos7E0IF2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777358878; c=relaxed/simple;
	bh=tMutqL/VYi2Wa2/lM2qhDSE5rYKHRd0/GydeAZwnFA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfVeTBdTL3+O+qIFIwd5WX33xilBzuj5xA2oyVpUFJ8Nv+2a7BpBRA0HI6mTratM2lVVtKuyNh25Xg3WMREMXjTl4fEjewjy43P36amvco49Utpm1Ddgh12vJl8gHGH0GYCRRVSUBd6iKUVegocnUGuirqqPLJSMNVdcgHZ/Hs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dpMn0R8B; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777358874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWl3+3xYCQS2TfIONHLvVzjRWYCsw+YxH5UO5pc9yUM=;
	b=dpMn0R8B93+rDrCnXJ/n+L8zj00H7MJvaPqmSRxTfNaaY0ZEl+LDZGcN3DW9KppxwJw7mI
	5Tpzu2pJXQV5SCMJsRy43y37V6QWh5zGA6LOgquKLFzIpUbCXSn6TaNkCxdKxL+2bokp0N
	H11ZfrV9Lvv51iEgVCrwSjiHP/cNfpA=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Anubhav Singh <anubhavsinggh@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH net-next v7 2/2] selftests: net: test PPPoE packets in gro.sh
Date: Tue, 28 Apr 2026 14:47:05 +0800
Message-ID: <20260428064717.74794-2-qingfang.deng@linux.dev>
In-Reply-To: <20260428064717.74794-1-qingfang.deng@linux.dev>
References: <20260428064717.74794-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 6D48247E48B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-546-lists,linux-ppp=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,nvidia.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingfang.deng@linux.dev,linux-ppp@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-ppp,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add PPPoE test-cases to the GRO selftest. Only run a subset of
common_tests to avoid changing the hardcoded L3 offsets everywhere.
Add a new "pppoe_sid" test case to verify that packets with different
PPPoE session IDs are correctly identified as separate flows and not
coalesced.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v7:
 - Do not run all the tests for PPPoE
 - Add a new test for PPPoE
v6: https://lore.kernel.org/netdev/20260326081127.61229-2-dqfext@gmail.com

 tools/testing/selftests/drivers/net/config |  2 +
 tools/testing/selftests/drivers/net/gro.py | 11 +++
 tools/testing/selftests/net/lib/gro.c      | 99 ++++++++++++++++++----
 3 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index fd16994366f4..07e386895b94 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -8,5 +8,7 @@ CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETCONSOLE_EXTENDED_LOG=y
 CONFIG_NETDEVSIM=m
+CONFIG_PPP=y
+CONFIG_PPPOE=y
 CONFIG_VLAN_8021Q=m
 CONFIG_XDP_SOCKETS=y
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 221f27e57147..ad7c80f7ba96 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -313,6 +313,12 @@ def _gro_variants():
         "ip_frag6", "ip_v6ext_same", "ip_v6ext_diff",
     ]
 
+    # Tests specific to PPPoE
+    pppoe_tests = [
+        "data_same", "data_lrg_sml", "data_sml_lrg", "data_lrg_1byte",
+        "data_burst", "pppoe_sid",
+    ]
+
     for mode in ["sw", "hw", "lro"]:
         for protocol in ["ipv4", "ipv6", "ipip", "ip6ip6"]:
             for test_name in common_tests:
@@ -325,6 +331,11 @@ def _gro_variants():
                 for test_name in ipv6_tests:
                     yield mode, protocol, test_name
 
+    for mode in ["sw"]:
+        for protocol in ["pppoev4", "pppoev6"]:
+            for test_name in pppoe_tests:
+                yield mode, protocol, test_name
+
 
 @ksft_variants(_gro_variants())
 def test(cfg, mode, protocol, test_name):
diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 11b16ae5f0e8..0da55b757bcc 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -67,12 +67,14 @@
 #include <errno.h>
 #include <error.h>
 #include <getopt.h>
+#include <net/ethernet.h>
+#include <net/if.h>
 #include <linux/filter.h>
 #include <linux/if_packet.h>
+#include <linux/if_pppox.h>
 #include <linux/ipv6.h>
 #include <linux/net_tstamp.h>
-#include <net/ethernet.h>
-#include <net/if.h>
+#include <linux/ppp_defs.h>
 #include <netinet/in.h>
 #include <netinet/ip.h>
 #include <netinet/ip6.h>
@@ -134,6 +136,7 @@ static int total_hdr_len = -1;
 static int ethhdr_proto = -1;
 static bool ipip;
 static bool ip6ip6;
+static bool pppoe;
 static uint64_t txtime_ns;
 static int num_flows = 4;
 static bool order_check;
@@ -171,6 +174,22 @@ static void vlog(const char *fmt, ...)
 	}
 }
 
+static void fill_pppoelayer(void *buf, int payload_len, uint16_t sid)
+{
+	struct pppoe_ppp_hdr {
+		struct pppoe_hdr eh;
+		__be16 proto;
+	} *ph = buf;
+
+	payload_len += sizeof(struct tcphdr);
+	ph->eh.type = 1;
+	ph->eh.ver = 1;
+	ph->eh.code = 0;
+	ph->eh.sid = htons(sid);
+	ph->eh.length = htons(payload_len + sizeof(ph->proto));
+	ph->proto = htons(proto == PF_INET ? PPP_IP : PPP_IPV6);
+}
+
 static void setup_sock_filter(int fd)
 {
 	const int dport_off = tcp_offset + offsetof(struct tcphdr, dest);
@@ -412,11 +431,15 @@ static void create_packet(void *buf, int seq_offset, int ack_offset,
 
 	fill_networklayer(buf + inner_ip_off, payload_len, IPPROTO_TCP);
 	if (inner_ip_off > ETH_HLEN) {
-		int encap_proto = (proto == PF_INET) ?
-				  IPPROTO_IPIP : IPPROTO_IPV6;
+		if (pppoe) {
+			fill_pppoelayer(buf + ETH_HLEN, payload_len + ip_hdr_len, 0x1234);
+		} else {
+			int encap_proto = (proto == PF_INET) ?
+					  IPPROTO_IPIP : IPPROTO_IPV6;
 
-		fill_networklayer(buf + ETH_HLEN,
-				  payload_len + ip_hdr_len, encap_proto);
+			fill_networklayer(buf + ETH_HLEN,
+					  payload_len + ip_hdr_len, encap_proto);
+		}
 	}
 
 	fill_datalinklayer(buf);
@@ -526,7 +549,7 @@ static void send_flags(int fd, struct sockaddr_ll *daddr, int psh, int syn,
 static void send_data_pkts(int fd, struct sockaddr_ll *daddr,
 			   int payload_len1, int payload_len2)
 {
-	static char buf[ETH_HLEN + IP_MAXPACKET];
+	static char buf[MAX_HDR_LEN + IP_MAXPACKET];
 
 	create_packet(buf, 0, 0, payload_len1, 0);
 	write_packet(fd, buf, total_hdr_len + payload_len1, daddr);
@@ -1071,6 +1094,20 @@ static void send_fragment6(int fd, struct sockaddr_ll *daddr)
 	write_packet(fd, buf, bufpkt_len, daddr);
 }
 
+static void send_changed_pppoe_sid(int fd, struct sockaddr_ll *daddr)
+{
+	static char buf[MAX_HDR_LEN + PAYLOAD_LEN];
+	int pkt_size = total_hdr_len + PAYLOAD_LEN;
+	struct pppoe_hdr *hdr = (struct pppoe_hdr *)(buf + ETH_HLEN);
+
+	create_packet(buf, 0, 0, PAYLOAD_LEN, 0);
+	write_packet(fd, buf, pkt_size, daddr);
+
+	create_packet(buf, PAYLOAD_LEN, 0, PAYLOAD_LEN, 0);
+	hdr->sid = htons(0x4321);
+	write_packet(fd, buf, pkt_size, daddr);
+}
+
 static void bind_packetsocket(int fd)
 {
 	struct sockaddr_ll daddr = {};
@@ -1121,9 +1158,10 @@ static void recv_error(int fd, int rcv_errno)
 static void check_recv_pkts(int fd, int *correct_payload,
 			    int correct_num_pkts)
 {
-	static char buffer[IP_MAXPACKET + ETH_HLEN + 1];
-	struct iphdr *iph = (struct iphdr *)(buffer + ETH_HLEN);
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + ETH_HLEN);
+	static char buffer[IP_MAXPACKET + MAX_HDR_LEN + 1];
+	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
+	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);
 	struct tcphdr *tcph;
 	bool bad_packet = false;
 	int tcp_ext_len = 0;
@@ -1140,7 +1178,7 @@ static void check_recv_pkts(int fd, int *correct_payload,
 
 	while (1) {
 		ip_ext_len = 0;
-		pkt_size = recv(fd, buffer, IP_MAXPACKET + ETH_HLEN + 1, 0);
+		pkt_size = recv(fd, buffer, sizeof(buffer), 0);
 		if (pkt_size < 0)
 			recv_error(fd, errno);
 
@@ -1183,9 +1221,10 @@ static void check_recv_pkts(int fd, int *correct_payload,
 
 static void check_capacity_pkts(int fd)
 {
-	static char buffer[IP_MAXPACKET + ETH_HLEN + 1];
-	struct iphdr *iph = (struct iphdr *)(buffer + ETH_HLEN);
-	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + ETH_HLEN);
+	static char buffer[IP_MAXPACKET + MAX_HDR_LEN + 1];
+	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
+	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
+	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);
 	int num_pkt = 0, num_coal = 0, pkt_idx;
 	const char *fail_reason = NULL;
 	int flow_order[num_flows * 2];
@@ -1203,7 +1242,7 @@ static void check_capacity_pkts(int fd)
 
 	while (1) {
 		ip_ext_len = 0;
-		pkt_size = recv(fd, buffer, IP_MAXPACKET + ETH_HLEN + 1, 0);
+		pkt_size = recv(fd, buffer, sizeof(buffer), 0);
 		if (pkt_size < 0)
 			recv_error(fd, errno);
 
@@ -1499,6 +1538,12 @@ static void gro_sender(void)
 		usleep(fin_delay_us);
 		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
 
+	/* PPPoE sub-tests */
+	} else if (strcmp(testname, "pppoe_sid") == 0) {
+		send_changed_pppoe_sid(txfd, &daddr);
+		usleep(fin_delay_us);
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+
 	} else {
 		error(1, 0, "Unknown testcase: %s", testname);
 	}
@@ -1716,6 +1761,12 @@ static void gro_receiver(void)
 	} else if (strcmp(testname, "capacity") == 0) {
 		check_capacity_pkts(rxfd);
 
+	} else if (strcmp(testname, "pppoe_sid") == 0) {
+		correct_payload[0] = PAYLOAD_LEN;
+		correct_payload[1] = PAYLOAD_LEN;
+		printf("different PPPoE session ID doesn't coalesce: ");
+		check_recv_pkts(rxfd, correct_payload, 2);
+
 	} else {
 		error(1, 0, "Test case error: unknown testname %s", testname);
 	}
@@ -1734,6 +1785,8 @@ static void parse_args(int argc, char **argv)
 		{ "ipv6", no_argument, NULL, '6' },
 		{ "ipip", no_argument, NULL, 'e' },
 		{ "ip6ip6", no_argument, NULL, 'E' },
+		{ "pppoev4", no_argument, NULL, 'p' },
+		{ "pppoev6", no_argument, NULL, 'P' },
 		{ "num-flows", required_argument, NULL, 'n' },
 		{ "rx", no_argument, NULL, 'r' },
 		{ "saddr", required_argument, NULL, 's' },
@@ -1745,7 +1798,7 @@ static void parse_args(int argc, char **argv)
 	};
 	int c;
 
-	while ((c = getopt_long(argc, argv, "46d:D:eEi:n:rs:S:t:ov", opts, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "46d:D:eEi:n:pPrs:S:t:ov", opts, NULL)) != -1) {
 		switch (c) {
 		case '4':
 			proto = PF_INET;
@@ -1765,6 +1818,16 @@ static void parse_args(int argc, char **argv)
 			proto = PF_INET6;
 			ethhdr_proto = htons(ETH_P_IPV6);
 			break;
+		case 'p':
+			pppoe = true;
+			proto = PF_INET;
+			ethhdr_proto = htons(ETH_P_PPP_SES);
+			break;
+		case 'P':
+			pppoe = true;
+			proto = PF_INET6;
+			ethhdr_proto = htons(ETH_P_PPP_SES);
+			break;
 		case 'd':
 			addr4_dst = addr6_dst = optarg;
 			break;
@@ -1812,6 +1875,10 @@ int main(int argc, char **argv)
 	} else if (ip6ip6) {
 		tcp_offset = ETH_HLEN + sizeof(struct ipv6hdr) * 2;
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
+	} else if (pppoe) {
+		tcp_offset = ETH_HLEN + PPPOE_SES_HLEN +
+			(proto == PF_INET ? sizeof(struct iphdr) : sizeof(struct ipv6hdr));
+		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
 	} else if (proto == PF_INET) {
 		tcp_offset = ETH_HLEN + sizeof(struct iphdr);
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
-- 
2.43.0


