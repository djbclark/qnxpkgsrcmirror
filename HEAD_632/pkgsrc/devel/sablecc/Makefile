# $NetBSD: Makefile,v 1.10 2006/10/04 21:36:00 wiz Exp $
#

DISTNAME=	sablecc-2.16.2
PKGREVISION=	2
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=sablecc/}

MAINTAINER=	hag@linnaean.org
HOMEPAGE=	http://sablecc.org/
COMMENT=	Java based Compiler Compiler

USE_JAVA=	run
USE_JAVA2=	yes

INSTALLATION_DIRS=	bin

do-build:
	${SED}	-e 's,@PREFIX@,${PREFIX},g'				\
		-e 's,@JAVA_HOME@,${PKG_JAVA_HOME},g'			\
		< ${FILESDIR}/sablecc > ${WRKDIR}/sablecc

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/sablecc ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/lib/java
	${INSTALL_DATA} ${WRKSRC}/lib/sablecc.jar ${PREFIX}/lib/java

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
