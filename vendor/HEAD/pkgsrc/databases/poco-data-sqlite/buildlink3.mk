# $NetBSD: buildlink3.mk,v 1.9 2013/10/19 09:06:56 adam Exp $

BUILDLINK_TREE+=	poco-data-sqlite

.if !defined(POCO_DATA_SQLITE_BUILDLINK3_MK)
POCO_DATA_SQLITE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.poco-data-sqlite+=	poco-data-sqlite>=1.3.5
BUILDLINK_ABI_DEPENDS.poco-data-sqlite+=	poco-data-sqlite>=1.4.2p1nb6
BUILDLINK_PKGSRCDIR.poco-data-sqlite?=	../../databases/poco-data-sqlite

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../databases/poco-data/buildlink3.mk"
.endif # POCO_DATA_SQLITE_BUILDLINK3_MK

BUILDLINK_TREE+=	-poco-data-sqlite
