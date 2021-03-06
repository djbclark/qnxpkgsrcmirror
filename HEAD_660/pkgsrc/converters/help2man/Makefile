# $NetBSD: Makefile,v 1.19 2013/07/03 08:11:36 wiz Exp $

DISTNAME=	help2man-1.43.3
CATEGORIES=	converters
MASTER_SITES=	${MASTER_SITE_GNU:=help2man/}

MAINTAINER=	arved@arved.at
HOMEPAGE=	http://www.gnu.org/software/help2man/
COMMENT=	Generate simple manual pages from program output
LICENSE=	gnu-gpl-v3

DEPENDS+=		p5-gettext>=1.01:../../devel/p5-gettext

WRKSRC=			${WRKDIR}/${PKGNAME_NOREV}
GNU_CONFIGURE=		yes
USE_TOOLS+=		perl:run msgfmt gmake

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Fixing install lib paths.
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	Makefile.in
SUBST_SED.paths=	-e 's,(libdir)/help2man,(libdir),g'

INFO_FILES=		yes

.include "../../mk/bsd.prefs.mk"

# XXX: will undoubtedly include more versions
.if ${OPSYS} == "Darwin" && !empty(OS_VERSION:M9.*)
SUBST_CLASSES+=		shlibarg
SUBST_STAGE.shlibarg=	pre-configure
SUBST_FILES.shlibarg=	Makefile.in
SUBST_SED.shlibarg=	-e 's, -shared , -dynamiclib ,g'
.endif

PLIST_VARS+=		nls

# QNX doesn't have langinfo, therefore our perl gets built without that module.
.if (${OPSYS} == "Darwin" && ${OS_VERSION:M8.*} != "") || ${OPSYS} == "QNX"
CONFIGURE_ARGS+=	--disable-nls
.else
.  if ${OPSYS} == "Darwin"
_STRIPFLAG_INSTALL=
.  endif
USE_PKGLOCALEDIR=	yes
PLIST.nls=		yes
.endif

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
