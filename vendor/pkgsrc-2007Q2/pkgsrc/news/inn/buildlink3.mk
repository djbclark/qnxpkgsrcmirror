# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 23:11:04 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
INN_BUILDLINK3_MK:=	${INN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	inn
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ninn}
BUILDLINK_PACKAGES+=	inn
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}inn

.if !empty(INN_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.inn+=	inn>=2.3.4
BUILDLINK_PKGSRCDIR.inn?=	../../news/inn

.endif	# INN_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
