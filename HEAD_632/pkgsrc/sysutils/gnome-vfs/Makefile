# $NetBSD: Makefile,v 1.65 2007/10/31 19:58:13 drochner Exp $

PKGCONFIG_OVERRIDE=	gnome-vfs-2.0.pc.in
PKGCONFIG_OVERRIDE+=	gnome-vfs-module-2.0.pc.in

OWN_DIRS=		${PKG_SYSCONFDIR}/modules

EGFILES+=		modules/default-modules.conf
EGFILES+=		modules/ssl-modules.conf

GCONF_SCHEMAS=		desktop_default_applications.schemas
GCONF_SCHEMAS+=	desktop_gnome_url_handlers.schemas
GCONF_SCHEMAS+=	system_dns_sd.schemas
GCONF_SCHEMAS+=	system_http_proxy.schemas
GCONF_SCHEMAS+=	system_smb.schemas

LDFLAGS.Darwin+=	-lresolv

BUILDLINK_API_DEPENDS.glib2+=	glib2>=2.9.3

PKG_DESTDIR_SUPPORT=	user-destdir

.include "Makefile.common"

CONFIGURE_ARGS+=	--enable-fam

CONFLICTS+=		gnome-vfs2-[0-9]*

.include "../../devel/GConf/schemas.mk"

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

.include "../../mk/fam.buildlink3.mk"
.include "../../mk/krb5.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
