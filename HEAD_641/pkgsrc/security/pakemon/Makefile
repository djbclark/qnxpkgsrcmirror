# $NetBSD: Makefile,v 1.26 2009/05/01 14:28:45 zafer Exp $

DISTNAME=	pakemon-0.3.1
PKGREVISION=	4
CATEGORIES=	security
MASTER_SITES=	http://www.binarii.com/files/security/ 
MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	# removed in 2001
COMMENT=	Packet monster, an Open Source Intrusion Detection System

GNU_CONFIGURE=	yes

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	pre-configure
SUBST_FILES.conf=	configure
SUBST_SED.conf=		-e "s|libnet-config|libnet10-config|g"
SUBST_SED.conf+=	-e "s|@@LN_INC@@|${BUILDLINK_PREFIX.libnet10}/include/libnet10|g"
SUBST_SED.conf+=	-e "s|@@LN_LIB@@|${BUILDLINK_PREFIX.libnet10}/lib/libnet10|g"
SUBST_MESSAGE.conf=	Fixing configuration script.

PKG_DESTDIR_SUPPORT=	user-destdir

post-extract:
	${CP} ${WRKSRC}/pakemon.h ${WRKSRC}/pakemon.h.in

.include "../../net/libpcap/buildlink3.mk"
.include "../../devel/libnet10/buildlink3.mk"
.include "../../net/libnids/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
