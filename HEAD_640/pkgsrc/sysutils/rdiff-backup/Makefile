# $NetBSD: Makefile,v 1.30 2008/11/29 18:13:28 snj Exp $

DISTNAME=	rdiff-backup-1.2.2
CATEGORIES=	sysutils net
MASTER_SITES=	http://savannah.nongnu.org/download/rdiff-backup/

MAINTAINER=	snj@NetBSD.org
HOMEPAGE=	http://www.nongnu.org/rdiff-backup/
COMMENT=	Remote incremental backup utility

PKG_DESTDIR_SUPPORT=	user-destdir

PYDISTUTILSPKG=		yes

PYTHON_VERSIONS_INCOMPATIBLE=	21 23

SUBST_CLASSES+=		path
SUBST_STAGE.path=	post-patch
SUBST_FILES.path=	setup.py
SUBST_SED.path=		-e "s|share/man|${PKGMANDIR}|"
SUBST_MESSAGE.path=	Fixing path to manpages.

BUILDLINK_API_DEPENDS.librsync+=	librsync>=0.9.6

.include "../../devel/librsync/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"

.include "../../mk/bsd.pkg.mk"
