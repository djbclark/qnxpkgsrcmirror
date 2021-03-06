# $NetBSD: Makefile,v 1.58 2008/05/26 02:13:21 joerg Exp $

DISTNAME=	dspam-3.8.0
CATEGORIES=	mail
MASTER_SITES=	http://dspam.nuclearelephant.com/sources/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://dspam.nuclearelephant.com/
COMMENT=	Extremely scalable, statistical-hybrid anti-spam filter

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes

USE_TOOLS+=		pax perl:run pkg-config
REPLACE_PERL=		src/tools/dspam_train.in
REPLACE_PERL+=		src/tools/dspam_logrotate
REPLACE_PERL+=		webui/cgi-bin/*.cgi webui/cgi-bin/configure.pl.in

PKGCONFIG_OVERRIDE+=	src/dspam.pc.in

SUBST_CLASSES+=		cgi
SUBST_STAGE.cgi=	post-patch
SUBST_FILES.cgi=	webui/cgi-bin/templates/nav_performance.html
SUBST_FILES.cgi+=	webui/cgi-bin/configure.pl.in
SUBST_FILES.cgi+=	webui/cgi-bin/dspam.cgi webui/cgi-bin/admin.cgi
SUBST_FILES.cgi+=	webui/cgi-bin/graph.cgi webui/cgi-bin/admingraph.cgi
SUBST_SED.cgi=		-e "s|auxw|${DSPAM_PSFLAGS}|g"
SUBST_SED.cgi+=		-e "s|yourdomain.com|${DSPAM_DOMAIN}|g"
SUBST_SED.cgi+=		-e "s|./admins|${PKG_SYSCONFDIR}/cgi-admins|"
SUBST_SED.cgi+=		-e "s|configure.pl|${PKG_SYSCONFDIR}/configure.pl|"
SUBST_SED.cgi+=		-e "s|\"\\/\";|\"${DSPAM_WWWHOME}\";|"
SUBST_SED.cgi+=		-e "s|\$$FILE = \"./default.prefs\";|\$$FILE = \"${PKG_SYSCONFDIR}/cgi-default.prefs\";|"
SUBST_MESSAGE.cgi=	Fixing paths and default options.

BUILD_DEFS+=		DSPAM_HOME VARBASE
BUILD_DEFS+=		DSPAM_SIGNATURE_LIFE
BUILD_DEFS+=		DSPAM_BINMODE
BUILD_DEFS+=		DSPAM_LOGDIR
BUILD_DEFS+=		DSPAM_LOGFILE
BUILD_DEFS+=		DSPAM_DOMAIN
BUILD_DEFS+=		DSPAM_WWWHOME
BUILD_DEFS+=		DSPAM_PIDDIR

.include "../../mk/bsd.prefs.mk"

DSPAM_HOME?=		${VARBASE}/dspam
DSPAM_SIGNATURE_LIFE?=	14

DSPAM_BINMODE?=		4511
DSPAM_USER?=		dspam
DSPAM_GROUP?=		dspam
DSPAM_LOGDIR?=		${DSPAM_HOME}/log
DSPAM_LOGFILE?=		${DSPAM_LOGDIR}/dspam.log
DSPAM_DOMAIN?=		yourdomain.com
DSPAM_WWWHOME?=		/dspam
DSPAM_PIDDIR?=		${VARBASE}/run/dspam
DSPAM_WWWUSER?=		${APACHE_USER}
DSPAM_WWWGROUP?=	${APACHE_GROUP}

PKG_GROUPS_VARS+=	DSPAM_GROUP DSPAM_WWWGROUP
PKG_USERS_VARS+=	DSPAM_USER DSPAM_WWWUSER

CONFIGURE_ARGS+=	--with-signature-life=${DSPAM_SIGNATURE_LIFE:Q}
CONFIGURE_ARGS+=	--with-dspam-home=${DSPAM_HOME:Q}		\
			--with-dspam-home-owner=${DSPAM_USER:Q}		\
			--with-dspam-home-group=${DSPAM_GROUP:Q}	\
			--with-dspam-owner=${DSPAM_USER:Q}		\
			--with-dspam-group=${DSPAM_GROUP:Q}		\
			--with-dspam-mode=${DSPAM_BINMODE:Q}		\
			--with-logdir=${DSPAM_LOGDIR:Q}			\
			--sysconfdir=${PKG_SYSCONFDIR:Q}

.include "options.mk"
.include "../../mk/pthread.buildlink3.mk"

DOCDIR=		${PREFIX}/share/doc/dspam
DATADIR=	${PREFIX}/share/dspam
EGDIR=		${PREFIX}/share/examples/dspam

RCD_SCRIPTS=		dspam

PKG_SYSCONFSUBDIR=	dspam

CONF_FILES_PERMS=	${EGDIR}/dspam.conf ${PKG_SYSCONFDIR}/dspam.conf \
			${DSPAM_USER} ${DSPAM_WWWGROUP} 0640
CONF_FILES_PERMS+=	${EGDIR}/cgi-admins ${PKG_SYSCONFDIR}/cgi-admins \
			${DSPAM_WWWUSER} ${DSPAM_WWWGROUP} 0640
CONF_FILES_PERMS+=	${EGDIR}/cgi-default.prefs \
			${PKG_SYSCONFDIR}/cgi-default.prefs \
			${DSPAM_WWWUSER} ${DSPAM_WWWGROUP} 0640
CONF_FILES_PERMS+=	${EGDIR}/configure.pl ${PKG_SYSCONFDIR}/configure.pl \
			${DSPAM_WWWUSER} ${DSPAM_WWWGROUP} 0640

PKG_GROUPS=		${DSPAM_GROUP}
PKG_USERS=		${DSPAM_USER}:${DSPAM_GROUP}
SPECIAL_PERMS=		${PREFIX}/bin/dspam ${DSPAM_USER} ${DSPAM_GROUP} \
			${DSPAM_BINMODE}
OWN_DIRS_PERMS=		${DSPAM_HOME} ${DSPAM_USER} ${DSPAM_WWWGROUP} 0775
OWN_DIRS_PERMS+=	${DSPAM_LOGDIR} ${DSPAM_USER} ${DSPAM_GROUP} 0775
OWN_DIRS_PERMS+=	${DSPAM_PIDDIR} ${DSPAM_USER} ${DSPAM_GROUP} 0770

FILES_SUBST+=		DSPAM_USER=${DSPAM_USER:Q}
FILES_SUBST+=		DSPAM_GROUP=${DSPAM_GROUP:Q}
FILES_SUBST+=		DSPAM_PIDDIR=${DSPAM_PIDDIR:Q}

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	pre-install
SUBST_FILES.conf=	src/dspam.conf.in
SUBST_SED.conf=		-e "s|@dspam_home@|${DSPAM_HOME}|g"
SUBST_SED.conf+=	-e "s|@delivery_agent@|${DSPAM_DELIVERY_AGENT_BIN}|g"
SUBST_SED.conf+=	-e "s|@PREFIX@|${PREFIX}|g"
SUBST_SED.conf+=	-e "s|@VARBASE@|${VARBASE}|g"
SUBST_SED.conf+=	-e "s|@DSPAM_PIDDIR@|${DSPAM_PIDDIR}|g"
SUBST_MESSAGE.conf=	Fixing configuration file.

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/RELEASE.NOTES ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/UPGRADING ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${DOCDIR}
	${INSTALL_DATA_DIR} ${DATADIR}
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA} ${WRKSRC}/src/dspam.conf.in ${EGDIR}/dspam.conf
	${INSTALL_DATA} ${WRKSRC}/webui/cgi-bin/admins ${EGDIR}/cgi-admins
	${INSTALL_DATA} ${WRKSRC}/webui/cgi-bin/default.prefs \
		${EGDIR}/cgi-default.prefs
	${INSTALL_DATA} ${WRKSRC}/webui/cgi-bin/configure.pl \
		${EGDIR}/configure.pl

.for d in txt webui/cgi-bin webui/htdocs
	${INSTALL_DATA_DIR} ${DATADIR}/${d}
	cd ${WRKSRC}/${d} && pax -rwppm '-s|.*/Makefile.*$$||'	\
		'-s|./admins.*$$||' '-s|./default.prefs.*$$||'		\
		'-s|./configure.pl.*$$||' . ${DATADIR}/${d}
.endfor

.for drv in mysql pgsql
.  if !empty(DSPAM_STORAGE_DRIVER:M${drv})
	${INSTALL_DATA_DIR} ${DATADIR}/${drv}
	cd ${WRKSRC}/src/tools.${drv}_drv && \
		pax -rwppm ./*.sql ${DATADIR}/${drv}
.  endif
.endfor

.if !empty(DSPAM_STORAGE_DRIVER:Msqlite*)
	${INSTALL_DATA_DIR} ${DATADIR}/sqlite
	 cd ${WRKSRC}/src/tools.sqlite_drv && \
	 	pax -rwppm '-s|.*/Makefile.*$$||' . ${DATADIR}/sqlite
.endif

	${CHMOD} ${SHAREMODE} ${DATADIR}/webui/cgi-bin/*.txt
	${CHMOD} ${SHAREMODE} ${DATADIR}/webui/cgi-bin/templates/*.html
	${CHMOD} ${SHAREMODE} ${DATADIR}/webui/htdocs/*.css
	${CHMOD} ${SHAREMODE} ${DATADIR}/webui/htdocs/*.gif

.include "../../mk/bsd.pkg.mk"
