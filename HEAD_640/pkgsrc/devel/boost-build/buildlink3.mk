# $NetBSD: buildlink3.mk,v 1.9 2008/09/13 16:14:13 jmmv Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BOOST_BUILD_BUILDLINK3_MK:=	${BOOST_BUILD_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	boost-build
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nboost-build}
BUILDLINK_PACKAGES+=	boost-build
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}boost-build

.if !empty(BOOST_BUILD_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.boost-build+=		boost-build-1.36.*
BUILDLINK_DEPMETHOD.boost-build?=	build
BUILDLINK_PKGSRCDIR.boost-build?=	../../devel/boost-build
.endif	# BOOST_BUILD_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
