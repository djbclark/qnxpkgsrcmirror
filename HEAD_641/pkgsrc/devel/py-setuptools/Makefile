# $NetBSD: Makefile,v 1.11 2009/07/08 13:55:59 joerg Exp $
#

EGG_VERSION=		0.6c9
DISTNAME=		setuptools-${EGG_VERSION}-py2.4.egg
PKGNAME=		${PYPKGPREFIX}-setuptools-${EGG_VERSION}
CATEGORIES=		devel python
MASTER_SITES=		http://pypi.python.org/packages/2.4/s/setuptools/
EXTRACT_SUFX=		# empty

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://peak.telecommunity.com/DevCenter/setuptools
COMMENT=		New Python packaging system

PKG_DESTDIR_SUPPORT=	user-destdir

PYTHON_VERSIONS_ACCEPTED= 26 25 24
USE_TOOLS+=		unzip pax

PY_PATCHPLIST=	yes
PLIST_SUBST+=	EGG_NAME=${EGG_NAME}
PLIST_SUBST+=	PYVERSSUFFIX=${PYVERSSUFFIX} PYPKGPREFIX=${PYPKGPREFIX}

CHECK_FILES_SKIP+=	${PREFIX}/${PYSITELIB}/easy-install.pth

FILES_SUBST+=	PYSITELIB=${PREFIX}/${PYSITELIB}
FILES_SUBST+=	PYVERSSUFFIX=${PYVERSSUFFIX}

INSTALLATION_DIRS=	bin

EGG_NAME=	${DISTNAME:S/2.4/${PYVERSSUFFIX}/}
TARGET_NAME=	${PREFIX}/${PYSITELIB}/${EGG_NAME}

do-extract:
	${MKDIR} ${WRKSRC}
	${TOOLS_CMD.unzip} -d ${WRKSRC} ${DISTDIR}/${DISTNAME}

post-extract:
	chmod -R go-w ${WRKSRC}

do-build:
	${SED} -e 's,@PYTHON@,${PYTHONBIN},' \
	       -e 's,@PYPREFIX@,${PYPKGPREFIX},' \
	       -e 's,@PYSITELIB@,${PREFIX}/${PYSITELIB},' \
	       ${FILESDIR}/manage-eggs.py > ${WRKDIR}/manage-eggs.py
	${SED} -e 's,@PYTHON@,${PYTHONBIN},' \
	       -e 's,@PKGVERSION@,${EGG_VERSION},' \
	       ${FILESDIR}/easy_install.py > ${WRKDIR}/easy_install.py
	${PY_COMPILE_ALL} -f -d ${TARGET_NAME} ${WRKSRC}
	${PY_COMPILE_O_ALL} -f -d ${TARGET_NAME} ${WRKSRC}

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/easy_install.py \
		${DESTDIR}${PREFIX}/bin/easy_install${PYVERSSUFFIX}
	${INSTALL_SCRIPT} ${WRKDIR}/manage-eggs.py ${DESTDIR}${PREFIX}/bin/${PYPKGPREFIX}-manage-eggs
	cd ${WRKSRC} && pax -rw -pm . ${DESTDIR}${TARGET_NAME}
	${ECHO} ./${EGG_NAME} > ${DESTDIR}${PREFIX}/${PYSITELIB}/setuptools.pth

.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
