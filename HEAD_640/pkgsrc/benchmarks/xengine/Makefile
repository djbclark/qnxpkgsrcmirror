# $NetBSD: Makefile,v 1.22 2008/11/10 17:21:33 wiz Exp $

DISTNAME=	xengine-1.0.1
PKGREVISION=	4
CATEGORIES=	benchmarks
MASTER_SITES=	#ftp://ftp.lab.kdd.co.jp/Usenet/comp.sources.x/volume09/xengine/
DISTFILES=	part01.z patch1.z

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Reciprocating engine for X

PKG_INSTALLATION_TYPES=	overwrite pkgviews

WRKSRC=		${WRKDIR}
DIST_SUBDIR=	xengine
USE_IMAKE=	yes
PATCH_DIST_STRIP=	-p1

USE_TOOLS+=	gzcat patch sed

EXTRACT_CMD=	${GZCAT} $$extract_file | ${SED} "1,/\#!/d" | ${SH}

pre-configure:
	cd ${WRKSRC}; ${PATCH} ${PATCH_DIST_ARGS} < xengine.patch1

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/xengine
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/xengine
	@${ECHO} ""
	@${ECHO} "Example value:"
	@${ECHO} "   1067 RPMs with P100, Winner 2000PRO/X, resolution: 1152x900"
	@${ECHO} ""

.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
