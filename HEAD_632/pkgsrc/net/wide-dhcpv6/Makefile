# $NetBSD: Makefile,v 1.4 2007/05/22 12:53:01 obache Exp $

DISTNAME=	wide-dhcpv6-20070507
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=wide-dhcpv6/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://wide-dhcpv6.sourceforge.net/
COMMENT=	DHCP6 client, server and relay agent by WIDE project

USE_TOOLS+=	lex yacc
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}
CONFIGURE_ARGS+=	--with-localdbdir=${VARBASE:Q}/db

RCD_SCRIPTS=	dhcp6c dhcp6relay dhcp6s

BUILD_DEFS+=	VARBASE
EGDIR=		${PREFIX}/share/examples/wide-dhcpv6
COMMANDS=	dhcp6c dhcp6s dhcp6relay dhcp6ctl
EXAMPLES=	dhcp6c.conf dhcp6s.conf
MAN5=		dhcp6c.conf.5 dhcp6s.conf.5
MAN8=		dhcp6c.8 dhcp6ctl.8 dhcp6relay.8 dhcp6s.8

INSTALLATION_DIRS=	${PKGMANDIR}/man5 ${PKGMANDIR}/man8 sbin \
			share/examples/wide-dhcpv6


SUBST_CLASSES+=		fix-paths
SUBST_STAGE.fix-paths=	pre-configure
SUBST_MESSAGE.fix-paths=Fixing absolute paths.
SUBST_FILES.fix-paths=	${MAN5} ${MAN8}
SUBST_SED.fix-paths=	-e 's,/usr/local/etc,${PKG_SYSCONFDIR:Q},g'

do-install:
.for f in ${COMMANDS}
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${PREFIX}/sbin
.endfor
.for f in ${MAN5}
	${INSTALL_MAN} ${WRKSRC}/${f} ${PREFIX}/${PKGMANDIR}/man5
.endfor
.for f in ${MAN8}
	${INSTALL_MAN} ${WRKSRC}/${f} ${PREFIX}/${PKGMANDIR}/man8
.endfor
.for f in ${EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/${f}.sample ${EGDIR}/${f}
.endfor

.include "../../mk/bsd.pkg.mk"
