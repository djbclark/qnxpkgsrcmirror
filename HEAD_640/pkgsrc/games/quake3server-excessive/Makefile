# $NetBSD: Makefile,v 1.6 2008/05/26 02:13:19 joerg Exp $

DISTNAME=	excessive_q3_server_003
PKGNAME=	quake3server-excessive-003
PKGREVISION=	1
CATEGORIES=	games net
MASTER_SITES=	ftp://ftp.fr.FreeBSD.org/pub/FreeBSD/distfiles/
EXTRACT_SUFX=	.zip

MAINTAINER=	david@silicium.ath.cx
COMMENT=	Quake III Arena Mod: Excessive for Linux

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}

.include "../../games/quake3server/Makefile.common"

DEPENDS+=	quake3server>=1.32:../../games/quake3server
USE_TOOLS+=	pax

ONLY_FOR_PLATFORM=	NetBSD-*-i386
NO_BUILD=	yes
Q3MODDIR=	${Q3ROOTDIR}/excessive

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${Q3MODDIR}
	cd ${WRKSRC}/excessive && pax -rwppm . ${DESTDIR}${Q3MODDIR}

.include "../../mk/bsd.pkg.mk"
