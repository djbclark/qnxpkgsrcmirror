# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 23:11:06 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CRYPTOPP_BUILDLINK3_MK:=	${CRYPTOPP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cryptopp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncryptopp}
BUILDLINK_PACKAGES+=	cryptopp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}cryptopp

.if !empty(CRYPTOPP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cryptopp+=	cryptopp>=5.1
BUILDLINK_DEPMETHOD.cryptopp?=	build
BUILDLINK_ABI_DEPENDS.cryptopp?=	cryptopp>=5.2.1nb1
BUILDLINK_PKGSRCDIR.cryptopp?=	../../security/cryptopp
.endif	# CRYPTOPP_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
