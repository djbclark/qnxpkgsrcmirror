# $NetBSD: Makefile,v 1.2 2006/05/04 01:38:02 minskim Exp $

DISTNAME=	rgl-0.2.3
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://rubyforge.org/frs/download.php/3959/
EXTRACT_SUFX=	.tgz

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://rgl.rubyforge.org/
COMMENT=	Framework for graph data structures and algorithms

DEPENDS+=	${RUBY_PKGPREFIX}-stream-[0-9]*:../../devel/ruby-stream

NO_BUILD=		yes
NO_CONFIGURE=		yes
USE_RUBY_INSTALL=	yes

.include "../../lang/ruby/modules.mk"

post-install:
	${INSTALL_DATA_DIR} ${RUBY_DOCDIR}/rgl
	${INSTALL_DATA} ${WRKSRC}/README ${RUBY_DOCDIR}/rgl
	${INSTALL_DATA_DIR} ${RUBY_EXAMPLESDIR}/rgl
	${CP} -R ${WRKSRC}/examples/* ${RUBY_EXAMPLESDIR}/rgl
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${RUBY_EXAMPLESDIR}/rgl
	${FIND} ${RUBY_EXAMPLESDIR}/rgl -type d -print |	\
		${XARGS} ${CHMOD} ${PKGDIRMODE}
	${FIND} ${RUBY_EXAMPLESDIR}/rgl -type f -print |	\
		${XARGS} ${CHMOD} ${SHAREMODE}

.include "../../mk/bsd.pkg.mk"
