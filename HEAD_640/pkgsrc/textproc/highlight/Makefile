#	$NetBSD: Makefile,v 1.3 2008/11/07 21:12:12 snj Exp $

DISTNAME=		highlight-2.6.14
CATEGORIES=		textproc
MASTER_SITES=		http://www.andre-simon.de/zip/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.andre-simon.de/
COMMENT=		Converts source code to formatted text with syntax highlighting

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake
USE_LANGUAGES=		c++
MANCOMPRESSED=		yes

MAKE_FILE=		makefile

PKG_SYSCONFSUBDIR=	highlight

EGDIR=			${PREFIX}/share/examples/highlight
CONF_FILES=		${EGDIR}/filetypes.conf			\
			${PKG_SYSCONFDIR}/filetypes.conf

SUBST_CLASSES+=		etc
SUBST_MESSAGE.etc=	Fixing hardcoded paths.
SUBST_STAGE.etc=	post-patch
SUBST_FILES.etc=	src/datadir.cpp
SUBST_SED.etc=		-e 's,/etc/highlight,${PKG_SYSCONFDIR},g'

.include "../../devel/libgetopt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
