# $NetBSD: Makefile,v 1.4 2008/10/15 12:18:37 obache Exp $
#
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++

.include "Makefile.common"

COMMENT+=		bad plugins

.include "../../mk/bsd.prefs.mk"

PLIST_VARS+=	x86
.if ${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64"
PLIST.x86=	yes
.endif

# bzip2 is likely present anyway, make it default
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
