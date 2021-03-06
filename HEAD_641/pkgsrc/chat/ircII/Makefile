# $NetBSD: Makefile,v 1.52 2009/02/18 08:18:53 mrg Exp $

DISTNAME=		ircii-${VERS}
PKGNAME=		ircII-${VERS}
CATEGORIES=		chat
MASTER_SITES=		ftp://ircii.warped.com/pub/ircII/ \
			http://ircii.warped.com/pub/ircII/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.eterna.com.au/ircii/
COMMENT=		The 'Internet Relay Chat' and 'Internet Citizens Band' Client

CONFLICTS=		blackened-[0-9]*

PKG_DESTDIR_SUPPORT=	user-destdir
PKG_INSTALLATION_TYPES=	overwrite pkgviews

VERS=			20081115
PLIST_SUBST+=	VERS=${VERS:Q}

.include "../../mk/bsd.prefs.mk"

WRKSRC=			${WRKDIR}/ircii-${VERS}
GNU_CONFIGURE=		yes
.if defined(DEFAULT_IRC_SERVER)
CONFIGURE_ARGS+=	--with-default-server=${DEFAULT_IRC_SERVER:Q}
.endif
USE_TOOLS+=		chmod	# see post-extract

# This pkg auto-detects IPv6.
BUILD_DEFS+=		IPV6_READY

.include "options.mk"

# Allow customizations from ${MAKECONF}
CONFIGURE_ARGS+=	${IRCII_CONFIGURE_ARGS}
CONFIGURE_ENV+=		${IRCII_CONFIGURE_ENV}

LDFLAGS.SunOS+=	-lsocket -lnsl

.if ${OPSYS} == "Interix"
CONFIGURE_ARGS+=	--with-non-blocking=none
.endif

# Optionally install compressed help files if MANZ is defined.
.if defined(MANZ)
PLIST_SUBST+=		GZSUFFIX=".gz"
DOC_COMPRESS_ARGS=	-z ${PREFIX}
.else
PLIST_SUBST+=		GZSUFFIX=
DOC_COMPRESS_ARGS=	${PREFIX}
.endif

post-extract:
	chmod -R g-w ${WRKSRC}/help/.

post-install:
	${AWK} '/^share\/irc\/help\// { sub("\\$${GZSUFFIX}$$", ""); print }' \
		${PLIST_SRC} |						\
	${SETENV} PATH=${PATH:Q} PKG_VERBOSE=${PKG_VERBOSE:Q}		\
	${SH} ${PKGSRCDIR}/mk/plist/doc-compress ${DOC_COMPRESS_ARGS}

.include "../../mk/bsd.pkg.mk"
