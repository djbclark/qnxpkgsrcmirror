# $NetBSD: Makefile,v 1.14 2012/04/08 19:09:07 wiz Exp $

DISTNAME=	${PYPKGPREFIX}-gnome-bindings-2.26.2
CATEGORIES=	meta-pkgs x11 gnome
MASTER_SITES=	# empty

MAINTAINER=	drochner@NetBSD.org
HOMEPAGE=	http://www.gnome.org/
COMMENT=	Meta-package for Python bindings for the GNOME desktop

META_PACKAGE=	yes

.include "../../lang/python/pyversion.mk"

# see http://ftp.gnome.org/pub/GNOME/bindings/2.26/2.26.2/sources/python/

DEPENDS+=	${PYPKGPREFIX}-gnome2>=2.26.1:../../x11/py-gnome2
DEPENDS+=	${PYPKGPREFIX}-gobject>=2.16.1:../../devel/py-gobject
DEPENDS+=	${PYPKGPREFIX}-gtk2>=2.14.1:../../x11/py-gtk2
DEPENDS+=	${PYPKGPREFIX}-ORBit>=2.14.3:../../net/py-ORBit

.include "../../mk/bsd.pkg.mk"
