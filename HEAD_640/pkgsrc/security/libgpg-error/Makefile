# $NetBSD: Makefile,v 1.24 2008/10/14 11:32:11 adam Exp $

DISTNAME=	libgpg-error-1.6
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.gnupg.org/gcrypt/libgpg-error/ \
		http://ftp.gnupg.org/gcrypt/libgpg-error/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://www.gnupg.org/
COMMENT=	Definitions of common error values for all GnuPG components

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		YES
GNU_CONFIGURE=		YES
USE_PKGLOCALEDIR=	YES
MAKE_JOBS_SAFE=		no

.include "../../mk/bsd.prefs.mk"

# XXX See HACKS
.if ${OPSYS} == IRIX || !empty(MACHINE_PLATFORM:MNetBSD-[3-9]*)
USE_TOOLS+=		nawk
.else
USE_TOOLS+=		gawk
.endif

MAKE_ENV+=		LC_ALL="C"

TEST_TARGET=		check

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
