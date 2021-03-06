# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/05/05 10:19:22 drochner Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_MPD_BUILDLINK3_MK:=	${PY_MPD_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	py-mpd
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npy-mpd}
BUILDLINK_PACKAGES+=	py-mpd
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}py-mpd

.if ${PY_MPD_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.py-mpd+=	${PYPKGPREFIX}-mpd>=0.2.0
BUILDLINK_PKGSRCDIR.py-mpd?=	../../audio/py-mpd
.endif	# PY_MPD_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
