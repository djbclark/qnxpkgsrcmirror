# $NetBSD: Makefile,v 1.4 2008/05/24 21:45:16 tnn Exp $
#

DISTNAME=	xwud-1.0.1
CATEGORIES=	x11 graphics
MASTER_SITES=	${MASTER_SITE_XORG:=app/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	reed@reedmedia.net
HOMEPAGE=	http://xorg.freedesktop.org/
COMMENT=	Display XWD X Window Dump image file

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

CONFIGURE_ENV+=		APP_MAN_SUFFIX=1

.include "../../x11/libX11/buildlink3.mk"

# Should this be in libX11/buildlink3.mk?
# Package 'inputproto', required by 'X11', not found
.include "../../x11/inputproto/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
