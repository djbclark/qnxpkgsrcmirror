# $NetBSD: Makefile,v 1.16 2008/10/11 09:31:57 uebayasi Exp $

DISTNAME=		etach-1.2.9
PKGNAME=		${EMACS_PKGNAME_PREFIX}${DISTNAME}
PKGREVISION=		2
CATEGORIES=		mail
MASTER_SITES=		http://rulnick.com/etach/download/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://rulnick.com/etach/
COMMENT=		Emacs Lisp package for dealing with MIME email attachments

PKG_DESTDIR_SUPPORT=	user-destdir

NO_CONFIGURE=		yes
NO_BUILD=		yes

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${EMACS_LISPPREFIX}/etach
	${INSTALL_DATA} ${WRKSRC}/etach.el ${DESTDIR}${EMACS_LISPPREFIX}/etach
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/share/doc/etach
	cd ${WRKSRC} && ${INSTALL_DATA} README.txt FAQ.txt LICENSE.txt	\
		${DESTDIR}${PREFIX}/share/doc/etach/

.include "../../editors/emacs/modules.mk"
.include "../../mk/bsd.pkg.mk"
