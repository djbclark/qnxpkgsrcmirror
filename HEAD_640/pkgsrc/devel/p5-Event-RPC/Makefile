# $NetBSD: Makefile,v 1.5 2008/11/05 22:42:24 he Exp $
#

DISTNAME=	Event-RPC-1.01
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	http://www.exit1.org/packages/Event-RPC/dist/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.exit1.org/Event-RPC/
#HOMEPAGE=	http://search.cpan.org/dist/Event-RPC/
COMMENT=	Event based transparent Client/Server RPC framework

DEPENDS+=	p5-Event-[0-9]*:../../devel/p5-Event
DEPENDS+=	p5-IO-Socket-SSL-[0-9]*:../../security/p5-IO-Socket-SSL
DEPENDS+=	p5-Net-SSLeay-[0-9]*:../../security/p5-Net-SSLeay

PERL5_PACKLIST=	auto/Event/RPC/.packlist
PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../devel/p5-glib2/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
