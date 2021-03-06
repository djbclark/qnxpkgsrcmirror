# $NetBSD: buildlink3.mk,v 1.1.1.1 2007/07/01 00:43:20 tnn Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SOLARIS_TAP_BUILDLINK3_MK:=	${SOLARIS_TAP_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	solaris-tap
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsolaris-tap}
BUILDLINK_PACKAGES+=	solaris-tap
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}solaris-tap

.if ${SOLARIS_TAP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.solaris-tap+=	solaris-tap>=20070525
BUILDLINK_PKGSRCDIR.solaris-tap?=	../../net/solaris-tap
BUILDLINK_DEPMETHOD.solaris-tap?=	build
.endif	# SOLARIS_TAP_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
