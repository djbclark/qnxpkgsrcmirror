# $NetBSD: Makefile,v 1.9 2009/02/10 14:48:04 rhaen Exp $

DISTNAME=		Email-Simple-2.005
PKGNAME=		p5-${DISTNAME}
SVR4_PKGNAME=		p5ems
CATEGORIES=		mail perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Email/}

MAINTAINER=		rhaen@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Email-Simple/
COMMENT=		Perl5 module for simple parsing of RFC2822 message format and headers

PKG_DESTDIR_SUPPORT=	user-destdir

# versions before 1.857 meddled in the guts of Email::Simple
CONFLICTS=		p5-Email-MIME<1.857

PERL5_PACKLIST=		auto/Email/Simple/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
