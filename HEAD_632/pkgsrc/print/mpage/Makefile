# $NetBSD: Makefile,v 1.19 2007/03/19 16:36:17 reed Exp $
#

DISTNAME=	mpage-2.5.5
PKGREVISION=	1
CATEGORIES=	print
MASTER_SITES=	ftp://ftp.mesa.nl/pub/mpage/	\
		http://www.mesa.nl/pub/mpage/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Print multiple pages per sheet of paper
HOMEPAGE=	http://www.mesa.nl/download.html

BUILD_TARGET=	default
MAKE_ENV+=	MANDIR=${PREFIX}/${PKGMANDIR}/man1

.include "../../mk/bsd.prefs.mk"

.if ${PAPERSIZE} == "A4"
MAKE_ENV+=	PAGESIZE=PAGE_A4
.elif ((${PAPERSIZE} == "Letter") || (${PAPERSIZE} == "Letterdj"))
MAKE_ENV+=	PAGESIZE=PAGE_LETTER
.endif

.include "../../mk/bsd.pkg.mk"
