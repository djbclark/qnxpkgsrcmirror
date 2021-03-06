# $NetBSD: buildlink3.mk,v 1.9 2009/03/20 19:24:51 joerg Exp $

BUILDLINK_TREE+=	python24

.if !defined(PYTHON24_BUILDLINK3_MK)
PYTHON24_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.python24+=	python24>=2.4
BUILDLINK_ABI_DEPENDS.python24?=	python24>=2.4.2nb4
BUILDLINK_PKGSRCDIR.python24?=	../../lang/python24

.if defined(BUILDLINK_DEPMETHOD.python)
BUILDLINK_DEPMETHOD.python24?=	${BUILDLINK_DEPMETHOD.python}
.endif

BUILDLINK_INCDIRS.python24+=	include/python2.4
BUILDLINK_LIBDIRS.python24+=	lib/python2.4/config
BUILDLINK_TRANSFORM+=		l:python:python2.4
.endif # PYTHON24_BUILDLINK3_MK

BUILDLINK_TREE+=	-python24

.include "../../mk/bsd.fast.prefs.mk"
.if ${OPSYS} != "IRIX"
.  include "../../mk/bdb.buildlink3.mk"
.endif

.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
