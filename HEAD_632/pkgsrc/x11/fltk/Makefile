# $NetBSD: Makefile,v 1.63 2007/03/16 21:40:33 joerg Exp $

DISTNAME=	fltk-1.1.7-source
PKGNAME=	${DISTNAME:S/-source//}
VERS=		${DISTNAME:S/fltk-//:S/-source//}
PKGREVISION=	4
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=fltk/} \
		ftp://ftp2.easysw.com/pub/fltk/${VERS}/ \
		ftp://ftp3.easysw.com/pub/fltk/${VERS}/ \
		http://ftp.easysw.com/pub/fltk/${VERS}/ \
		http://mirror.nu6.org/ftp.easysw.com/pub/fltk/${VERS}/ \
		ftp://ftp.funet.fi/pub/mirrors/ftp.easysw.com/pub/fltk/${VERS}/ \
		ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${VERS}/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.fltk.org/
COMMENT=	Fast Light Tool Kit for graphical user interfaces

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=			${WRKDIR}/${DISTNAME:S/-source//}
USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake
USE_LIBTOOL=		yes
TEST_TARGET=		test

PTHREAD_OPTS+=		require
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-libtool=${LIBTOOL:Q}
CONFIGURE_ARGS+=	--enable-threads
CONFIGURE_ARGS+=	ac_cv_have_overlay=yes
.if exists(./descr)
PLIST_SUBST+=		WITH_LINKS="@comment "
.else
CONFIGURE_ARGS+=	--with-links
PLIST_SUBST+=		WITH_LINKS=""
.endif

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
