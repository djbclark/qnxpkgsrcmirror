# $NetBSD: buildlink3.mk,v 1.10 2008/01/17 14:06:07 joerg Exp $

.include "../../mk/bsd.fast.prefs.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
RENDERPROTO_BUILDLINK3_MK:=	${RENDERPROTO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	renderproto
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrenderproto}
BUILDLINK_PACKAGES+=	renderproto
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}renderproto

.if !empty(RENDERPROTO_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.renderproto+=	renderproto>=0.9.3nb1
BUILDLINK_PKGSRCDIR.renderproto?=	../../x11/renderproto
BUILDLINK_DEPMETHOD.renderproto?=	build
.endif	# RENDERPROTO_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
