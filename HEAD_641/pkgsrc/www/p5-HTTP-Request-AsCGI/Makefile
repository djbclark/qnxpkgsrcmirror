# $NetBSD: Makefile,v 1.3 2009/04/29 22:25:47 sno Exp $

DISTNAME=	HTTP-Request-AsCGI-0.9
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=HTTP/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/HTTP-Request-AsCGI/
COMMENT=	Setup a CGI enviroment from a HTTP::Request
LICENSE=	gnu-gpl-v2 # OR artistic

DEPENDS+=	p5-Class-Accessor>=0:../../devel/p5-Class-Accessor
DEPENDS+=	p5-libwww>=5.805:../../www/p5-libwww
DEPENDS+=	p5-URI-[0-9]*:../../www/p5-URI

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/HTTP/Request/AsCGI/.packlist

PKG_DESTDIR_SUPPORT=    user-destdir

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
