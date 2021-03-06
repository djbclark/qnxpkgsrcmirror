# $NetBSD: Makefile,v 1.53 2013/07/10 13:28:37 wiz Exp $

PKGNAME=	${PYPKGPREFIX}-subversion-${SVNVER}
PKGREVISION=	1
COMMENT=	Python bindings and tools for Subversion

.include "../../devel/subversion/Makefile.common"

SHLIBTOOL_OVERRIDE=	# empty

CONFIGURE_ENV+=		PYTHON2=${PYTHONBIN:Q}

PY_PATCHPLIST=		YES
PYTHON_PATCH_SCRIPTS=	tools/hook-scripts/mailer/mailer.py
PYTHON_SELF_CONFLICT=	YES

BUILD_TARGET=		swig-py
INSTALL_TARGET=		install-swig-py

MAKE_ENV+=		EXTRA_CPPFLAGS=${BUILDLINK_CPPFLAGS:Q}
MAKE_FLAGS+=		swig_pydir=${LOCALBASE}/${PYSITELIB}/libsvn \
			swig_pydir_extra=${LOCALBASE}/${PYSITELIB}/svn

TEST_TARGET=		all check check-swig-py

INSTALLATION_DIRS=	${SVNEXAMPLES}/python ${SVNEXAMPLES}/hook-scripts

post-patch:
	${RM} ${WRKSRC}/build-outputs.mk
	${CP} ${FILESDIR}/build-outputs.mk ${WRKSRC}/build-outputs.mk

post-install:
	${INSTALL_DATA} ${WRKSRC}/tools/examples/*.py ${DESTDIR}${SVNEXAMPLES}/python
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/mailer/mailer.py \
		${DESTDIR}${SVNEXAMPLES}/hook-scripts
	${INSTALL_DATA} \
		${WRKSRC}/tools/hook-scripts/mailer/mailer.conf.example \
		${DESTDIR}${SVNEXAMPLES}/hook-scripts

.include "../../devel/subversion-base/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
