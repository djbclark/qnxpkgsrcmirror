# $NetBSD: Makefile,v 1.8 2008/10/19 19:17:57 he Exp $

DISTNAME=	Module-Install-0.77
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5moi
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Module/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Module-Install/
COMMENT=	Perl5 module for building and installing Perl modules

DEPENDS+=	p5-Archive-Tar>=1.38:../../archivers/p5-Archive-Tar
DEPENDS+=	p5-ExtUtils-Install>=1.50:../../devel/p5-ExtUtils-Install
DEPENDS+=	p5-ExtUtils-ParseXS>=2.19:../../devel/p5-ExtUtils-ParseXS
DEPENDS+=	p5-Module-Build>=0.2808:../../devel/p5-Module-Build
DEPENDS+=	p5-Module-CoreList>=2.15:../../devel/p5-Module-CoreList
DEPENDS+=	p5-Module-ScanDeps>=0.83:../../devel/p5-Module-ScanDeps
DEPENDS+=	p5-PAR-Dist>=0.29:../../devel/p5-PAR-Dist
DEPENDS+=	p5-YAML-Tiny>=1.31:../../textproc/p5-YAML-Tiny
DEPENDS+=	p5-File-Remove>=1.40:../../sysutils/p5-File-Remove
DEPENDS+=	p5-Devel-PPPort-[0-9]*:../../devel/p5-Devel-PPPort

PERL5_PACKLIST=		auto/Module/Install/.packlist

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
