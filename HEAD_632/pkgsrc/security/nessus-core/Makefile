# $NetBSD: Makefile,v 1.31 2006/06/11 14:45:50 joerg Exp $

.include 	"../../security/nessus/Makefile.common"

DISTNAME=	nessus-core-${VERS}

COMMENT=	Core module of the Nessus Network Security Scanner

WRKSRC=		${WRKDIR}/nessus-core

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config
CONFIGURE_ARGS+=	--enable-gtk
CONFIGURE_ARGS+=	--with-x
CONFIGURE_ARGS+=	--localstatedir=${VARBASE:Q}
CONFIGURE_ARGS+=	--sharedstatedir=${PKG_SYSCONFBASE:Q}
CONFIGURE_ENV+=		ac_cv_path_GTKCONFIG="pkg-config gtk+-2.0" \
			ac_cv_path_GLIBCONFIG="pkg-config glib-2.0"

RCD_SCRIPTS=	nessusd

PKG_SYSCONFSUBDIR?=	nessus

OWN_DIRS_PERMS+=	${VARBASE}/nessus ${ROOT_USER} ${ROOT_GROUP} 0700
OWN_DIRS_PERMS+=	${PKG_SYSCONFDIR} ${ROOT_USER} ${ROOT_GROUP} 0700

OWN_DIRS+=	${PREFIX}/lib/nessus		\
		${PREFIX}/lib/nessus/reports	\
		${PREFIX}/lib/nessus/plugins

MAKE_DIRS+=	${VARBASE}/nessus/jobs		\
		${VARBASE}/nessus/logs		\
		${VARBASE}/nessus/tmp		\
		${VARBASE}/nessus/users

CONF_FILES+=	${BUILDLINK_PREFIX.libnasl}/share/examples/libnasl/nessus_org.pem \
		${VARBASE}/nessus/nessus_org.pem
CONF_FILES+=	${PREFIX}/share/examples/nessus/nessus-services	\
		${VARBASE}/nessus/nessus-services

.include "../../security/libnasl/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
