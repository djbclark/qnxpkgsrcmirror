# $NetBSD: Makefile,v 1.14 2008/05/27 09:44:39 tnn Exp $
#

DISTNAME=	libidea-0.8.2b
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.psy.uq.oz.au/pub/Crypto/libeay/ \
		ftp://ftp.funet.fi/pub/mirrors/ftp.psy.uq.oz.au/libeay/ \
		ftp://ftp.ntnu.no/pub/unix/security/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.media-crypt.com/pages/fidea.html
COMMENT=	IDEA block cipher library

NOT_FOR_BULK_PLATFORM=	HPUX-*-*

WRKSRC=		${WRKDIR}/idea
CRYPTO=		YES
LICENSE=	idea-license
RESTRICTED=	IDEA is a patented algorithm that requires proper licensing
NO_SRC_ON_CDROM=${RESTRICTED}
NO_BIN_ON_CDROM=${RESTRICTED}
NO_SRC_ON_FTP=	${RESTRICTED}
NO_BIN_ON_FTP=	${RESTRICTED}

INSTALLATION_DIRS=	bin include lib

do-install:
	cd ${WRKSRC} &&							\
	${INSTALL_DATA} libidea.a ${PREFIX}/lib &&			\
	${INSTALL_DATA} idea.h ${PREFIX}/include &&			\
	${INSTALL_PROGRAM} ideatest idea_spd ${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
