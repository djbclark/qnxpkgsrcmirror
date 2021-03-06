# $NetBSD: Makefile,v 1.38 2007/10/05 21:26:26 joerg Exp $
#

DISTNAME=		nethack_source_331_jtp_193
PKGNAME=		falcons-eye-1.9.3
PKGREVISION=		12
CATEGORIES=		games
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=falconseye/}
EXTRACT_SUFX=		.zip

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://falconseye.sourceforge.net/
COMMENT=		Falcon's Eye NetHack

EXTRACT_OPTS_ZIP=	-aq
HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	./sys/unix/setup.sh
DIST_SUBDIR=		${PKGNAME_NOREV}-20050216-2

WRKSRC=			${WRKDIR}
USE_TOOLS+=		bison lex ksh:run
MAKE_ENV+=		YACC=${TOOLS_CMDLINE_YACC:Q}
MAKE_FLAGS+=		GAMEUID=${GAMEOWN}
MAKE_FLAGS+=		GAMEGRP=${GAMEGRP}

REPLACE_KSH+=		src/fe-config

LIBS.SunOS+=		-lm

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Configuring program paths.
SUBST_STAGE.paths=	post-patch
SUBST_FILES.paths=	include/config.h src/fe-config.in
SUBST_SED.paths=	-e "s,XXXPREFIXXXX,${PREFIX},g"
SUBST_SED.paths+=	-e "s,@GZIP_PROGRAM@,${GZIP_CMD:M*gzip},g"

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "NetBSD"
SUBST_CLASSES+=		unixconf
SUBST_MESSAGE.unixconf=	Configuring to use NetBSD presets.
SUBST_STAGE.unixconf=	post-patch
SUBST_FILES.unixconf=	include/unixconf.h
SUBST_SED.unixconf=	-e 's,^\/\* \#define BSD 1 \*\/,\#define BSD 1,'
SUBST_SED.unixconf+=	-e 's,^\#define SYSV,\/\* \#define SYSV \*\/,'
SUBST_SED.unixconf+=	-e 's,^\#define LINUX,\/\* \#define LINUX \*\/,'
.endif

EGDIR=			${PREFIX}/share/examples/falcons-eye
SHAREDIR=		${PREFIX}/share/falcons-eye-dir

CONF_FILES_PERMS+=	/dev/null ${SHAREDIR}/logfile ${ROOT_USER} games 664
CONF_FILES_PERMS+=	/dev/null ${SHAREDIR}/record ${ROOT_USER} games 664
CONF_FILES_PERMS+=	${EGDIR}/jtp_intr.txt ${SHAREDIR}/config/jtp_intr.txt \
	${ROOT_USER} games 664
CONF_FILES_PERMS+=	${EGDIR}/jtp_keys.txt ${SHAREDIR}/config/jtp_keys.txt \
	${ROOT_USER} games 664
CONF_FILES_PERMS+=	${EGDIR}/jtp_lit1.dat ${SHAREDIR}/config/jtp_lit1.dat \
	${ROOT_USER} games 664
CONF_FILES_PERMS+=	${EGDIR}/jtp_opts.txt ${SHAREDIR}/config/jtp_opts.txt \
	${ROOT_USER} games 664
CONF_FILES_PERMS+=	${EGDIR}/jtp_snds.txt ${SHAREDIR}/config/jtp_snds.txt \
	${ROOT_USER} games 664

pre-configure:
	${CP} ${WRKSRC}/src/fe-config.in ${WRKSRC}/src/fe-config
	${CHMOD} 755 ${WRKSRC}/sys/unix/setup.sh

post-build:
	${CP} ${WRKSRC}/src/nethack ${WRKSRC}/src/falcons-eye

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/fe-config ${PREFIX}/bin

.include "../../devel/SDL/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
