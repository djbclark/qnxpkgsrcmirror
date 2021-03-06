# $NetBSD: Makefile,v 1.8 2006/02/05 23:08:39 joerg Exp $
#
# NOTE: if you are depending on ant from another package, please be aware that
# the ant team has CHANGED the version numbering scheme.  A previous version
# of ant was 3.1.  Do NOT use dependency patterns such as >=1.3 which could pick
# up this version by mistake.

DISTNAME=	apache-ant-1.5.4
PKGREVISION=	2
CATEGORIES=	devel java
MASTER_SITES=	http://archive.apache.org/dist/ant/binaries/
EXTRACT_SUFX=	.zip
DISTFILES=	${DISTNAME}-bin${EXTRACT_SUFX}

MAINTAINER=	jwise@NetBSD.org
HOMEPAGE=	http://ant.apache.org/
COMMENT=	"Apache Project's Java-Based make(1) replacement"

DEPENDS+=	crimson>=1.1.3:../../textproc/crimson

# Up to version 1.5.1 inclusive this was known as "jakarta-ant".
CONFLICTS=	jakarta-ant*

WRKSRC=		${WRKDIR}/${PKGNAME_NOREV}
USE_JAVA=	run

EXTRACT_OPTS_ZIP=	-Caq
INSTALLATION_DIRS=	bin

do-build:
	${SED}	-e 's,@PREFIX@,${PREFIX},g'				\
		-e 's,@JAVA_HOME@,${PKG_JAVA_HOME},g'			\
		< ${FILESDIR}/ant > ${WRKDIR}/ant

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/ant ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/antRun ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/lib/java
	${INSTALL_DATA_DIR} ${PREFIX}/lib/java/ant
	${INSTALL_DATA} ${WRKSRC}/lib/ant.jar ${PREFIX}/lib/java/ant
	${INSTALL_DATA} ${WRKSRC}/lib/optional.jar ${PREFIX}/lib/java/ant
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/java/ant
	cd ${WRKSRC}/docs && ${PAX} -rw -pmp * ${PREFIX}/share/doc/java/ant
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/java/ant
	${INSTALL_DATA} ${WRKSRC}/WHATSNEW ${PREFIX}/share/doc/java/ant

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
