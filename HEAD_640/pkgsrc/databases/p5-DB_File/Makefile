# $NetBSD: Makefile,v 1.24 2008/10/19 19:17:43 he Exp $

DISTNAME=	DB_File-1.817
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5dfi
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DB_File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/DB_File/
COMMENT=	Perl5 module to use Berkeley DB version 1 API

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/DB_File/.packlist

.include "../../mk/bsd.prefs.mk"
.include "../../mk/bdb.buildlink3.mk"

MAKE_ENV+=	DB_FILE_NAME=${BDB_LIBS:Q}
MAKE_ENV+=	DB_FILE_INCLUDE="${BDBBASE}/${BUILDLINK_INCDIRS.${BDB_TYPE}}"
MAKE_ENV+=	DB_FILE_LIB="${BDBBASE}/lib"
.if empty(BDB_TYPE:Mdb1)
MAKE_ENV+=	DB_FILE_COMPAT185=1
.endif

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
