# $NetBSD: Makefile,v 1.10 2013/05/31 12:40:03 wiz Exp $

DISTNAME=	App-cpanoutdated-0.20
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=App/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/App-cpanoutdated/
COMMENT=	Detect outdated CPAN modules in your environment
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/App/cpanoutdated/.packlist

DEPENDS+=	{perl>=5.12,p5-ExtUtils-MakeMaker>=6.56}:../../devel/p5-ExtUtils-MakeMaker
DEPENDS+=	p5-libwww-[0-9]*:../../www/p5-libwww
DEPENDS+=	p5-local-lib-[0-9]*:../../devel/p5-local-lib

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
