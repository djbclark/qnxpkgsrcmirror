# $NetBSD: Makefile,v 1.29 2007/01/30 20:47:58 joerg Exp $

.include "Makefile.common"

PKGREVISION=	5
COMMENT=	Password sniffer (webspy)

DEPENDS+=	dsniff-nox11-[0-9]*:../../security/dsniff-nox11

BUILD_TARGET=	libmissing.a webspy

INSTALLATION_DIRS+=	sbin man/man8

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/webspy ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/webspy.8 ${PREFIX}/${PKGMANDIR}/man8

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
