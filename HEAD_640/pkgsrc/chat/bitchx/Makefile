# $NetBSD: Makefile,v 1.45 2008/07/13 16:07:13 dholland Exp $

DISTNAME=	ircii-pana-1.1-final
PKGNAME=	bitchx-1.1
PKGREVISION=	3
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=bitchx/}

MAINTAINER=	jmcneill@NetBSD.org
HOMEPAGE=	http://www.bitchx.org/
COMMENT=	IRC client based on ircII

# This package is not even remotely 64-bit clean
NOT_FOR_PLATFORM=	*-*-alpha *-*-sparc64 *-*-x86_64

WRKSRC=			${WRKDIR}/BitchX
GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--with-ssl

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Darwin"
CFLAGS+=	-DBIND_8_COMPAT
.endif

SUBST_CLASSES+=		manpage
SUBST_STAGE.manpage=	post-patch
SUBST_FILES.manpage+=	doc/BitchX.1
SUBST_SED.manpage+=	-e 's,@PREFIX@,${PREFIX},g'

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/ncurses/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
