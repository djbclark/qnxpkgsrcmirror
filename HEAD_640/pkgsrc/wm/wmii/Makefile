# $NetBSD: Makefile,v 1.18 2008/05/16 09:06:03 ghen Exp $

DISTNAME=		wmii-3.6
PKGREVISION=		2
CATEGORIES=		wm
MASTER_SITES=		http://www.suckless.org/download/

MAINTAINER=		ghen@NetBSD.org
HOMEPAGE=		http://wmii.suckless.org/
COMMENT=		Modular and keyboard-friendly window manager

DEPENDS+=		dmenu>=3.6:../../x11/dmenu

NO_CONFIGURE=		yes

BUILD_DEFS+=		PKG_SYSCONFBASE
MAKE_ENV+=		PKG_SYSCONFBASE=${PKG_SYSCONFBASE}

# see ${WRKSRC}/mk/wmii.mk
CONFVERSION=		3.5
PLIST_SUBST+=		CONFVERSION=${CONFVERSION}

PKG_SYSCONFSUBDIR=	wmii-${CONFVERSION}
EGDIR=			${PREFIX}/share/examples/${PKG_SYSCONFSUBDIR}
EGFILES=		rc.wmii welcome wmiirc
CONF_FILES_MODE=	0755

.for f in ${EGFILES}
CONF_FILES+=		${EGDIR}/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

.include "../../devel/libixp/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
