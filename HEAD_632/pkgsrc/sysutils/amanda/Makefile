# $NetBSD: Makefile,v 1.42 2007/10/25 22:01:05 jlam Exp $
#

DISTNAME=	amanda-2.4.4p4
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.amanda.org/
COMMENT=	The "meta-package" for Amanda, a network backup system

DEPENDS+=	amanda-client-2.4.4p4{,nb[0-9]*}:../../sysutils/amanda-client
DEPENDS+=	amanda-server-2.4.4p4{,nb[0-9]*}:../../sysutils/amanda-server
DEPENDS+=	amanda-plot-2.4.4p4{,nb[0-9]*}:../../sysutils/amanda-plot

EXTRACT_ONLY=	# empty
NO_CHECKSUM=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes
PLIST_SRC=	# empty (meta-package)

do-install:	# empty

.include "../../mk/bsd.pkg.mk"
