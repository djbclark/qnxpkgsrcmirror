# $NetBSD: Makefile,v 1.77 2008/07/14 12:56:06 joerg Exp $

DISTNAME=	xsane-0.994
PKGNAME=	xsane-0.99.4
PKGREVISION=	7
CATEGORIES=	graphics
MASTER_SITES=	http://www.xsane.org/download/ \
		http://gd.tuwien.ac.at/hci/sane/xsane/ \
		ftp://gd.tuwien.ac.at/hci/sane/xsane/ \
		ftp://ftp.u-aizu.ac.jp/pub/misc/device/scsi/scanner/sane/xsane/ \
		ftp://sunsite.uio.no/pub/sane/xsane/ \
		ftp://ftp.informatik.uni-oldenburg.de/pub/sane/xsane/

MAINTAINER=	rh@NetBSD.org
HOMEPAGE=	http://www.xsane.org/
COMMENT=	New improved frontend for SANE

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake msgfmt pkg-config
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../graphics/gimp/buildlink3.mk"
.include "../../graphics/sane-backends/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
