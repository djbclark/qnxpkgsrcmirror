# $NetBSD: Makefile,v 1.23 2007/10/29 12:56:30 uebayasi Exp $
#

DISTNAME=	semantic-1.4.4
PKGNAME=	${EMACS_PKGNAME_PREFIX}${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=cedet/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://cedet.sourceforge.net/semantic.shtml
COMMENT=	Lexer, parser-generator, and parser written for Emacs

PKGSRC_MAKE_ENV+=	EMACS=${EMACS_FLAVOR}

NO_CONFIGURE=	yes
USE_TOOLS+=	gmake
INFO_FILES=	yes

MAKE_ENV+=	EMACS=${EMACS_FLAVOR:Q}

# XXX cd ${WRKSRC}; ${MAKE} -V semantic_LISP
SRCS=	semantic.el semantic-util.el semantic-bnf.el semantic-ctxt.el
# XXX cd ${WRKSRC}; ${MAKE} -V Languages_LISP
SRCS+=	semantic-c.el semantic-el.el semantic-java.el semantic-make.el \
	semantic-scm.el semantic-texi.el
# XXX cd ${WRKSRC}; ${MAKE} -V tools_LISP
SRCS+=	semantic-imenu.el semantic-sb.el working.el semanticdb.el document.el \
	document-vars.el sformat.el semantic-chart.el semantic-util-modes.el \
	semantic-analyze.el semantic-ia.el semantic-cb.el semantic-ia-sb.el
# XXX cd ${WRKSRC}; ${MAKE} -V senator_LISP
SRCS+=	senator.el

# XXX cd ${WRKSRC}; ${MAKE} -V init_LISP
AUXFILES=	semantic-load.el
# XXX cd ${WRKSRC}; ${MAKE} -V aux_AUX
AUXFILES+=	c.bnf make.bnf java.bnf scheme.bnf

INSTALLATION_DIRS=	${EMACS_INFOPREFIX}

do-install:
	${INSTALL_DATA_DIR} ${EMACS_LISPPREFIX}/semantic
	cd ${WRKSRC} && ${INSTALL_DATA} ${SRCS} ${SRCS:.el=.elc} 	\
			${EMACS_LISPPREFIX}/semantic
	cd ${WRKSRC} && ${INSTALL_DATA} ${AUXFILES} ${EMACS_LISPPREFIX}/semantic
	set -e;								\
	cd ${WRKSRC}; for f in semantic.info semantic.info-[0-9]*; do	\
		${TEST} ! -f "$$f" ||					\
		${INSTALL_DATA} "$$f" ${EMACS_INFOPREFIX};		\
	done

.include "../../mk/emacs.mk"

.include "../../editors/speedbar/buildlink3.mk"
.include "../../lang/eieio/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
