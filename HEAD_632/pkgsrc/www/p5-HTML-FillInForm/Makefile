# $NetBSD: Makefile,v 1.18 2007/05/25 11:20:29 markd Exp $

DISTNAME=	HTML-FillInForm-1.06
PKGNAME=	p5-${DISTNAME}
SVR4_PKGNAME=	p5hfi
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=HTML/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/HTML-FillInForm/
COMMENT=	Perl5 module that populates HTML Forms with CGI data

DEPENDS+=	p5-HTML-Parser>=3.26:../../www/p5-HTML-Parser

PKG_INSTALLATION_TYPES=	overwrite pkgviews

PERL5_PACKLIST=		auto/HTML/FillInForm/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
