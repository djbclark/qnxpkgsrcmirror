# $NetBSD: Makefile,v 1.7 2008/10/19 19:18:56 he Exp $

DISTNAME=	Text-Tabs+Wrap-2001.0929
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Text/}

MAINTAINER=	adrianp@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~muir/${DISTNAME}
COMMENT=	Line wrapping to form simple paragraphs

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/Text/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
