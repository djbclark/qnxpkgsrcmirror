# $NetBSD: Makefile,v 1.2 2009/01/08 21:58:17 shattered Exp $
#

.include "../../x11/wxGTK28/Makefile.common"

PKGREVISION=		1
PKGNAME=		${DISTNAME:S/wxGTK/wxGTK28/}
COMMENT=		GTK-based implementation of the wxWidgets GUI library

BUILD_TARGET=	all
INSTALL_TARGET=	install

INSTALLATION_DIRS=	${DOCDIR}

post-build:
	set -e; cd ${WRKSRC}/locale; \
	for lang in `echo *.po` ; do \
		[ $${lang} = "wxstd.po" ] && continue; \
		${TOOLS_PATH.msgfmt} -c -o $${lang%.po}.mo $${lang}; \
	done
	set -e; cd ${WRKSRC}/locale/msw; \
	for lang in it; do \
	    ${TOOLS_PATH.msgfmt} -c -o $${lang}.mo $${lang}.po; \
	done

post-install:
	${INSTALL_DATA} ${WRKSRC}/docs/licence.txt ${DESTDIR}${DOCDIR}

.include "../../mk/oss.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
