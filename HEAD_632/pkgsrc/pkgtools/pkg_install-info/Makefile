# $NetBSD: Makefile,v 1.17 2007/11/08 19:00:56 joerg Exp $
#

DISTNAME=		pkg_install-info-${VERSION}
PKGREVISION=		3
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.gnu.org/software/texinfo/texinfo.html
COMMENT=		Standalone GNU info file installation utility

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		yes

NO_CHECKSUM=		yes
CHECK_PERMS=		no

# Don't change this unless the sources are updated from GNU Texinfo.
# Otherwise use PKGREVISION if you need to change this package version.
VERSION=		4.5

MAKE_ENV+=		BINOWN=${BINOWN:Q} BINGRP=${BINGRP:Q}

INSTALLATION_DIRS=	bin

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}

.include "../../mk/bsd.pkg.mk"
