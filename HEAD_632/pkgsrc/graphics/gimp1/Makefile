# $NetBSD: Makefile,v 1.7 2007/10/25 22:00:46 jlam Exp $
#

DISTNAME=	gimp-1.2.5
PKGREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gimp.org/
COMMENT=	GNU Image Manipulation Program

NO_CHECKSUM=	yes
NO_BUILD=	YES
PLIST_SRC=	# empty (meta-package)

DEPENDS+=	gimp-base>=1.2.5:../../graphics/gimp1-base
DEPENDS+=	gimp-data>=1.2:../../graphics/gimp1-data
DEPENDS+=	gimp-print>=4.2.0:../../print/gimp-print
DEPENDS+=	gimp-print-escputil>=4.2.0:../../print/gimp-print-escputil

do-install:	# nothing

.include "../../mk/bsd.pkg.mk"
