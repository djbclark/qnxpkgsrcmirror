# $NetBSD: Makefile,v 1.28 2009/07/08 14:15:07 joerg Exp $

DISTNAME=	xmradio-1.2
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://core.de/~coto/radio/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://core.de/~coto/xmradio.html
COMMENT=	Radio application for Brooktree 848 compatible TV cards

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	sox>=12.16:../../audio/sox

ONLY_FOR_PLATFORM=	NetBSD-1.4[Y-Z]-* NetBSD-1.4Z[A-Z]-i386 \
			NetBSD-1.5_ALPHA-i386 NetBSD-1.[5-9]*-* \
			NetBSD-[2-9]*.*-*

USE_IMAKE=	YES

INSTALLATION_DIRS=	share/doc/xmradio

post-install:
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/doc/xmradio

.include "../../x11/libXpm/buildlink3.mk"
.include "../../mk/motif.buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
