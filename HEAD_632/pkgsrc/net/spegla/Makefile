# $NetBSD: Makefile,v 1.7 2005/04/11 21:47:00 tv Exp $

DISTNAME=		spegla-1.1p4
CATEGORIES=		net
MASTER_SITES=		ftp://subzero.campus.luth.se/pub/spegla/

MAINTAINER=		jnilsson@ludd.luth.se
COMMENT=		Mirror program for FTP sites (written in C)

MANCOMPRESSED_IF_MANZ=	yes
PLIST_SRC=		${WRKDIR}/PLIST
BUILDLINK_TRANSFORM+=	rm:-Werror

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	MANINSTALL

post-install:
	@${CP} ${PKGDIR}/PLIST ${PLIST_SRC}
	@for OPT in ${MANINSTALL} x; do \
	  case $$OPT in \
	    catinstall) ${ECHO} man/cat1/spegla.0 >>${PLIST_SRC};; \
	    maninstall) ${ECHO} man/man1/spegla.1 >>${PLIST_SRC};; \
	  esac; \
	done

.include "../../mk/bsd.pkg.mk"
