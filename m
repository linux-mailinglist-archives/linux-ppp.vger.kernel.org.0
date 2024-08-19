Return-Path: <linux-ppp+bounces-75-lists+linux-ppp=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-ppp@lfdr.de
Delivered-To: lists+linux-ppp@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C239566C0
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Aug 2024 11:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6471F2029D
	for <lists+linux-ppp@lfdr.de>; Mon, 19 Aug 2024 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0306D15CD6E;
	Mon, 19 Aug 2024 09:18:47 +0000 (UTC)
X-Original-To: linux-ppp@vger.kernel.org
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11020138.outbound.protection.outlook.com [52.101.169.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C515CD79
	for <linux-ppp@vger.kernel.org>; Mon, 19 Aug 2024 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059126; cv=fail; b=u8S1QwU9iUM4UfSILXwsQRVImGxi+asT4ZwqKFeiD5sNHbAzmwrJE7B/ygL7XWKD5IBokMcQntHojyJl3jVixc3c0s3jpfEXtWjVMh6IZZjwwNav5NSFz8qxC6pq4PZ4R0FnXO25RodomS1bLkgGScnmGZSXQVyqRW4aU5k4RYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059126; c=relaxed/simple;
	bh=RWWjOYVKJLXiwBoMqBI3EuTBQJL4K7tblNxu9yuYot0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TOHaVwZUkuOuzzN03GiMCPP8VSxEjGtPBMRzUCTE5PZIqRROmP3E2Iy/+5jV9ZB70MF+b7/McYeeNlaZg4QF6qXuw/ud/eQLhGoZz4km2FwkBHOqGD+wjeE2/EwknUAZNnsLR0ugM+PCMo3v9spL8DGmkm5hbPAWJUmuIJxRCY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aconnic.com; spf=pass smtp.mailfrom=aconnic.com; arc=fail smtp.client-ip=52.101.169.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aconnic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aconnic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdqw0L2jkxftYPQU7OIW/jERKIDJmSeJgC/aMYmzheClZSb/uktDmq5a5llcpTPZm7jM88hxpR8qmQygwwS7jGcPStxrXykKHj0tHAAbcDAR7BO4yjnKHIV31+lrHqo/UvrC+i/rel2RiQfXLs5+58Q/856H6xqEiHrnGWIQKpyZRDZNTSV2sEPVV+tQhwM0XxvtwcX+fTN7WIcnToLO2FnzScLub5csZCnlP9rvUm7kfWoS2w6yZCrM+oLWPQYcoltTIOzDzEmEkQifM+ULKlqTqVYYRKNvEvC04QxGNNS7kwbD45jb8js1Rppb6Hd8N8coK0yVcG8jV+L7Q1XdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NqXzWiGN7BB+P4F8C6taRZPBrvOk6kEFy+YwcYQddg=;
 b=LK5q3luC6ahhNGQN0hBgEYj7S3cBcbxNyZWDLW3/8Dj3ATd+bY4oo1bw+rcqrT9MhQymivQOqitg3MJISVBKGe2owsG9+MEZo22+OOvD4P6tLf9Bx7p7XE6pL6MV7ifMqS6HZOUu6/J3RSVTqRw+x1We/UZMaq8P70dDsrqDrBsIduPe4Yp8bys4luT8bFtakom9ZKjN2uIix4l6i0lORIq0unBNfMOEp2MP62dRkx2qxwyz6daYcxgza7I0wphpmM8TS+x0Qk4gjTEpZ9wb/4KJPqaB5H5ykLo9HkpApyMM5uabbz3stb6be0O5HosSeXpSY0ejCcgL/Py/8WNeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aconnic.com; dmarc=pass action=none header.from=aconnic.com;
 dkim=pass header.d=aconnic.com; arc=none
Received: from FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::11)
 by FR2P281MB2489.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:62::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 09:18:40 +0000
Received: from FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b828:a3a0:87a7:4c5d]) by FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b828:a3a0:87a7:4c5d%6]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:18:40 +0000
From: "Scheibner, Stefan" <Stefan.Scheibner@aconnic.com>
To: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>
Subject: Bugreport configure ppp without '--with-openssl'
Thread-Topic: Bugreport configure ppp without '--with-openssl'
Thread-Index: AQHa8hi2+2sIW35eFki5Wl4nnDvvxw==
Date: Mon, 19 Aug 2024 09:18:40 +0000
Message-ID:
 <FR4P281MB3530A329B44C8D7C8B8B3616988C2@FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aconnic.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR4P281MB3530:EE_|FR2P281MB2489:EE_
x-ms-office365-filtering-correlation-id: e3783065-e014-4ade-a0f3-08dcc02fea33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CsIUHSjRVKcU0cALnY3pyHUJ0ZYgoSVC4Lerx4g5zAbUE8X8/4m9idteRd?=
 =?iso-8859-1?Q?P04+q2H727koefBMEnzEfIjo7pqvcuXBAFnTRkcOCb+3Y4Fo4VmiV9KjIe?=
 =?iso-8859-1?Q?TbtlhBBxeVfRy9YZQA7jOGwR7EtM9JuiCgXd4KfQjTYE2hsJr6WRCry8bO?=
 =?iso-8859-1?Q?/qMBrggsHU4wHDR5cUYw4wEWlaaQp1nQoJTBElxmiRuWkwCsQikJ7LJfyq?=
 =?iso-8859-1?Q?eePnoZs5i0apcaEoTbGXXEfDNxntNrnd2RfPAgGVmyRXHZZAcEgIWN9xqd?=
 =?iso-8859-1?Q?uScVyEkNOswtppB+Wlys96RNlXPHAM0MUoXMJxkDKEfET3HHmQJINixCOw?=
 =?iso-8859-1?Q?JL8IkdsfPhZ1XDR/ejqTumsSWGFlnBIwTCL40MiYtS06TJQfUkEaOkqNsX?=
 =?iso-8859-1?Q?mkIkkb/QUX+rYzxjeBeXA9cDr199fEn+T8qLjW4wz7EErnNzaik83eJOB7?=
 =?iso-8859-1?Q?cSVdgpAM6ApvRmNWvwZmGsklx5CJ4yQCccZCEBdEUIB0y1pzWYmtiV+1+Z?=
 =?iso-8859-1?Q?R/47cE11UM69cv2OyRAaVyghbcXxB2NR1/7L6FX3tOLDLimEo8AW4sYins?=
 =?iso-8859-1?Q?xr35CSEt4FXEJ1uY7opjFcaKRsWVxnCE93S4EIPp9MsbKSe5D05P1vo/+o?=
 =?iso-8859-1?Q?mE4EBlmTx/yCdgDvm4752xwYThrp7GN+fAp+HG4c1odr4erfq/cnYc1hug?=
 =?iso-8859-1?Q?M4Mbw7AwxehC04QPYWP37uttKUAvfjX5tQbwiDWj5/hanKioLnWcqRVoMb?=
 =?iso-8859-1?Q?anwu3qOKbaKFIWKGmptHAH5047EX/mNXCXT7XrkMuQg+vXmWXRXiw6ilN5?=
 =?iso-8859-1?Q?XseeuQj/02lksmGwEwn0NqPm1oK8BIu03ltiUPKHq5cDQX9PVef3Np3Jcp?=
 =?iso-8859-1?Q?/yGYuBya+cZBMmedMSDfN63sAlpMMEeq0w6t34RJ6LinwG/rwPT/J/701s?=
 =?iso-8859-1?Q?4mX4pE8NAIHvC0kq4dQYrUndYA6WyUaYC9P6pQ7BJD3wc5ypwH/CBnLzRs?=
 =?iso-8859-1?Q?6Ta4aihCR82APbqeohEv76D66/ROKh+8Ydn98lKP6KbD5MJTdz6S9Vr/FE?=
 =?iso-8859-1?Q?JcbB8n4UkLaIyUK2Zl/ge2ZyqSCjBTTLZHfJKxf6KSj2RjHZYX7yb3+104?=
 =?iso-8859-1?Q?XpmAYYDk/yI0cKJm9Wj7R4ex6MFkw9T0yoSPAW49rUOQ8Z08aV8xdEs0I6?=
 =?iso-8859-1?Q?aIQ6Zh3B/IIJV8rVhi06+DxIeSraT5yu5zV/FVGkU0loXJ2cNV6KmtIME9?=
 =?iso-8859-1?Q?nZtOHL865mUtEv6pby8/fzwndjHmxKiVYb0OmJHzVKchokansl/Exichgo?=
 =?iso-8859-1?Q?0AHwD1uD2yNSVKouXPrdq/N0+T/Zi53xpryNyTVQQr/MX+1XN+sFkiYPMO?=
 =?iso-8859-1?Q?6sMg7nbAWzGBNw1RIdD5nkTmTJSWuIU48OTWbhJuFlj2YKqa1ZMckEpwhB?=
 =?iso-8859-1?Q?gql9ibQ6dPubVzzNFfH8l2kt1Oi0hWgqcP59rw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jWCD08ejKT7jUsUGWo9rrRWz7Ryk0simdcmmrk54NrCPHATFEnZGSSzjZk?=
 =?iso-8859-1?Q?kwY9ORTc4kOTVmde5Qle+s4CaS2xd/Bk92stkNzsfdgBrKPfwx2dHrrVW+?=
 =?iso-8859-1?Q?FQakYqDTInBEaZ80UpsP0ib2uScZuilF0JsuxeKOZXMhqTajhbaUHMiMvC?=
 =?iso-8859-1?Q?5KTK53XqL23Xnq6SFZZvMDpxsplmfRRm0hGgjEQMY28L515Nazlu0SOIRH?=
 =?iso-8859-1?Q?VmzR6oVIUbrFVpMVqkyiC+xNuTUsp81Wd+5MHVnEVTRuGgcczz1UvjAnse?=
 =?iso-8859-1?Q?jUEnO+FCbvD9SGxxnYVbCEIAAFSNiJUWGdmtDd+FArENtb/caW6Dic1VBf?=
 =?iso-8859-1?Q?aN85BbzZTdxzvaBjhUsqo2chzeXppyhqVxzWDQipjOYP70geGylsMxu4HS?=
 =?iso-8859-1?Q?X9BAc3uUw7anI/gsJXP62Jh4FzynmyCjD1LxiYYYKoiO1glTozEs/EK3kk?=
 =?iso-8859-1?Q?nIvTVYak3luw/25JcgJPu6mLLP4HZXytf6F8E6s6DtGBc2h2YjFY/oS0Hm?=
 =?iso-8859-1?Q?tI9PUULYIT0RP84h1AvZwGAkU3ato4gO33RC5pzW0m8Z4xB0a7cqTIWD69?=
 =?iso-8859-1?Q?ca3oWe8vJFlEyYMYaNGbaDKZOIMgIbdOykPqP1Q8/EhGeN/7vjqtcwW0V7?=
 =?iso-8859-1?Q?RzGTXUvPV/h9tuNFt9OtCqpUyDFq2r9YWTtjECrZDe6uUOzU3eQagNi/dE?=
 =?iso-8859-1?Q?BaPNXgbidGshI8+WjLlBFQQdCPaHt0jolofajCOvaEqiNLpTkjK82jaume?=
 =?iso-8859-1?Q?gg0umY+/Yyay87RL1j+V0dRGJzvjk5wrA3uds5CKIX3Ll6gbvWdh9YD8GA?=
 =?iso-8859-1?Q?TuHgHnHYV/ujL/HEfq3B2u9d7iU1pekBF0ZYPwAo5FPjk7xoy1gh606Ovm?=
 =?iso-8859-1?Q?Oww/dAdAHs07F91qVdTIqLcD9d0g2h2pZ6oPdgksjzbWaWfSxjaXis/TfX?=
 =?iso-8859-1?Q?+FSPt9SdrUlBCdjxyaKWKLsCgtSk61B7ATPRAcCjTT6X3YVl9OGFvR8FRX?=
 =?iso-8859-1?Q?FgSg0Y64msNW8AoznehSTMAQMzRpRRP+qWnfg9r/eiekolm9GDVjYnuv/a?=
 =?iso-8859-1?Q?+UCSajKA3QScbny0+6ym5IEH19MEf6V9fWwK6ep5GXGILknSn1yP018PFa?=
 =?iso-8859-1?Q?RmZJj/8GztnEPkBtQJx/TIVghHxAK/gCXKCO90xh++VPz47E821fiQlyNr?=
 =?iso-8859-1?Q?wCfyo7KDjPZ088UqRY31PQJDriInJ0nChO2sWZ/NB/jOn/8EzB97bBAA2V?=
 =?iso-8859-1?Q?b5/gfhlzSZ2vrUEWiNF80LjcjNC3StmkSry0bOEFYnpVw1bDrdor9nBEBw?=
 =?iso-8859-1?Q?iZ4VDJmENO5+K2/hLJkYKAQhleVs8HujqllR2RZLEO4Vh/5xhmKGHzBSG5?=
 =?iso-8859-1?Q?XuqFtovFfMegsFWR7gO/QsiLifzzzdarGyzZ4pW1TZO2yl4iJ0crQFZXUZ?=
 =?iso-8859-1?Q?PSdktUJ+UrivnalcUGa81ECxT9eHZ+8onb7ss/ZlCaHB+xm1sHnAFHqKny?=
 =?iso-8859-1?Q?TuSzQUklzR2W8c1nkvSr5Qi3wc1OzCtZMqiW7NDLx68eYmYE3/W/5jEqTm?=
 =?iso-8859-1?Q?wKb/+chj202yiigXvPZqggZJg/CP3TBCqZl004P+U5pbOWNPAZWxrJb9Gl?=
 =?iso-8859-1?Q?hSeMy+t0jqxRwSAojtpNQEB+eIPdY4vERjpm4j/He+0OZymq74p8pkLg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aconnic.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3530.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3783065-e014-4ade-a0f3-08dcc02fea33
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 09:18:40.4616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b0c6afb7-e762-4e9c-a18f-757ec69e3cc3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNRS9px9I+kJiWZgpAG3JAeZzVQQk/9COh1hwNFTfa18Z0Ey9hKehXwo3HuQG0vKBoVxJP20dW3MJNxPUsiSL1SW6J3WvUC+SXFd6v1Etsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2489

Hi,=0A=
=0A=
I updated ppp-2.4.9 to ppp-2.5.0.=0A=
I have may found an issue using pkg-config to find openssl includes and lib=
s.=0A=
After calling autogen.sh, we call configure with a lot of environment varia=
bles.=0A=
PATH=3D... CC=3D... CFLAGS=3D... LDFLAGS=3D...=0A=
PKG_CONFIG_PATH=3DPATH_TO_PKG_CONFIG_FILES =0A=
configure --host=3Dmips-34kc-linux-gnu --build=3Di486-linux-gnu=0A=
=0A=
As you can see we do cross-compilation and don't pass --with-openssl=0A=
During configure, default ssl dirs are checked but no ssl.h file could be f=
ound.=0A=
Btw. On cross-compile we should skip checking default locations.=0A=
However the variable found is still false.=0A=
Then we come to following if:=0A=
if test "${with_openssl}" !=3D "no" && test ! ${found}=0A=
For some reason we don't go into the if condition to use pkg-config to get=
=0A=
openssl includes and libs.=0A=
I think the "test ! ${found}" should be changed to "test ${found} =3D=3D fa=
lse".=0A=
"test ! ${somevar}" seems to be true, if somevar does not exists. It=0A=
does not check the content of the variable.=0A=
=0A=
Here are some tests I made:=0A=
    foo=3Dtrue=0A=
    if test ! ${foo}=0A=
    then :=0A=
        printf "%s\n" "in if test ! foo=3Dtrue" >&6=0A=
    fi=0A=
    =0A=
    if test ${foo}=0A=
    then :=0A=
        printf "%s\n" "in if test foo=3Dtrue" >&6=0A=
    fi=0A=
    =0A=
    foo=3Dfalse=0A=
    =0A=
    if test ! ${foo}=0A=
    then :=0A=
        printf "%s\n" "in if test ! foo=3Dfalse " >&6=0A=
    fi=0A=
    =0A=
    if test ${foo}=0A=
    then :=0A=
        printf "%s\n" "in if test foo=3Dfalse " >&6=0A=
    fi=0A=
    =0A=
    if test ${foobarbaz}=0A=
    then :=0A=
        printf "%s\n" "in if test foobarbaz " >&6=0A=
    fi=0A=
    if test ! ${foobarbaz}=0A=
    then :=0A=
        printf "%s\n" "in if test ! foobarbaz " >&6=0A=
    fi=0A=
    =0A=
    On terminal I see following lines:=0A=
    in if test foo=3Dtrue=0A=
    in if test foo=3Dfalse=0A=
    in if test ! foobarbaz=0A=
=0A=
Therefore I propose following patch (based on tag ppp-2.5.0)=0A=
--- a/m4/ax_check_openssl.m4=0A=
+++ b/m4/ax_check_openssl.m4=0A=
@@ -70,7 +70,7 @@ AC_DEFUN([AX_CHECK_OPENSSL], [=0A=
            ])=0A=
        done])=0A=
      =0A=
-    AS_IF([test "${with_openssl}" !=3D "no" && test ! ${found}], [  =0A=
+    AS_IF([test "${with_openssl}" !=3D "no" && test ${found} =3D=3D false]=
, [=0A=
        # if pkg-config is installed and openssl has installed a .pc file,=
=0A=
        # then use that information and don't search ssldirs=0A=
        AC_PATH_PROG([PKG_CONFIG], [pkg-config])=0A=
=0A=
May you can check this.=0A=
=0A=
At the moment, we use autoconf version 2.72c=0A=
=0A=
If you need more details, don't hesitate to contact me.=0A=
=0A=
Best regards,=0A=
Stefan Scheibner=0A=
Software engineer=0A=

