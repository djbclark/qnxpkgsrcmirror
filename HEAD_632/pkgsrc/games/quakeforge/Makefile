# $NetBSD: Makefile,v 1.18 2007/09/07 22:12:12 jlam Exp $

DISTNAME=		quakeforge-0.5.5
PKGREVISION=		7
CATEGORIES=		games
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=quake/}

MAINTAINER=		snj@NetBSD.org
HOMEPAGE=		http://www.quakeforge.net/
COMMENT=		Improved Quake engine

CONFIGURE_ARGS+=	--with-cpp="${CPP} %d %i %o"
CONFIGURE_ARGS+=	--disable-ogg
CONFIGURE_ARGS+=	--disable-xmms
GNU_CONFIGURE=		YES
USE_LANGUAGES=		c c++
USE_TOOLS+=		bison gmake
USE_LIBTOOL=		YES

SUBST_CLASSES+=		dsp
SUBST_STAGE.dsp=	post-patch
SUBST_MESSAGE.dsp=	Adjusting sound device path.
SUBST_FILES.dsp=	libs/audio/targets/snd_oss.c
SUBST_SED.dsp=		-e "s|/dev/dsp|${DEVOSSAUDIO}|"

PKG_OPTIONS_VAR=	PKG_OPTIONS.quakeforge
PKG_SUPPORTED_OPTIONS=	inet6

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--with-ipv6
.else
CONFIGURE_ARGS+=	--without-ipv6
.endif

.if ${OPSYS} == "NetBSD" || ${OPSYS} == "SunOS"
PLIST_SUBST+=		COND_SUN=""
.else
PLIST_SUBST+=		COND_SUN="@comment "
.endif

INSTALLATION_DIRS=	include/QF/GL include/QF/plugin include/QF/ruamoko/gui

.include "../../devel/SDL/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
