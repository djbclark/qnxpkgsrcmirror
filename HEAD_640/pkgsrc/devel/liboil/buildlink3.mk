# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 23:10:45 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOIL_BUILDLINK3_MK:=	${LIBOIL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	liboil
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nliboil}
BUILDLINK_PACKAGES+=	liboil
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}liboil

.if !empty(LIBOIL_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.liboil+=	liboil>=0.3.6
BUILDLINK_PKGSRCDIR.liboil?=	../../devel/liboil
.endif	# LIBOIL_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
