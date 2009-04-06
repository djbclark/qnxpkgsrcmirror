# $NetBSD: buildlink3.mk,v 1.1.1.1 2009/04/06 10:25:19 drochner Exp $

BUILDLINK_TREE+=	xcb-util

.if !defined(XCB_UTIL_BUILDLINK3_MK)
XCB_UTIL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xcb-util?=	xcb-util>=0.3.3
BUILDLINK_PKGSRCDIR.xcb-util?=		../../x11/xcb-util

.include "../../x11/libxcb/buildlink3.mk"
.endif # XCB_UTIL_BUILDLINK3_MK

BUILDLINK_TREE+=	-xcb-util
