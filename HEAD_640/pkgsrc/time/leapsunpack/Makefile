# $NetBSD: Makefile,v 1.1.1.1 2008/07/30 13:59:25 schmonz Exp $
#

DISTNAME=		leapsunpack-0.05
CATEGORIES=		time
MASTER_SITES=		${HOMEPAGE}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://su.bze.ro/software/
COMMENT=		Creates libtai leapsecs.dat from compressed table

DEPENDS+=		libtai-[0-9]*:../../devel/libtai

DJB_RESTRICTED=		no

SUBST_CLASSES+=		files
SUBST_STAGE.files=	do-configure
SUBST_FILES.files=	leapsinstall.sh
SUBST_SED.files=	-e "s|@PKG_SYSCONFDIR@|${PKG_SYSCONFDIR}|g"
SUBST_MESSAGE.files=	Fixing configuration files.

INSTALLATION_DIRS=	bin share/doc/${PKGBASE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/leapsunpack ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/leapsinstall ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${PREFIX}/share/doc/${PKGBASE}

.include "../../mk/djbware.mk"
.include "../../mk/bsd.pkg.mk"
