# $NetBSD: Makefile,v 1.7 2006/06/15 13:31:28 wiz Exp $
#

DISTNAME=		bos_1_1
PKGNAME=		bos-1.1
PKGREVISION=		2
CATEGORIES=		games
MASTER_SITES=		http://bos.seul.org/files/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://bos.seul.org/
COMMENT=		Invasion - Battle of Survival (real-time strategy game)

DEPENDS+=		stratagus>=2.1:../../games/stratagus

INSTALLATION_DIRS=	bin

do-build:
	${SED} -e "s|@LOCALBASE@|${LOCALBASE}|" \
		-e "s|@PREFIX@|${PREFIX}|" ${FILESDIR}/bos > \
		${WRKSRC}/bos

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bos ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/bos
	cd ${WRKSRC} && ${PAX} -pe -rw data ${PREFIX}/share/bos
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/bos
	${INSTALL_DATA} ${WRKSRC}/README.txt ${PREFIX}/share/doc/bos

.include "../../mk/bsd.pkg.mk"
