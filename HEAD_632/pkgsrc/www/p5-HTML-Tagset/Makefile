# $NetBSD: Makefile,v 1.21 2006/11/05 17:37:55 joerg Exp $
#

DISTNAME=		HTML-Tagset-3.10
PKGNAME=		p5-${DISTNAME}
SVR4_PKGNAME=		p5htg
CATEGORIES=		www perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=HTML/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/HTML-Tagset/
COMMENT=		Perl5 module of data tables useful in parsing HTML

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/HTML/Tagset/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
