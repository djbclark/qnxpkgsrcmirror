# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:11:03 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBLIVE_BUILDLINK3_MK:=	${LIBLIVE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	liblive
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nliblive}
BUILDLINK_PACKAGES+=	liblive
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}liblive

.if !empty(LIBLIVE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.liblive+=	liblive>=2003.04.04
BUILDLINK_ABI_DEPENDS.liblive+=	liblive>=2003.04.04nb1
BUILDLINK_PKGSRCDIR.liblive?=	../../net/liblive
.endif	# LIBLIVE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
