# $NetBSD: Makefile,v 1.72 2013/05/06 18:18:31 drochner Exp $

DISTNAME=	gpgme-1.4.1
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.gnupg.org/gcrypt/gpgme/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnupg.org/related_software/gpgme/
COMMENT=	GnuPG Made Easy
LICENSE=	gnu-gpl-v2

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
PTHREAD_OPTS+=		require
INFO_FILES=		yes

SUBST_CLASSES+=		pthread
SUBST_FILES.pthread=	src/gpgme-config.in
SUBST_SED.pthread+=	-e 's,@PTHREAD_LIBS@,${PTHREAD_LDFLAGS} ${PTHREAD_LIBS},g'
SUBST_SED.pthread+=	-e 's,@PTHREAD_CFLAGS@,${PTHREAD_CFLAGS},g'
SUBST_STAGE.pthread=	post-patch

LIBS.SunOS+=		-lnsl -lsocket

# getenv_r is not detected correctly. It will be found
# in either base system or librfuncs
CONFIGURE_ENV+=		ac_cv_func_getenv_r=yes

TEST_TARGET=		check

.include "../../mk/pthread.buildlink3.mk"

.if ${PTHREAD_TYPE} == "native"
CONFIGURE_ARGS+=	--without-pth --without-pth-test
.endif

.include "options.mk"

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "HPUX"
CONFIGURE_ENV+=		ac_cv_lib_pthread_pthread_create=yes
.endif

# TLS is unsupported on NetBSD<=5, but causes crashes on -current too
#.if !empty(MACHINE_PLATFORM:MNetBSD-[0-5].*-*)
.if !empty(MACHINE_PLATFORM:MNetBSD-*-*)
CONFIGURE_ENV+=		gpgme_cv_tls_works=no
.endif

# we want the getenv_r() semantics of NetBSD-current
BUILDLINK_API_DEPENDS.librfuncs+=	librfuncs>=1.0.7nb1
.include "../../devel/librfuncs/buildlink3.mk"
BUILDLINK_API_DEPENDS.libassuan+=	libassuan>=2.0.2
.include "../../security/libassuan2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libgpg-error+=	libgpg-error>=1.4
.include "../../security/libgpg-error/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
_UNWRAP_FILES=
