# $NetBSD: Makefile,v 1.5 2008/12/12 22:42:39 he Exp $
#

DISTNAME=	HTML-WikiConverter-0.63
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=HTML/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/HTML-WikiConverter/
COMMENT=	Convert HTML to wiki markup

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-Class-Data-Inheritable>=0.02:../../devel/p5-Class-Data-Inheritable
DEPENDS+=	p5-Params-Validate>=0.77:../../devel/p5-Params-Validate
DEPENDS+=	p5-CSS-[0-9]*:../../www/p5-CSS
DEPENDS+=	p5-HTML-Parser>=1.27:../../www/p5-HTML-Parser
DEPENDS+=	p5-HTML-Tagset>=3.04:../../www/p5-HTML-Tagset
DEPENDS+=	p5-HTML-Tree>=3.18:../../www/p5-HTML-Tree
DEPENDS+=	p5-URI>=1.35:../../www/p5-URI

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/HTML/WikiConverter/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
