# $NetBSD: Makefile,v 1.6 2009/07/22 09:01:20 wiz Exp $

DISTNAME=	empathy-2.24.1
PKGREVISION=	1
CATEGORIES=	chat gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/empathy/2.24/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://live.gnome.org/Empathy
COMMENT=	Gnome instant messenger client

# not strictly needed, but without any plugins, empathy is useless
DEPENDS+=	telepathy-gabble-[0-9]*:../../chat/telepathy-gabble
DEPENDS+=	telepathy-idle-[0-9]*:../../chat/telepathy-idle

GNU_CONFIGURE=		yes
USE_TOOLS+=		gawk gmake intltool msgfmt pkg-config
USE_TOOLS+=		autoconf
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes

GCONF_SCHEMAS+=	GNOME_Megaphone_Applet.schemas
GCONF_SCHEMAS+=	empathy.schemas

pre-configure:
	cd ${WRKSRC} && autoconf -f

.include "../../chat/telepathy-mission-control/buildlink3.mk"
.include "../../chat/telepathy-glib/buildlink3.mk"
.include "../../devel/GConf/schemas.mk"
.include "../../devel/libglade/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=		glib2>=2.16.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../lang/python/application.mk"
BUILDLINK_API_DEPENDS.enchant+=		enchant>=1.2.0
.include "../../mail/evolution-data-server/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/enchant/buildlink3.mk"
.include "../../textproc/gnome-doc-utils/buildlink3.mk"
.include "../../textproc/gtk-doc/buildlink3.mk"
.include "../../textproc/iso-codes/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gnome-panel/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk2+=		gtk2+>=2.12.0
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/omf-scrollkeeper.mk"
.include "../../mk/bsd.pkg.mk"
