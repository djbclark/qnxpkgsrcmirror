# $NetBSD: Makefile,v 1.11 2004/07/30 15:50:37 minskim Exp $

DISTNAME=		dhry2.1
PKGNAME=		dhrystone-2.1
CATEGORIES=		benchmarks
MASTER_SITES=		ftp://gatekeeper.dec.com/pub/misc/
EXTRACT_SUFX=		.tar.Z

MAINTAINER=		root@garbled.net
COMMENT=		Reinhold Weicker's DHRYSTONE 2.1 integer benchmark

PKG_INSTALLATION_TYPES=	overwrite pkgviews

WRKSRC=			${WRKDIR}

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dry2 ${PREFIX}/bin/dry2
	${INSTALL_PROGRAM} ${WRKSRC}/dry2reg ${PREFIX}/bin/dry2reg
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/dhrystone
	${INSTALL_DATA} ${WRKSRC}/clarify.doc ${PREFIX}/share/doc/dhrystone
	${INSTALL_DATA} ${WRKSRC}/Rationale ${PREFIX}/share/doc/dhrystone

benchmark:
	-@${ECHO} 5000000 | ${WRKSRC}/dry2 | tee ${WRKSRC}/dry.out
	-@${ECHO} 5000000 | ${WRKSRC}/dry2reg | tee -a ${WRKSRC}/dry.out

results:
	@${MKDIR} /tmp/benches/`domainname`
	-@${CP} ${WRKSRC}/dry.out /tmp/benches/`domainname`/dhrystone.`uname`-`uname -m`-`uname -r`.`hostname`

.include "../../mk/bsd.pkg.mk"
