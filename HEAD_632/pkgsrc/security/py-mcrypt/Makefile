# $NetBSD: Makefile,v 1.5 2007/02/22 19:27:09 wiz Exp $
#

DISTNAME=	python-mcrypt-1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/python-//}
PKGREVISION=	1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=python-mcrypt/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://sourceforge.net/projects/python-mcrypt/
COMMENT=	Python interface to mcrypt library

PYBINMODULE=	yes
PYDISTUTILSPKG= yes
PYTHON_VERSIONS_ACCEPTED=	24 23 22

.include "../../lang/python/extension.mk"
.include "../../security/libmcrypt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
