# $NetBSD: Makefile,v 1.4 2008/03/03 01:50:26 jlam Exp $
#

DISTNAME=	myhdl-0.5.1
PKGNAME=	MyHDL-iverilog-0.5.1
CATEGORIES=	cad python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=myhdl/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://jandecaluwe.com/Tools/MyHDL/Overview.html
COMMENT=	Icarus Verilog cosimulation support for py-MyHDL

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DIRS+=	cosimulation/icarus

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/lib/ivl
	${INSTALL_DATA} ${WRKSRC}/cosimulation/icarus/myhdl.vpi \
		${DESTDIR}${PREFIX}/lib/ivl

.include "../../cad/verilog/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
