# $NetBSD: Makefile,v 1.11 2009/08/12 02:31:21 obache Exp $
#

DISTNAME=		tomboy-0.14.3
PKGREVISION=		1
CATEGORIES=		editors misc
MASTER_SITES=		${MASTER_SITE_GNOME:=sources/tomboy/0.14/}

MAINTAINER=		rhaen@NetBSD.org
HOMEPAGE=		http://www.gnome.org/projects/tomboy
COMMENT=		Gnome desktop note application
LICENSE=		gnu-lgpl-v2.1

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=  yes
USE_LIBTOOL=    yes
USE_TOOLS+=     gmake intltool pkg-config bash:run msgfmt

GCONF_SCHEMAS=	tomboy.schemas

PKGCONFIG_OVERRIDE+=	data/tomboy-addins.pc.in

.include "../../devel/GConf/schemas.mk"
BUILDLINK_API_DEPENDS.mono-addins+=	mono-addins>=0.3.1
.include "../../devel/mono-addins/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../lang/mono/buildlink3.mk"
# evolution needs gmime-sharp
#.include "../../mail/evolution/buildlink3.mk"
#.include "../../mail/gmime-sharp/buildlink3.mk"
#.include "../../net/galago-sharp/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/ndesk-dbus-glib/buildlink3.mk"
.include "../../sysutils/ndesk-dbus/buildlink3.mk"
.include "../../textproc/gnome-doc-utils/buildlink3.mk"
.include "../../textproc/gtkspell/buildlink3.mk"
.include "../../mk/omf-scrollkeeper.mk"
.include "../../x11/gnome-desktop-sharp/buildlink3.mk"
.include "../../x11/gnome-panel/buildlink3.mk"
.include "../../x11/gnome-sharp/buildlink3.mk"
.include "../../x11/gtk-sharp/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk2+=	gtk2+>=2.10.0
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
