# $NetBSD: Makefile,v 1.25 2007/09/21 13:04:14 wiz Exp $
#

DISTNAME=		glabels-2.0.4
PKGREVISION=		4
CATEGORIES=		print
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=glabels/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://glabels.sourceforge.net/
COMMENT=		Program for creating labels and business cards for GNOME

USE_PKGLOCALEDIR=	yes
USE_LIBTOOL=		yes
USE_DIRS+=		gnome2-1.5
GNU_CONFIGURE=		yes
USE_TOOLS+=		gmake intltool msgfmt pkg-config

.include "../../databases/shared-mime-info/mimedb.mk"
.include "../../devel/libgnomeui/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../graphics/libgnomecanvas/buildlink3.mk"
.include "../../print/libgnomeprint/buildlink3.mk"
.include "../../print/libgnomeprintui/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/scrollkeeper/omf.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
