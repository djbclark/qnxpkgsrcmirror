# $NetBSD: Makefile,v 1.7 2008/06/16 14:52:58 joerg Exp $
#

COMMENT=	ISC Dynamic Host Configuration Protocol (DHCP) Client
COMPONENT=	client
SUBDIR=		client
PKGREVISION=	1

CONFLICTS+=	isc-dhclient-[0-9]*

CONF_FILES+=	${EGDIR}/dhclient.conf ${PKG_SYSCONFDIR}/dhclient.conf

RCD_SCRIPTS=	isc_dhclient
MAN_FILES=	man5/dhclient.conf.5 man5/dhclient.leases.5 \
		man8/dhclient-script.8 man8/dhclient.8
FILES_SUBST+=	DHCP_HOME=${DHCP_HOME}

post-install:
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA} ${WRKSRC}/client/dhclient.conf ${EGDIR}

.include "../../net/isc-dhcp/Makefile.common"
.include "../../net/isc-dhcp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
