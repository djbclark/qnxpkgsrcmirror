# $NetBSD: Makefile,v 1.8 2007/05/16 15:25:14 heinz Exp $
#

DISTNAME=		Digest-BubbleBabble-0.01
PKGNAME=		p5-${DISTNAME}
SVR4_PKGNAME=		p5bbl
PKGREVISION=		2
CATEGORIES=		security perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Digest/}

MAINTAINER=		heinz@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Digest-BubbleBabble/
COMMENT=		Perl5 module for bubble babble fingerprints

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=		p5-Digest-MD5-[0-9]*:../../security/p5-Digest-MD5
DEPENDS+=		p5-Digest-SHA1-[0-9]*:../../security/p5-Digest-SHA1

PERL5_PACKLIST=		auto/Digest/BubbleBabble/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
