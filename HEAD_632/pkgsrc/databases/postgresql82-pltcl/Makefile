# $NetBSD: Makefile,v 1.2 2007/02/05 11:10:03 adam Exp $

PKGNAME=	postgresql82-pltcl-${BASE_VERS}
COMMENT=	PL/Tcl procedural language for the PostgreSQL backend

DEPENDS+=	postgresql82-server>=${BASE_VERS}:../../databases/postgresql82-server

.include "../../databases/postgresql82/Makefile.common"

CONFIGURE_ARGS+=	--with-tcl
CONFIGURE_ARGS+=	--with-tclconfig="${BUILDLINK_PREFIX.tcl}/lib"
CONFIGURE_ENV+=		TCLSH="${TCLSH}"
TCLSH=			${BUILDLINK_PREFIX.tcl}/bin/tclsh

BUILD_DIRS=		src/pl/tcl

USE_LIBTOOL=		yes
PKG_LIBTOOL=		${PKG_SHLIBTOOL}

.include "../../databases/postgresql82-client/buildlink3.mk"
.include "../../lang/tcl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
