# $NetBSD: Makefile,v 1.1.1.1 2007/09/16 10:30:25 wiz Exp $
#

DISTNAME=	muse-3.11
PKGNAME=	${EMACS_PKGNAME_PREFIX}emacs-${DISTNAME}
CATEGORIES=	textproc editors
MASTER_SITES=	http://download.gna.org/muse-el/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mwolson.org/projects/EmacsMuse.html
COMMENT=	Publishing environment for Emacs

#LICENSE=	gplv3
USE_LANGUAGES=	# none
USE_TOOLS+=	gmake makeinfo
INFO_FILES=	yes

MAKE_FLAGS+=	-I..
INSTALLATION_DIRS=	share/doc/emacs-muse share/examples/emacs-muse

pre-build:
	sed -e "s,@PREFIX@,${PREFIX}," -e "s,@LISPDIR@,${EMACS_LISPPREFIX}," \
		-e "s,@EMACS@,${EMACS_BIN}," ${FILESDIR}/Makefile.defs \
		> ${WRKSRC}/Makefile.defs

post-install:
	${INSTALL_DATA} ${WRKSRC}/etc/emacs-wiki-migration.txt \
		${PREFIX}/share/doc/emacs-muse
	${INSTALL_DATA} ${WRKSRC}/etc/muse.rnc \
		${PREFIX}/share/doc/emacs-muse
	${INSTALL_DATA} ${WRKSRC}/examples/QuickStart.muse \
		${PREFIX}/share/examples/emacs-muse
	${INSTALL_DATA} ${WRKSRC}/examples/*.png \
		${PREFIX}/share/examples/emacs-muse

.include "../../mk/emacs.mk"
.include "../../mk/bsd.pkg.mk"
