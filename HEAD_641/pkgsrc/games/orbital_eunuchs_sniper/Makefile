# $NetBSD: Makefile,v 1.14 2009/02/15 21:57:51 wiz Exp $
#

DISTNAME=		orbital_eunuchs_sniper-1.30
CATEGORIES=		games
MASTER_SITES=		http://icculus.org/oes/

MAINTAINER=		wiz@NetBSD.org
HOMEPAGE=		http://icculus.org/oes/
COMMENT=		Overhead shooting game

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-games-dir=${PREFIX}/libexec

INSTALLATION_DIRS=	share/doc/orbital_eunuchs_sniper
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
REPLACE_INTERPRETER+=	bash
REPLACE.bash.old=	.*/bin/bash
REPLACE.bash.new=	${SH}
REPLACE_FILES.bash=	src/snipe2d.in

.if ${MACHINE_ARCH} == "x86_64"
PLIST_SUBST+=		CPU=amd64
.else
PLIST_SUBST+=		CPU=${MACHINE_ARCH}
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/README \
		${DESTDIR}${PREFIX}/share/doc/orbital_eunuchs_sniper
	${INSTALL_DATA} ${WRKSRC}/readme.txt \
		${DESTDIR}${PREFIX}/share/doc/orbital_eunuchs_sniper

.include "../../audio/SDL_mixer/buildlink3.mk"
.include "../../devel/SDL/buildlink3.mk"
.include "../../graphics/SDL_image/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
