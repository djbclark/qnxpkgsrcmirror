# $NetBSD: Makefile,v 1.12 2007/01/07 09:14:01 rillig Exp $
#

DISTNAME=	mpeg_encode-1.5b-src
PKGNAME=	${DISTNAME:S/-src//}
PKGREVISION=	4
CATEGORIES=	multimedia net
MASTER_SITES=	ftp://mm-ftp.cs.berkeley.edu/pub/multimedia/mpeg/encode/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://bmrc.berkeley.edu/frame/research/mpeg/mpeg_encode.html
COMMENT=	The Parallel Berkeley MPEG Encoder

WRKSRC=			${WRKDIR}/mpeg_encode
USE_TOOLS+=		gmake
INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

post-build:
	@cd ${WRKSRC}/convert && \
		${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mpeg_encode ${PREFIX}/bin
.for i in eyuvtojpeg jmovie2jpeg mpeg_demux
	${INSTALL_PROGRAM} ${WRKSRC}/convert/${i} ${PREFIX}/bin
.endfor
	${INSTALL_DATA_DIR}  ${PREFIX}/share/doc/mpeg_encode
.for i in EXTENSIONS INPUT.FORMAT mpeg_encode.1 parallel.param param-summary \
		template.param users-guide.fm users-guide.mif users-guide.ps
	${INSTALL_DATA}  ${WRKSRC}/docs/${i} ${PREFIX}/share/doc/mpeg_encode
.endfor
	${INSTALL_DATA_DIR}  ${PREFIX}/share/examples/mpeg_encode
	cd ${WRKSRC}/examples ; for i in * ; do \
		${INSTALL_DATA} $$i ${PREFIX}/share/examples/mpeg_encode; \
	done
	${INSTALL_MAN} ${WRKSRC}/docs/mpeg_encode.1 ${PREFIX}/${PKGMANDIR}/man1

.include "../../graphics/jpeg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
