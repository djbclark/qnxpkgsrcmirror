# $NetBSD: Makefile,v 1.28 2007/10/27 22:31:10 adrianp Exp $

DISTNAME=	mantis-1.0.8
CATEGORIES=	devel www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=mantisbt/}

MAINTAINER=	adrianp@NetBSD.org
HOMEPAGE=	http://www.mantisbt.org/
COMMENT=	PHP/MySQL/web based bugtracking system

DEPENDS+=	${APACHE_PKG_PREFIX}-${PHP_PKG_PREFIX}>=4.0.6:../../www/ap-php
DEPENDS+=	${PHP_PKG_PREFIX}-mysql>=4.0.6:../../databases/php-mysql

NO_BUILD=	YES

.include "../../mk/bsd.prefs.mk"

PKG_OPTIONS_VAR=	PKG_OPTIONS.mantis
PKG_SUPPORTED_OPTIONS=	charts

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mcharts)
DEPENDS+=	${PHP_PKG_PREFIX}-jpgraph-[0-9]*:../../graphics/php-jpgraph
.endif

APACHE_USER?=		www
BUILD_DEFS+=		APACHE_USER

PKG_USERS_VARS+=	APACHE_USER
MESSAGE_SUBST+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR:Q}

MANTIS_HOME=		${PREFIX}/share/mantis
EGDIR=			${PREFIX}/share/examples/mantis
CONF_FILES+=		${EGDIR}/mantis.conf ${PKG_SYSCONFDIR}/mantis.conf
CONF_FILES_PERMS+=	${EGDIR}/config_inc.php \
			${MANTIS_HOME}/config_inc.php \
			${APACHE_USER} ${SHAREGRP} 0400
MANTIS_EG=		config_inc.php mantis.conf mantis_offline.php.sample

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	pre-install
SUBST_FILES.conf=	mantis.conf
SUBST_SED.conf=		-e "s|@MANTIS_HOME@|${MANTIS_HOME}|g"
SUBST_MESSAGE.conf=	Fixing configuration files.

post-extract:
	${CP} ${FILESDIR}/mantis.conf ${WRKSRC}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/mantis
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA_DIR} ${MANTIS_HOME}

	${INSTALL_DATA} ${WRKSRC}/doc/CUSTOMIZATION ${PREFIX}/share/doc/mantis
	${INSTALL_DATA} ${WRKSRC}/doc/INSTALL ${PREFIX}/share/doc/mantis
	${MV} ${WRKSRC}/config_inc.php.sample ${WRKSRC}/config_inc.php

. 	for f in ${MANTIS_EG}
		${INSTALL_DATA} ${WRKSRC}/${f} ${EGDIR}
		${RM} ${WRKSRC}/${f}
.	endfor

	cd ${WRKSRC} && ${FIND} . -name .cvsignore -print | ${XARGS} ${RM}
	cd ${WRKSRC} && ${PAX} -rwpppm . ${MANTIS_HOME}

	cd ${MANTIS_HOME} && \
		${FIND} . -type f | ${XARGS} ${CHMOD} ${SHAREMODE}

.include "../../mk/mysql.buildlink3.mk"
.include "../../lang/php/phpversion.mk"
.include "../../mk/apache.mk"
.include "../../mk/bsd.pkg.mk"
