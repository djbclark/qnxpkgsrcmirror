# $NetBSD: Makefile,v 1.11 2007/01/07 09:14:02 rillig Exp $
#

DISTNAME=	CMU-dhcp-3.3.7+PU-9
PKGNAME=	cmu-dhcpd-3.3.7.9
CATEGORIES=	net
MASTER_SITES=	http://www.net.princeton.edu/software/dhcpd/
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.net.princeton.edu/software/dhcpd/
COMMENT=	CMU BootP and DHCP server, plus Princeton patches

NOT_FOR_PLATFORM=	Interix-*-* # no userland routing table support

WRKSRC=		${WRKDIR}/CMU-dhcp-3.3.7+PU-9
GNU_CONFIGURE=	YES

INSTALLATION_DIRS=	${PKGMANDIR}/man5 ${PKGMANDIR}/man8 sbin

do-install:
	${INSTALL_DATA_DIR} /var/db/bindings
	${INSTALL_PROGRAM} ${WRKSRC}/dhcpd ${PREFIX}/sbin/cmu-dhcpd
	${INSTALL_MAN} ${WRKSRC}/man/bootptab.5 ${PREFIX}/${PKGMANDIR}/man5/bootptab.5
	${INSTALL_MAN} ${WRKSRC}/man/dhcpd.8 ${PREFIX}/${PKGMANDIR}/man8/dhcpd.8
	${INSTALL_MAN} ${WRKSRC}/man/dhcpd.conf.5 ${PREFIX}/${PKGMANDIR}/man5/dhcpd.conf.5

.include "../../mk/bsd.pkg.mk"
