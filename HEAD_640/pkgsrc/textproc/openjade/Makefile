# $NetBSD: Makefile,v 1.18 2009/01/11 09:08:00 minskim Exp $
#

DISTNAME=	openjade-1.3.2
PKGREVISION=	5
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=openjade/}

MAINTAINER=	kogule@mars.dti.ne.jp
HOMEPAGE=	http://openjade.sourceforge.net/
COMMENT=	SGML/XML parser toolkit and DSSSL engine, successor to "jade"

USE_TOOLS+=	gmake perl
USE_LANGUAGES=	c c++
USE_LIBTOOL=	YES
GNU_CONFIGURE=	YES

CONFIGURE_ENV+=	CXXFLAGS=${CFLAGS:M*:Q}
CONFIGURE_ARGS+=	--enable-default-catalog=${OPENJADE_DATA_DIR}/catalog \
		--datadir=${OPENJADE_DATA_DIR:Q}

SGML_CATALOGS=		${PREFIX}/share/sgml/openjade/catalog

OPENJADE_DATA_DIR=	${PREFIX}/share/sgml/openjade
OPENJADE_DOC_DIR=	${PREFIX}/share/doc/openjade

post-install:
	${INSTALL_DATA_DIR} ${OPENJADE_DATA_DIR}/pubtext
	${INSTALL_DATA} ${WRKSRC}/dsssl/* ${OPENJADE_DATA_DIR}
	${INSTALL_DATA} ${WRKSRC}/pubtext/* ${OPENJADE_DATA_DIR}/pubtext

	${INSTALL_DATA_DIR} ${OPENJADE_DOC_DIR}/doc
	${INSTALL_DATA_DIR} ${OPENJADE_DOC_DIR}/jadedoc/images
	${INSTALL_DATA} ${WRKSRC}/doc/*.htm ${OPENJADE_DOC_DIR}/doc
	${INSTALL_DATA} ${WRKSRC}/jadedoc/copying.txt ${OPENJADE_DOC_DIR}/jadedoc
	${INSTALL_DATA} ${WRKSRC}/jadedoc/*.htm ${OPENJADE_DOC_DIR}/jadedoc
	${INSTALL_DATA} ${WRKSRC}/jadedoc/images/* ${OPENJADE_DOC_DIR}/jadedoc/images

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../textproc/opensp/buildlink3.mk"
.include "../../textproc/xmlcatmgr/catalogs.mk"
.include "../../mk/bsd.pkg.mk"
