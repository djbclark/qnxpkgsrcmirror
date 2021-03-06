# $NetBSD: buildlink3.mk,v 1.11 2008/07/17 09:02:54 dsainty Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
OPENMOTIF_BUILDLINK3_MK:=	${OPENMOTIF_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	openmotif
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nopenmotif}
BUILDLINK_PACKAGES+=	openmotif
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}openmotif

.if !empty(OPENMOTIF_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.openmotif+=	openmotif>=2.3.1
BUILDLINK_ABI_DEPENDS.openmotif?=	openmotif>=2.3.1
BUILDLINK_PKGSRCDIR.openmotif?=	../../x11/openmotif
.endif	# OPENMOTIF_BUILDLINK3_MK

.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXp/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/xbitmaps/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
