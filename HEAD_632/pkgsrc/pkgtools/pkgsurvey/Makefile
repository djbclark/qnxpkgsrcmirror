# $NetBSD: Makefile,v 1.10 2007/08/20 21:42:26 agc Exp $
#

DISTNAME=	pkgsurvey-0.0
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	agc@pkgsrc.org
COMMENT=	Utility to collate pkg information, and mail to central census site

WRKSRC=		${WRKDIR}
NO_CHECKSUM=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes

INSTALLATION_DIRS=	bin

PKG_DESTDIR_SUPPORT=	user-destdir

do-install:
	${INSTALL_PROGRAM_DIR} ${DESTDIR}${PREFIX}/bin
	${SED} -e 's|\$${PKG_INFO}|${PKG_INFO}|'			\
		-e 's|\$${UNAME}|${UNAME}|g'				\
		${FILESDIR}/pkgsurvey.sh > ${DESTDIR}${PREFIX}/bin/pkgsurvey
	${CHMOD} 755 ${DESTDIR}${PREFIX}/bin/pkgsurvey

.include "../../mk/bsd.pkg.mk"
