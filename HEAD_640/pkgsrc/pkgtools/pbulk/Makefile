# $NetBSD: Makefile,v 1.50 2009/01/31 23:25:37 joerg Exp $

DISTNAME=	pbulk-0.37
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	joerg@NetBSD.org
HOMEPAGE=	ftp://ftp.NetBSD.org/pub/NetBSD/packages/pkgsrc/doc/pkgsrc.html
COMMENT=	Modular bulk build framework

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/pbulk
EXTRACT_ONLY=	# empty
NO_CHECKSUM=	YES

MAKE_JOBS_SAFE=	no

USE_FEATURES=	nbcompat
USE_TOOLS+=	awk:run bzip2:run digest:run gzip:run ident:run make:run \
		mail:run sed:run tar:run groff nroff
DEPENDS+=	rsync-[0-9]*:../../net/rsync

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "NetBSD" && ${MAKE} == "/usr/bin/make"
TARGET_MAKE=	${MAKE}
.else
TARGET_MAKE=	$${prefix}/bin/bmake
.endif

NEATO=		${PREFIX}/bin/neato

SUBST_CLASSES+=		tools
SUBST_STAGE.tools=	post-patch
SUBST_MESSAGE.tools=	Fixing references to tools
SUBST_FILES.tools=	pbulk.conf scripts/build scripts/build-client-start \
	scripts/bulkbuild scripts/bulkbuild-rebuild scripts/bulkbuild-restart \
	scripts/client-clean \
	scripts/pkg-build scripts/pkg-up-to-date scripts/pre-build \
	scripts/report scripts/scan scripts/scan-client-start scripts/upload \
	scripts/compute-packages.awk scripts/create-broken-graph.awk \
	scripts/create-report-html.awk scripts/create-report-txt.awk \
	scripts/create-report.awk
SUBST_VARS.tools=	AWK BZIP2 CHOWN DIGEST GZIP_CMD IDENT MAIL_CMD NEATO \
			PBULK_CONFIG PBULK_CONFIG_VERSION PKG_ADD_CMD \
			PKG_DELETE_CMD PKG_INFO_CMD PREFIX SED SH TAR \
			TARGET_MAKE

CONF_FILES+=	share/examples/pbulk/pbulk.conf ${PKG_SYSCONFDIR}/pbulk.conf

PBULK_CONFIG=		${PKG_SYSCONFDIR}/pbulk.conf
PBULK_CONFIG_VERSION=	0.34

INSTALLATION_DIRS=	bin libexec/pbulk \
			${PKGMANDIR}/cat1 ${PKGMANDIR}/man1 \
			share/examples/pbulk
USE_BSD_MAKEFILE=	yes

.include "../../mk/bsd.prefs.mk"

do-extract:
	${CP} -r ${FILESDIR}/pbulk ${WRKDIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/pbulk.conf ${DESTDIR}${PREFIX}/share/examples/pbulk/pbulk.conf

.if ${OPSYS} == "SunOS"
LDADD+=		-lsocket -lresolv
MAKE_ENV+=	LDADD=${LDADD:Q}
.endif

.if ${OPSYS} == "Linux"
CPPFLAGS+=	-D_GNU_SOURCE
.endif

.include "../../mk/bsd.pkg.mk"
