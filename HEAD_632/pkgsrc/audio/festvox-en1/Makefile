# $NetBSD: Makefile,v 1.23 2007/08/23 21:08:20 joerg Exp $

DISTNAME=	festvox_en1
PKGNAME=	festvox-en1-1.4.0
PKGREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://www.speech.cs.cmu.edu/festival/cstr/festival/1.4.1/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.cstr.ed.ac.uk/projects/festival/
COMMENT=	MBROLA based British English male voice for festival

DEPENDS+=	festival>=1.4.0:../../audio/festival
DEPENDS+=	festlex-poslex>=1.4.0:../../audio/festlex-poslex
DEPENDS+=	festlex-oald>=1.4.0:../../audio/festlex-oald
DEPENDS+=	mbrola-301h{,nb[0-9]*}:../../audio/mbrola
DEPENDS+=	mbrolavox-en1-980910{,nb[0-9]*}:../../audio/mbrolavox-en1

LICENSE=	no-commercial-use

WRKSRC=		${WRKDIR}/festival
NO_BUILD=	yes

FHOME=		${PREFIX}/share/festival
MBROLA=		${FHOME}/lib/voices/english/en1_mbrola

post-extract:
	${CHMOD} -R a+r ${WRKSRC}
	${FIND} ${WRKSRC} -type d -print | ${XARGS} ${CHMOD} 755

do-install:
	cd ${WRKSRC} && ${PAX} -rw * ${FHOME}
#ugh
	${LN} -fs ../../../../../mbrola/voices/en1 ${MBROLA}
	${LN} -fs ../../../../../mbrola/voices/en1/en1mrpa ${MBROLA}

.include "../../mk/bsd.pkg.mk"
