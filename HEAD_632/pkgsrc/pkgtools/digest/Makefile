# $NetBSD: Makefile,v 1.55 2007/11/11 11:35:49 martti Exp $
#
# When adding new digest algorithms, please use rmd160 as the template,
# and bump the VERSION definition.

DISTNAME?=	digest-${VERSION}
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER?=	agc@NetBSD.org
HOMEPAGE?=	http://www.NetBSD.org/docs/software/packages.html
COMMENT?=	Message digest wrapper utility
#LICENSE=	original-bsd

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

CHECK_PERMS=		no

GNU_CONFIGURE=		yes

NO_PKGTOOLS_REQD_CHECK=	yes
NO_MTREE=		yes

# XXX Remove the following line after pkgsrc/bootstrap is up and
# XXX running.
USE_NATIVE_GCC=		yes

.include "../../mk/bsd.prefs.mk"

NO_CHECKSUM=		yes

VERSION!=	${AWK} -F "'" '/^PACKAGE_VERSION=/ {print $$2}' \
		${FILESDIR}/configure

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}

pre-install:
	-@${MKDIR} ${DESTDIR}${PKG_DBDIR}

do-test:
	@${ECHO} "No news is good news"
	@cd ${WRKSRC} && ${SETENV} DIGESTDIR=${WRKSRC} ${SH} ./regress.sh
	@${ECHO} "All tests completed"

.include "../../mk/bsd.pkg.mk"
