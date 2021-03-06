# $NetBSD: Makefile,v 1.11 2009/01/25 04:46:06 taca Exp $
#

DISTNAME=	typolight-${TL_VERSION}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=typolight/}

MAINTAINER=	taca@NetBSD.org
HOMEPAGE=	http://www.typolight.org/
COMMENT=	Powerful web content management system (CMS)

DEPENDS+=	${PHP_PKG_PREFIX}-gd>=5.1.0:../../graphics/php-gd
DEPENDS+=	${PHP_PKG_PREFIX}-mbstring>=5.1.0:../../misc/php-mbstring
DEPENDS+=	${PHP_PKG_PREFIX}-mysql>=5.1.0:../../databases/php-mysql
DEPENDS+=	${PHP_PKG_PREFIX}-mcrypt>=5.1.0:../../security/php-mcrypt
DEPENDS+=	${PHP_PKG_PREFIX}-soap>=5.1.0:../../net/php5-soap

PKG_DESTDIR_SUPPORT=	destdir

PHP_VERSIONS_ACCEPTED=	5

USE_TOOLS=	pax
NO_BUILD=	yes

EG_DATA=	${WWW_EG_FILES} system/config tl_files
EG_FILES=	system/config/config.php system/config/countries.php \
		system/config/dcaconfig.php system/config/languages.php \
		system/config/tcpdf.php system/config/timezones.php \
		system/config/tinyFlash.php system/config/tinyMCE.php \
		system/config/tinyNews.php
TMPL_FILES=	tl_files/tiny_templates/index.html \
		tl_files/xBrowser_style_sheets/xBasic.css \
		tl_files/xBrowser_style_sheets/xElements.css \
		tl_files/xBrowser_style_sheets/xForm.css \
		tl_files/xBrowser_style_sheets/xNavigation.css
WWW_EG_FILES=	basic.css print.css robots.txt

CONF_FILES_PERMS+=	${TL_EGDIR}/system/config/localconfig.php \
			${TL_WEBDIR}/system/config/localconfig.php \
			${APACHE_USER} ${APACHE_GROUP} 0600

CONF_FILES+=		${TL_EGDIR}/typolight.conf \
			${PKG_SYSCONFDIR}/typolight.conf

.for f in ${EG_FILES}
CONF_FILES+=		${TL_EGDIR}/${f} ${TL_WEBDIR}/${f}
.endfor

.for f in ${TMPL_FILES}
REQD_FILES+=		${TL_EGDIR}/${f} ${TL_WEBDIR}/${f}
.endfor

.for f in ${WWW_EG_FILES}
CONF_FILES_PERMS+=	${TL_EGDIR}/${f} ${TL_WEBDIR}/${f} \
			${APACHE_USER} ${APACHE_GROUP} 0644
.endfor

SUBST_CLASSES+=		conf
SUBST_FILES.conf+=	${WRKDIR}/typolight.conf
SUBST_SED.conf+=        -e 's|@PREFIX@|${PREFIX:Q}|g'
SUBST_SED.conf+=        -e 's|@TL_WEBDIR@|${TL_WEBDIR:Q}|g'
SUBST_STAGE.conf=	post-configure

WWW_FILES=	._htaccess CHANGELOG.txt INSTALL.txt LICENSE.txt \
		cron.php flash.php index.php \
		plugins templates typolight
WWW_SYSFILES=	config/.htaccess constants.php drivers functions.php \
		html iefixes.css initialize.php interface.php libraries \
		logs/.htaccess mbstring.php modules themes tmp/.htaccess \
		typolight.css

INSTALLATION_DIRS+=	${TL_DOCDIR} ${TL_EGDIR} ${TL_WEBDIR}/system/config
OWN_DIRS_PERMS+= \
		${TL_WEBDIR} ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/plugins ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system/drivers ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system/html ${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/system/libraries ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system/logs ${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/system/modules ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system/themes ${BINOWN} ${APACHE_GROUP} 0775 \
		${TL_WEBDIR}/system/tmp ${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/templates ${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/tl_files ${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/tl_files/tiny_templates \
		${BINOWN} ${APACHE_GROUP} 0770 \
		${TL_WEBDIR}/tl_files/xBrowser_style_sheets \
		${BINOWN} ${APACHE_GROUP} 0770

PKG_GROUPS_VARS+=	APACHE_GROUP
PKG_USERS_VARS+=	APACHE_USER

.include "options.mk"

pre-configure:
	${CP} ${FILESDIR}/typolight.conf ${WRKDIR}
	cd ${WRKSRC}; ${RM} -rf music_academy.css \
		templates/example_website.sql tl_files/music_academy

do-install:
	cd ${WRKSRC}; pax -rw -pm ${WWW_FILES} ${DESTDIR}${PREFIX}/${TL_WEBDIR}
	cd ${WRKSRC}/system; \
		pax -rw -pm ${WWW_SYSFILES} \
			${DESTDIR}${PREFIX}/${TL_WEBDIR}/system; \
		${INSTALL_DATA} config/.htaccess \
			${DESTDIR}${PREFIX}/${TL_WEBDIR}/system/config
	cd ${WRKSRC}; pax -rw -pm ${EG_DATA} ${DESTDIR}${PREFIX}/${TL_EGDIR}
	rm -f ${DESTDIR}${PREFIX}/${TL_EGDIR}/system/config/.htaccess
	${INSTALL_DATA} ${WRKDIR}/typolight.conf ${DESTDIR}${PREFIX}/${TL_EGDIR}
	${INSTALL_DATA} ${FILESDIR}/README \
		${DESTDIR}${PREFIX}/${TL_DOCDIR}

.include "Makefile.common"
.include "../../lang/php/phpversion.mk"
.include "../../mk/bsd.pkg.mk"
