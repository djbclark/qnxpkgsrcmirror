# $NetBSD: Makefile,v 1.2 2008/10/19 19:17:49 he Exp $
#

DISTNAME=	Compress-PPMd-0.11
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Compress/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Compress-PPMd/
COMMENT=	Perl 5 module interface to the Dmitry Shkarin PPMd compression library

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c c++
PERL5_PACKLIST=	auto/Compress/PPMd/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
