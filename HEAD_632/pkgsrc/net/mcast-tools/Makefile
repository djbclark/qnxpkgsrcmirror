# $NetBSD: Makefile,v 1.1.1.1 2007/10/11 19:14:20 is Exp $

DISTNAME=	mcast-tools-20061214
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}

MAINTAINER=	is@NetBSD.org
COMMENT=	IPv6 multicast routing daemons and tools

CONFLICTS=	pim6sd-[0-9]* pim6dd-[0-9]*

GNU_CONFIGURE=	yes

INSTALLATION_DIRS= share/examples

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/mcast-tools
	${INSTALL_DATA} ${WRKSRC}/pim6sd/pim6sd.conf.sample ${PREFIX}/share/examples/mcast-tools
	${INSTALL_DATA} ${FILESDIR}/pim6dd.conf.sample ${PREFIX}/share/examples/mcast-tools
	${INSTALL_DATA} ${WRKSRC}/mfc/mfc.conf.sample ${PREFIX}/share/examples/mcast-tools

.include "../../mk/bsd.pkg.mk"
