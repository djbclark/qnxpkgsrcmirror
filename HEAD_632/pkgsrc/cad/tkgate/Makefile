# $NetBSD: Makefile,v 1.23 2007/01/20 01:47:00 rillig Exp $
#

DISTNAME=	tkgate-1.6i
PKGREVISION=	4
CATEGORIES=	cad
MASTER_SITES=	ftp://gadoid.ices.cmu.edu/pub/tkgate/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.tkgate.org/
COMMENT=	Tcl/Tk based digital circuit editor and simulator

BUILD_DEPENDS+=		bison>=1.35:../../devel/bison
BUILD_DEPENDS+=		libiconv-[0-9]*:../../converters/libiconv

USE_IMAKE=		yes
USE_TOOLS+=		gm4

TKGATE_SITENAME=	Earth

CONFIGURE_ENV+=		BUILDLINK_LDFLAGS=${BUILDLINK_LDFLAGS:Q}
CONFIGURE_ENV+=		LOCALBASE=${LOCALBASE}

SUBST_CLASSES+=		tkgate
SUBST_MESSAGE.tkgate=	Fixing paths in configuration files.
SUBST_STAGE.tkgate=	pre-configure
SUBST_FILES.tkgate=	config.h
SUBST_SED.tkgate=	-e 's|@LOCALBASE@|${LOCALBASE}|g'
SUBST_SED.tkgate+=	-e 's|@PREFIX@|${PREFIX}|g'
SUBST_SED.tkgate+=	-e 's|@X11BASE@|${X11BASE}|g'

do-configure:
	${ECHO} "${TKGATE_SITENAME}" > ${WRKSRC}/sitename.txt
	( cd ${WRKSRC} && ${CONFIGURE_ENV} ./configure )

.include "../../x11/tk/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
