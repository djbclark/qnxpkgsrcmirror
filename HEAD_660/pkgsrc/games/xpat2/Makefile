# $NetBSD: Makefile,v 1.27 2012/10/06 11:55:02 asau Exp $

DISTNAME=	xpat2-1.07
PKGREVISION=	3
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SUNSITE:=games/solitaires/}
EXTRACT_SUFX=	-src.tar.gz

MAINTAINER=	kuebart@mathematik.uni-ulm.de
COMMENT=	X11 solitaire game with 14 variations

MAKE_JOBS_SAFE=		no
PKG_INSTALLATION_TYPES=	overwrite pkgviews

USE_TOOLS+=	imake pax

MAKE_ENV+=	XPMDIR=${BUILDLINK_PREFIX.libXpm:Q} XMKMF=${XMKMF_CMD:Q}

SETGIDGAME=	yes

CONF_FILES_PERMS=	/dev/null /var/games/xpat.log ${GAMES_USER} ${GAMES_GROUP} ${GAMEMODE}
MAKE_DIRS=		/var/games

SPECIAL_PERMS+=	bin/xpat2 ${SETGID_GAMES_PERMS}

.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
