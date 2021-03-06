# $NetBSD: buildlink3.mk,v 1.9 2006/12/09 03:38:16 jnemeth Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GMP_BUILDLINK3_MK:=	${GMP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gmp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngmp}
BUILDLINK_PACKAGES+=	gmp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}gmp

.if !empty(GMP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gmp+=		gmp>=4.2.1
BUILDLINK_ABI_DEPENDS.gmp+=	gmp>=4.2.1
BUILDLINK_PKGSRCDIR.gmp?=	../../devel/gmp
.endif	# GMP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
