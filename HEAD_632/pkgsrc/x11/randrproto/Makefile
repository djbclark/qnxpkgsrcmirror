# $NetBSD: Makefile,v 1.6 2007/02/26 14:52:58 joerg Exp $
#

DISTNAME=		randrproto-1.2.1
CATEGORIES=		x11
MASTER_SITES=		http://xorg.freedesktop.org/releases/individual/proto/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		Randr extension headers from modular X.org

PKG_DESTDIR_SUPPORT=	user-destdir

CONFLICTS+=		randrext-[0-9]*

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	${WRKSRC}/randrproto.pc.in
USE_LANGUAGES=		# none, not even C

.include "../../mk/bsd.pkg.mk"
