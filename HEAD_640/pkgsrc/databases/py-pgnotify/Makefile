# $NetBSD: Makefile,v 1.11 2008/06/20 01:09:11 joerg Exp $
#

DISTNAME=	pgnotify-0.1
PKGNAME=	${PYPKGPREFIX}-pgnotify-0.1
PKGREVISION=	2
CATEGORIES=	databases python
MASTER_SITES=	http://sandbox.rulemaker.net/ngps/Dist/
EXTRACT_SUFX=	.zip

MAINTAINER=	darcy@NetBSD.org
HOMEPAGE=	http://sandbox.rulemaker.net/ngps/pgnotify
COMMENT=	Python interface to PostgreSQL LISTEN/NOTIFY

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	${PYPKGPREFIX}-postgresql-[0-9]*:../../databases/py-postgresql

MAKE_ENV+=		MANDIR=${PREFIX}/${PKGMANDIR}
MAKE_ENV+=		BINDIR=${PREFIX}/bin
USE_TOOLS+=		gmake

PYDISTUTILSPKG=	yes
PLIST_SUBST+=	PYPKGPREFIX=${PYPKGPREFIX}

.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
