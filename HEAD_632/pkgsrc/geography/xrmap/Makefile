# $NetBSD: Makefile,v 1.6 2007/10/25 22:00:44 jlam Exp $
#

DISTNAME=		xrmap-2.29
PKGREVISION=		1
CATEGORIES=		geography
MASTER_SITES=		# none
DISTFILES=		# empty

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://frmas.free.fr/li_1.htm
COMMENT=		Earth map viewer - complete

NO_CHECKSUM=		yes
NO_BUILD=		yes
PLIST_SRC=		# empty (meta-package)

DEPENDS+=	xrmap-base-2.29nb1:../../geography/xrmap-base
DEPENDS+=	xrmap-data>=0:../../geography/xrmap-data
DEPENDS+=	xrmap-factbook_text>=2002:../../geography/xrmap-factbook_text
DEPENDS+=	xrmap-factbook_html>=2002:../../geography/xrmap-factbook_html
DEPENDS+=	xrmap-anthems>=1.1:../../geography/xrmap-anthems
DEPENDS+=	xrmap-flags>=1.1:../../geography/xrmap-flags
DEPENDS+=	xrmap-hymns>=1.2:../../geography/xrmap-hymns
DEPENDS+=	xrmap-pdfmaps>=1.1:../../geography/xrmap-pdfmaps

do-install:
	@${DO_NADA}

.include "../../mk/bsd.pkg.mk"
