# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:10:41 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
BUDDY_BUILDLINK3_MK:=	${BUDDY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	buddy
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nbuddy}
BUILDLINK_PACKAGES+=	buddy
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}buddy

.if !empty(BUDDY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.buddy+=	buddy>=2.4
BUILDLINK_PKGSRCDIR.buddy?=	../../devel/buddy
.endif	# BUDDY_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
