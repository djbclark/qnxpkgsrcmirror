# $NetBSD: Makefile,v 1.16 2009/01/19 22:45:40 kefren Exp $

DISTNAME=	monodevelop-1.9.1
CATEGORIES=	devel
PKGREVISION=	1
MASTER_SITES=	http://go-mono.com/sources/monodevelop/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	kefren@NetBSD.org
HOMEPAGE=	http://www.monodevelop.com/
COMMENT=	IDE for C\# and other .NET languages

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake perl:run pkg-config bash
EXTRACT_USING=	gtar
MAKE_JOBS_SAFE=	no

USE_DIRS+=	xdg-1.4

REPLACE_BASH+=	monodevelop.in
REPLACE_BASH+=	src/addins/MonoDevelop.Autotools/templates/configure.template
REPLACE_BASH+=	contrib/extract_makefile_variable.sh
REPLACE_BASH+=	theme-icons/icon-theme-installer

.include "../../databases/shared-mime-info/buildlink3.mk"
.include "../../devel/mono-addins/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../lang/mono/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/buildlink3.mk"
.include "../../x11/gtksourceview-sharp2/buildlink3.mk"
.include "../../x11/gtk-sharp/buildlink3.mk"
.include "../../x11/gnome-sharp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
