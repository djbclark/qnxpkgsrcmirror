# $NetBSD: Makefile,v 1.44 2008/06/20 01:09:35 joerg Exp $
#

DISTNAME=		gcombust-0.1.54
PKGREVISION=		6
CATEGORIES=		x11 sysutils
MASTER_SITES=		${HOMEPAGE}

MAINTAINER=		rh@NetBSD.org
HOMEPAGE=		http://www.abo.fi/~jmunsin/gcombust/
COMMENT=		Graphical frontend for CD mastering (mkisofs, cdrecord, ...)

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=		cdrtools>=1.10:../../sysutils/cdrtools
DEPENDS+=		cdlabelgen-[0-9]*:../../graphics/cdlabelgen
DEPENDS+=		gv-[0-9]*:../../print/gv

USE_DIRS+=		gnome1-1.5
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
