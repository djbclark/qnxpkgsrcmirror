$NetBSD: manual-libtool.m4,v 1.23 2008/11/19 01:26:52 chuck Exp $

Local pkgsrc changes:
- override the basename to point to the actual backend compiler,
  critical e.g. on Solaris
- portability fixes for print on Interix
- override for shlib naming policy on various platforms
- QNX support
- Interix3 support
- disable static linkage on OS X by default

--- libtool.m4.orig	2008-02-01 11:26:47.000000000 -0500
+++ libtool.m4	2008-12-15 10:57:02.000000000 -0500
@@ -249,7 +249,10 @@
     *) break;;
   esac
 done
-cc_basename=`$echo "X$cc_temp" | $Xsed -e 's%.*/%%' -e "s%^$host_alias-%%"`
+# Return the actual command name, not our pkgsrc wrapper name because several
+# decisions are made only based on compiler names
+new_cc_temp=`$cc_temp --wrappee-name 2>/dev/null` || new_cc_temp="$cc_temp"
+cc_basename=`$echo "X$new_cc_temp" | $Xsed -e 's%.*/%%' -e "s%^$host_alias-%%"`
 ])
 
 
@@ -474,11 +477,11 @@
 
   if test "X$echo" = Xecho; then
     # We didn't find a better echo, so look for alternatives.
-    if test "X`(print -r '\t') 2>/dev/null`" = 'X\t' &&
+    if test "X`(print -r - '\t') 2>/dev/null`" = 'X\t' &&
        echo_testing_string=`(print -r "$echo_test_string") 2>/dev/null` &&
        test "X$echo_testing_string" = "X$echo_test_string"; then
       # This shell has a builtin print -r that does the trick.
-      echo='print -r'
+      echo='print -r -'
     elif (test -f /bin/ksh || test -f /bin/ksh$ac_exeext) &&
 	 test "X$CONFIG_SHELL" != X/bin/ksh; then
       # If we have ksh, try running configure again with it.
@@ -1427,6 +1430,7 @@
 bsdi[[45]]*)
   version_type=linux
   need_version=no
+  need_lib_prefix=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
   soname_spec='${libname}${release}${shared_ext}$major'
   finish_cmds='PATH="\$PATH:/sbin" ldconfig $libdir'
@@ -1525,7 +1529,7 @@
   dynamic_linker=no
   ;;
 
-freebsd* | dragonfly*)
+freebsd*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
   if test -x /usr/bin/objformat; then
@@ -1539,7 +1543,7 @@
   version_type=freebsd-$objformat
   case $version_type in
     freebsd-elf*)
-      library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext} $libname${shared_ext}'
+      library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
       need_version=no
       need_lib_prefix=no
       ;;
@@ -1569,6 +1573,16 @@
   esac
   ;;
 
+dragonfly*)
+  version_type=linux # XXX tv this should be =linux; current selection has problems
+  need_version=no
+  need_lib_prefix=no
+  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=no
+  hardcode_into_libs=yes
+  ;;
+
 gnu*)
   version_type=linux
   need_lib_prefix=no
@@ -1637,15 +1651,22 @@
   hardcode_into_libs=yes
   ;;
 
+interix3*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
+  soname_spec='${libname}${release}${shared_ext}$major'
+  dynamic_linker='Interix 3.x ld.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  ;;
+
 irix5* | irix6* | nonstopux*)
   case $host_os in
     nonstopux*) version_type=nonstopux ;;
-    *)
-	if test "$lt_cv_prog_gnu_ld" = yes; then
-		version_type=linux
-	else
-		version_type=irix
-	fi ;;
+    *) version_type=irix ;;
   esac
   need_lib_prefix=no
   need_version=no
@@ -1710,11 +1731,11 @@
   ;;
 
 netbsd*)
-  version_type=sunos
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
-    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
+    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix2'
     finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
     dynamic_linker='NetBSD (a.out) ld.so'
   else
@@ -1738,14 +1759,16 @@
   version_type=linux
   need_lib_prefix=no
   need_version=no
+  sys_lib_search_path_spec="/lib /usr/lib"
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
+  dynamic_linker='QNX libc.so'
   soname_spec='${libname}${release}${shared_ext}$major'
   shlibpath_var=LD_LIBRARY_PATH
   shlibpath_overrides_runpath=yes
   ;;
 
 openbsd*)
-  version_type=sunos
+  version_type=linux
   sys_lib_dlsearch_path_spec="/usr/lib"
   need_lib_prefix=no
   # Some older versions of OpenBSD (3.3 at least) *do* need versioned libs.
@@ -1753,7 +1776,7 @@
     openbsd3.3 | openbsd3.3.*) need_version=yes ;;
     *)                         need_version=no  ;;
   esac
-  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
+  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
   finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
   shlibpath_var=LD_LIBRARY_PATH
   if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
@@ -1954,9 +1977,7 @@
 
       case $tagname in
       CXX)
-	if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
-	    ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
-	    (test "X$CXX" != "Xg++"))) ; then
+	if test -n "$CXX" && test "X$CXX" != "Xno" ; then
 	  AC_LIBTOOL_LANG_CXX_CONFIG
 	else
 	  tagname=""
@@ -2475,6 +2496,10 @@
   lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|\.a)$'
   ;;
 
+interix3*)
+  lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|\.a)$'
+  ;;
+
 irix5* | irix6* | nonstopux*)
   case $LD in
   *-32|*"-32 ") libmagic=32-bit;;
@@ -2505,7 +2530,7 @@
   ;;
 
 nto-qnx*)
-  lt_cv_deplibs_check_method=unknown
+  lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|S\.a)$'
   ;;
 
 openbsd*)
@@ -2712,21 +2737,10 @@
 # ---------------
 AC_DEFUN([_LT_AC_LANG_CXX],
 [AC_REQUIRE([AC_PROG_CXX])
-AC_REQUIRE([_LT_AC_PROG_CXXCPP])
+AC_REQUIRE([AC_PROG_CXXCPP])
 _LT_AC_SHELL_INIT([tagnames=${tagnames+${tagnames},}CXX])
 ])# _LT_AC_LANG_CXX
 
-# _LT_AC_PROG_CXXCPP
-# ------------------
-AC_DEFUN([_LT_AC_PROG_CXXCPP],
-[
-AC_REQUIRE([AC_PROG_CXX])
-if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
-    ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
-    (test "X$CXX" != "Xg++"))) ; then
-  AC_PROG_CXXCPP
-fi
-])# _LT_AC_PROG_CXXCPP
 
 # AC_LIBTOOL_F77
 # --------------
@@ -2864,7 +2878,7 @@
 AC_DEFUN([_LT_AC_LANG_CXX_CONFIG],
 [AC_LANG_PUSH(C++)
 AC_REQUIRE([AC_PROG_CXX])
-AC_REQUIRE([_LT_AC_PROG_CXXCPP])
+AC_REQUIRE([AC_PROG_CXXCPP])
 
 _LT_AC_TAGVAR(archive_cmds_need_lc, $1)=no
 _LT_AC_TAGVAR(allow_undefined_flag, $1)=
@@ -3350,6 +3364,16 @@
     _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
     _LT_AC_TAGVAR(archive_expsym_cmds, $1)='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
     ;;
+  interix3*)
+    # Oy, what a hack.
+    # Because shlibs are not compiled -fPIC due to broken code, we must
+    # choose an --image-base.  Otherwise, 0x10000000 will be chosen for
+    # all libraries, leading to runtime relocations -- slow and very
+    # memory consuming.  To do this, we pick a random 256KB-aligned
+    # start address between 0x50000000 and 0x6ffc0000 at link time.
+    _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+    _LT_AC_TAGVAR(archive_expsym_cmds, $1)='sed s,^,_, $export_symbols >$output_objdir/$soname.exp && $CC -shared $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file $wl$output_objdir/$soname ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+    ;;
   irix5* | irix6*)
     case $cc_basename in
       CC*)
@@ -3503,14 +3527,29 @@
     ;;
   netbsd*)
     if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+      # a.out is quite broken and goes directly to ld
       _LT_AC_TAGVAR(archive_cmds, $1)='$LD -Bshareable  -o $lib $predep_objects $libobjs $deplibs $postdep_objects $linker_flags'
       wlarc=
+      # Determine if we need to override the c++rt0 that is
+      # picked up by analysing output_verbose_link_cmds
+      if test -f ${PREFIX}/lib/c++rt0/c++rt0.o.PIC; then
+        cpprt0_file="${PREFIX}/lib/c++rt0/c++rt0.o.PIC"
+      else
+        cpprt0_file=
+      fi
       _LT_AC_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_AC_TAGVAR(hardcode_direct, $1)=yes
       _LT_AC_TAGVAR(hardcode_shlibpath_var, $1)=no
-    fi
-    # Workaround some broken pre-1.5 toolchains
     output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | grep conftest.$objext | $SED -e "s:-lgcc -lc -lgcc::"'
+    elif $CC -dumpspecs | grep -- '-lgcc -lc -lgcc' >/dev/null; then
+      # Workaround some broken pre-1.5 ELF toolchains
+      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | grep conftest.$objext | $SED -e "s:-lgcc -lc -lgcc::"'
+    else
+      # Modern ELF works sanely as-is
+      _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      _LT_AC_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+      output_verbose_link_cmd='echo'
+    fi
     ;;
   openbsd2*)
     # C++ shared libraries are fairly broken
@@ -3823,6 +3862,11 @@
     # FIXME: insert proper C++ library support
     _LT_AC_TAGVAR(ld_shlibs, $1)=no
     ;;
+  nto-qnx*)
+    _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+    _LT_AC_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    output_verbose_link_cmd='echo'
+    ;;
   *)
     # FIXME: insert proper C++ library support
     _LT_AC_TAGVAR(ld_shlibs, $1)=no
@@ -3985,6 +4029,21 @@
     esac
   done
 
+  case "$host_os" in
+  netbsd*)
+    if test -n "$cpprt0_file"; then
+      predep_objects_CXX=`eval echo $predep_objects_CXX | sed -e 's:/usr/lib/c++rt0.o:$cpprt0_file:'`
+    fi
+    ;;
+  interix3*)
+    # Interix installs completely hosed .la files for C++, so rather than
+    # hack all around it, let's just trust "g++" to DTRT.
+    predep_objects_CXX=
+    postdep_objects_CXX=
+    postdeps_CXX=
+    ;;
+  esac
+
   # Clean up.
   rm -f a.out a.exe
 else
@@ -5033,9 +5092,11 @@
 	[_LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-DDLL_EXPORT'])
       ;;
     darwin* | rhapsody*)
-      # PIC is the default on this platform
+      # PIC is the default on this platform, and static linking of
+      # binaries generally doesn't work
       # Common symbols not allowed in MH_DYLIB files
       _LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-fno-common'
+      _LT_AC_TAGVAR(lt_prog_compiler_static, $1)=''
       ;;
     *djgpp*)
       # DJGPP does not support shared libraries at all
@@ -5061,6 +5122,10 @@
 	;;
       esac
       ;;
+    interix3*)
+      # Interix 3.0-3.5 -fPIC option generates borked code.
+      # (Instead, shlibs are relocated at runtime.)
+      ;;
     *)
       _LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
       ;;
@@ -5139,6 +5204,8 @@
 	# This is c89, which is MS Visual C++ (no shared libs)
 	# Anyone wants to do a port?
 	;;
+      interix3*)
+	;;
       irix5* | irix6* | nonstopux*)
 	case $cc_basename in
 	  CC*)
@@ -5278,6 +5345,8 @@
 	;;
       vxworks*)
 	;;
+      nto-qnx*)
+	;;
       *)
 	_LT_AC_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
 	;;
@@ -5319,9 +5388,11 @@
       ;;
 
     darwin* | rhapsody*)
-      # PIC is the default on this platform
+      # PIC is the default on this platform, and static linking of
+      # binaries generally doesn't work
       # Common symbols not allowed in MH_DYLIB files
       _LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-fno-common'
+      _LT_AC_TAGVAR(lt_prog_compiler_static, $1)=''
       ;;
 
     interix[[3-9]]*)
@@ -5355,6 +5426,11 @@
       esac
       ;;
 
+    interix3*)
+      # Interix 3.0-3.5 -fPIC option generates borked code.
+      # (Instead, shlibs are relocated at runtime.)
+      ;;
+
     *)
       _LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
       ;;
@@ -5510,6 +5586,10 @@
       _LT_AC_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
       ;;
 
+    nto-qnx*)
+      _LT_AC_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+      ;;
+
     *)
       _LT_AC_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
       ;;
@@ -5791,6 +5871,17 @@
       fi
       ;;
 
+    interix3*)
+      # Oy, what a hack.
+      # Because shlibs are not compiled -fPIC due to broken code, we must
+      # choose an --image-base.  Otherwise, 0x10000000 will be chosen for
+      # all libraries, leading to runtime relocations -- slow and very
+      # memory consuming.  To do this, we pick a random 256KB-aligned
+      # start address between 0x50000000 and 0x6ffc0000 at link time.
+      _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+      _LT_AC_TAGVAR(archive_expsym_cmds, $1)='sed s,^,_, $export_symbols >$output_objdir/$soname.exp && $CC -shared $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file $wl$output_objdir/$soname.exp ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+      ;;
+
     netbsd*)
       if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
 	_LT_AC_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
@@ -5856,6 +5947,11 @@
       _LT_AC_TAGVAR(hardcode_shlibpath_var, $1)=no
       ;;
 
+    nto-qnx*)
+       _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+       _LT_AC_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+       ;;
+
     *)
       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
 	_LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
@@ -6210,6 +6306,21 @@
       fi
       ;;
 
+    interix3*)
+      # Oy, what a hack.
+      # Because shlibs are not compiled -fPIC due to broken code, we must
+      # choose an --image-base.  Otherwise, 0x10000000 will be chosen for
+      # all libraries, leading to runtime relocations -- slow and very
+      # memory consuming.  To do this, we pick a random 256KB-aligned
+      # start address between 0x50000000 and 0x6ffc0000 at link time.
+      _LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+      _LT_AC_TAGVAR(archive_expsym_cmds, $1)='sed s,^,_, $export_symbols >$output_objdir/$soname.exp && $CC -shared $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file $wl$output_objdir/$soname ${wl}--image-base,$(($RANDOM %4096/2*262144+1342177280)) -o $lib'
+      _LT_AC_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
+      _LT_AC_TAGVAR(hardcode_direct, $1)=yes
+      _LT_AC_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-h,$libdir'
+      _LT_AC_TAGVAR(hardcode_shlibpath_var, $1)=no
+      ;;
+
     irix5* | irix6* | nonstopux*)
       if test "$GCC" = yes; then
 	_LT_AC_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
@@ -6435,6 +6546,13 @@
       _LT_AC_TAGVAR(hardcode_shlibpath_var, $1)=no
       ;;
 
+    nto-qnx*)
+      _LT_AC_TAGVAR(archive_cmds, $1)='$LD -shared -o $lib $libobjs $deplibs $linker_flags'
+      _LT_AC_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
+      _LT_AC_TAGVAR(hardcode_direct, $1)=yes
+      _LT_AC_TAGVAR(hardcode_shlibpath_var, $1)=no
+      ;;
+
     *)
       _LT_AC_TAGVAR(ld_shlibs, $1)=no
       ;;
