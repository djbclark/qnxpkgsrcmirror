# $NetBSD: Makefile,v 1.2 2008/10/19 19:19:24 he Exp $

DISTNAME=	URI-Escape-XS-0.02
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	www net perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=URI/}

MAINTAINER=	martti@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/URI-Escape-XS/
COMMENT=	Escape and unescape unsafe characters in URIs

DEPENDS+=	p5-URI>=1.35:../../www/p5-URI

PERL5_PACKLIST=	auto/URI/Escape/XS/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
