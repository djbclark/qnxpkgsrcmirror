# $NetBSD: Makefile,v 1.8 2007/06/08 18:35:22 wiz Exp $

DISTNAME=	tree-puzzle-5.1
PKGNAME=	puzzle-5.1
PKGREVISION=	1
CATEGORIES=	biology
MASTER_SITES=	ftp://ftp.ebi.ac.uk/pub/software/unix/puzzle/ \
		ftp://ftp.pasteur.fr/pub/GenSoft/unix/evolution/Puzzle/ \
		ftp://iubio.bio.indiana.edu/molbio/evolve/puzzle/

MAINTAINER=	babafou@babafou.eu.org
HOMEPAGE=	http://www.tree-puzzle.de/
COMMENT=	Maximum likelihood analysis of molecular sequence data

GNU_CONFIGURE=	yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/puzzle
	cd ${WRKSRC}/doc && ${INSTALL_DATA} tree-puzzle.pdf	\
		${PREFIX}/share/doc/puzzle
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/html/puzzle
	cd ${WRKSRC}/doc && ${INSTALL_DATA} tree-puzzle.html	\
		*.gif ${PREFIX}/share/doc/html/puzzle
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/puzzle
	cd ${WRKSRC}/data && ${INSTALL_DATA} EF.* *.a *.n *.b	\
		${PREFIX}/share/examples/puzzle

.include "../../parallel/mpi-ch/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
