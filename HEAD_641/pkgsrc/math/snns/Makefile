# $NetBSD: Makefile,v 1.21 2009/02/23 18:14:20 joerg Exp $

DISTNAME=	SNNSv4.2
PKGNAME=	snns-4.2
PKGREVISION=	2
CATEGORIES=	misc
MASTER_SITES=	http://www-ra.informatik.uni-tuebingen.de/downloads/SNNS/

MAINTAINER=	wulf@NetBSD.org
HOMEPAGE=	http://www-ra.informatik.uni-tuebingen.de/SNNS/
COMMENT=	Software simulator for neural networks

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	YES
CONFIGURE_ARGS+=	--enable-global

XGUILOADPATH=	${PREFIX}/share/snns

INSTALLATION_DIRS+=	share/snns share/doc/snns \
			share/examples/snns

INSTALL_TARGET=		install install-man
INSTALL_MAKE_FLAGS+=	INSTALLDIR=${DESTDIR}${PREFIX} \
			MANDIR=${DESTDIR}${PREFIX}/${PKGMANDIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/help.hdoc ${DESTDIR}${XGUILOADPATH}
	${INSTALL_DATA} ${WRKSRC}/default.cfg ${DESTDIR}${XGUILOADPATH}
	for i in `ls -1 ${WRKSRC}/tools/doc`; do \
		${INSTALL_DATA} ${WRKSRC}/tools/doc/$$i \
			${DESTDIR}${PREFIX}/share/doc/snns; \
	done
	for i in `ls -1 ${WRKSRC}/examples`; do \
		${INSTALL_DATA} ${WRKSRC}/examples/$$i \
		    ${DESTDIR}${PREFIX}/share/examples/snns; \
	done

.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
