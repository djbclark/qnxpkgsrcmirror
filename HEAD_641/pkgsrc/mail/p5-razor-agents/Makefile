# $NetBSD: Makefile,v 1.29 2008/10/19 19:18:20 he Exp $

DISTNAME=	razor-agents-2.84
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5ra
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=razor/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	heinz@NetBSD.org
HOMEPAGE=	http://razor.sourceforge.net/
COMMENT=	Distributed and collaborative spam detection network

# MIME::QuotedPrint, Getopt::Long, File::Copy needed from the perl package
DEPENDS+=	p5-Time-HiRes-[0-9]*:../../time/p5-Time-HiRes
DEPENDS+=	p5-Digest-SHA1-[0-9]*:../../security/p5-Digest-SHA1
DEPENDS+=	p5-URI-[0-9]*:../../www/p5-URI

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

MAKE_FLAGS+=	MANSUBDIR=${PKGMANDIR:Q}

PERL5_PACKLIST=	auto/razor-agents/.packlist
REPLACE_PERL+=	lib/Razor2/*.pm  lib/Razor2/*/*.pm

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
