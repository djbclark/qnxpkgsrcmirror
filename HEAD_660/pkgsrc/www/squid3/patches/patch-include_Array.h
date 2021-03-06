$NetBSD: patch-include_Array.h,v 1.1 2013/07/15 17:56:45 joerg Exp $

Implement enough of the iterator contract to allow building with libc++.

--- include/Array.h.orig	2013-07-14 20:39:37.000000000 +0000
+++ include/Array.h
@@ -42,12 +42,19 @@
 #include "compat/assert.h"
 
 /* iterator support */
+#include <iterator>
 
 template <class C>
 class VectorIteratorBase
 {
 
 public:
+    typedef typename C::value_type value_type;
+    typedef std::forward_iterator_tag iterator_category;
+    typedef typename C::pointer pointer;
+    typedef typename C::reference reference;
+    typedef typename C::difference_type difference_type;
+
     VectorIteratorBase();
     VectorIteratorBase(C &);
     VectorIteratorBase(size_t, C &);
@@ -79,8 +86,10 @@ class Vector
 public:
     typedef E value_type;
     typedef E* pointer;
+    typedef E& reference;
     typedef VectorIteratorBase<Vector<E> > iterator;
     typedef VectorIteratorBase<Vector<E> const> const_iterator;
+    typedef ptrdiff_t difference_type;
 
     void *operator new (size_t);
     void operator delete (void *);
