# $NetBSD: Makefile,v 1.23 2013/05/31 12:39:57 wiz Exp $

DISTNAME=	automake-1.4-p6
PKGNAME=	automake14-1.4.6
PKGREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU:=automake/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnu.org/software/automake/automake.html
COMMENT=	GNU Standards-compliant Makefile generator (old version)
LICENSE=	gnu-gpl-v2

DEPENDS+=	autoconf213>=2.13:../../devel/autoconf213

CONFLICTS=	automake<1.6

#PKG_INSTALLATION_TYPES=	overwrite pkgviews

GNU_CONFIGURE=		YES
_STRIPFLAG_INSTALL=	# none

USE_TOOLS+=		makeinfo perl:run
INFO_FILES=	yes

TEST_TARGET=		check

.include "../../mk/bsd.pkg.mk"
