# $NetBSD: Makefile,v 1.4 2009/07/22 09:01:45 wiz Exp $
#

POLICYKIT_GNOME_VER=	0.9.2
DISTNAME=		PolicyKit-gnome-${POLICYKIT_GNOME_VER}
PKGNAME=		policykit-gnome-${POLICYKIT_GNOME_VER}
CATEGORIES=		security
MASTER_SITES=		http://hal.freedesktop.org/releases/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		netbsd-desktop@NetBSD.org
HOMEPAGE=		http://hal.freedesktop.org/
COMMENT=		GNOME dialogs for PolicyKit

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DEFS+=		VARBASE

GNU_CONFIGURE=		YES
USE_PKGLOCALEDIR=	YES
USE_TOOLS+=		gmake intltool msgfmt perl pkg-config
USE_LIBTOOL=		YES

GCONF_SCHEMAS=		polkit-gnome.schemas

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}

.include "../../devel/GConf/schemas.mk"
.include "../../security/policykit/buildlink3.mk"
.include "../../textproc/gnome-doc-utils/buildlink3.mk"
.include "../../textproc/gtk-doc/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
