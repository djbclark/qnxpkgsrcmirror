# $NetBSD: Makefile,v 1.2 2008/10/19 19:19:17 he Exp $

DISTNAME=	Template-Stash-HTML-Entities-1.3.1
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/Y/YO/YOSHIDA/}

MAINTAINER=	abs@absd.org
HOMEPAGE=	http://search.cpan.org/~yoshida/Template-Stash-HTML-Entities/
COMMENT=	Encode Template toolkit stash values using HTML::Entities

DEPENDS+=	p5-HTML-Parser-[0-9]*:../../www/p5-HTML-Parser
DEPENDS+=	p5-Template-Toolkit-[0-9]*:../../www/p5-Template-Toolkit

PERL5_PACKLIST= auto/Template/Stash/HTML/Entities/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
