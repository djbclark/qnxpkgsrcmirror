# $NetBSD: Makefile,v 1.4 2008/08/30 08:10:29 dholland Exp $

DISTNAME=		lilo-22.8.src
PKGREVISION=		1
PKGNAME=		${DISTNAME:S/.src//}
CATEGORIES=		sysutils
MASTER_SITES=		${MASTER_SITE_SUNSITE:=system/boot/lilo/} \
			http://home.san.rr.com/johninsd/pub/linux/lilo/

MAINTAINER=		reed@reedmedia.net
HOMEPAGE=		http://lilo.go.dyndns.org/
COMMENT=		Generic boot loader for Linux

# This is LInux LOader; it can load different operating systems.
# Build untested on other operating systems.
ONLY_FOR_PLATFORM=	Linux-*-*

WRKSRC=			${WRKDIR}/${PKGNAME_NOREV}

# Don't force perl for extra tool -- maybe a MESSAGE?
#USE_PERL5=		YES

#BUILD_DEPENDS+=		dev86>=0.16.10:../../devel/dev86
# bcc is old and doesn't have -v switch to indicate version
#BUILD_DEPENDS+=		bcc>=95.3.12:../../devel/bcc
BUILD_DEPENDS+=		bin86>=0.16.10:../../devel/bin86
BUILD_DEPENDS+=		nasm>=0.98:../../devel/nasm

USE_TOOLS+=		gmake perl:run
MAKE_ENV+=		ROOT=${PREFIX:Q}

CONF_FILES=		${PREFIX}/share/lilo/lilo.conf.example	${PKG_SYSCONFDIR}/lilo.conf

REPLACE_INTERPRETER+=	bash
REPLACE.bash.old=	.*/bin/bash
REPLACE.bash.new=	${SH}
REPLACE_FILES.bash=	mkrescue

REPLACE_INTERPRETER+=	perl
REPLACE.perl.old=	.*/bin/perl
REPLACE.perl.new=	${PERL5}
REPLACE_FILES.perl=	keytab-lilo.pl

post-patch:
	${CP} ${WRKSRC}/config.h ${WRKSRC}/config.h.orig
	${SED} -e "s:@@PREFIX@@:${PREFIX}:" \
		-e "s:@@PKG_SYSCONFDIR@@:${PKG_SYSCONFDIR}:" \
		< ${WRKSRC}/config.h.orig > ${WRKSRC}/config.h

# TODO: later handle boot directory too?
INSTALLATION_DIRS=	sbin ${PKGMANDIR}/man5 ${PKGMANDIR}/man8	\
			share/lilo share/doc/lilo

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lilo ${PREFIX}/sbin/lilo
	${INSTALL_SCRIPT} ${WRKSRC}/mkrescue ${PREFIX}/sbin/mkrescue
	${INSTALL_SCRIPT} ${WRKSRC}/keytab-lilo.pl ${PREFIX}/sbin/keytab-lilo
	${INSTALL_MAN} ${WRKSRC}/manPages/lilo.8 ${PREFIX}/${PKGMANDIR}/man8
	${INSTALL_MAN} ${WRKSRC}/manPages/lilo.conf.5 ${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_MAN} ${WRKSRC}/manPages/mkrescue.8 ${PREFIX}/${PKGMANDIR}/man8
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/lilo
	${INSTALL_DATA} ${WRKSRC}/sample/lilo.sample.conf ${PREFIX}/share/lilo
	${INSTALL_DATA} ${FILESDIR}/lilo.conf.example ${PREFIX}/share/lilo

.include "../../mk/bsd.pkg.mk"
