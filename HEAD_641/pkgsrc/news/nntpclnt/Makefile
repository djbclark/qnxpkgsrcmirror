# $NetBSD: Makefile,v 1.34 2009/05/19 08:59:29 wiz Exp $

DISTNAME=	nntpclnt-1.6.1
PKGREVISION=	6
CATEGORIES=	news
MASTER_SITES=	ftp://ftp.uu.net/networking/news/nntp/

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	NNTP client library and inews client posting program
LICENSE=	nntpclnt-license

RESTRICTED=	Do not sell, rent, trade, market, or use for monetary profit
# No permission granted for derivative works.
NO_BIN_ON_FTP=	${RESTRICTED}
NO_SRC_ON_CDROM=${RESTRICTED}
NO_BIN_ON_CDROM=${RESTRICTED}

CONFLICTS+=	inn-[0-9]*

BUILD_TARGET=	inews
PKG_GROUPS=	news
PKG_SYSCONFSUBDIR=	nntp

PLIST_SUBST+=	PKG_SYSCONFDIR=${PKG_SYSCONFDIR:Q}

.include "../../mk/bsd.prefs.mk"

CONFIG_SH=	${FILESDIR}/config.${OPSYS}.sh
ONLY_FOR_PLATFORM=	NetBSD-*-* SunOS-*-* DragonFly-*-* Linux-*-* Darwin-*-*

INSTALLATION_DIRS=	bin include lib ${PKGMANDIR}/man3

do-configure:
	${SED} -e s,@PREFIX@,${PREFIX}, -e s,@PKGSYSCONFDIR@,${PKG_SYSCONFDIR}, \
		${CONFIG_SH} >${WRKSRC}/config.sh
	@cd ${WRKSRC} && ${SH} Makefile.SH && ${SH} config.h.SH

post-build:
	cd ${WRKSRC} && \
		${AR} clq libnntpclnt.a nntpclnt.o && ${RANLIB} libnntpclnt.a

do-install:
	${INSTALL_PROGRAM} -g ${PKG_GROUPS} -m 2555 ${WRKSRC}/inews \
	  ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/nntp.h ${PREFIX}/include/
	${INSTALL_DATA} ${WRKSRC}/libnntpclnt.a ${PREFIX}/lib/
	${INSTALL_DATA} ${WRKSRC}/nntpclnt.3 ${PREFIX}/${PKGMANDIR}/man3/
	${INSTALL_DATA_DIR} ${PKG_SYSCONFDIR}

.include "../../mk/bsd.pkg.mk"
