# $NetBSD: Makefile,v 1.60 2008/11/13 11:31:11 dsainty Exp $

DISTNAME=	libidn-1.11
CATEGORIES=	devel
MASTER_SITES=	ftp://alpha.gnu.org/pub/gnu/libidn/ \
		http://ftp.gnu.org/gnu/libidn/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnu.org/software/libidn/
COMMENT=	Internationalized Domain Names command line tool

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		makeinfo pkg-config perl:build
TEXINFO_REQD=		4.1
GNU_CONFIGURE=		yes
INFO_FILES=		yes
CONFIGURE_ENV+=		EMACS=${FALSE}
CONFIGURE_ARGS+=	--disable-csharp --disable-java

PKGCONFIG_OVERRIDE+=	libidn.pc.in
TEST_TARGET=		check
#LICENSE=		gnu-gplv3 gnu-gplv2 gnu-lgplv21

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libgetopt/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"

.if ${OPSYS} == "QNX"
# otherwise it pulls out the mcs utility as a C# compiler.
CONFIGURE_ARGS+=		--enable-csharp=no
.endif
