# $NetBSD: Makefile,v 1.21 2008/06/22 12:49:53 gdt Exp $

DISTNAME=	pkg_rolling-replace-0.16
PKGREVISION=	2
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ngoffee@bbn.com
COMMENT=	Replace/upgrade packages in-place

DEPENDS+=	pkg_chk>=1.76:../../pkgtools/pkg_chk
DEPENDS+=	pkg_tarup>=1.6.6:../../pkgtools/pkg_tarup

PKG_INSTALLATION_TYPES= overwrite pkgviews

USE_TOOLS+=	patch

WRKSRC=		${WRKDIR}
NO_CHECKSUM=	yes
NO_BUILD=	yes
USE_LANGUAGES=	# none

INSTALLATION_DIRS=	sbin ${PKGMANDIR}/man8

PKG_CHK?=		${PREFIX}/sbin/pkg_chk

SUBST_CLASSES+=		tools
SUBST_STAGE.tools=	pre-configure
SUBST_MESSAGE.tools=	Substituting tool locations.
SUBST_FILES.tools=	pkg_rolling-replace.sh
SUBST_VARS.tools=	PKG_INFO_CMD MAKE PKG_CHK AWK

SUBST_CLASSES+=		prefix
SUBST_STAGE.prefix=	pre-configure
SUBST_MESSAGE.prefix=	Substituting PREFIX location.
SUBST_FILES.prefix=	pkg_rolling-replace.8
SUBST_VARS.prefix=	PREFIX

SUBST_CLASSES+=		makeconf
SUBST_STAGE.makeconf=	pre-configure
SUBST_MESSAGE.makeconf=	Recording default path of mk.conf.
SUBST_FILES.makeconf=	pkg_rolling-replace.sh pkg_rolling-replace.8
SUBST_SED.makeconf=	-e 's,@MAKECONF@,${MAKE:T:Mbmake:S/bmake/${PREFIX}/g}/etc/mk.conf,g'

REPLACE_SH+=		pkg_rolling-replace.sh

.include "../../mk/bsd.prefs.mk"

do-extract:
	cp ${FILESDIR}/pkg_rolling-replace.sh ${WRKSRC}
	cp ${FILESDIR}/pkg_rolling-replace.8 ${WRKSRC}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pkg_rolling-replace.sh \
		${PREFIX}/sbin/pkg_rolling-replace
	${INSTALL_MAN} ${WRKSRC}/pkg_rolling-replace.8 \
		${PREFIX}/${PKGMANDIR}/man8/pkg_rolling-replace.8

.include "../../mk/bsd.pkg.mk"
