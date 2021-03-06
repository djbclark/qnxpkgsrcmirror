# $NetBSD: Makefile,v 1.4 2008/12/20 16:12:47 he Exp $

DISTNAME=	Rose-DBx-Garden-Catalyst-0.13
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Rose/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Rose-DBx-Garden-Catalyst/
COMMENT=	Create Catalyst components that use RDBO and RHTMLO

DEPENDS+=	p5-Catalyst-Runtime>=5.7:../../www/p5-Catalyst-Runtime
DEPENDS+=	p5-Catalyst-Plugin-ConfigLoader>=0:../../www/p5-Catalyst-Plugin-ConfigLoader
DEPENDS+=	p5-Catalyst-Plugin-Static-Simple>=0:../../www/p5-Catalyst-Plugin-Static-Simple
DEPENDS+=	p5-CatalystX-CRUD-YUI>=0.009:../../www/p5-CatalystX-CRUD-YUI

DEPENDS+=	p5-Rose-HTMLx-Form-Related>=0.12:../../www/p5-Rose-HTMLx-Form-Related
DEPENDS+=	p5-Rose-DBx-Object-MoreHelpers>=0.06:../../databases/p5-Rose-DBx-Object-MoreHelpers
DEPENDS+=	p5-Rose-DBx-AutoReconnect>=0:../../databases/p5-Rose-DBx-AutoReconnect
DEPENDS+=	p5-Rose-DB-Object>=0.77:../../databases/p5-Rose-DB-Object
DEPENDS+=	p5-Rose-DBx-Garden>=0.11:../../databases/p5-Rose-DBx-Garden
DEPENDS+=	p5-YAML-Syck>=0:../../textproc/p5-YAML-Syck
DEPENDS+=	p5-JSON>=>2.00:../../converters/p5-JSON
DEPENDS+=	p5-JSON-XS>=>2.00:../../converters/p5-JSON-XS
DEPENDS+=	p5-Data-Dump>=0:../../devel/p5-Data-Dump
DEPENDS+=	p5-Tree-Simple>=0:../../devel/p5-Tree-Simple
DEPENDS+=	p5-Tree-Simple-VisitorFactory>=0:../../devel/p5-Tree-Simple-VisitorFactory
DEPENDS+=	p5-Path-Class>=0:../../devel/p5-Path-Class
DEPENDS+=	p5-Template-Toolkit>=0:../../www/p5-Template-Toolkit
DEPENDS+=	p5-Catalyst-View-TT>=0:../../www/p5-Catalyst-View-TT
DEPENDS+=	p5-CatalystX-CRUD>=0:../../databases/p5-CatalystX-CRUD
DEPENDS+=	p5-CatalystX-CRUD-Model-RDBO>=0.16:../../databases/p5-CatalystX-CRUD-Model-RDBO
DEPENDS+=	p5-CatalystX-CRUD-Controller-RHTMLO>=0.10:../../www/p5-CatalystX-CRUD-Controller-RHTMLO
DEPENDS+=	p5-Scalar-List-Utils>=0:../../devel/p5-Scalar-List-Utils

# For tests:
BUILD_DEPENDS+=	sqlite3>=0:../../databases/sqlite3
BUILD_DEPENDS+=	p5-IPC-Cmd>=0:../../devel/p5-IPC-Cmd

SUBST_CLASSES+=	sqlite3
SUBST_MESSAGE.sqlite3=	Fixing sqlite3-using test
SUBST_STAGE.sqlite3=	post-configure
SUBST_FILES.sqlite3=	t/lib/MyDB.pm
SUBST_SED.sqlite3=	-e "s!\"sqlite3!\"${PREFIX}/bin/sqlite3!"

USE_LANGUAGES=	# empty
PERL5_PACKLIST= auto/Rose/DBx/Garden/Catalyst/.packlist

PKG_DESTDIR_SUPPORT=    user-destdir

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
