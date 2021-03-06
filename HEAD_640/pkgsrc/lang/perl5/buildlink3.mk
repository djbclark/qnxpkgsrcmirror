# $NetBSD: buildlink3.mk,v 1.43 2008/10/19 19:10:42 he Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PERL5_BUILDLINK3_MK:=	${PERL5_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	perl
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nperl}
BUILDLINK_PACKAGES+=	perl
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}perl

.if !empty(PERL5_BUILDLINK3_MK:M+)
.include "../../mk/bsd.fast.prefs.mk"
PERL5_REQD+=			5.10.0
.for _perl5_ver_ in ${PERL5_REQD}
BUILDLINK_API_DEPENDS.perl+=	perl>=${_perl5_ver_}
.endfor
# Prevent p5-* etc. packages built for 5.10.0 to be used
# with the next incompatible version of perl:
BUILDLINK_API_DEPENDS.perl+=    perl<5.12.0

BUILDLINK_PKGSRCDIR.perl?=	../../lang/perl5

FIND_PREFIX:=	PERLDIR=perl
.include "../../mk/find-prefix.mk"
PERL5=		${PERLDIR}/bin/perl

PERL5_OPTIONS?=		# empty
.  if !empty(PERL5_OPTIONS:Mthreads)
INSTALL_TEMPLATES+=	${.CURDIR}/../../lang/perl5/files/install_threads.tmpl
.  endif

.  if ${PKG_INSTALLATION_TYPE} == "overwrite"
#
# Perl keeps headers and odd libraries in an odd path not caught by the
# default BUILDLINK_FILES_CMD, so name them to be symlinked into
# ${BUILDLINK_DIR}.
#
.include "../../lang/perl5/vars.mk"
BUILDLINK_FILES.perl=							\
	${PERL5_SUB_INSTALLARCHLIB}/CORE/*				\
	${PERL5_SUB_INSTALLARCHLIB}/auto/DynaLoader/DynaLoader.a
.  endif
.endif  # PERL5_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
