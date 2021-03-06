# $NetBSD: Makefile,v 1.10 2007/02/22 19:27:06 wiz Exp $
#

DISTNAME=	bagpipetex-3.01
PKGNAME=	tex-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	print
MASTER_SITES=	http://www.stanford.edu/~wrinnes/bagpipe.tex/distribution/
DISTFILES=	bagpipe301.tar.gz

MAINTAINER=	dgriffi@cs.csubak.edu
HOMEPAGE=	http://www.stanford.edu/~wrinnes/bagpipe.tex/
COMMENT=	MusixTeX macros to typeset bagpipe music

DEPENDS+=	tex-musixtex>=112:../../print/tex-musixtex

WRKSRC=		${WRKDIR}
NO_CONFIGURE=	yes

TEXMF_CNF=	${LOCALBASE}/share/texmf/web2c/texmf.cnf

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf/doc/bagpipetex
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf/fonts/tfm/bagpipetex
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf/fonts/source/bagpipetex
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf/tex/latex/bagpipetex
	${INSTALL_DATA} ${WRKSRC}/README \
		${WRKSRC}/bagdoc.dvi \
		${WRKSRC}/bagdoc.ps \
		${WRKSRC}/bagdoc.tex \
		${WRKSRC}/quickref.dvi \
		${WRKSRC}/quickref.ps \
		${WRKSRC}/quickref.tex \
		${PREFIX}/share/texmf/doc/bagpipetex
	${INSTALL_DATA} ${WRKSRC}/Green.tex \
		${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA} ${WRKSRC}/GreenTwo.tex \
		${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA} ${WRKSRC}/Bonnets.tex \
		${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA} ${WRKSRC}/Washer.tex \
		${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA} ${WRKSRC}/BlackDonald.tex \
		${PREFIX}/share/texmf/doc/bagpipetex/examples
	${INSTALL_DATA} ${WRKSRC}/*.mf \
		${PREFIX}/share/texmf/fonts/source/bagpipetex
	${INSTALL_DATA} ${WRKSRC}/*.tfm \
		${PREFIX}/share/texmf/fonts/tfm/bagpipetex
	${INSTALL_DATA} ${WRKSRC}/bagpipe.tex \
		${PREFIX}/share/texmf/tex/latex/bagpipetex
	${INSTALL_DATA} ${WRKSRC}/*.ini \
		${PREFIX}/share/texmf/tex/latex/bagpipetex
	${LOCALBASE}/bin/texconfig rehash

do-build:
	cd ${WRKDIR} ; \
	tex bagdoc ; \
	dvips bagdoc.dvi -o bagdoc.ps ; \
	musixtex quickref ; \
	musixflx quickref ; \
	musixtex quickref ; \
	dvips quickref.dvi -o quickref.ps

.include "../../mk/bsd.pkg.mk"
