# $NetBSD: Makefile,v 1.3 2009/05/20 00:58:13 wiz Exp $
#

DISTNAME=		guile-gtk-0.5
PKGNAME=		guile16-gtk-0.5
PKGREVISION=		1
CATEGORIES=		devel x11
MASTER_SITES=		${MASTER_SITE_GNU:=guile-gtk/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.gnu.org/software/guile-gtk/
COMMENT=		Library to make GTK 1.2 accessible from guile

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		yes
USE_TOOLS+=		makeinfo

GNU_CONFIGURE=		yes
GNU_CONFIGURE_PREFIX=	${PREFIX}/guile/1.6
MAKE_ENV+=		MACHINE_ARCH=${MACHINE_ARCH:Q}
INFO_FILES=		yes

BUILDLINK_PASSTHRU_DIRS=	${PREFIX}/guile/1.6

.include "../../lang/guile16/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"
.include "../../graphics/gdk-pixbuf/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
