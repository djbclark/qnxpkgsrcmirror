# $NetBSD: Makefile,v 1.10 2008/10/19 19:18:10 he Exp $

DISTNAME=	Chart-ThreeD-0.01
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
SVR4_PKGNAME=	p5c3d
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Chart/}

MAINTAINER=	he@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Chart-ThreeD/
COMMENT=	Three-Dimentional pie chart plotting

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-GD>=2.16:../../graphics/p5-GD

PERL5_PACKLIST=		auto/Chart-ThreeD/.packlist

REPLACE_PERL+=	pie.pl

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
