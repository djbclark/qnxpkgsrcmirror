# $NetBSD: Makefile,v 1.10 2007/09/21 13:03:47 wiz Exp $
#

DISTNAME=		comix-3.6.4
PKGREVISION=		1
CATEGORIES=		graphics python
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=comix/}

MAINTAINER=		hugor@users.sourceforge.net
HOMEPAGE=		http://comix.sourceforge.net/index.html
COMMENT=		Image viewer specifically designed to handle comic books

DEPENDS+=		unrar-[0-9]*:../../archivers/unrar

USE_DIRS+=		xdg-1.3
MANCOMPRESSED=		yes

SUBST_CLASSES+=			install-path
SUBST_STAGE.install-path=	pre-build
SUBST_MESSAGE.install-path=	Fixing man page installation path.
SUBST_FILES.install-path=	install.py
SUBST_SED.install-path=		-e "s,share/man/man,${PKGMANDIR}/man,g"

PYTHON_PATCH_SCRIPTS=		comix mime/comicthumb

do-build:

do-install:
	cd ${WRKSRC} && ${PYTHONBIN} install.py install --installdir ${PREFIX}

.include "../../databases/shared-mime-info/buildlink3.mk"
.include "../../devel/GConf/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/py-imaging/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../x11/py-gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
