# $NetBSD: Makefile,v 1.5 2007/10/07 12:59:15 kano Exp $
#

DISTNAME=	xen-2.0.7-install-x86_32
PKGNAME=	xenkernel20-2.0.7
CATEGORIES=	sysutils
MASTER_SITES=	http://www.cl.cam.ac.uk/Research/SRG/netos/xen/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.NetBSD.org/ports/xen/
COMMENT=	Xen Kernel

ONLY_FOR_PLATFORM=	Linux-2.[46]*-i386 NetBSD-*-i386

WRKSRC=		${WRKDIR}/xen-2.0-install

NO_CONFIGURE=	yes
NO_BUILD=	yes

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/xen-kernel
	${INSTALL_DATA} ${WRKSRC}/install/boot/xen.gz ${PREFIX}/xen-kernel/xen.gz

.include "../../mk/bsd.pkg.mk"
