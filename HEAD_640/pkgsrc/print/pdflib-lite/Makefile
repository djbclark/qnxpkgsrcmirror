# $NetBSD: Makefile,v 1.2 2008/06/12 02:14:43 joerg Exp $
#

DISTNAME=	PDFlib-Lite-7.0.3
PKGNAME=	pdflib-lite-7.0.3
CATEGORIES=	print
MASTER_SITES=	http://www.pdflib.com/binaries/PDFlib/703/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.pdflib.com/
COMMENT=	C library to produce PDF files

PKG_DESTDIR_SUPPORT=	user-destdir

CONFLICTS+=	pdflib-[0-9]*

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
CONFIGURE_ARGS+=	--with-tcl=no

DOCDIR=		${PREFIX}/share/doc/pdflib

INSTALLATION_DIRS=	${DOCDIR}

post-install:
	cd ${WRKSRC}/doc/pdflib; for file in				\
		PDFlib-Lite-license.pdf					\
		PDFlib-API-reference.pdf;				\
	do								\
		${INSTALL_DATA} $${file} ${DESTDIR}${DOCDIR};		\
	done

.include "../../mk/bsd.pkg.mk"
