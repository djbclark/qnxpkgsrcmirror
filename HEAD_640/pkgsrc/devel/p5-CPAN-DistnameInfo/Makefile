# $NetBSD: Makefile,v 1.2 2008/11/16 23:21:17 he Exp $
#

DISTNAME=	CPAN-DistnameInfo-0.07
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=CPAN/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/CPAN-DistnameInfo/
COMMENT=	Perl 5 module to exatract distname and version from distfile

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/CPAN/DistnameInfo/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
