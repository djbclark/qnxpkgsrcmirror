# $NetBSD: Makefile,v 1.37 2013/10/04 08:07:23 manu Exp $
#

DISTNAME=	glusterfs-3.4.1
PKGREVISION=	1
CATEGORIES=	filesystems
MASTER_SITES=	http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.1/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gluster.org/
COMMENT=	Cluster filesystem
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_TOOLS+=		flex bison

CONFIGURE_ARGS+=	--disable-fusermount
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}
CONFIGURE_ARGS+=	CFLAGS=${CFLAGS:M*:Q}\ -DDEBUG

# Make sure we do not attept to link with -lfl
# Only libfl.a is available, and libtool wants libfl.so
MAKE_FLAGS+=		LEXLIB=""
MAKE_FLAGS+=		libglusterfs_la_LIBADD=""
MAKE_ENV+=		AM_MAKEFLAGS=${MAKE_FLAGS:Q}

SUBST_CLASSES+=		py
SUBST_STAGE.py=		post-build
SUBST_FILES.py=		extras/volgen/glusterfs-volgen
SUBST_SED.py=		-e "s,/usr/bin/python,${PYTHONBIN},g"

SUBST_CLASSES+=		bash
SUBST_STAGE.bash=	post-build
SUBST_FILES.bash=	xlators/mount/fuse/utils/mount.glusterfs
SUBST_SED.bash=		-e "s,/bin/bash,/bin/sh,g"

SUBST_CLASSES+=		mtab
SUBST_STAGE.mtab=	post-build
SUBST_FILES.mtab=	xlators/mount/fuse/utils/mount.glusterfs
SUBST_SED.mtab=		-e "s,/etc/mtab,/proc/mounts,g"

SUBST_CLASSES+=		etc
SUBST_STAGE.etc=	pre-build
SUBST_FILES.etc+=	cli/src/cli-rpc-ops.c
SUBST_FILES.etc+=	libglusterfs/src/compat.h
SUBST_FILES.etc+=	xlators/mgmt/glusterd/src/glusterd-op-sm.c
SUBST_FILES.etc+=	xlators/mgmt/glusterd/src/glusterd.h
SUBST_FILES.etc+=	doc/examples/replicate.vol
SUBST_FILES.etc+=	doc/examples/protocol-server.vol
SUBST_FILES.etc+=	doc/examples/unify.vol
SUBST_FILES.etc+=	doc/examples/stripe.vol
SUBST_FILES.etc+=	doc/glusterd.vol
SUBST_FILES.etc+=	doc/glusterfsd.8
SUBST_FILES.etc+=	doc/glusterfsd.vol.sample
SUBST_SED.etc=		-e "s,/etc/gluster,${PREFIX}/etc/gluster,g"

SUBST_CLASSES+=		vol
SUBST_STAGE.vol=	post-build
SUBST_FILES.vol=	doc/Makefile
SUBST_SED.vol=		-e "s/glusterd.vol/glusterd.vol.sample/g"

REPLACE_PYTHON+=	${WRKSRC}/extras/volgen/glusterfs-volgen

EGDIR=			${PREFIX}/etc/glusterfs
CONF_FILES+=		${EGDIR}/glusterd.vol.sample ${EGDIR}/glusterd.vol
OWN_DIRS+=		${VARBASE}/log/glusterfs
BUILD_DEFS+=		VARBASE

RCD_SCRIPTS=		glusterfsd glusterd

PLIST_SRC=		${PLIST_SRC_DFLT}
PLIST_SUBST+=		VARBASE=${VARBASE}
PLIST_SUBST+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}
MESSAGE_SRC=		${PKGDIR}/MESSAGE.${OPSYS}


post-build:
	 cp ${WRKSRC}/doc/glusterd.vol ${WRKSRC}/doc/glusterd.vol.sample

post-install:
	${INSTALL_SCRIPT} ${DESTDIR}/sbin/mount.glusterfs \
	    ${DESTDIR}/${PREFIX}/sbin/mount.glusterfs

# Debug
CFLAGS+=		-g
INSTALL_UNSTRIPPED=	yes

.include "options.mk"

.include "../../mk/bsd.prefs.mk"
.include "../../lang/python/application.mk"
.if ${OPSYS} == "NetBSD"
#.include "../../filesystems/perfuse/buildlink3.mk"
.endif

.include "../../mk/bsd.pkg.mk"
