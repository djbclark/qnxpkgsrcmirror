# $NetBSD: Makefile,v 1.17 2013/07/05 13:29:37 ryoon Exp $

DISTNAME=	kcalc-${_KDE_VERSION}
PKGREVISION=	4
CATEGORIES=	math
COMMENT=	KDE scientific calculator

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../devel/gmp/buildlink3.mk"
.include "../../math/mpfr/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
