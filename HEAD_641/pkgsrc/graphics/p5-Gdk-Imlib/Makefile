# $NetBSD: Makefile,v 1.11 2009/08/03 15:23:58 joerg Exp $
#

PKG_DESTDIR_SUPPORT=	user-destdir
MAKE_JOBS_SAFE=		no

.include "../../x11/p5-gtk/Makefile.common"

PKGNAME=	p5-Gdk-Imlib-${GTKPERL_VERSION}
PKGREVISION=	5

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Perl bindings for Imlib

PERL5_PACKLIST=	auto/Gtk/Gdk/ImlibImage/.packlist
SUBPACKAGE=	GdkImlib

.include "../../graphics/imlib/buildlink3.mk"
.include "../../x11/p5-gtk/Makefile.subpackage"
