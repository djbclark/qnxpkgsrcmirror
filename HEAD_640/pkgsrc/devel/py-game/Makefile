# $NetBSD: Makefile,v 1.12 2008/11/18 12:42:32 drochner Exp $
#

DISTNAME=		pygame-1.8.1release
PKGNAME=		${PYPKGPREFIX}-game-1.8.1
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		http://pygame.org/ftp/

MAINTAINER=		recht@NetBSD.org
HOMEPAGE=		http://pygame.org/
COMMENT=		Set of Python modules designed for writing games

PKG_DESTDIR_SUPPORT=	user-destdir

PY_PATCHPLIST=		yes
PYDISTUTILSPKG=		yes

# XXX
post-extract:
	${CHMOD} go+r ${WRKSRC}/lib/*

.include "../../audio/SDL_mixer/buildlink3.mk"
.include "../../devel/SDL_ttf/buildlink3.mk"
.include "../../graphics/SDL_image/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../multimedia/smpeg/buildlink3.mk"
.include "../../math/py-Numeric/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
