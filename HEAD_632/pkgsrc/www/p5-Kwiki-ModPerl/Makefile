# $NetBSD: Makefile,v 1.2 2007/06/08 12:25:06 wiz Exp $

DISTNAME=	Kwiki-ModPerl-0.09
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Kwiki/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.kwiki.org/
COMMENT=	Kwiki integration with ModPerl

DEPENDS+=	p5-Kwiki>=0.38:../../www/p5-Kwiki

PERL5_PACKLIST=		auto/Kwiki/ModPerl/.packlist

.include "../../mk/apache.mk"
.if ${PKG_APACHE} == "apache13"
.include "../../www/ap-perl/buildlink3.mk"
.else
.include "../../www/ap2-perl/buildlink3.mk"
.endif
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
