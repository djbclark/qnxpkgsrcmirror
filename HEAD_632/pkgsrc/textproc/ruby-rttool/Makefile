# $NetBSD: Makefile,v 1.17 2007/02/22 19:01:26 wiz Exp $

DISTNAME=	rttool-${VERSION}
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}
CATEGORIES=	textproc ruby
MASTER_SITES=	http://www.rubyist.net/~rubikitch/archive/

MAINTAINER=	taca@NetBSD.org
HOMEPAGE=	http://www.rubyist.net/~rubikitch/computer/rttool/
COMMENT=	RT to HTML (and hopefully LaTeX in future) table converter

CONFLICTS+=	ruby[1-9][0-9]-rttool-*

.include "../../lang/ruby/rubyversion.mk"
# install a library file to rdtool's directory, too
BUILDLINK_DEPMETHOD.${RUBY_PKGPREFIX}-rdtool= full

VERSION=		1.0.2
USE_RUBY_SETUP=		yes
REPLACE_RUBY_DIRS=	${WRKSRC}/bin/rt ${WRKSRC}/lib/rt
HTMLDOCS=		rttool.en.html rttool.ja.html
DOCS=			rttool.en.rd rttool.ja.rd
SRCS=			rt2html-lib.rb rt2txt-lib.rb rtparser.rb \
			rtvisitor.rb w3m.rb

post-install:
	${INSTALL_DATA_DIR} ${RUBY_DOCDIR}/rt
.for f in ${DOCS} ${HTMLDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_DOCDIR}/rt
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_DOCDIR}/rt
.endfor
	${INSTALL_DATA_DIR} ${RUBY_EXAMPLESDIR}/rt
	${INSTALL_DATA} ${WRKSRC}/examples/* ${RUBY_EXAMPLESDIR}/rt

.include "../../lang/ruby/modules.mk"
.include "../../textproc/ruby-rdtool/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
