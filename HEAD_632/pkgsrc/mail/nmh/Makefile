# $NetBSD: Makefile,v 1.66 2007/11/17 12:04:13 rillig Exp $

DISTNAME=		nmh-1.0.4
PKGREVISION=		7
CATEGORIES=		mail
MASTER_SITES=		ftp://ftp.mhost.com/pub/nmh/ \
			ftp://ftp.gw.com/pub/unix/mail/mh/nmh/

MAINTAINER=		kim@tac.nyc.ny.us
HOMEPAGE=		http://www.nongnu.org/nmh/
COMMENT=		Cleaned up MH mailer suite

CONFLICTS=		ja-mh-[0-9]*
CONFLICTS+=		ja-mh6-[0-9]*

USE_TOOLS+=		lex

# We choose DOT_LOCKING in our patches because ".lock" files are
# the most common locking mechanism supported by mail software.
# It also works well over NFS.

# Locks supported by `mail.local' are ".lock" and flock(2).

.include "../../mk/bsd.prefs.mk"
# Avoids SEGV in nmh's private version of strcasecmp() under gcc4
.if !empty(PKGSRC_COMPILER:Mgcc*)
CFLAGS+=		-O1
.endif

.if ${OPSYS} == "IRIX"
CPPFLAGS+=		-DIRIX5 # for a patch with extra typedefs
.endif

.include "options.mk"

# Mail Transport Agent - either "smtp" or "sendmail"
NMH_MTA?=		smtp

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--libdir=${PREFIX}/libexec/nmh
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}
CONFIGURE_ARGS+=	--enable-nmh-pop
CONFIGURE_ARGS+=	--with-mts=${NMH_MTA:Q}

.if defined(NMH_EDITOR)
CONFIGURE_ARGS+=	--with-editor=${NMH_EDITOR:Q}
.endif

.if defined(NMH_PAGER)
CONFIGURE_ARGS+=	--with-pager=${NMH_PAGER:Q}
.endif

.if defined(KERBEROS)
PKG_USE_KERBEROS=	yes
.if ${OPSYS} == "NetBSD"
LIBS+=			-lroken -lcrypt -lcom_err
.endif
CONFIGURE_ARGS+=	--with-krb4
.else
CONFIGURE_ARGS+=	--without-krb4
.endif

DOCDIR=			share/doc/nmh
EGDIR=		${PREFIX}/share/examples/nmh

BUILD_DEFS+=		NMH_MTA NMH_EDITOR NMH_PAGER NMH_HASH_BACKUP

PKG_SYSCONFSUBDIR=	nmh
CONF_FILES=		# empty
.for f in		MailAliases		\
			components		\
			digestcomps		\
			distcomps		\
			forwcomps		\
			mhl.body		\
			mhl.digest		\
			mhl.format		\
			mhl.forward		\
			mhl.headers		\
			mhl.reply		\
			mhn.defaults		\
			mts.conf		\
			rcvdistcomps		\
			rcvdistcomps.outbox	\
			replcomps		\
			replgroupcomps		\
			scan.MMDDYY		\
			scan.YYYYMMDD		\
			scan.default		\
			scan.mailx		\
			scan.nomime		\
			scan.size		\
			scan.time		\
			scan.timely		\
			scan.unseen		\
			tmac.h
CONF_FILES+=		${EGDIR}/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

# This hopefully makes sure the permissions and ownership are right.
pre-install:
	${INSTALL_DATA_DIR} ${EGDIR}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${DOCDIR}
	for f in `${GREP} '^${DOCDIR}/' ${PKGDIR}/PLIST`; do \
	    ${INSTALL_DATA} ${WRKSRC}/`${BASENAME} $$f` ${PREFIX}/${DOCDIR}; \
	done
	${INSTALL_DATA} ${FILESDIR}/mhn.defaults.dist ${EGDIR}/mhn.defaults

.include "../../mk/bsd.pkg.mk"
