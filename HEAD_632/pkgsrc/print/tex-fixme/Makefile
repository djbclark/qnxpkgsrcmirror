# $NetBSD: Makefile,v 1.2 2006/05/01 18:32:26 minskim Exp $

DISTNAME=	fixme
PKGNAME=	tex-${DISTNAME}-3.2
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_TEX_CTAN:=macros/latex/contrib/}
EXTRACT_SUFX=	.zip

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://tug.ctan.org/tex-archive/macros/latex/contrib/fixme/
COMMENT=	Insert "fixme" notes into draft documents

DIST_SUBDIR=	${PKGNAME}
USE_DIRS+=	texmf-1.2

.include "../../print/teTeX/module.mk"

do-build:
	cd ${WRKSRC} && latex fixme.ins

do-install:
	${INSTALL_DATA_DIR} ${PKG_LOCALTEXMFPREFIX}/doc/latex/fixme
	${INSTALL_DATA} ${WRKSRC}/NEWS ${WRKSRC}/README ${WRKSRC}/fixme.pdf \
		${WRKSRC}/fixme.el ${PKG_LOCALTEXMFPREFIX}/doc/latex/fixme
	${INSTALL_DATA_DIR} ${PKG_LOCALTEXMFPREFIX}/tex/latex/fixme
	${INSTALL_DATA} ${WRKSRC}/fixme.sty \
		${PKG_LOCALTEXMFPREFIX}/tex/latex/fixme

.include "../../mk/bsd.pkg.mk"
