# $NetBSD: Makefile,v 1.2 2008/09/13 09:10:06 ahoka Exp $
#

DISTNAME=		libsigsegv-2.5
PKGNAME=		libsigsegv25-2.5
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GNU:=libsigsegv/}

MAINTAINER=		martijn.van.buul@gmail.com
HOMEPAGE=		http://libsigsegv.sourceforge.net/
COMMENT=		Library for handling page faults in user mode

PKG_DESTDIR_SUPPORT=	user-destdir
CONFLICTS+=		libsigsegv-[0-9]*

USE_PKGLOCALEDIR=	yes
USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config
GNU_CONFIGURE=		yes
TEST_TARGET=		check

.include "../../mk/bsd.pkg.mk"
