# $NetBSD: Makefile,v 1.18 2008/11/05 23:22:26 he Exp $

DISTNAME=	Exception-Class-1.26
PKGNAME=	p5-${DISTNAME}
SVR4_PKGNAME=	p5exc
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Exception/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Exception-Class/
COMMENT=	Perl5 module implementing real exception classes

DEPENDS+=	p5-Class-Data-Inheritable>=0.02:../../devel/p5-Class-Data-Inheritable
DEPENDS+=	p5-Devel-StackTrace>=1.17:../../devel/p5-Devel-StackTrace
DEPENDS+=	p5-Test-Simple>=0.46:../../devel/p5-Test-Simple

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		# none

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Exception/Class/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
