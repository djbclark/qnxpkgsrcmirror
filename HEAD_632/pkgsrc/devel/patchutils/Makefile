# $NetBSD: Makefile,v 1.7 2006/10/15 21:40:07 rillig Exp $
#

DISTNAME=		patchutils-0.2.31
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		http://cyberelk.net/tim/data/patchutils/stable/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		recht@NetBSD.org
HOMEPAGE=		http://cyberelk.net/tim/patchutils/index.html
COMMENT=		Some programs for manipulating patch files

DEPENDS+=		patch-[0-9]*:../../devel/patch

USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		perl:run
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-patch=${PREFIX}/bin/${GNU_PROGRAM_PREFIX}patch

REPLACE_BASH+=		editdiff.in espdiff.in
USE_TOOLS+=		bash:run

.include "../../mk/bsd.pkg.mk"
