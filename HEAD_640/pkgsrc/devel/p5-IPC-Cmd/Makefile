# $NetBSD: Makefile,v 1.1.1.1 2008/12/20 14:38:42 he Exp $

DISTNAME=	IPC-Cmd-0.42
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=IPC/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/IPC-Cmd/
COMMENT=	Perl module for finding and running system commands

DEPENDS+=       p5-Locale-Maketext-Simple>=0:../../misc/p5-Locale-Maketext-Simple

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/IPC/Cmd/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
