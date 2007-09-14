# $NetBSD: buildlink3.mk,v 1.9 2007/02/02 09:23:44 drochner Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBXML++2_BUILDLINK3_MK:=	${LIBXML++2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libxml++2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibxml++2}
BUILDLINK_PACKAGES+=	libxml++2
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libxml++2

.if !empty(LIBXML++2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libxml++2+=	libxml++2>=2.10.0
BUILDLINK_ABI_DEPENDS.libxml++2+=	libxml++2>=2.10.0nb1
BUILDLINK_PKGSRCDIR.libxml++2?=	../../textproc/libxml++2
.endif	# LIBXML++2_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../devel/glibmm/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
