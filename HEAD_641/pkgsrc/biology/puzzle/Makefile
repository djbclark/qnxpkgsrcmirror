# $NetBSD: Makefile,v 1.10 2009/04/28 19:07:31 zafer Exp $

DISTNAME=	tree-puzzle-5.1
PKGNAME=	puzzle-5.1
PKGREVISION=	1
CATEGORIES=	biology
MASTER_SITES=  http://www.tree-puzzle.de/ \
		ftp://ftp.ebi.ac.uk/pub/software/unix/puzzle/ 

MAINTAINER=	babafou@babafou.eu.org
HOMEPAGE=	http://www.tree-puzzle.de/
COMMENT=	Maximum likelihood analysis of molecular sequence data

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes

INSTALLATION_DIRS=	share/doc/puzzle share/doc/html/puzzle \
			share/examples/puzzle

post-install:
	cd ${WRKSRC}/doc && ${INSTALL_DATA} tree-puzzle.pdf	\
		${DESTDIR}${PREFIX}/share/doc/puzzle
	cd ${WRKSRC}/doc && ${INSTALL_DATA} tree-puzzle.html	\
		*.gif ${DESTDIR}${PREFIX}/share/doc/html/puzzle
	cd ${WRKSRC}/data && ${INSTALL_DATA} EF.* *.a *.n *.b	\
		${DESTDIR}${PREFIX}/share/examples/puzzle

.include "../../parallel/mpi-ch/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
