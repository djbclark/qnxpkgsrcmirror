# $NetBSD: Makefile,v 1.1.1.1 2009/08/09 13:31:28 sno Exp $

DISTNAME=	CatalystX-LeakChecker-0.02
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel www
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=CatalystX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/CatalystX-LeakChecker/
COMMENT=	Debug memory leaks in Catalyst applications
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Catalyst-Runtime>=5.80000:../../www/p5-Catalyst-Runtime
DEPENDS+=	p5-Data-Visitor-[0-9]*:../../devel/p5-Data-Visitor
DEPENDS+=	p5-Moose-[0-9]*:../../devel/p5-Moose
DEPENDS+=	p5-MooseX-AttributeHelpers-[0-9]*:../../devel/p5-MooseX-AttributeHelpers
DEPENDS+=	p5-MooseX-Types-[0-9]*:../../devel/p5-MooseX-Types
DEPENDS+=	p5-PadWalker>=1:../../devel/p5-PadWalker
DEPENDS+=	p5-Task-Weaken-[0-9]*:../../devel/p5-Task-Weaken
DEPENDS+=	p5-Text-SimpleTable-[0-9]*:../../textproc/p5-Text-SimpleTable
DEPENDS+=	p5-aliased-[0-9]*:../../devel/p5-aliased
DEPENDS+=	p5-namespace-autoclean-[0-9]*:../../devel/p5-namespace-autoclean
DEPENDS+=	p5-namespace-clean>=0.05:../../devel/p5-namespace-clean

BUILD_DEPENDS+=	p5-Test-Simple>=0.88:../../devel/p5-Test-Simple

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/CatalystX/LeakChecker/.packlist

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
