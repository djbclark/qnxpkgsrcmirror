# $NetBSD: Makefile,v 1.11 2008/07/14 12:56:11 joerg Exp $

DISTNAME=		ja-vflib-${VFLIB_VERSION}
VFLIB_VERSION=		2.24.2nb2
CATEGORIES=		japanese print
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		tech-pkg-ja@jp.NetBSD.org
HOMEPAGE=		http://TypeHack.aial.hiroshima-u.ac.jp/VFlib/
COMMENT=		Japanese Vector font libraries and utilities

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=		ja-vflib-lib-${VFLIB_VERSION}:../../print/ja-vflib-lib
DEPENDS+=		ja-vflib-utils-${VFLIB_VERSION}:../../print/ja-vflib-utils


EXTRACT_ONLY=		# empty
NO_CHECKSUM=		yes
NO_CONFIGURE=		yes
NO_BUILD=		yes
PLIST_SRC=		# empty (meta-package)

do-install:		# empty

.include "../../mk/bsd.pkg.mk"
