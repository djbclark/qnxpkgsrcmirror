# $NetBSD: Makefile,v 1.18 2006/06/16 10:58:23 rillig Exp $
#

DISTNAME=	sybase-0.36
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	databases python
MASTER_SITES=	http://object-craft.com.au/projects/sybase/download/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.object-craft.com.au/projects/sybase/
COMMENT=	Sybase interface for Python using FreeTDS

PYTHON_VERSIONS_ACCEPTED=	21 22 23 24

PYSETUPBUILDARGS=	build_ext -D HAVE_FREETDS=61 -U WANT_BULKCOPY
PYDISTUTILSPKG=		yes

SYBASE=		${BUILDLINK_PREFIX.freetds}
MAKE_ENV+=	SYBASE=${SYBASE:Q}

SUBST_CLASSES+=		sybase
SUBST_STAGE.sybase=	pre-configure
SUBST_MESSAGE.sybase=	Fixing runtime_library_dirs.
SUBST_FILES.sybase=	setup.py
SUBST_SED.sybase=	-e "s|\\(runtime_library_dirs = \\)None|\\1['${SYBASE}/lib']|"

.include "../../databases/freetds/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
