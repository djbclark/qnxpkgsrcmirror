# $NetBSD: Makefile,v 1.19 2009/08/06 01:44:48 minskim Exp $

DISTNAME=		haskell-mode-1.44
PKGNAME=		${EMACS_PKGNAME_PREFIX}${DISTNAME}
PKGREVISION=		2
CATEGORIES=		devel editors
MASTER_SITES=		http://www.haskell.org/haskell-mode/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.haskell.org/haskell-mode/
COMMENT=		Haskell mode for Emacs

PKG_DESTDIR_SUPPORT=	user-destdir
INSTALLATION_DIRS=	${EMACS_LISPPREFIX:C|^${PREFIX}/||}/haskell-mode \
			share/doc/html/haskell-mode

HTML=	.emacs fontlock.hs indent.hs index.html installation-guide.html
SRCS=	haskell-decl-scan.el haskell-doc.el haskell-font-lock.el	\
	haskell-ghci.el haskell-hugs.el haskell-indent.el		\
	haskell-mode.el haskell-simple-indent.el

do-build:
	for f in ${SRCS}; do						\
		${EMACS_BIN} --no-init-file --no-site-file -batch	\
		-f batch-byte-compile ${WRKSRC}/$$f;			\
	done

do-install:
	cd ${WRKSRC} && ${INSTALL_DATA} ${SRCS} ${SRCS:.el=.elc} 	\
			${DESTDIR}${EMACS_LISPPREFIX}/haskell-mode
	cd ${WRKSRC} && ${INSTALL_DATA} ${HTML}				\
			${DESTDIR}${PREFIX}/share/doc/html/haskell-mode

.include "../../editors/emacs/modules.mk"
.include "../../mk/bsd.pkg.mk"
