# $NetBSD: Makefile,v 1.3 2009/04/12 20:41:18 sno Exp $

DISTNAME=		Email-Stuff-2.08
PKGNAME=		p5-${DISTNAME}
CATEGORIES=		mail perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Email/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Email-Stuff/
COMMENT=		More casual approach to creating and sending emails
LICENSE=		artistic-2.0

DEPENDS+=	p5-prefork>=1.01:../../devel/p5-prefork
DEPENDS+=	p5-Params-Util>=0.23:../../devel/p5-Params-Util
DEPENDS+=	p5-Email-Simple>=1.998:../../mail/p5-Email-Simple
DEPENDS+=	p5-Email-MIME>=1.858:../../mail/p5-Email-MIME
DEPENDS+=	p5-Email-MIME-Creator>=1.451:../../mail/p5-Email-MIME-Creator
DEPENDS+=	p5-Email-Send>=2.185:../../mail/p5-Email-Send
DEPENDS+=	p5-File-Type>=0.22:../../devel/p5-File-Type
# BUILD_DEPENDS+= Email-Send-Test

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/Email/Stuff/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
