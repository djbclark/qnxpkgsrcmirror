# $NetBSD: Makefile,v 1.4 2009/07/07 20:49:40 sno Exp $

DISTNAME=	CPAN-1.9402
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=CPAN/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/${DISTNAME}/
COMMENT=	Perl module to query, download and build perl modules from CPAN sites

MAKE_PARAMS+=	verbose

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c

PERL5_PACKLIST=		auto/CPAN/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
