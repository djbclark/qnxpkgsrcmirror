# $NetBSD: Makefile,v 1.13 2007/04/01 01:58:38 obache Exp $

DISTNAME=	imlib2-ruby-${VER}
PKGNAME=	${RUBY_PKGPREFIX}-imlib2-${VER}
PKGREVISION=	4
CATEGORIES=	graphics ruby
MASTER_SITES=	http://www.pablotron.org/download/

MAINTAINER=	obache@NetBSD.org
HOMEPAGE=	http://www.pablotron.org/software/imlib2-ruby/
COMMENT=	Imlib2 bindings for Ruby

VER=		0.5.2

REPLACE_RUBY_DIRS=	${WRKSRC}/examples
RUBY_HAS_ARCHLIB=	yes
RUBY_REQD=		1.8.0
USE_RUBY_EXTCONF=	yes
RUBY_DYNAMIC_DIRS=	${RUBY_DOCDIR:S,${PREFIX}/,,}/imlib2

INSTALL_TARGET=	site-install

DOCS=		AUTHORS COPYING ChangeLog README TODO

post-install:
	${INSTALL_DATA_DIR} ${RUBY_EXAMPLESDIR}/imlib2
	cd ${WRKSRC}/examples && ${PAX} -rw -pp -pm . ${RUBY_EXAMPLESDIR}/imlib2
	${INSTALL_DATA_DIR} ${RUBY_DOCDIR}/imlib2
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_DOCDIR}/imlib2
.endfor
	${INSTALL_DATA_DIR} ${RUBY_DOCDIR}/imlib2/api
	cd ${WRKSRC}/doc && ${PAX} -rw -pp -pm . ${RUBY_DOCDIR}/imlib2/api
	${RUBY_GENERATE_PLIST}

BUILDLINK_API_DEPENDS.imlib2+=      imlib2>=1.2.0nb2

.include "../../graphics/imlib2/buildlink3.mk"
.include "../../lang/ruby/modules.mk"
.include "../../mk/bsd.pkg.mk"
