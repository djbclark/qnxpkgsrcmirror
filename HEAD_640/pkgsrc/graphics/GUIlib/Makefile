# $NetBSD: Makefile,v 1.16 2008/06/12 02:14:31 joerg Exp $
#

DISTNAME=	GUIlib-1.1.0
PKGREVISION=	7
CATEGORIES=	graphics
MASTER_SITES=	http://www.libsdl.org/projects/GUIlib/src/

MAINTAINER=	zuntum@NetBSD.org
HOMEPAGE=	http://www.libsdl.org/projects/GUIlib/
COMMENT=	Very simple GUI framework library

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		YES

USE_LANGUAGES=		c c++
USE_LIBTOOL=		YES

.include "../../devel/SDL/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
