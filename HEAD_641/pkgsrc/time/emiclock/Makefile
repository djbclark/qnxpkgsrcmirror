# $NetBSD: Makefile,v 1.22 2009/07/07 20:25:27 joerg Exp $
#

DISTNAME=	emiclock-2.0.2
PKGREVISION=	4
CATEGORIES=	x11 time
MASTER_SITES=	${MASTER_SITE_FREEBSD}

MAINTAINER=	minoura@NetBSD.org
COMMENT=	Analog clock with image in the middle
LICENSE=	emiclock-license

PKG_DESTDIR_SUPPORT=	user-destdir

RESTRICTED=	Do not distribute
NO_SRC_ON_FTP=${RESTRICTED}
NO_BIN_ON_FTP=${RESTRICTED}
NO_SRC_ON_CDROM=${RESTRICTED}
NO_BIN_ON_CDROM=${RESTRICTED}

USE_IMAKE=	yes

.include "../../mk/bsd.prefs.mk"

.if defined(XAW_TYPE) && (${XAW_TYPE} == "3d" || ${XAW_TYPE} == "xpm")
post-patch:
	${ECHO} "#define USE_XAW3D" > ${WRKSRC}/xawconfig.h
.else
post-patch:
	${ECHO} "#undef USE_XAW3D" > ${WRKSRC}/xawconfig.h
.endif

INSTALLATION_DIRS=	lib/X11/ja_JP.eucJP/app-defaults

post-install:
	${INSTALL_DATA} ${WRKSRC}/resources/R6/EUC/EmiClock.ad \
		${DESTDIR}${PREFIX}/lib/X11/ja_JP.eucJP/app-defaults/EmiClock

.include "../../mk/xaw.buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
