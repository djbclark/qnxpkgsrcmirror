# $NetBSD: Makefile,v 1.36 2008/11/10 17:21:34 wiz Exp $

DISTNAME=	emacs-20.7
PKGREVISION=	12
CATEGORIES=	editors
MASTER_SITES=	http://ftp.gnu.org/pub/old-gnu/emacs/	\
		ftp://ftp.gnu.org/pub/old-gnu/emacs
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DISTFILES+=	${DISTNAME}-mule-4.1b-elc${EXTRACT_SUFX}
SITES.${DISTNAME}-mule-4.1b-elc.tar.gz=	${MASTER_SITE_LOCAL}

# Mule enhancement (back port) patch by Satoshi Yatagawa
SITES.emacs-20.7-mule-4.1b.patch=	\
			http://www.teu.ac.jp/nsit/~yatagawa/comp/emacs/
PATCHFILES=		emacs-20.7-mule-4.1b.patch
# XIM fix patch by Seiichiro Inoue
SITES.emacs20-xim-20000713.diff=	\
			http://home.catv.ne.jp/pp/ginoue/software/emacs-xim/
PATCHFILES+=		emacs20-xim-20000713.diff
PATCH_DIST_STRIP=	-p1

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gnu.org/software/emacs/emacs.html
COMMENT=	GNU editing macros (editor)

NOT_FOR_PLATFORM=	Darwin-*-*

CONFLICTS=	mule-[0-9]*

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake
GNU_ARCH.mipsbe= mips

# build PATH in the dumped emacs is not a problem
CHECK_WRKREF_SKIP+=	bin/emacs
CHECK_WRKREF_SKIP+=	bin/emacs-20.7

.include "../../mk/bsd.prefs.mk"

# This matches NetBSD <1.7 releases and 1.6A-1.6P, where ld is <2.13.2.1.
.if (${OPSYS} == "NetBSD" && \
    (empty(OS_VERSION:M1.[0-5]*) && \
     empty(OS_VERSION:M1.6_*) && \
     empty(OS_VERSION:M1.6) && \
     empty(OS_VERSION:M1.6.[0-9]*) && \
     empty(OS_VERSION:M1.6[A-P]*))) || \
    (${OPSYS} == "DragonFly")
# If using GNU ld 2.13.2.1 or later, avoid creating combined reloc
# sections and .data reloc sections, both of which Emacs can't handle
# properly.  Analyzed by Stephen Ma.
LDFLAGS+=	-Wl,-z,nocombreloc
.endif

.if ${OPSYS} == "DragonFly" && exists(/usr/lib/crtbegin.o)
CPPFLAGS+=	-DDFLY_PRE_17_CRT
.endif

.include "options.mk"

MAKE_ENV+=	INSTALL_STRIP=${_STRIPFLAG_INSTALL:Q}

.include "../../mk/compiler.mk"
.if !empty(CC_VERSION:Mgcc-3.*)
CFLAGS+=	-fno-zero-initialized-in-bss
.endif

INFO_FILES=	# PLIST

INSTALL_PROGRAM=${INSTALL} ${COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}

post-extract:
	${CP} ${FILESDIR}/amd64.h ${WRKSRC}/src/m
	${CP} ${FILESDIR}/dragonfly.h ${WRKSRC}/src/s

pre-install:
	@${FIND} ${WRKSRC} -type f -name "*.orig*" -print | ${XARGS} ${RM} -f

post-install:
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/emacs

.include "../../mk/bsd.pkg.mk"
