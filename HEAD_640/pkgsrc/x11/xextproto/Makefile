# $NetBSD: Makefile,v 1.6 2009/01/06 20:15:27 wiz Exp $
#

DISTNAME=		xextproto-7.0.4
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_XORG:=proto/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		XExt extension headers from X.org

PKG_DESTDIR_SUPPORT=	user-destdir

CONFLICTS+=		xextensions-[0-9]*

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	${WRKSRC}/xextproto.pc.in
USE_LANGUAGES=		# none, not even C

.include "../../mk/bsd.pkg.mk"
