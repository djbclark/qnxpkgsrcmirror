# $NetBSD: Makefile,v 1.1 2007/03/07 21:22:20 rillig Exp $
#

DISTNAME=	subst-1.0
CATEGORIES=	regress
DISTFILES=	# none

MAINTAINER=	rillig@NetBSD.org
COMMENT=	Test the SUBST framework

NO_CHECKSUM=	yes
WRKSRC=		${WRKDIR}
USE_TOOLS+=	diff

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	do-build
SUBST_FILES.vars=	vars
SUBST_VARS.vars=	PLAIN DQUOT SQUOT DELIM EVIL1

.include "${.PARSEDIR}/vars.mk"

pre-build:
	for v in ${SUBST_VARS.vars}; do echo "$$v=@$$v@"; done > ${WRKSRC}/vars

do-build:
	@${DO_NADA}

post-build:
	diff vars.mk ${WRKSRC}/vars

.include "../../mk/bsd.pkg.mk"
