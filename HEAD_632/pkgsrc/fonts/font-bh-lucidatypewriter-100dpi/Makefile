# $NetBSD: Makefile,v 1.1.1.1 2006/11/15 11:22:27 joerg Exp $
#

DISTNAME=		font-bh-lucidatypewriter-100dpi-1.0.0
CATEGORIES=		fonts
MASTER_SITES=		http://xorg.freedesktop.org/releases/individual/font/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		100dpi Bigelow & Holmes Lucida Typewriter PCF fonts

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		yes
USE_TOOLS+=		gmake pkg-config bdftopcf ucs2any

FONTS_DIRS.x11=		lib/X11/fonts/100dpi

.include "../../fonts/font-util/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
