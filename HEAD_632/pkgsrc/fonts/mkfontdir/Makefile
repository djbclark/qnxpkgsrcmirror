# $NetBSD: Makefile,v 1.3 2007/03/21 22:57:19 wiz Exp $
#

DISTNAME=		mkfontdir-1.0.3
CATEGORIES=		fonts x11
MASTER_SITES=		http://xorg.freedesktop.org/releases/individual/app/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		X11 Font Index Generator

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=		mkfontscale>=1.0.1:../../fonts/mkfontscale

GNU_CONFIGURE=		yes

.include "../../mk/bsd.pkg.mk"
