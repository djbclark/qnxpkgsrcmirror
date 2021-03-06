# $NetBSD: Makefile,v 1.27 2007/07/04 20:54:54 jlam Exp $
#

DISTNAME=	vsftpd-2.0.4
PKGREVISION=	1
CATEGORIES=	net
MASTER_SITES=	ftp://vsftpd.beasts.org/users/cevans/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://vsftpd.beasts.org/
COMMENT=	FTP server that aims to be very secure

PKG_SYSCONFSUBDIR=	vsftpd

BUILD_TARGET=	vsftpd
RCD_SCRIPTS=	vsftpd

PKG_GROUPS_VARS+=	VSFTPD_GROUP
PKG_USERS_VARS+=	VSFTPD_USER

VSFTPD_USER?=	vsftpd
VSFTPD_GROUP?=	vsftpd
PKG_GROUPS=	${VSFTPD_GROUP}
PKG_USERS=	${VSFTPD_USER}:${VSFTPD_GROUP}

DOCDIR=		${PREFIX}/share/doc/vsftpd
EGDIR=		${PREFIX}/share/examples/vsftpd

CFLAGS+=	-DPKG_SYSCONFDIR="\"${PKG_SYSCONFDIR}\""

CONF_FILES=	${EGDIR}/vsftpd.conf.default ${PKG_SYSCONFDIR}/vsftpd.conf
MAKE_DIRS=	${VARBASE}/chroot
OWN_DIRS=	${VARBASE}/chroot/vsftpd

INSTALLATION_DIRS=	libexec ${PKGMANDIR}/man5 ${PKGMANDIR}/man8

SUBST_CLASSES+=		paths
SUBST_FILES.paths=	vsftpd.8 vsftpd.conf.5 vsftpd.conf
SUBST_SED.paths+=	-e 's,@PKG_SYSCONFDIR@,${PKG_SYSCONFDIR},g'
SUBST_STAGE.paths=	post-patch

MAKE_ENV+=		LIBS=${LIBS:M*:Q}

.include "../../mk/bsd.prefs.mk"

LIBS.SunOS=	-lsocket -lnsl -lrt -lsendfile

.include "options.mk"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vsftpd ${PREFIX}/libexec
	${INSTALL_MAN} ${WRKSRC}/vsftpd.8 ${PREFIX}/${PKGMANDIR}/man8
	${INSTALL_MAN} ${WRKSRC}/vsftpd.conf.5 ${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA} ${WRKSRC}/vsftpd.conf ${EGDIR}/vsftpd.conf.default
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA_DIR} ${DOCDIR}/SECURITY
	cd ${WRKSRC} && ${INSTALL_DATA} FAQ INSTALL README README.ssl \
		TUNING ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/SECURITY/* ${DOCDIR}/SECURITY

.include "../../mk/bsd.pkg.mk"
