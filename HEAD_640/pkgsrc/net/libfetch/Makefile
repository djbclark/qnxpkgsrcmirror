# $NetBSD: Makefile,v 1.25 2009/02/05 22:45:25 joerg Exp $
#

DISTNAME=	libfetch-2.22
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty

NO_CHECKSUM=	yes

MAINTAINER=	joerg@NetBSD.org
HOMEPAGE=	http://www.FreeBSD.org/
COMMENT=	Library to access HTTP/FTP server
#LICENSE=	modified-bsd

PKG_DESTDIR_SUPPORT=	user-destdir

USE_FEATURES=		nbcompat

USE_BSD_MAKEFILE=	yes

INSTALLATION_DIRS=	include lib ${PKGMANDIR}/cat3 ${PKGMANDIR}/man3

BUILD_TARGET=	depend all
INSTALL_TARGET=	install includes

do-extract:
	${CP} -r ${FILESDIR} ${WRKSRC}

.include "options.mk"

.include "../../mk/bsd.pkg.mk"
