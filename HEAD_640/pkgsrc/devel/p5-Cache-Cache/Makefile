# $NetBSD: Makefile,v 1.13 2008/10/19 19:17:47 he Exp $
#

DISTNAME=	Cache-Cache-1.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5cc
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Cache/} \
		${MASTER_SITE_SOURCEFORGE:=perl-cache/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://perl-cache.sourceforge.net/
COMMENT=	The Cache interface

DEPENDS+=	p5-Error>=0.15:../../devel/p5-Error
DEPENDS+=	p5-Digest-SHA1>=2.02:../../security/p5-Digest-SHA1
DEPENDS+=	p5-Storable>=1.014:../../devel/p5-Storable
DEPENDS+=	p5-IPC-ShareLite>=0.09:../../devel/p5-IPC-ShareLite

PKG_DESTDIR_SUPPORT=	user-destdir
PKG_INSTALLATION_TYPES=	overwrite pkgviews

USE_LANGUAGES=	# none

PERL5_PACKLIST=	auto/Cache/Cache/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
