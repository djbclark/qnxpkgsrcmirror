# $NetBSD: Makefile,v 1.19 2013/06/06 12:54:39 wiz Exp $
#

DISTNAME=	scim-unikey-0.3.1
PKGREVISION=	17
CATEGORIES=	inputmethod
MASTER_SITES=	http://scim-unikey.googlecode.com/files/

MAINTAINER=	obache@NetBSD.org
HOMEPAGE=	http://code.google.com/p/scim-unikey/
COMMENT=	Vietnamese Input Method Engine for SCIM using Unikey IME
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		pkg-config msgfmt

USE_SCIM_GTKUTILS=	yes

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../inputmethod/scim/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
