# $NetBSD: Makefile,v 1.2 2009/07/17 18:00:24 adrianp Exp $
#

DISTNAME=	openvas-libnasl-2.0.0
CATEGORIES=	security
MASTER_SITES=	http://wald.intevation.org/frs/download.php/549/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.openvas.org/
COMMENT=	Libraries for the Open Vulnerability Assessment System

BUILD_DEPENDS+=	bison-[0-9]*:../../devel/bison

GNU_CONFIGURE=	YES
USE_LIBTOOL=	YES
BUILD_DEFS+=	VARBASE
USE_TOOLS=	pkg-config

CONFIGURE_ARGS+=	--localstatedir=${VARBASE}

.include "../../security/openvas-libraries/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../security/gnutls/buildlink3.mk"
.include "../../security/gpgme/buildlink3.mk"
.include "../../net/libpcap/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
