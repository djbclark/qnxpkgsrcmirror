# $NetBSD: Makefile,v 1.17 2007/10/29 23:54:36 uebayasi Exp $

DISTNAME=	jsclasses-071024
PKGNAME=	ja-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	print japanese
MASTER_SITES=	http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/
EXTRACT_SUFX=	.zip

MAINTAINER=	kei@NetBSD.org
HOMEPAGE=	http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/
COMMENT=	New document class files for pLaTeX

DEPENDS+=	ja-ptex-bin>=3.1.9:../../print/ja-ptex-bin

WRKSRC=		${WRKDIR}/jsclasses

.include "../../print/teTeX/module.mk"

PLATEX_DIR=	${PKG_LOCALTEXMFPREFIX}/ptex/platex
NO_BUILD=	YES

pre-extract:
	${MKDIR} ${WRKSRC}

post-extract:
	@cd ${WRKSRC}; \
	${MV} ../*.* .

do-install:
	@cd ${WRKSRC}; \
	${INSTALL_DATA_DIR} ${PLATEX_DIR}/js; \
	${INSTALL_DATA} *.cls *.dtx *.ins *.sty ${PLATEX_DIR}/js

.include "../../mk/bsd.pkg.mk"
