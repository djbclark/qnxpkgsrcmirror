# $NetBSD: Makefile,v 1.30 2006/09/09 02:42:00 obache Exp $
#

DISTNAME=		angband-283
PKGNAME=		angband-tty-2.8.3
PKGREVISION=		3
CATEGORIES=		games
MASTER_SITES=		ftp://export.andrew.cmu.edu/angband/Source/ \
			ftp://ftp.greyhelm.com/pub/Games/Angband/Angband-2.7.x/Source/
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${SPOILERFILE}

MAINTAINER=		root@garbled.net
HOMEPAGE=		http://www.phial.com/angband/
COMMENT=		Tolkien based variant of Moria for tty/console displays

CONFLICTS=		angband-x11-[0-9]*

WRKSRC=			${WRKDIR}/${DISTNAME}/src
EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}
MAKE_FILE=		Makefile.std
BUILD_TARGET=		angband

SPOILERFILE=		angband-spoilers.tar.gz

.if ${MACHINE_ARCH} == "arm" || ${MACHINE_ARCH} == "arm32"
GCC_REQD+=		2.95.3
.endif

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL} -d -o bin -g games -m 0775 ${PREFIX}/share/angband
	cd ${WRKDIR}/${DISTNAME}/lib && ${PAX} -wr * ${PREFIX}/share/angband
	cd ${PREFIX}/share/angband/help && \
		${PAX} -O -zrf ${DISTDIR}/${SPOILERFILE}
	${CHOWN} -R ${GAMEOWN}:${GAMEGRP} ${PREFIX}/share/angband
	cd ${PREFIX}/share/angband && ${CHMOD} ${GAMEDATAMODE} */*
	cd ${PREFIX}/share/angband && ${CHMOD} ${GAMEDIRMODE} apex bone data edit file help info save user xtra
	${INSTALL_GAME} ${WRKSRC}/angband ${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
