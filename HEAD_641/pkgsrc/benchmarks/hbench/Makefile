# $NetBSD: Makefile,v 1.42 2009/07/08 14:19:46 joerg Exp $

DISTNAME=		hbench-OS-1.0
PKGNAME=		hbench-1.0
PKGREVISION=		6
CATEGORIES=		benchmarks
MASTER_SITES=		http://www.eecs.harvard.edu/vino/perf/hbench/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.eecs.harvard.edu/vino/perf/hbench/
COMMENT=		Suite of portable benchmarks to measure the OS and the hardware

DEPENDS+=		gnuplot>=3.7:../../graphics/gnuplot

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=			${WRKDIR}/hbench-OS
OSVERSION_SPECIFIC=	YES
BUILD_TARGET=		build
USE_TOOLS+=		perl:run
OVERRIDE_GNU_CONFIG_SCRIPTS=	yes

DIST_SUBDIR=		${PKGNAME_NOREV}

GET_ARCH_CMD=		${PKGSRCDIR:Q}/mk/gnu-config/config.guess | ${SED} -e 's/-.*-.*$$//'
GET_OS_CMD=		${PKGSRCDIR:Q}/mk/gnu-config/config.guess | ${SED} -e 's/^.*-.*-//'
PLIST_SUBST+=		PLATFORM=${GET_OS_CMD:sh:Q}-${GET_ARCH_CMD:sh:Q}

.include "../../mk/bsd.prefs.mk"

HB_HOSTNAME!=		${UNAME} -n
HB_SHORTNAME=		${HB_HOSTNAME:C/\..*//}

post-extract:
	${CP} ${FILESDIR}/do-install ${WRKSRC}

SUBST_CLASSES+=		hb
SUBST_STAGE.hb=		pre-configure
SUBST_MESSAGE.hb=	Replacing bin with libexec.
SUBST_FILES.hb=		do-install
SUBST_FILES.hb+=	scripts/*
SUBST_FILES.hb+=	Results/Makefile
SUBST_SED.hb=		-e 's,@PREFIX@,${PREFIX},g'
SUBST_SED.hb+=		-e 's,/bin/hbench,/libexec/hbench,g'

INSTALLATION_DIRS=	bin

do-install:
	${SETENV} ${MAKE_ENV} WRKSRC=${WRKSRC} BINOWN=${BINOWN} \
		REAL_PREFIX=${PREFIX} BINGRP=${BINGRP} \
		PREFIX=${DESTDIR}${PREFIX} ${WRKSRC}/do-install

benchmark:
	@if [ `id -u` != 0 ]; then ${ECHO} "This benchmark must be run as root!" ; exit 1 ; fi
	cd ${WRKSRC};							\
	${MKDIR} conf;							\
	${MKDIR} results;						\
	${SED} -e 's|@pwd@|'`/bin/pwd`'|g' 				\
		-e 's|@hostname@|${HB_SHORTNAME}|g'			\
		-e 's|@wrksrc@|'`/bin/pwd`'|g'				\
		${FILESDIR}/setup.answers | ${MAKE} setup;		\
	${MV} conf/${HB_SHORTNAME}.run conf/foo ;			\
	${SED} -e 's|#PLAINBINDIR=${HBENCHROOT}|PLAINBINDIR='`/bin/pwd`'|' \
		< conf/foo > conf/${HB_SHORTNAME}.run ;			\
	${MAKE} run

results:
	@${MKDIR} /tmp/benches/`domainname`
	-@cd ${WRKSRC} ; \
	tar -cf /tmp/benches/`domainname`/hbench.`uname`-`uname -m`-`uname -r`.`hostname`.tar results conf

.include "../../mk/bsd.pkg.mk"
