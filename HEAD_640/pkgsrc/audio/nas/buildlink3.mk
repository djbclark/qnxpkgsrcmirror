# $NetBSD: buildlink3.mk,v 1.9 2006/07/12 17:21:52 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NAS_BUILDLINK3_MK:=	${NAS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	nas
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnas}
BUILDLINK_PACKAGES+=	nas
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}nas

.if !empty(NAS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.nas+=	nas>=1.4.2
BUILDLINK_ABI_DEPENDS.nas+=	nas>=1.7bnb2
BUILDLINK_PKGSRCDIR.nas?=	../../audio/nas
.endif	# NAS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
