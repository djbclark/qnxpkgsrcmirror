# $NetBSD: builtin.mk,v 1.3 2007/02/22 19:27:08 wiz Exp $

BUILTIN_PKG:=	mit-krb5

BUILTIN_FIND_FILES_VAR:=		H_MIT_KRB5 SH_KRB5_CONFIG
BUILTIN_FIND_FILES.H_MIT_KRB5=		/usr/include/krb5.h
BUILTIN_FIND_GREP.H_MIT_KRB5=		Massachusetts Institute of Technology
BUILTIN_FIND_FILES.SH_KRB5_CONFIG=	/usr/bin/krb5-config
BUILTIN_FIND_GREP.SH_KRB5_CONFIG=	^[ 	]*--version)

.include "../../mk/buildlink3/bsd.builtin.mk"

###
### Determine if there is a built-in implementation of the package and
### set IS_BUILTIN.<pkg> appropriately ("yes" or "no").
###
.if !defined(IS_BUILTIN.mit-krb5)
IS_BUILTIN.mit-krb5=	no
.  if empty(H_MIT_KRB5:M__nonexistent__) && empty(H_MIT_KRB5:M${LOCALBASE}/*)
IS_BUILTIN.mit-krb5=	yes
.  endif
.endif
MAKEVARS+=	IS_BUILTIN.mit-krb5

###
### If there is a built-in implementation, then set BUILTIN_PKG.<pkg> to
### a package name to represent the built-in package.
###
.if !defined(BUILTIN_PKG.mit-krb5) && \
    !empty(IS_BUILTIN.mit-krb5:M[yY][eE][sS])
.  if empty(SH_KRB5_CONFIG:M__nonexistent__)
BUILTIN_VERSION.mit-krb5!=	${SH_KRB5_CONFIG} --version | \
				${SED} -e 's/.*release //' -e 's/-.*//'
.  endif
BUILTIN_VERSION.mit-krb5?=	1.4.0
BUILTIN_PKG.mit-krb5=		mit-krb5-${BUILTIN_VERSION.mit-krb5}
.endif
MAKEVARS+=	BUILTIN_PKG.mit-krb5

###
### Determine whether we should use the built-in implementation if it
### exists, and set USE_BUILTIN.<pkg> appropriate ("yes" or "no").
###
.if !defined(USE_BUILTIN.mit-krb5)
.  if ${PREFER.mit-krb5} == "pkgsrc"
USE_BUILTIN.mit-krb5=	no
.  else
USE_BUILTIN.mit-krb5=	${IS_BUILTIN.mit-krb5}
.    if defined(BUILTIN_PKG.mit-krb5) && \
        !empty(IS_BUILTIN.mit-krb5:M[yY][eE][sS])
USE_BUILTIN.mit-krb5=	yes
.      for _dep_ in ${BUILDLINK_API_DEPENDS.mit-krb5}
.        if !empty(USE_BUILTIN.mit-krb5:M[yY][eE][sS])
USE_BUILTIN.mit-krb5!=							\
	if ${PKG_ADMIN} pmatch ${_dep_:Q} ${BUILTIN_PKG.mit-krb5:Q}; then \
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
.        endif
.      endfor
.    endif
.  endif
.endif
MAKEVARS+=	USE_BUILTIN.mit-krb5
