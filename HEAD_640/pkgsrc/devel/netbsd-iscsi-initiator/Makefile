# $NetBSD: Makefile,v 1.9 2008/02/28 11:58:48 rillig Exp $

DISTNAME=	netbsd-iscsi-20080207
PKGNAME=	${DISTNAME:C/-iscsi/-iscsi-initiator/}
CATEGORIES=	devel
MASTER_SITES=	http://www.alistaircrooks.co.uk/src/

MAINTAINER=	agc@NetBSD.org
HOMEPAGE=	http://www.alistaircrooks.co.uk/software.html
COMMENT=	NetBSD's iSCSI initiator (per iSCSI RFC 3720)

GNU_CONFIGURE=	yes
CONFIGURE_DIRS=	src
BUILD_TARGET=	all-initiator

AUTO_MKDIRS=			yes

PKG_DESTDIR_SUPPORT=	user-destdir

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/iscsifs ${DESTDIR}${PREFIX}/sbin/iscsifs
	${INSTALL_MAN} ${WRKSRC}/src/iscsifs.8 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8/iscsifs.8

.include "../../mk/bsd.prefs.mk"
.if $(OPSYS) != "QNX"
.include "../../mk/fuse.buildlink3.mk"
.else
MAKEFLAGS +=    PTHREAD_FLAGS=
MAKEFLAGS +=    PTHREAD_LDFLAGS=
MAKEFLAGS +=    PTHREAD_LIBS=
.endif

.include "../../mk/pthread.buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
