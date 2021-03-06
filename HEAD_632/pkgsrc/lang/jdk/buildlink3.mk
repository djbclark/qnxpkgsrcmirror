# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 23:10:55 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
JDK_BUILDLINK3_MK:=	${JDK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	jdk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Njdk}
BUILDLINK_PACKAGES+=	jdk
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}jdk

.if !empty(JDK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.jdk+=	jdk>=1.1.8
BUILDLINK_PKGSRCDIR.jdk?=	../../lang/jdk
BUILDLINK_JAVA_PREFIX.jdk=	${PREFIX}/java/jdk-1.1.8

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_JAVA_PREFIX.jdk}

BUILDLINK_CPPFLAGS.jdk= \
	-I${BUILDLINK_JAVA_PREFIX.jdk}/include				\
	-I${BUILDLINK_JAVA_PREFIX.jdk}/include/netbsd
.endif	# JDK_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
