# $NetBSD: Makefile,v 1.17 2007/05/28 20:35:38 heinz Exp $
#

DISTNAME=	rad3R6P1
PKGNAME=	radiance-3.6.1
PKGREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://www.radiance-online.org/software/non-cvs/	\
		http://www.radiance-online.org/software/
DISTFILES+=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}supp${EXTRACT_SUFX}

MAINTAINER=	jschauma@NetBSD.org
HOMEPAGE=	http://www.radiance-online.org/
COMMENT=	Physically-based, image-generating, backward raytracer

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/ray

LICENSE=	radiance-license

PATCHEES=	makeall ./src/rt/Rmakefile ./src/util/Rmakefile		\
		./src/ot/Rmakefile ./src/meta/Rmakefile 		\
		./src/hd/Rmakefile ./src/gen/Rmakefile 			\
		./src/cv/Rmakefile ./src/common/Rmakefile 		\
		./src/cal/Rmakefile installib				\
		./src/cv/mgflib/Makefile ./src/meta/lib4014/Makefile 	\
		./src/px/Rmakefile					\
		./src/px/tiff/contrib/acorn/Makefile 			\
		./src/px/tiff/contrib/addtiffo/Makefile  		\
		./src/px/tiff/contrib/iptcutil/Makefile

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "NetBSD"
PKGSRC_ARCH=	9
PLIST_SUBST+=	USE_GL="@comment "
.elif ${OPSYS} == "FreeBSD"
PKGSRC_ARCH=	8
PLIST_SUBST+=	USE_GL="@comment "
.elif ${OPSYS} == "DragonFly"
PKGSRC_ARCH=	12
PLIST_SUBST+=	USE_GL="@comment "
.elif ${OPSYS} == "Linux"
PLIST_SUBST+=	USE_GL="@comment "
PKGSRC_ARCH=	6
.elif ${OPSYS} == "IRIX"
PKGSRC_ARCH=	3
PLIST_SUBST+=	USE_GL=""
.endif

MAKE_ENV+=	MV=${MV:Q} RM=${RM:Q} CP=${CP:Q}			\
		INSTALL_SCRIPT=${INSTALL_SCRIPT:Q} 			\
		INSTALL_PROGRAM=${INSTALL_PROGRAM:Q}			\
		RANLIB=${RANLIB:Q} AR=${AR:Q}

DESTDIRPREFIX=	${DESTDIR}${PREFIX}

do-configure:
.for patchee in ${PATCHEES}
	${SED} -e 's|@PREFIX@|${PREFIX}|g' 				\
		-e 's|@PKGSRC_ARCH@|${PKGSRC_ARCH}|g'			\
		-e 's|@WRKSRC@|${WRKSRC}|g'				\
		-e 's|@X11BASE@|${X11BASE}|g'				\
		-e 's|@MAKE@|${MAKE}|g'					\
		${WRKSRC}/${patchee} >	${WRKSRC}/${patchee}.tmp &&	\
	${MV} ${WRKSRC}/${patchee}.tmp ${WRKSRC}/${patchee}
.endfor
	${RM} ${WRKSRC}/lib/.gdb_history

do-build:
	cd ${WRKSRC} && ${MAKE_ENV} csh ./makeall install
	@${RM} -f ${WRKSRC}/radiance/bin/wish*

do-install:
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/radiance
	cd ${WRKSRC}/radiance && ${PAX} -rw -s '|.*/\.DS_Store||' . ${DESTDIRPREFIX:Q}/radiance/
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/radiance/obj
	cd ${WRKSRC}/obj && ${PAX} -rw -s '|.*/\.DS_Store||' . ${DESTDIRPREFIX:Q}/radiance/obj/
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/radiance/lib
	cd ${WRKSRC}/lib && ${PAX} -rw -s '|.*/\.DS_Store||' . ${DESTDIRPREFIX:Q}/radiance/lib/
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/radiance/man
	cd ${WRKSRC}/doc/man && ${PAX} -rw -s '|.*/\.DS_Store||' . ${DESTDIRPREFIX:Q}/radiance/man/
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/share/doc/radiance
	${INSTALL_DATA} ${WRKSRC}/doc/pdf/*.pdf \
		${DESTDIRPREFIX:Q}/share/doc/radiance/
	${INSTALL_DATA_DIR} ${DESTDIRPREFIX:Q}/share/doc/html/radiance
	${INSTALL_DATA} ${WRKSRC}/doc/ray.html \
		${DESTDIRPREFIX:Q}/share/doc/radiance/index.html

.include "../../graphics/tiff/buildlink3.mk"
.include "../../x11/tk/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
