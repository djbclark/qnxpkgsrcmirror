# $NetBSD: Makefile,v 1.6 2008/07/14 12:56:15 joerg Exp $
#

DISTNAME=	gtk+extra-2.1.1
PKGNAME=	${DISTNAME:S/gtk/gtk2/}
PKGREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=scigraphica/}

MAINTAINER=	bouyer@NetBSD.org
HOMEPAGE=	http://gtkextra.sourceforge.net/
COMMENT=	Useful set of GTK+ widgets for creating GUIs

PKG_DESTDIR_SUPPORT=	user-destdir

USE_X11BASE=		YES
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		YES

USE_LIBTOOL=		YES
PKGCONFIG_OVERRIDE=	gtkextra-2.0.pc.in

.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
