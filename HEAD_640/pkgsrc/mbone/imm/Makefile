# $NetBSD: Makefile,v 1.26 2007/02/22 19:26:48 wiz Exp $

DISTNAME=	imm36a1
PKGNAME=	imm-3.6a1
PKGREVISION=	1
CATEGORIES=	mbone tk
MASTER_SITES=	ftp://ftp.hawaii.edu/paccom/imm/
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	is@NetBSD.org
HOMEPAGE=	http://tang.itd.nrl.navy.mil/5522/ntm/imm.html
COMMENT=	Internet Image(or other data) Multicaster (and receiver)

DEPENDS+=	xv>=3.10:../../graphics/xv

WRKSRC=		${WRKDIR}/${DISTNAME}.src
BUILD_TARGET=	netbsd

.include "../../x11/tk83/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
