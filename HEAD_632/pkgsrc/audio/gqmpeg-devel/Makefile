# $NetBSD: Makefile,v 1.16 2006/04/17 13:46:16 wiz Exp $

DISTNAME=		gqmpeg-0.91.1
PKGREVISION=		5
CATEGORIES=		audio
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=gqmpeg/}

MAINTAINER=		sekiya@NetBSD.org
HOMEPAGE=		http://gqmpeg.sourceforge.net/
COMMENT=		GTK+ front end to mpg123

DEPENDS+=		mpg123{,-esound,-nas}>=0.59.18:../../audio/mpg123
DEPENDS+=		vorbis-tools>=1.0.0.6:../../audio/vorbis-tools
DEPENDS+=		xmp>=2.0.2:../../audio/xmp

USE_TOOLS+=		msgfmt pkg-config
USE_DIRS+=		gnome2-1.5
USE_DIRS+=		xdg-1.2
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES

CONFIGURE_ARGS+=	--without-included-gettext
CONFIGURE_ENV+=		GNOME_DATADIR=${PREFIX}/share

.include "options.mk"

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
