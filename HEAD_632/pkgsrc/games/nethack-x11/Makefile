# $NetBSD: Makefile,v 1.35 2006/12/27 13:37:36 joerg Exp $
#

.include "../../games/nethack-lib/Makefile.common"

PKGNAME=		nethack-x11-${NETHACK_VERSION}
PKGREVISION=		2
COMMENT=		The X11 version of NetHack

CATEGORIES+=		x11

DEPENDS+=		nethack-lib-${NETHACK_VERSION}nb1:../../games/nethack-lib


BUILD_TARGET=		x11tiles nethack
INSTALL_TARGET=		binfiles
MAKE_ENV+=		GTYPE=-x11

FONTS_DIRS.x11+=	${PREFIX}/lib/X11/fonts/misc

INSTALLATION_DIRS=	lib/X11/app-defaults lib/X11/fonts/misc

post-install:
	@${INSTALL_DATA} ${WRKSRC}/dat/x11tiles ${PREFIX}/share/${NETHACK_DIR}
	@${INSTALL_DATA} ${WRKSRC}/win/X11/NetHack.ad \
	    ${PREFIX}/lib/X11/app-defaults/NetHack
	@${INSTALL_DATA} ${WRKSRC}/win/X11/nh10.bdf ${PREFIX}/lib/X11/fonts/misc
	@${INSTALL_DATA} ${WRKSRC}/win/X11/nethack.rc \
	    ${PREFIX}/share/${NETHACK_DIR}/nethack.x11.rc

.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
