# $NetBSD: Makefile,v 1.1.1.1 2009/07/08 11:33:32 sno Exp $

DISTNAME=	String-RewritePrefix-0.004
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=String/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/String-RewritePrefix/
COMMENT=	Rewrite strings based on a set of known prefixes
LICENSE=	${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/String/RewritePrefix/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
