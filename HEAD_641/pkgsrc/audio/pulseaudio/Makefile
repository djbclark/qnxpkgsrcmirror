# $NetBSD: Makefile,v 1.26 2009/07/28 12:52:40 tnn Exp $

# NOTE: Please send a copy of any patches that are not pkgsrc-specific
# to <pulseaudio-discuss@mail.0pointer.de>

DISTNAME=	pulseaudio-0.9.14
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://0pointer.de/lennart/projects/pulseaudio/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.pulseaudio.org/
COMMENT=	Sound server for POSIX and Win32 systems

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake m4 msgfmt intltool perl \
		autoconf automake autoreconf

AUTOCONF_REQD=	2.62

PKGCONFIG_OVERRIDE+=	libpulse-browse.pc.in
PKGCONFIG_OVERRIDE+=	libpulse-mainloop-glib.pc.in
PKGCONFIG_OVERRIDE+=	libpulse-simple.pc.in
PKGCONFIG_OVERRIDE+=	libpulse.pc.in

PULSE_USER?=		pulse
PULSE_GROUP?=		pulse
PULSE_GROUP_REALTIME?=	pulsert
PULSE_GROUP_ACCESS?=	pulseacc

BUILD_DEFS+=		VARBASE PKG_SYSCONFBASE

PKG_SYSCONFSUBDIR=	pulse
EGDIR=		${PREFIX}/share/examples/pulseaudio
CONF_FILES=	${EGDIR}/client.conf ${PKG_SYSCONFDIR}/client.conf
CONF_FILES+=	${EGDIR}/daemon.conf ${PKG_SYSCONFDIR}/daemon.conf
CONF_FILES+=	${EGDIR}/default.pa ${PKG_SYSCONFDIR}/default.pa
CONF_FILES+=	${EGDIR}/system.pa ${PKG_SYSCONFDIR}/system.pa

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASE}
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}
CONFIGURE_ARGS+=	--with-system-user=${PULSE_USER}
CONFIGURE_ARGS+=	--with-system-group=${PULSE_GROUP}
CONFIGURE_ARGS+=	--with-realtime-group=${PULSE_GROUP_REALTIME}
CONFIGURE_ARGS+=	--with-access-group=${PULSE_GROUP_ACCESS}
MAKE_ENV+=		EGDIR=${EGDIR}

SPECIAL_PERMS+=		bin/pulseaudio ${SETUID_ROOT_PERMS}

SUBST_CLASSES+=		padsp
SUBST_MESSAGE.padsp=	Fixing LD_PRELOAD paths
SUBST_STAGE.padsp=	post-build
SUBST_FILES.padsp=	src/utils/padsp
SUBST_SED.padsp=	-e 's@libpulsedsp\.so@${PREFIX}/lib/&@'

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "NetBSD"
# broken test for TLS
CONFIGURE_ENV+=		cc_cv_tls___thread=no
.endif

PLIST_VARS+=		evdev hal oss

.if ${OPSYS} == "Darwin"
BUILDLINK_TRANSFORM+=	rm:-Wl,-version-script=./map-file
BUILDLINK_TRANSFORM+=	rm:-Wl,-no-undefined
BUILDLINK_TRANSFORM+=	rm:-Wl,-z rm:-Wl,nodelete
.else
PLIST.hal=		yes
PLIST.oss=		yes
.endif

PKG_GROUPS=             ${PULSE_GROUP}
PKG_GROUPS+=		${PULSE_GROUP_REALTIME}
PKG_GROUPS+=		${PULSE_GROUP_ACCESS}
PKG_USERS=              ${PULSE_USER}:${PULSE_GROUP}

BUILDLINK_TRANSFORM+=	rm:-Wl,--gc-sections

# Use native atomic ops on NetBSD >= 5.0, otherwise
# fallback to libatomic_ops
.if ${OPSYS} == "NetBSD" && exists(/usr/include/sys/atomic.h)
CONFIGURE_ARGS+=	--enable-netbsd-atomic-ops
.else
CONFIGURE_ARGS+=	--disable-netbsd-atomic-ops
.include "../../devel/libatomic_ops/buildlink3.mk"
.endif

# Build module-mmkbd-evdev.so under Linux
.if ${OPSYS} == "Linux" && exists(/usr/include/linux/input.h)
PLIST.evdev=           yes
.endif

.include "options.mk"

pre-configure:
	cd ${WRKSRC} && autoreconf -f

.include "../../audio/libsamplerate/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../audio/speex/buildlink3.mk"
.include "../../databases/gdbm/buildlink3.mk"
.include "../../devel/GConf/schemas.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../devel/liboil/buildlink3.mk"
.include "../../security/policykit/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.if ${OPSYS} != "Darwin"
.include "../../sysutils/consolekit/buildlink3.mk"
.endif
.include "../../sysutils/hal/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
