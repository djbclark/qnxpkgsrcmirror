# $NetBSD: Makefile,v 1.45 2007/07/04 20:54:50 jlam Exp $
#

.include "Makefile.common"

RCD_SCRIPTS=		mldonkey

PKG_GROUPS_VARS+=	MLDONKEY_GROUP
PKG_USERS_VARS+=	MLDONKEY_USER

BUILD_DEFS+=		MLDONKEY_HOME VARBASE

OWN_DIRS_PERMS=		${MLDONKEY_HOME} ${MLDONKEY_USER} ${MLDONKEY_GROUP} 0700
OWN_DIRS_PERMS+=	${VARBASE}/log/mldonkey \
			${MLDONKEY_USER} ${MLDONKEY_GROUP} 0700
OWN_DIRS_PERMS+=	${VARBASE}/run/mldonkey \
			${MLDONKEY_USER} ${MLDONKEY_GROUP} 0700

PKG_GROUPS=		${MLDONKEY_GROUP}
PKG_USERS=		${MLDONKEY_USER}:${MLDONKEY_GROUP}

PKG_GECOS.${MLDONKEY_USER}=	Dedicated mldonkey server
PKG_HOME.${MLDONKEY_USER}=	${MLDONKEY_HOME}
PKG_SHELL.${MLDONKEY_USER}=	${SH}

FILES_SUBST+=		MLDONKEY_GROUP=${MLDONKEY_GROUP:Q}
FILES_SUBST+=		MLDONKEY_HOME=${MLDONKEY_HOME:Q}
FILES_SUBST+=		MLDONKEY_USER=${MLDONKEY_USER:Q}

do-install:
	${INSTALL_PROGRAM_DIR} ${PREFIX}/libexec/mldonkey
	${INSTALL_PROGRAM} ${WRKSRC}/mlnet ${PREFIX}/libexec/mldonkey

.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
