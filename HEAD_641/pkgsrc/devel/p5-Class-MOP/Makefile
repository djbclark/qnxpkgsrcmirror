# $NetBSD: Makefile,v 1.26 2009/08/08 13:41:10 sno Exp $
#

DISTNAME=	Class-MOP-0.91
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Class-MOP/
COMMENT=	Perl 5 module providing a meta object protocol
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Devel-GlobalDestruction-[0-9]*:../../devel/p5-Devel-GlobalDestruction
DEPENDS+=	p5-MRO-Compat>=0.05:../../devel/p5-MRO-Compat
DEPENDS+=	p5-Sub-Name>=0.04:../../devel/p5-Sub-Name
DEPENDS+=	p5-Task-Weaken-[0-9]*:../../devel/p5-Task-Weaken

# Only for test target
BUILD_DEPENDS+=	p5-PathTools-[0-9]*:../../devel/p5-PathTools
BUILD_DEPENDS+=	p5-SUPER-[0-9]*:../../devel/p5-SUPER # t/050_scala_style_mixin_composition.t
BUILD_DEPENDS+=	p5-Test-Exception>=0.27:../../devel/p5-Test-Exception
BUILD_DEPENDS+=	p5-Test-Simple>=0.77:../../devel/p5-Test-Simple
BUILD_DEPENDS+=	p5-Test-Output-[0-9]*:../../devel/p5-Test-Output # t/310_inline_structor.t
BUILD_DEPENDS+=	p5-Test-LeakTrace-[0-9]*:../../devel/p5-Test-LeakTrace # t/312_anon_class_leak.t

USE_LANGUAGES=	c
MAKE_JOBS_SAFE= no

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/Class/MOP/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
