# $NetBSD: Makefile,v 1.8 2009/06/30 00:07:23 joerg Exp $
#

DISTNAME=	vtwm-5.4.7
PKGREVISION=	3
CATEGORIES=	x11 wm
MASTER_SITES=	http://www.vtwm.org/downloads/

MAINTAINER=	mehul.sanghvi@gmail.com
HOMEPAGE=	http://www.vtwm.org/downloads/
COMMENT=	TWM with virtual desktop, m4, sound and 3-D buttons

PKG_DESTDIR_SUPPORT=	user-destdir

MAKE_JOBS_SAFE=		no

USE_IMAKE=	YES

.include "../../audio/rplay/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
