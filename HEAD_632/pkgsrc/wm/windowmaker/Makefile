# $NetBSD: Makefile,v 1.76 2007/12/02 11:45:06 wiz Exp $

DISTNAME=	WindowMaker-0.92.0
PKGNAME=	${DISTNAME:S/WindowMaker/windowmaker/}
PKGREVISION=	7
CATEGORIES=	x11 wm windowmaker
MASTER_SITES=	ftp://ftp.windowmaker.info/pub/source/release/ \
		http://windowmaker.info/pub/source/release/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.windowmaker.info/
COMMENT=	GNUStep-compliant NEXTSTEP(tm) window manager clone

BROKEN_GETTEXT_DETECTION=	yes

USE_TOOLS+=		msgfmt
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-usermenu
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASEDIR:Q}
CONFIGURE_ARGS+=	--with-gnustepdir=${PREFIX:Q}/share/GNUstep
CONFIGURE_ARGS+=	--with-nlsdir=${PREFIX:Q}/${PKGLOCALEDIR:Q}/locale
CONFIGURE_ENV+=		LINGUAS=yes
CONFIGURE_ENV+=		CPP_PATH=${CPP:Q}
REPLACE_PERL+=		util/wkdemenu.pl
INSTALL_TARGET=		install-strip

.include "../../mk/compiler.mk"

.if ${MACHINE_ARCH} != "i386"
CONFIGURE_ENV+=		ac_cv_c_inline_asm=no
.endif

.if ${MACHINE_ARCH} == "arm" || ${MACHINE_ARCH} == "arm32"
GCC_REQD+=	3.0
.endif

PKG_SYSCONFSUBDIR=	WindowMaker
EGDIR=			${PREFIX}/share/examples/WindowMaker
CONF_FILES=
.for f in WMGLOBAL WMRootMenu WMState WMWindowAttributes WindowMaker
CONF_FILES+=		${EGDIR:Q}/${f:Q} ${PKG_SYSCONFDIR:Q}/${f:Q}
.endfor

# WINDOWMAKER_OPTIONS is a space-separated list of compile-time options
# to support.  Currently supported options:
#
#	kde		enable support for kde/kwm window manager hints
#	gnome		enable support for GNOME window manager hints
#	openlook	enable support for OPEN LOOK(tm) window manager hints
#	vdesktop	enable support for virtual desktop.

WINDOWMAKER_OPTIONS?=	gnome kde openlook vdesktop

BUILD_DEFS+=		WINDOWMAKER_OPTIONS

.for option in ${WINDOWMAKER_OPTIONS}
CONFIGURE_ARGS+=	--enable-${option:Q}
.endfor

post-extract:
	${RM} -f ${WRKSRC:Q}/WindowMaker/Defaults/WMState \
		 ${WRKSRC:Q}/WindowMaker/Defaults/WMWindowAttributes \
		 ${WRKSRC:Q}/WindowMaker/Defaults/WindowMaker \
		 ${WRKSRC:Q}/po/zh_TW.Big5.po
	set -e; \
	for manfile in ${WRKSRC:Q}/doc/*.1x ${WRKSRC:Q}/doc/*/*.1x; \
	do \
		${MV} "$$manfile" `${ECHO} "$$manfile" | ${SED} "s/1x$$/1/"`; \
	done;
	set -e; \
	cd ${WRKSRC:Q} && \
	for f in WINGs/wapplication.c WindowMaker/Defaults/WindowMaker.in \
		WPrefs.app/Paths.c WindowMaker/menu* WindowMaker/plmenu*; do \
		${SED}	-e "s|/usr/local|${PREFIX}|g" \
			-e "s|${PREFIX}/GNUstep|${PREFIX}/share/GNUstep|g" \
			"$$f" > "$$f".new && \
		${MV} "$$f".new "$$f"; \
	done

post-install:
	${INSTALL_DATA_DIR} ${PREFIX:Q}/share/WindowMaker/SoundSets
	${INSTALL_DATA_DIR} ${PREFIX:Q}/share/WindowMaker/Sounds
	${TOUCH} ${PREFIX:Q}/share/WindowMaker/SoundSets/.directory
	${TOUCH} ${PREFIX:Q}/share/WindowMaker/Sounds/.directory
	${INSTALL_DATA_DIR} ${PREFIX:Q}/share/doc/WindowMaker
	cd ${WRKSRC:Q} && \
	${INSTALL_DATA} \
		README README.definable-cursor FAQ FAQ.I18N \
		${PREFIX:Q}/share/doc/WindowMaker

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../graphics/libungif/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
