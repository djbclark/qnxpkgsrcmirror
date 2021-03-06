# $NetBSD: Makefile,v 1.48 2009/06/09 21:31:04 minskim Exp $

DISTNAME=	tetex-src-3.0
PKGNAME=	${DISTNAME:C/tetex/teTeX/:C/src/bin/}
PKGREVISION=	34
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_TEX_CTAN:=systems/unix/teTeX/3.0/distrib/}

MAINTAINER=	kei@NetBSD.org
HOMEPAGE=	http://www.tug.org/tetex/
COMMENT=	TeX distribution for UNIX compatible systems - binaries

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	makeindexk-[0-9]*:../../textproc/makeindexk
DEPENDS+=	teTeX-texmf>=3.0nb14:../../print/teTeX3-texmf
DEPENDS+=	tex-bin-kpathsea-[0-9]*:../../print/tex-bin-kpathsea
DEPENDS+=	tex-bin-latex-[0-9]*:../../print/tex-bin-latex
DEPENDS+=	tex-bin-metafont-[0-9]*:../../fonts/tex-bin-metafont
DEPENDS+=	tex-bin-tex-[0-9]*:../../print/tex-bin-tex
DEPENDS+=	tex-pdftex-[0-9]*:../../print/tex-pdftex
DEPENDS+=	web2c>=7.5.7nb2:../../print/web2c

# games/omega previously installed an omega executable too
CONFLICTS+=	omega<0.90.4nb1

INFO_FILES=	# PLIST

USE_TOOLS+=	bison lex

USE_LIBTOOL=	yes

CONFIGURE_ARGS+=	--without-texinfo --without-texi2html
CONFIGURE_ARGS+=	--without-dvipdfm --without-dvipng
CONFIGURE_ARGS+=	--without-dvipsk --without-odvipsk
CONFIGURE_ARGS+=	--without-dviljk --without-makeindexk
CONFIGURE_ARGS+=	--without-etex --without-omega --without-aleph \
			--without-pdftex --without-pdfetex --without-pdfxtex
CONFIGURE_ARGS+=	--without-xdvik --without-oxdvik

MAKE_ENV+=		KPATHSEA_PREFIX=${BUILDLINK_PREFIX.kpathsea}
MAKE_FLAGS+=		LIBTOOL=${LIBTOOL:Q}
MAKE_FLAGS+=		vartexfonts=${VARBASE:Q}/lib/texmf/fonts

SUBST_CLASSES+=		web2c
SUBST_MESSAGE.web2c=	Disabling web2c.
SUBST_STAGE.web2c=	pre-configure
SUBST_FILES.web2c=	Makefile.in texk/Makefile.in
SUBST_SED.web2c=	-e 's,^programs = web2c,programs =,' \
			-e 's,^@FMU@,,'

BUILD_DEFS+=		VARBASE
LOWER_PAPERSIZE_cmd=	${ECHO} ${PAPERSIZE} | ${TR} '[A-Z]' '[a-z]'
LOWER_PAPERSIZE=	${LOWER_PAPERSIZE_cmd:sh}
FILES_SUBST+=		PAPERSIZE=${LOWER_PAPERSIZE:Q}

OWN_DIRS+=	${VARBASE}/lib/texmf ${PREFIX}/share/texmf-local
.for d in pk source tfm
OWN_DIRS_PERMS+=	${VARBASE}/lib/texmf/fonts/${d} \
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 1777
.endfor

INSTALL_MAKE_FLAGS+=	prefix=${DESTDIR}${PREFIX}
INSTALL_MAKE_FLAGS+=	texmf=${DESTDIR}${PREFIX}/share/texmf
INSTALL_MAKE_FLAGS+=	infodir=${DESTDIR}${PREFIX}/${PKGINFODIR}
INSTALL_MAKE_FLAGS+=	mandir=${DESTDIR}${PREFIX}/${PKGMANDIR}

CFLAGS.QNX+= -D__NO_EXT_QNX

INSTALLATION_DIRS+=	info share/texmf/fmtutil

TEX_TEXMF_DIRS=	${PREFIX}/share/texmf

TEX_FORMAT_NAMES+=	tetex

.include "../../print/kpathsea/buildlink3.mk"
.include "../../print/kpathsea/texmf.mk"
.include "../../print/teTeX3-bin/Makefile.common"
.include "../../print/texlive-tetex/format.mk"

post-extract:
	${RM} -rf ${WRKSRC}/texk/kpathsea

post-install:
.for f in a2ping e2pall epstopdf
	${INSTALL_SCRIPT} ${WRKSRC}/texk/tetex/${f} ${DESTDIR}${PREFIX}/bin
.endfor
	${LN} -sf mpost ${DESTDIR}${PREFIX}/bin/metafun
	${LN} -sf omega ${DESTDIR}${PREFIX}/bin/lambda
	${LN} -sf aleph ${DESTDIR}${PREFIX}/bin/lamed
	${LN} -sf pdftex ${DESTDIR}${PREFIX}/bin/mptopdf
	${INSTALL_DATA} ${FILESDIR}/format.tetex.cnf \
		${DESTDIR}${PREFIX}/share/texmf/fmtutil

.include "../../mk/bsd.pkg.mk"
