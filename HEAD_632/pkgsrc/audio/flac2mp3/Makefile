# $NetBSD: Makefile,v 1.7 2006/03/04 21:28:55 jlam Exp $

DISTNAME=	flac2mp3
PKGNAME=	flac2mp3-20041223
PKGREVISION=	1
CATEGORIES=	audio converters
MASTER_SITES=	http://www.gurulabs.com/files/
EXTRACT_SUFX=	.pl

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.gurulabs.com/
COMMENT=	Script to convert flac to mp3

DEPENDS+=	lame-[0-9]*:../../audio/lame
DEPENDS+=	p5-MP3-Info-[0-9]*:../../audio/p5-MP3-Info

PKG_INSTALLATION_TYPES=	overwrite pkgviews

REPLACE_PERL=	flac2mp3.pl
USE_TOOLS+=	perl:run
WRKSRC=		${WRKDIR}

NO_BUILD=	yes

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/flac2mp3.pl ${PREFIX}/bin/flac2mp3

.include "../../mk/bsd.pkg.mk"
