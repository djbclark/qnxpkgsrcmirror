# $NetBSD: Makefile,v 1.11 2006/09/03 00:56:30 wiz Exp $
#

DISTNAME=	album_themes
PKGNAME=	album_themes-20050507
PKGREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://marginalhacks.com/bin/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://marginalhacks.com/Hacks/album/Download.html
COMMENT=	Themes for the album generator

DEPENDS+=	album-[0-9]*:../../www/album

NO_CONFIGURE=	YES
NO_BUILD=	YES
EXTRACT_ONLY=	# none

USE_TOOLS+=	tar

A_DATADIR=	share/Album
A_HTTPDIR=	share/httpd/htdocs/Album

PLIST_SRC=		${WRKDIR}/PLIST

MESSAGE_SUBST= A_DATADIR=${A_DATADIR} A_HTTPDIR=${A_HTTPDIR}

# dynamic PLIST generation
pre-install:
	@${RM} -f ${PLIST_SRC}
	@${TAR} -tvzf ${DISTDIR}/${DISTFILES} | \
	 ${SED} -n -e 's,^-.* ,${A_DATADIR}/,p' >> ${PLIST_SRC}
	@${TAR} -tvzf ${DISTDIR}/${DISTFILES} | \
	 ${SED} -n -e 's,^d.* ,@dirrm ${A_DATADIR}/,p' | ${SORT} -r >> ${PLIST_SRC}
	@${ECHO} "@dirrm ${A_DATADIR}/Themes" >> ${PLIST_SRC}
	@${ECHO} "@dirrm ${A_DATADIR}" >> ${PLIST_SRC}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${A_DATADIR}
	cd ${PREFIX}/${A_DATADIR}; \
	${TAR} -xzf ${DISTDIR}/${DISTFILES}

.include "../../mk/bsd.pkg.mk"
