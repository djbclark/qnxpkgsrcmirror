# $NetBSD: Makefile,v 1.12 2009/07/17 18:00:15 adrianp Exp $

DISTNAME=	tre-0.7.5
PKGREVISION=	6
CATEGORIES=	devel
MASTER_SITES=	http://laurikari.net/tre/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://laurikari.net/tre/
COMMENT=	Lightweight and robust POSIX compliant regexp matching library
LICENSE=	gnu-lgpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		YES
USE_LIBTOOL=		YES

CONFIGURE_ARGS+=	--disable-system-abi

INSTALLATION_DIRS+=	share/doc/tre

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/tre-api.html ${DESTDIR}${PREFIX}/share/doc/tre/
	${INSTALL_DATA} ${WRKSRC}/doc/tre-syntax.html ${DESTDIR}${PREFIX}/share/doc/tre/

.include "../../devel/gettext-lib/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
