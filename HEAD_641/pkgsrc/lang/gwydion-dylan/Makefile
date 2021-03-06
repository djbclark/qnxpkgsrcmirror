# $NetBSD: Makefile,v 1.7 2008/09/07 23:55:41 dholland Exp $
#

DISTNAME=		gwydion-dylan-${DYLAN_VERSION}
PKGREVISION=		1
CATEGORIES=		lang
MASTER_SITES=		ftp://ftp.opendylan.org/pub/gd/src/tar/ \
			ftp://ftp.fu-berlin.de/pub/unix/languages/dylan/src/tar/ \
			ftp://ftp.ntua.gr/pub/lang/gwydion/src/tar/ \
			ftp://gd.tuwien.ac.at/languages/gwydiondylan/src/tar/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.opendylan.org/
COMMENT=		Functional language

USE_TOOLS+=		gmake perl
USE_LIBTOOL=		yes
MAKE_FILE=		GNUmakefile
BUILD_TARGET=		default

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-mindy-bootstrap

DYLAN_VERSION=		2.4.0

# other architecture changes will be gratefully received
# (but note: don't enable platforms you haven't explicitly tested, as
# they are liable to hang in the mindy debugger and hose bulk builds.)
ONLY_FOR_PLATFORM=	NetBSD-*-i386 NetBSD-*-sparc NetBSD-*-powerpc

.include "../../mk/bsd.prefs.mk"

.if ${MACHINE_ARCH} == "i386"
ALT_ARCH=		x86
.elif ${MACHINE_ARCH} == "powerpc"
ALT_ARCH=		ppc
.else
ALT_ARCH=		${MACHINE_ARCH}
.endif

SUBST_CLASSES+=		gc
SUBST_STAGE.gc=		pre-configure
SUBST_FILES.gc=		d2c/runtime/garbage-collection/Makegen
SUBST_SED.gc=		-e 's,-I/usr/include,-I${LOCALBASE}/include,'

PLIST_SUBST+=		ALT_ARCH=${ALT_ARCH:Q}
PLIST_SUBST+=		DYLAN_VERSION=${DYLAN_VERSION:Q}

.include "../../devel/boehm-gc/buildlink3.mk"

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
