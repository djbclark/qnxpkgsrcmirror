# $NetBSD: Makefile,v 1.6 2008/06/12 02:14:19 joerg Exp $

PKGNAME=	postgresql82-adminpack-${BASE_VERS}
COMMENT=	Admin pack module for pgAdmin management

DEPENDS+=	postgresql82-server>=${BASE_VERS}:../../databases/postgresql82-server

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../databases/postgresql82/Makefile.common"

BUILD_DIRS=		contrib/adminpack

USE_LIBTOOL=		yes
PKG_LIBTOOL=		${PKG_SHLIBTOOL}

REQD_DIRS+=		${PG_SUBPREFIX}share/doc/postgresql/contrib
REQD_DIRS+=		${PG_SUBPREFIX}share/postgresql/contrib

.include "../../databases/postgresql82-client/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
