# $NetBSD: Makefile,v 1.12 2008/12/20 22:41:32 he Exp $

DISTNAME=	IO-All-0.39
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:S/${MODULE_DIR}/${AUTHOR_DIR}/}
MODULE_DIR=	modules/by-module
AUTHOR_DIR=	authors/id/I/IN/INGY

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/IO-All/
COMMENT=	Spiffy OO interface to Perl IO

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=	perl

PERL5_PACKLIST=		auto/IO/All/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
