# $NetBSD: Makefile,v 1.31 2012/10/23 17:19:02 asau Exp $
#

DISTNAME=	pygoogle-0.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
PKGREVISION=	5
CATEGORIES=	net python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=pygoogle/}

MAINTAINER=	drochner@NetBSD.org
HOMEPAGE=	http://pygoogle.sourceforge.net/
COMMENT=	Call the Google web API from Python

DEPENDS+=	${PYPKGPREFIX}-SOAPpy-[0-9]*:../../net/py-soappy

EGG_NAME=	pygoogle-0.5

.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
