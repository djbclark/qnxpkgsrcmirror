# $NetBSD: Makefile,v 1.13 2007/11/18 10:39:58 wiz Exp $

DISTNAME=		ratfor77
PKGNAME=		ratfor-1.0
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		http://sepwww.stanford.edu/ftp/sep-distr/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://sepwww.stanford.edu/software/ratfor.html
COMMENT=		Preprocessor for the Ratfor dialect of Fortran

BUILD_TARGET=		ratfor77
USE_TOOLS+=		gmake
INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ratfor77 ${PREFIX}/bin/ratfor
	${INSTALL_MAN} ${WRKSRC}/ratfor.man ${PREFIX}/${PKGMANDIR}/man1/ratfor.1

.include "../../mk/bsd.pkg.mk"
