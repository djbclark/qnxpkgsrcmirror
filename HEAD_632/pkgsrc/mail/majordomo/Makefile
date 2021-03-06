# $NetBSD: Makefile,v 1.29 2007/07/04 20:54:44 jlam Exp $

DISTNAME=		majordomo-1.94.5
PKGREVISION=		2
CATEGORIES=		mail
MASTER_SITES=		ftp://ftp.sgi.com/other/majordomo/1.94.5/ \
			ftp://ftp-europe.sgi.com/other/majordomo/1.94.5/
EXTRACT_SUFX=	.tgz

MAINTAINER=		packages@biology.nmsu.edu
HOMEPAGE=		http://www.greatcircle.com/majordomo/
COMMENT=		The Majordomo mailing list manager

LICENSE=		majordomo-license

CONFLICTS+=		bounce-*

USE_TOOLS+=		perl:run

BUILD_TARGET=		wrapper
INSTALL_TARGET=		install install-wrapper
MAKE_FILE=		Makefile.netbsd

MAJORDOMO_TMPDIR?=	/var/tmp
MAJORDOMO_HOMEDIR?=	/home
MAJORDOMO_USER?=	majordom
MAJORDOMO_GROUP?=	majordom

PKG_GROUPS_VARS+=	MAJORDOMO_GROUP
PKG_USERS_VARS+=	MAJORDOMO_USER

MESSAGE_SUBST+=		HOME=${MAJORDOMO_HOMEDIR}			\
			MAJORDOMO_USER=${MAJORDOMO_USER}		\
			MAJORDOMO_GROUP=${MAJORDOMO_GROUP}

DOCDIR=			${PREFIX}/share/doc/majordomo
DOCFILES=		Changelog FUTURE INSTALL LICENSE NEWLIST README
DOCDOCFILES=		FAQ README.sequencer list-owner-info \
			majordomo-faq.html majordomo.lisa6.ps majordomo.ora

EXDIR=			${PREFIX}/share/examples/majordomo
EXDIRS=			archives archives/example-l digests \
			digests/example-l-digest lists
EXFILES=		example-l.passwd example-l.info
EXLISTS=		example-l example-l-digest

BUILD_DEFS+=		MAJORDOMO_TMPDIR

USERGROUP_PHASE=	configure
PKG_GROUPS=		${MAJORDOMO_GROUP}
PKG_USERS=		${MAJORDOMO_USER}:${MAJORDOMO_GROUP}
OWN_DIRS_PERMS+=	${MAJORDOMO_HOMEDIR}/${MAJORDOMO_USER}		\
			${MAJORDOMO_USER} ${MAJORDOMO_GROUP} 0775
OWN_DIRS_PERMS+=	${MAJORDOMO_HOMEDIR}/${MAJORDOMO_USER}/archives	\
			${MAJORDOMO_USER} ${MAJORDOMO_GROUP} 0775
OWN_DIRS_PERMS+=	${MAJORDOMO_HOMEDIR}/${MAJORDOMO_USER}/digests	\
			${MAJORDOMO_USER} ${MAJORDOMO_GROUP} 0775
OWN_DIRS_PERMS+=	${MAJORDOMO_HOMEDIR}/${MAJORDOMO_USER}/lists	\
			${MAJORDOMO_USER} ${MAJORDOMO_GROUP} 0775

CONFIGURE_SED=		-e "s|@PREFIX@|${PREFIX}|g"			\
			-e "s|@PERL@|${PERL5}|g"			\
			-e "s|@HOME@|${MAJORDOMO_HOMEDIR}|g"		\
			-e "s|@MAJORDOMO_USER@|${MAJORDOMO_USER}|g"	\
			-e "s|@UID@|${PKG_UID.${MAJORDOMO_USER}}|g"	\
			-e "s|@GID@|${PKG_GID.${MAJORDOMO_GROUP}}|g"	\
			-e "s|@TMPDIR@|${MAJORDOMO_TMPDIR}|g"

MESSAGE_SED=		-e 's|$${PREFIX}|${PREFIX}|g'			\
			-e 's|$${HOME}|${HOME}|g'			\
			-e 's|$${MAJORDOMO_USER}|${MAJORDOMO_USER}|g'	\
			-e 's|$${MAJORDOMO_GROUP}|${MAJORDOMO_GROUP}|g'	\

do-configure:
	${SED} ${CONFIGURE_SED} ${WRKSRC}/Makefile > ${WRKSRC}/Makefile.netbsd

post-build:
	${SED} ${CONFIGURE_SED} ${WRKSRC}/sample.cf > ${WRKSRC}/majordomo.cf
	${SED} ${CONFIGURE_SED} ${FILESDIR}/aliases.majordomo		\
		> ${WRKSRC}/aliases.majordomo
	${SED}	-e 's|$${PREFIX}|${PREFIX}|g'				\
		-e 's|$${HOME}|${HOME}|g'				\
		-e 's|$${MAJORDOMO_USER}|${MAJORDOMO_USER}|g'		\
		-e 's|$${MAJORDOMO_GROUP}|${MAJORDOMO_GROUP}|g'		\
		${PKGDIR}/MESSAGE > ${WRKSRC}/post-install-notes

post-install:
	${LN} -sf archive2.pl ${PREFIX}/libexec/majordomo/archive
	${INSTALL_DATA_DIR} ${DOCDIR}
.for file in ${DOCFILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCDIR}/${file}
.endfor
.for file in ${DOCDOCFILES}
	${INSTALL_DATA} ${WRKSRC}/Doc/${file} ${DOCDIR}/${file}
.endfor
	${INSTALL_DATA} ${WRKSRC}/post-install-notes ${DOCDIR}/post-install-notes
	${INSTALL} -d -m 775 -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} ${EXDIR}
.for dir in ${EXDIRS}
	${INSTALL} -d -m 775 -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} ${EXDIR}/${dir}
.endfor
	${INSTALL_DATA} -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		${WRKSRC}/aliases.majordomo ${EXDIR}/aliases.majordomo
	${INSTALL_DATA} -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		${FILESDIR}/keep_me ${EXDIR}/archives/example-l/.keep_me
	${INSTALL_DATA} -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		${FILESDIR}/keep_me ${EXDIR}/digests/example-l-digest/.keep_me
.for file in ${EXFILES}
	${INSTALL_DATA} -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		${FILESDIR}/${file} ${EXDIR}/lists/${file}
.endfor
.for file in ${EXLISTS}
	${INSTALL} -m 664 -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		/dev/null ${EXDIR}/lists/${file}
.endfor
	${LN} -sf example-l.info ${EXDIR}/lists/example-l-digest.info
	${LN} -sf example-l.passwd ${EXDIR}/lists/example-l-digest.passwd
	${INSTALL_DATA} -o ${MAJORDOMO_USER} -g ${MAJORDOMO_GROUP} \
		${WRKSRC}/majordomo.cf ${EXDIR}/majordomo.cf

# verify installation; requires interaction
test: install
	${PREFIX}/libexec/majordomo/wrapper config-test

.include "../../mk/bsd.pkg.mk"
