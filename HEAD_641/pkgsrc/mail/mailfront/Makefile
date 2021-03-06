# $NetBSD: Makefile,v 1.10 2009/04/08 01:44:04 schmonz Exp $
#

DISTNAME=		mailfront-1.12
CATEGORIES=		mail
MASTER_SITES=		${HOMEPAGE}archive/

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://untroubled.org/mailfront/
COMMENT=		Mail server network protocol front-ends

DEPENDS+=		daemontools-[0-9]*:../../sysutils/daemontools
DEPENDS_QMAIL=		qmail>=1.03nb8:../../mail/qmail
DEPENDS+=		${DEPENDS_QMAIL}

DJB_RESTRICTED=		NO
DJB_MAKE_TARGETS=	NO
DJB_CONFIG_CMDS+=	${ECHO} ${PREFIX}/include > conf-include;	\
			${ECHO} ${PREFIX}/lib/${PKGBASE} > conf-modules;\
			${ECHO} ${PREFIX}/lib > conf-cvmlibs

RCD_SCRIPTS=		smtpfront
INSTALLATION_DIRS=	share/doc/mailfront

.include "../../mk/bsd.prefs.mk"

post-install:
	cd ${WRKSRC};							\
	for f in *.html; do						\
		${INSTALL_DATA} $${f} ${PREFIX}/share/doc/mailfront;	\
	done;								\
	for f in ANNOUNCEMENT NEWS README; do				\
		${INSTALL_DATA} $${f} ${PREFIX}/share/doc/mailfront;	\
	done

# Detect the PKG_SYSCONFDIR of the installed qmail, so we can create
# config files there and refer to them from rc.d scripts.
#
.if !defined(PKG_SYSCONFDIR.mailfront)
PKG_SYSCONFDIR.mailfront!=						\
	${PKG_INFO} -Q PKG_SYSCONFDIR					\
		${DEPENDS_QMAIL:C/:.*$//:Q} 2>/dev/null ||		\
	${ECHO} "PKG_SYSCONFDIR.mailfront_not_set"
.  if empty(PKG_SYSCONFDIR.mailfront:M*not_set)
MAKEVARS+=	PKG_SYSCONFDIR.mailfront
.  endif
.endif

.include "../../devel/bglibs/buildlink3.mk"
.include "../../security/cvm/buildlink3.mk"
.include "../../mk/djbware.mk"
.include "../../mk/bsd.pkg.mk"
