# $NetBSD: Makefile,v 1.1.1.1 2008/05/25 15:29:19 joerg Exp $

VERS=		6129
DISTNAME=	fltk-2.0.x-r${VERS}
PKGNAME=	fltk2-2.0pre${VERS}
CATEGORIES=	x11
MASTER_SITES=	http://ftp.easysw.com/pub/fltk/snapshots/ \
		http://mirror.nu6.org/ftp.easysw.com/pub/fltk/snapshots/ \
		ftp://ftp.funet.fi/pub/mirrors/ftp.easysw.com/pub/fltk/snapshots/ \
		ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/snapshots/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.fltk.org/
COMMENT=	Fast Light Tool Kit for graphical user interfaces

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake
TEST_TARGET=		test

PTHREAD_OPTS+=		require
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-threads
CONFIGURE_ARGS+=	ac_cv_have_overlay=yes

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
