# $NetBSD: buildlink3.mk,v 1.17 2007/12/05 07:11:28 martti Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SQUIRRELMAIL_BUILDLINK3_MK:=	${SQUIRRELMAIL_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	squirrelmail
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsquirrelmail}
BUILDLINK_PACKAGES+=	squirrelmail
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}squirrelmail

.if ${SQUIRRELMAIL_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.squirrelmail+=	squirrelmail>=1.4.12
BUILDLINK_PKGSRCDIR.squirrelmail?=	../../mail/squirrelmail
.endif	# SQUIRRELMAIL_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
