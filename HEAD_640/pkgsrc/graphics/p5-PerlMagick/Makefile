# $NetBSD: Makefile,v 1.61 2008/10/28 10:42:02 adam Exp $

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../graphics/ImageMagick/Makefile.common"

PKGNAME=	p5-PerlMagick-${DISTVERSION}

SVR4_PKGNAME=	p5pma

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.simplesystems.org/ImageMagick/www/perl-magick.html
COMMENT=	Object-oriented Perl interface to ImageMagick

DISTINFO_FILE=	${.CURDIR}/../../graphics/ImageMagick/distinfo
FILESDIR=	${.CURDIR}/../../graphics/ImageMagick/files
PATCHDIR=	${.CURDIR}/../../graphics/ImageMagick/patches

PKG_INSTALLATION_TYPES=	overwrite pkgviews

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
# Some configure_args come from Makefile.common
CONFIGURE_ARGS+=	--with-perl=${PERL5:Q}

PERL5_CONFIGURE=	no
PERL5_CONFIGURE_DIRS=	${WRKSRC}/PerlMagick
PERL5_PACKLIST=		auto/Image/Magick/.packlist
BUILD_DIRS=		${PERL5_CONFIGURE_DIRS}

post-configure: perl5-configure

BUILDLINK_API_DEPENDS.ImageMagick+=         ImageMagick>=${DISTVERSION}
.include "../../graphics/ImageMagick/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
