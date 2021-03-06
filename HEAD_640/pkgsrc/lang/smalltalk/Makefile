# $NetBSD: Makefile,v 1.43 2008/09/06 17:54:15 ahoka Exp $

DISTNAME=	smalltalk-2.3.5
PKGREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GNU:=smalltalk/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.smalltalk.org/versions/GNUSmalltalk.html
COMMENT=	GNU Smalltalk: A smalltalk-80 implementation

ONLY_FOR_PLATFORM=	*-*-i386 *-*-sparc *-*-powerpc

USE_TOOLS+=		gawk gmake makeinfo pkg-config
USE_GNU_READLINE=	YES
USE_LIBTOOL=		YES
GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--with-gdbm=${BUILDLINK_PREFIX.gdbm}/lib
CONFIGURE_ARGS+=	--with-gmp=${BUILDLINK_PREFIX.gmp}/lib
CONFIGURE_ARGS+=	--with-lispdir=${PREFIX}/share/emacs/site-lisp
CONFIGURE_ARGS+=	--with-readline=${BUILDLINK_PREFIX.readline}/lib
CONFIGURE_ARGS+=	--with-tcl=${BUILDLINK_PREFIX.tcl}/lib
CONFIGURE_ARGS+=	--with-tk=${BUILDLINK_PREFIX.tk}/lib
CONFIGURE_ARGS+=	--without-emacs
#CONFIGURE_ARGS+=	--without-glib --without-gtk
#CONFIGURE_ENV+=		CFLAGS="-O2 -fsigned-char"

SUBST_CLASSES+=		sed
SUBST_STAGE.sed=	pre-configure
SUBST_MESSAGE.sed=	Replacing sed interpreter.
SUBST_FILES.sed=	examples/*.sed
SUBST_SED.sed=		-e "s|/bin/sed|${SED}|"

REPLACE_PERL+=		vfs/mailfs vfs/deb

IGNORE_LIBTOOLIZE=	lib/smalltalk/libc.la
INFO_FILES=		YES
TEST_TARGET=		check

post-extract:
	sed -e "s/long double/double/g" -e "s/1.0L/1.0/g" -e  "s/0.0L/0.0/g" \
	-e "s/LDBL_EPSILON/DBL_EPSILON/g" -e "s/truncl/trunc/g" \
	${WRKSRC:Q}/lib-src/truncl.c > ${WRKSRC:Q}/lib-src/trunc.c
	sed -e "s/long double/float/g" -e "s/1.0L/1.0F/g" -e  "s/0.0L/0.0F/g" \
	-e "s/LDBL_EPSILON/FLT_EPSILON/g" -e "s/truncl/truncf/g" \
	${WRKSRC}/lib-src/truncl.c > ${WRKSRC}/lib-src/truncf.c

.include "../../converters/libiconv/buildlink3.mk"
.include "../../databases/gdbm/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/tk/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
