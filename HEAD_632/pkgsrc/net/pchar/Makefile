# $NetBSD: Makefile,v 1.32 2007/09/07 22:12:19 jlam Exp $

DISTNAME=		pchar-1.5
CATEGORIES=		net
MASTER_SITES=		http://www.kitchenlab.org/www/bmah/Software/pchar/

MAINTAINER=		soren@NetBSD.org
HOMEPAGE=		http://www.kitchenlab.org/www/bmah/Software/pchar/
COMMENT=		Tool for measuring Internet path characteristics

GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++

PKG_OPTIONS_VAR=	PKG_OPTIONS.pchar
PKG_SUPPORTED_OPTIONS=	inet6

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--with-ipv6
.endif

.if ${OPSYS} == "NetBSD"
.  include "../../net/net-snmp/buildlink3.mk"
CONFIGURE_ARGS+=	--with-snmp=${BUILDLINK_PREFIX.net-snmp}
LIBS+=			-lsnmp -lcrypto -ldes
.endif

INSTALLATION_DIRS=	${PKGMANDIR}/man8 sbin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pchar ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/pchar.8 ${PREFIX}/${PKGMANDIR}/man8

.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
