# $NetBSD: Makefile,v 1.22 2007/06/18 04:43:45 dogcow Exp $
#

DISTNAME=	xbatt-1.3pr1
PKGNAME=	xbatt-1.3.1
PKGREVISION=	2
CATEGORIES=	sysutils x11
MASTER_SITES=	http://www2.clave.gr.jp/~eto/xbatt/

MAINTAINER=	hubertf@NetBSD.org
HOMEPAGE=	http://www2.clave.gr.jp/~eto/xbatt/	# Not really
COMMENT=	Displays battery status of your notebook via APM

.if !exists(/usr/include/machine/apmvar.h)
PKG_SKIP_REASON+=	"APM is not available for ${MACHINE_PLATFORM}"
.endif

WRKSRC=		${WRKDIR}/xbatt-1.3
USE_IMAKE=	YES
BUILD_TARGET=	xbatt

post-install:
		${INSTALL_DATA} ${FILESDIR}/XBatt ${PREFIX}/lib/X11/app-defaults/XBatt
		${INSTALL_MAN_DIR} ${PREFIX}/share/doc/xbatt
		${INSTALL_MAN} ${WRKSRC}/README ${PREFIX}/share/doc/xbatt
		${INSTALL_MAN} ${WRKSRC}/README.jp ${PREFIX}/share/doc/xbatt

.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXaw/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
