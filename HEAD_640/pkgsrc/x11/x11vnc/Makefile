# $NetBSD: Makefile,v 1.18 2008/12/11 07:27:00 obache Exp $
#

DISTNAME=	x11vnc-0.9.6
CATEGORIES=	x11 net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libvncserver/}

MAINTAINER=	obache@NetBSD.org
HOMEPAGE=	http://www.karlrunge.com/x11vnc/
COMMENT=	VNC server for real X displays

PKG_DESTDIR_SUPPORT=	user-destdir

USE_DIRS+=	xdg-1.1

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--with-system-libvncserver

PTHREAD_AUTO_VARS=	yes
SUBST_CLASSES+=		pthread
SUBST_STAGE.pthread=	pre-configure
SUBST_FILES.pthread=	configure
SUBST_SED.pthread=	-e 's|-lpthread||g'

.include "options.mk"

BUILD_DIRS=	x11vnc
INSTALL_DIRS=	x11vnc classes

.include "../../security/openssl/buildlink3.mk"
.include "../../net/libvncserver/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
