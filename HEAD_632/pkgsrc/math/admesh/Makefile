# $NetBSD: Makefile,v 1.9 2006/03/04 21:30:02 jlam Exp $

DISTNAME=		admesh-0.95
CATEGORIES=		math
MASTER_SITES=		http://www.varlog.com/products/admesh/files/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.varlog.com/products/admesh/
COMMENT=		Program for processing triangulated solid meshes

GNU_CONFIGURE=		yes
CONFIGURE_HAS_MANDIR=	no
INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/admesh ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/admesh
	cd ${WRKSRC} && ${INSTALL_DATA} README ADMESH.DOC		\
		${PREFIX}/share/doc/admesh/
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/admesh
	${INSTALL_DATA} ${WRKSRC}/block.stl ${PREFIX}/share/examples/admesh

.include "../../mk/bsd.pkg.mk"
