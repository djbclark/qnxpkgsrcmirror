# $NetBSD: Makefile,v 1.5 2008/08/13 13:20:14 ahoka Exp $
#

DISTNAME=	confuse-2.6
CATEGORIES=	devel
MASTER_SITES=	http://bzero.se/confuse/

MAINTAINER=	ahoka@NetBSD.org
HOMEPAGE=	http://www.nongnu.org/confuse/
COMMENT=	Configuration file parser library

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--enable-shared
USE_LIBTOOL=		YES
USE_PKGLOCALEDIR=       YES
USE_TOOLS+=		pkg-config msgfmt

PKGCONFIG_OVERRIDE+=    libconfuse.pc.in
INSTALLATION_DIRS=      lib include

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
