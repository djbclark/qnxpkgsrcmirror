# $NetBSD: Makefile,v 1.18 2007/03/05 20:14:32 darcy Exp $
#

DISTNAME=		ec-fonts-mftraced-1.0.8
PKGREVISION=		6
CATEGORIES=		fonts
MASTER_SITES=		http://lilypond.org/download/fonts/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://lilypond.org/web/
COMMENT=		EC PostScript Type1 fonts with TFMs for TeX

USE_DIRS+=		texmf-1.1
USE_PKGLOCALEDIR=	yes
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake
MAKE_FILE=		GNUmakefile
MAKE_ENV+=		PKG_LOCALTEXMFPREFIX=${PKG_LOCALTEXMFPREFIX:Q}
TEX_FONTMAPS=		ec-mftrace.map

.include "../../fonts/mftrace/buildlink3.mk"
.include "../../print/teTeX/module.mk"
.include "../../mk/bsd.pkg.mk"
