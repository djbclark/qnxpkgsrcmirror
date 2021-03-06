# $NetBSD: buildlink3.mk,v 1.6 2008/12/19 23:54:47 hira Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XFCE4_THUNAR_BUILDLINK3_MK:=	${XFCE4_THUNAR_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	xfce4-thunar
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-thunar}
BUILDLINK_PACKAGES+=	xfce4-thunar
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}xfce4-thunar

.if ${XFCE4_THUNAR_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.xfce4-thunar+=	xfce4-thunar>=0.9.3nb2
BUILDLINK_PKGSRCDIR.xfce4-thunar?=	../../sysutils/xfce4-thunar
.endif	# XFCE4_THUNAR_BUILDLINK3_MK

pkgbase := xfce4-thunar
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.xfce4-thunar:Mhal)
.include "../../sysutils/hal/buildlink3.mk"
.endif

.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libexif/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../x11/xfce4-exo/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../devel/xfce4-dev-tools/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/fam.buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
