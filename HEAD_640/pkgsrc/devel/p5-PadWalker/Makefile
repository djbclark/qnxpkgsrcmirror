# $NetBSD: Makefile,v 1.2 2008/10/19 19:17:58 he Exp $

DISTNAME=	PadWalker-1.7
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/R/RO/ROBIN/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/perldoc?PadWalker
COMMENT=	Play with other peoples' lexical variables

USE_LANGUAGES=	c
PERL5_PACKLIST= auto/PadWalker/.packlist

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
