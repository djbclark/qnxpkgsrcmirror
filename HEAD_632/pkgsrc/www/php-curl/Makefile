# $NetBSD: Makefile,v 1.12 2006/11/19 11:50:25 wiz Exp $

MODNAME=		curl
PKGREVISION=		1
CATEGORIES+=		www
COMMENT=		PHP extension for curl functions

CONFLICTS=	php-curl-[0-9]*

CONFIGURE_ARGS+=	--with-curl=shared,${BUILDLINK_PREFIX.curl}

USE_PHP_EXT_PATCHES=	yes

.include "../../lang/php/ext.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
