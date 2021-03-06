# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 23:11:10 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GDOME2_BUILDLINK3_MK:=	${GDOME2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gdome2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngdome2}
BUILDLINK_PACKAGES+=	gdome2
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}gdome2

.if !empty(GDOME2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gdome2+=	gdome2>=0.8.1nb1
BUILDLINK_ABI_DEPENDS.gdome2?=	gdome2>=0.8.1nb2
BUILDLINK_PKGSRCDIR.gdome2?=	../../textproc/gdome2
.endif	# GDOME2_BUILDLINK3_MK

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
