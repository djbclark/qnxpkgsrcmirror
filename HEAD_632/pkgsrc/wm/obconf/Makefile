# $NetBSD: Makefile,v 1.22 2007/09/21 13:04:26 wiz Exp $

DISTNAME=		obconf-2.0.1
PKGREVISION=		1
CATEGORIES=		wm
MASTER_SITES=		http://icculus.org/openbox/obconf/
# PR pkg/36489
MASTER_SITES+=		http://offload1.icculus.org/openbox/obconf/

MAINTAINER=		snj@NetBSD.org
HOMEPAGE=		http://icculus.org/openbox/obconf/
COMMENT=		Tool for configuring the Openbox window manager

USE_TOOLS+=		pkg-config
USE_DIRS+=		xdg-1.1
GNU_CONFIGURE=		YES

.include "../../databases/shared-mime-info/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/buildlink3.mk"
BUILDLINK_API_DEPENDS.openbox+=	openbox>=3.4.2
.include "../../wm/openbox/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
