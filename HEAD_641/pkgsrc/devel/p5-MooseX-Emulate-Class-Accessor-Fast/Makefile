# $NetBSD: Makefile,v 1.4 2009/07/21 06:22:06 sno Exp $

DISTNAME=	MooseX-Emulate-Class-Accessor-Fast-0.00902
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/MooseX-Emulate-Class-Accessor-Fast/
COMMENT=	Emulate Class::Accessor::Fast behavior using Moose attributes
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Moose>=0.84:../../devel/p5-Moose
DEPENDS+=	p5-namespace-clean-[0-9]*:../../devel/p5-namespace-clean

BUILD_DEPENDS+=	p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/MooseX/Emulate/Class/Accessor/Fast/.packlist
PERL5_MODULE_TYPE=	Module::Install

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
