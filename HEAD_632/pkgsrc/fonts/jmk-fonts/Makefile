# $NetBSD: Makefile,v 1.12 2006/10/04 21:39:31 wiz Exp $
#

DISTNAME=	jmk-x11-fonts-3.0
PKGNAME=	jmk-fonts-3.0
PKGREVISION=	3
CATEGORIES=	fonts x11
MASTER_SITES=	${MASTER_SITE_SUNSITE:=X11/fonts/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.jmknoble.net/fonts/
COMMENT=	Jim Knoble's font collection for X11

USE_IMAKE=	yes
USE_TOOLS+=	bdftopcf

FONTS_DIRS.x11+=	${PREFIX}/lib/X11/fonts/jmk
REQD_DIRS+=		${PREFIX}/lib/X11/fonts/jmk

post-install:
	${RM} ${PREFIX}/lib/X11/fonts/jmk/fonts.scale

.include "../../mk/bsd.pkg.mk"
