# $NetBSD: Makefile,v 1.3 2008/10/19 19:17:57 he Exp $
#

DISTNAME=	MooseX-Getopt-0.15
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/MooseX-Getopt/
COMMENT=	Perl 5 Moose role for processing command line options

DEPENDS+=	p5-Getopt-Long-Descriptive-[0-9]*:../../devel/p5-Getopt-Long-Descriptive
DEPENDS+=	p5-Getopt-Long>=2.37:../../devel/p5-Getopt-Long
DEPENDS+=	p5-Moose>=0.43:../../devel/p5-Moose

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/MooseX/Getopt/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
