# $NetBSD: Makefile,v 1.7 2013/05/31 12:42:17 wiz Exp $

DISTNAME=	Text-Trac-0.15
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	perl5 textproc
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Text/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Text-Trac/
COMMENT=	Perl extension for formatting text with Trac Wiki Style
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Class-Accessor-[0-9]*:../../devel/p5-Class-Accessor
DEPENDS+=	p5-Class-Data-Inheritable-[0-9]*:../../devel/p5-Class-Data-Inheritable
DEPENDS+=	p5-HTML-Parser-[0-9]*:../../www/p5-HTML-Parser
DEPENDS+=	p5-List-MoreUtils-[0-9]*:../../devel/p5-List-MoreUtils
DEPENDS+=	p5-Tie-IxHash-[0-9]*:../../devel/p5-Tie-IxHash
DEPENDS+=	p5-UNIVERSAL-require-[0-9]*:../../devel/p5-UNIVERSAL-require

BUILD_DEPENDS+=	p5-Test-Base-[0-9]*:../../devel/p5-Test-Base

USE_LANGUAGES=		# empty

PERL5_PACKLIST=		auto/Text/Trac/.packlist
PERL5_MODULE_TYPE=	Module::Install::Bundled

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
