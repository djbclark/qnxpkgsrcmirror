# $NetBSD: Makefile,v 1.4 2012/10/31 11:17:18 asau Exp $
#

DISTNAME=	libnet-1.0.2a
PKGNAME=	${DISTNAME:S/libnet/libnet10/}
PKGREVISION=	1
CATEGORIES=	devel net
MASTER_SITES=	http://www.packetfactory.net/libnet/dist/deprecated/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.packetfactory.net/libnet/
COMMENT=	C library for portable packet creation and injection
LICENSE=	2-clause-bsd

PKG_INSTALLATION_TYPES=	overwrite pkgviews
CONFLICTS=	libnet-[0-9]*

WRKSRC=		${WRKDIR}/${DISTNAME:C/l/L/}

USE_LIBTOOL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	LIBNET_CONFIG_CFLAGS="-I${PREFIX}/include/libnet10" \
		LIBNET_CONFIG_LIBS=${LDFLAGS:M*:Q}

SUBST_CLASSES+=		man
SUBST_STAGE.man=	pre-configure
SUBST_FILES.man=	Makefile.in
SUBST_SED.man=		-e 's,@MAN_PREFIX@,${PREFIX}/${PKGMANDIR}/man3,g'
SUBST_MESSAGE.man=	Fixing path to man files.

INSTALLATION_DIRS=	bin lib share/examples ${PKGMANDIR}/man3

post-extract:
	${CHMOD} -R a+r ${WRKSRC}/doc

post-install:
	${CHMOD} ${SHAREMODE} ${DESTDIR}${PREFIX}/include/libnet10/libnet.h
	${CHMOD} ${SHAREMODE} ${DESTDIR}${PREFIX}/include/libnet10/libnet/*.h
	${CHMOD} ${MANMODE} ${DESTDIR}${PREFIX}/${PKGMANDIR}/man3/libnet10.3

.include "../../mk/bsd.pkg.mk"
