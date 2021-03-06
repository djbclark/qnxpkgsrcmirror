# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/10/30 20:58:11 bjs Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBPCIACCESS_BUILDLINK3_MK:=	${LIBPCIACCESS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libpciaccess
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibpciaccess}
BUILDLINK_PACKAGES+=	libpciaccess
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libpciaccess

.if ${LIBPCIACCESS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libpciaccess+=	libpciaccess>=0.10.4
BUILDLINK_PKGSRCDIR.libpciaccess?=	../../sysutils/libpciaccess
.endif	# LIBPCIACCESS_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
