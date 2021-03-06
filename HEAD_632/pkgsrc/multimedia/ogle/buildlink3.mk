# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 23:11:02 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
OGLE_BUILDLINK3_MK:=	${OGLE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ogle
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nogle}
BUILDLINK_PACKAGES+=	ogle
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}ogle

.if !empty(OGLE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ogle+=	ogle>=0.9.2
BUILDLINK_ABI_DEPENDS.ogle+=	ogle>=0.9.2nb3
BUILDLINK_PKGSRCDIR.ogle?=	../../multimedia/ogle
.endif	# OGLE_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
