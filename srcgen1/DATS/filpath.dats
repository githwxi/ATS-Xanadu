(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#include
"./../HATS/xatsopt.hats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
extern
castfn
UN_string_vt2t
{l:agz}
(cs: !strptr(l)):<> String0
//
(* ****** ****** *)
//
#staload
"./../UTIL/SATS/mylibc0.sats"
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/xsymbol.sats"
//
  typedef symbol = $SYM.symbol
//
(* ****** ****** *)

#staload "./../SATS/filpath.sats"

(* ****** ****** *)

local
//
#if
SYSTEM_IS_POSIX_LIKE
#then
//
val theDirSep: char = '/'
val theCurDir: string = "."
val theParDir: string = ".."
//
#endif

in (* in of [local] *)

implement theDirSep_get() = theDirSep
implement theCurDir_get() = theCurDir
implement theParDir_get() = theParDir

end // end of [local]

(* ****** ****** *)

#define CNUL '\000'

(* ****** ****** *)
//
(*
HX-2020-05-02:
This one is full of hacks.
Note that the front dot in
a path is not removed.
*)
//
implement
fpath_normalize
  (fp0) = let
//
#if(__XATSOPT_DEBUG__)
//
(*
val () =
println!
("fpath_normalize: fp0 = ", fp0)
*)
//
#endif//__XATSOPT_DEBUG__
//
val
fp1 = aux0(fp1)
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("fpath_normalize: fp1 = ", fp1)
*)
#endif//__XATSOPT_DEBUG__
//
in
  fp1
end where
{
//
vtypedef
dirs =
List0_vt(Strptr1)
//
val
fp1 = string2ptr(fp0)
//
val
DSP = theDirSep_get()
val
CDR = theCurDir_get()
val
PDR = theParDir_get()
//
//
fun
getc
(p0: ptr): char =
$UN.ptr0_get<char>(p0)
fun
putc
( p0: ptr
, c0: char): ptr =
(
  ptr0_succ<char>(p0)
) where
{
val () =
$UN.ptr0_set<char>(p0, c0)
}
//
fun
gets
( p0: ptr
, p1: ptr): Strptr1 =
let
//
val
bsz =
ptr0_diff<char>(p1, p0)
val
bsz = $UN.cast{Size}(bsz)
val
( pfat
, pfgc | q0) = malloc_gc(bsz+1)
//
fun
loop
( p0: ptr
, q0: ptr): void =
if
p0 < p1
then
let
val c0 =
$UN.ptr0_get<char>(p0)
val () =
$UN.ptr0_set<char>(q0, c0)
in
  loop
  ( ptr0_succ<char>(p0)
  , ptr0_succ<char>(q0))
end
else
(
  $UN.ptr0_set<char>(q0, CNUL)
)
//
in
let
val () = loop(p0, q0)
in
$UN.castvwtp0(@(pfat, pfgc | q0))
end
end // end of [gets]
//
fun
puts
( p0: ptr
, cs: string): ptr =
(
loop
( p0
, string2ptr(cs))
) where
{
//
fun
loop
( p0: ptr
, q0: ptr): ptr =
let
val c0 = getc(q0)
in
if
iseqz(c0)
then p0 else
let
val p1 = putc(p0, c0)
val q1 =
ptr0_succ<char>(q0) in loop(p1, q1)
end
end // end of [loop]
//
} (* end of [puts] *)
//
fun
isDSP
( c0
: char): bool =
( c0 = DSP )
fun
isCDR
( dir
: !Strptr1): bool =
(
CDR =
$UN.strptr2string(dir))
fun
isPDR
( dir
: !Strptr1): bool =
(
PDR =
$UN.strptr2string(dir))
//
//
val
isabs = isDSP(getc(fp1))
//
fun
dirln
( dir
: !Strptr1): Size =
let
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
(
"dirln = "
, UN_string_vt2t(dir))
*)
#endif//__XATSOPT_DEBUG__
//
in
string_length
($UN.strptr2string(dir))
end
//
fun
aux0
(p0: ptr): string =
if
isabs
then
let
  val
  p0 =
  ptr0_succ<char>(p0)
  val npar = 0
  val dirs = list_vt_nil()
in
  aux1(p0, p0, npar, dirs)
end // then
else
let
  val npar = 0
  val dirs = list_vt_nil()
in
  aux1(p0, p0, npar, dirs)
end // else
// end of [aux0]
//
and
aux1
( p0: ptr
, p1: ptr
, npar: int
, dirs: dirs
) : string =
let
val c1 = getc(p1)
in
//
if
iseqz(c1)
then
(
aux3(p0, p1, npar, dirs)
)
else
(
if
isDSP(c1)
then
aux2(p0, p1, npar, dirs)
else
let
  val p1 =
  ptr0_succ<char>(p1)
in
  aux1(p0, p1, npar, dirs)
end
)
//
end // end of [aux1]
//
and
aux2
( p0: ptr
, p1: ptr
, npar: int
, dirs: dirs
) : string =
let
val
dir0 = gets(p0, p1)
//
val p0 =
ptr0_succ<char>(p1)
//
in
if
isCDR(dir0)
then
let
val dirs =
(
case+ dirs of
|
list_vt_nil() =>
(
if
isabs
then
let
val()=free(dir0) in dirs
end
else
(
 list_vt_cons(dir0, dirs)
) // end of [if]
)
|
list_vt_cons _ =>
let
val()=free(dir0) in dirs
end
) : dirs // end of [val]
in
  aux1(p0, p0, npar, dirs)
end
else
(
if
isPDR(dir0)
then
(
case+ dirs of
| ~
list_vt_nil
((*void*)) =>
let
  val () =
  strptr_free(dir0)
  val npar = npar + 1
  val dirs = list_vt_nil()
in
  aux1(p0, p0, npar, dirs)
end
| @
list_vt_cons
(dir1, dirx) =>
if
isCDR(dir1)
then
let
  val () =
  strptr_free(dir0)
  val npar = npar + 1
in
  fold@{..}(dirs);
  aux1(p0, p0, npar, dirs)
end
else
let
  val () =
  strptr_free(dir0)
  val () =
  strptr_free(dir1)
  val dirx = (dirx)
in
  free@{..}{0}(dirs);
  aux1(p0, p0, npar, dirx)
end
)
else
aux1
( p0, p0
, npar, list_vt_cons(dir0, dirs))
)
end
//
and
aux3
( p0: ptr
, p1: ptr
, npar: int
, dirs: dirs
) : string =
let
val
base = gets(p0, p1)
val
dirs =
list_vt_reverse(dirs)
in
  aux4(npar, dirs, base)
end
//
and
aux4
( npar: int
, dirs: dirs
, base: Strptr1
) : string =
let
//
val n0 =
dirln(base)
val n0 =
(
  loop1(n0, dirs)
) where
{
fun
loop1
( n0: Size
, xs: !dirs): Size =
(
case+ xs of
| list_vt_nil() => succ(n0)
| list_vt_cons(x0, xs) =>
  loop1(n0+succ(dirln(x0)), xs)
)
}
//
val
iscdr =
(
  auxcdr(dirs)
) where
{
fun
auxcdr
(xs: !dirs): bool =
(
case+ xs of
|
list_vt_nil
  () => false
|
list_vt_cons
  (x0, xs) => isCDR(x0)
)
} (*where*) // end-of-val
//
local
val
npar =
$UN.cast{Size}(npar)
in
val n0 =
n0 +
npar *
succ(string_length(PDR))
end
//
val n0 =
$UN.cast{Size}(n0)
val n0 =
(
if
isabs
then
succ(n0) else n0): Size
//
val
(
pfat
,
pfgc|q0) = malloc_gc(n0)
//
val q1 =
(
if
isabs
then putc(q0, DSP) else q0
) : ptr // end-of-val
//
val q1 =
(
if
iscdr
then
let
val q1 =
puts(q1, CDR)
in
putc(q1, DSP) end else q1): ptr
//
val dirs =
(
if
iscdr
then
(
case-
dirs of
| ~
list_vt_cons
(x0, xs) =>
let
val () =
free(x0) in xs end) else dirs): dirs
//
val q1 =
loop2(q1, npar) where
{
fun
loop2
( q1: ptr
, npar: int): ptr =
if
(npar <= 0)
then q1 else
let
  val
  npar = npar-1
  val q1 =
  puts(q1, PDR)
  val q1 =
  putc(q1, DSP) in loop2(q1, npar)
end // end of [if]
}
//
val q1 =
loop3(q1, dirs) where
{
fun
loop3
( q1: ptr
, dirs: dirs): ptr =
(
case+ dirs of
| ~list_vt_nil() => q1
| ~list_vt_cons(dir0, dirs) =>
   let
   val
   dir1 =
   $UN.strptr2string(dir0)
   val q1 = puts(q1, dir1)
   val () = strptr_free(dir0)
   in
   let
   val q1 =
   putc(q1, DSP) in loop3(q1, dirs)
   end
   end
) (* end of [loop3] *)
}
//
local
val base =
$UN.strptr2string(base)
in
val q1 = puts(q1, base)
end
val q1 = putc(q1, CNUL)
val () = strptr_free(base)
//
in
  $UN.castvwtp0((pfat, pfgc | q0))
end // end of [aux4]
//
} (* end of [fpath_normalize] *)

(* ****** ****** *)

local

absimpl
dirpath_type = string

(* ****** ****** *)

in (*in-of-local*)

(* ****** ****** *)
//
implement
the_dirpath_dummy = ""
//
implement
dirpath_make(dp0) = dp0
//
(* ****** ****** *)
//
implement
dirpath_get_name(dir) = dir
//
(* ****** ****** *)
//
implement
print_dirpath(dir) =
fprint_dirpath(stdout_ref, dir)
implement
prerr_dirpath(dir) =
fprint_dirpath(stderr_ref, dir)
//
(* ****** ****** *)
//
implement
fprint_dirpath(out, dir) = fprint!(out, dir)
implement
fprintln_dirpath(out, dir) = fprintln!(out, dir)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
filpath_type = $rec
{ filpath_kind= int
, filpath_givename= string // given name
, filpath_fullname= string // in raw form
, filpath_fullpath= symbol // is normalized
} (* end of [filpath_type] *)

in (* in-of-local *)
//
implement
filpath_get_given
  (fp0) = fp0.filpath_givename
implement
filpath_get_full1
  (fp0) = fp0.filpath_fullname
implement
filpath_get_full2
  (fp0) = fp0.filpath_fullpath
//
end // end of [local]

(* ****** ****** *)

local

fun
auxmain
( cs
: string): string =
let
//
val
NUL = '\000'
val
sep = theDirSep_get()
//
fun
aux1
(p0: ptr): ptr =
let
val p1 =
ptr0_succ<char>(p0)
val c0 =
$UN.ptr0_get<char>(p0)
in
ifcase
| (c0=NUL) =>
  the_null_ptr
| (c0=sep) =>
  aux2(p0, p1) | _ => aux1(p1)
end
//
and
aux2
( p0: ptr
, p1: ptr): ptr =
let
val p2 =
ptr0_succ<char>(p1)
val c1 =
$UN.ptr0_get<char>(p1)
in
ifcase
| (c1=NUL) => p0
| (c1=sep) =>
  aux2(p1, p2) | _ => aux2(p0, p2)
end
//
val p0 =
string2ptr(cs)
//
val p1 = aux1(p0)
//
in
  if
  iseqz(p1)
  then theCurDir_get()
  else xatsopt_strbtwe(p0, p1)
end // end of [auxmain]

in (*in-of-local*)

implement
filpath_get_dirname(fp0) =
$effmask_all
(
auxmain
($SYM.symbol_get_name(fp0.full2()))
) (* end of [filpath_get_dirname] *)

end // end of [local]

(* ****** ****** *)

local

fun
issfx
( fp0: filpath
, sfx: string): bool = let
//
val nm = fp0.given()
val p0 = string2ptr(nm)
val n0 = string_length(nm)
val n1 = string_length(sfx)
//
in
  if n0 < n1
    then false
    else let
      val p1 =
      ptr_add<char>(p0, n0-n1)
    in
      iseqz(strcmp($UN.cast{string}(p1), sfx))
    end // end of [else]
end // end of [issfix]

in (* in-of-local *)

implement
filpath_is_cats(fp0) =
$effmask_all(issfx(fp0, ".cats"))
implement
filpath_is_sats(fp0) =
$effmask_all(issfx(fp0, ".sats"))
implement
filpath_is_dats(fp0) =
$effmask_all(issfx(fp0, ".dats"))

end // end of [local]

(* ****** ****** *)

local
//
absimpl
the_dirpathlst_v = unit_v
//
val
the_dirpath =
ref<dirpath>(the_dirpath_dummy)
val
the_dirpathlst =
ref<List0_vt(dirpath)>(list_vt_nil())
//
in (* in-of-local *)

(* ****** ****** *)
//
implement
the_dirpath_get
  ((*void*)) = the_dirpath[]
//
(* ****** ****** *)
//
implement
the_dirpathlst_pout
(
  pf | (*none*)
) = let
//
prval unit_v() = pf
//
in
  the_dirpathlst_ppout((*void*))
end // end of [the_dirpathlst_pout]
//
implement
the_dirpathlst_ppout
  ((*none*)) = let
//
val dp = x0 where {
//
  val
  (vbox pf | p0) =
  ref_get_viewptr(the_dirpathlst)
//
  val-
  ~list_vt_cons(x0, xs) = !p0
  val ((*void*)) = (!p0 := xs)
//
} (* end of [val] *)
//
val () = the_dirpath[] := dp
//
in
  // nothing
end // end of [the_dirpathlst_ppout]
//
(* ****** ****** *)
//
implement
the_dirpathlst_push(dp) =
let
//
val () =
the_dirpathlst_ppush(dp) in (unit_v() | ())
//
end // end of [the_dirpathlst_push]
//
implement
the_dirpathlst_ppush(dp) =
let
  val x0 = the_dirpath[]
  val () = the_dirpath[] := dp
  val (vbox pf | p0) = ref_get_viewptr(the_dirpathlst)
  val () = !p0 := list_vt_cons(x0, !p0)
in
  // nothing
end // end of [the_dirpathlst_ppush]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
the_dirpathlst_ppush_cwd
  ((*void*)) =
(
  the_dirpathlst_ppush(dir)
) where
{
  val dir = dirpath_make(theCurDir_get())
} (* end of [the_dirpathlst_ppush_cwd] *)
//
(* ****** ****** *)

local

val
the_includes =
ref<dirpathlst>(list_nil())

in (* in-of-local *)
//
implement
the_includes_get
((*void*)) = the_includes[]
//
implement
the_includes_pout
((*void*)) =
let
  val dps = the_includes[]
in
//
case+ dps of
| list_nil
  ((*void*)) => ()
| list_cons
  (dp0, dps) => the_includes[] := dps
//
end // end of [the_includes]
implement
the_includes_push
  ( dir ) = let
  val dps = the_includes[]
  val dp0 = dirpath_make(dir)
in
  the_includes[] := list_cons(dp0, dps)
end // end of [the_includes]
//
end // end of [local]

(* ****** ****** *)

implement
filpath_dirbase
  (dir, base) =
(
strptr2string(fpath)
) where
{
val fpath =
filpath_dirbase_vt(dir, base)
} (* end of [filpath_dirbase] *)

(* ****** ****** *)

local
//
%{^
typedef char *charptr;
%} (* %{^ *)
abstype
charptr = $extype"charptr"
//
in (* in-of-local *)
//
implement
filpath_dirbase_vt
  (dir0, base) = let
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("filpath_dirbase_vt: dir0 = ", dir0)
val () =
println!
("filpath_dirbase_vt: base = ", base)
*)
#endif//__XATSOPT_DEBUG__
//
val
dir0 = g1ofg0(dir0)
val
base = g1ofg0(base)
//
val n1 = length(dir0)
val n2 = length(base)
//
val sep = theDirSep_get()
//
val sepd =
(
if
(n1 > 0)
then (dir0[n1-1] = sep) else false
) : bool // end of [val]
//
val n12 =
(
if sepd then (n1+n2+1) else (n1+n2+2)
) : Size_t // end of [val]
//
val dir0 = $UN.cast{charptr}(dir0)
val base = $UN.cast{charptr}(base)
//
in
//
if
sepd
then let
  val
  (pf,fpf|p0) = malloc_gc(n12)
  val _(*n12*) =
  $extfcall(int, "sprintf", p0, "%s%s", dir0, base)
in
  $UN.castvwtp0((pf, fpf | p0))
end // end of [then]
else let
  val
  (pf, fpf | p0) = malloc_gc(n12)
  val _(*n12*) =
  $extfcall(int, "sprintf", p0, "%s/%s", dir0, base)
in
  $UN.castvwtp0((pf, fpf | p0))
end // end of [then]
//
end // end of [filpath_dirbase_vt]

end // end of [local]

(* ****** ****** *)
//
implement
eq_filpath_filpath
  (x, y) = (cmp(x, y) = 0)
implement
neq_filpath_filpath
  (x, y) = (cmp(x, y) != 0)
//
(* ****** ****** *)

implement
cmp_filpath_filpath
  (x1, x2) = let
//
val f1 =
$SYM.symbol_get_name(x1.full2())
//
val f2 =
$SYM.symbol_get_name(x2.full2())
//
in
  compare_string_string(f1, f2)
end // end of [compare_filpath_filpath]

(* ****** ****** *)

local

absreimpl filpath_type

in (* in-of-local *)

implement
the_filpath_dummy = $rec{
  filpath_kind= 0
, filpath_givename= ""
, filpath_fullname= ""
, filpath_fullpath= $SYM.symbol_nil
} // end of [the_filpath_dummy]

implement
the_filpath_stdin = $rec{
  filpath_kind= 0
, filpath_givename= "__STDIN__"
, filpath_fullname= "__STDIN__"
, filpath_fullpath= $SYM.STDIN_fp_symbol
} // end of [the_filpath_stdin]

implement
the_filpath_string = $rec{
  filpath_kind= 0
, filpath_givename= "__STRING__"
, filpath_fullname= "__STRING__"
, filpath_fullpath= $SYM.STRING_fp_symbol
} // end of [the_filpath_string]

implement
filpath_make
(
  given, fname1
) = let
//
val
fname2 =
fpath_normalize(fname1)
val
fname2 =
$SYM.symbol_make(fname2)
//
in '{
  filpath_kind= 0
, filpath_givename= given
, filpath_fullname= fname1
, filpath_fullpath= fname2
} end // end of [filename_make]

end // end of [local]

(* ****** ****** *)
//
implement
filpath_is_dummy(fp) =
$SYM.eq_symbol_symbol
  (fp.full2(), $SYM.symbol_nil)
implement
filpath_isnot_dummy(fp) =
$SYM.neq_symbol_symbol
  (fp.full2(), $SYM.symbol_nil)
//
(* ****** ****** *)
//
implement
filpath_is_stdin(fp) =
$SYM.eq_symbol_symbol
  (fp.full2(), $SYM.STDIN_fp_symbol)
//
(* ****** ****** *)
//
implement
print_filpath_full1
  (fp0) =
(
fprint_filpath_full1(stdout_ref, fp0)
)
implement
prerr_filpath_full1
  (fp0) =
(
fprint_filpath_full1(stderr_ref, fp0)
)
//
(* ****** ****** *)
//
implement
fprint_filpath_full1
  (out, fp0) =
(
  fprint_string(out, name)
) where
{
  val name = fp0.full1()
} (* end of [fprint_filpath_full1] *)
//
implement
fprintln_filpath_full1
  (out, fp0) =
(
  fprint_newline(out)
) where
{
  val () = fprint_filpath_full1(out, fp0)
}
//
(* ****** ****** *)
//
implement
print_filpath_full2
  (fp0) =
(
fprint_filpath_full2(stdout_ref, fp0)
)
implement
prerr_filpath_full2
  (fp0) =
(
fprint_filpath_full2(stderr_ref, fp0)
)
//
(* ****** ****** *)
//
implement
fprint_filpath_full2
  (out, fp0) =
(
  fprint_string(out, name)
) where
{
  val name =
  $SYM.symbol_get_name(fp0.full2())
} (* end of [fprint_filpath_full2] *)
//
implement
fprintln_filpath_full2
  (out, fp0) =
(
  fprint_newline(out)
) where
{
  val () = fprint_filpath_full2(out, fp0)
}
//
(* ****** ****** *)

local
//
absimpl
the_filpathlst_v = unit_v
//
val
the_filpath =
ref<filpath>(the_filpath_dummy)
val
the_filpathlst =
ref<List0_vt(filpath)>(list_vt_nil())
//
in (* in-of-local *)

(* ****** ****** *)
//
implement
the_filpath_get
  ((*void*)) = the_filpath[]
//
(* ****** ****** *)

implement
the_filpathlst_pout
(
  pf | (*none*)
) = let
//
prval unit_v() = pf
//
in
  the_filpathlst_ppout((*void*))
end // end of [the_filpathlst_pout]

implement
the_filpathlst_ppout
  ((*none*)) = let
//
val fp = x0 where {
//
  val
  (vbox pf | p0) =
  ref_get_viewptr(the_filpathlst)
//
  val-
  ~list_vt_cons(x0, xs) = !p0
  val ((*void*)) = (!p0 := xs)
//
} (* end of [val] *)
//
val () = the_filpath[] := fp
//
in
  // nothing
end // end of [the_filpathlst_ppout]

(* ****** ****** *)
//
implement
the_filpathlst_push(fp) =
let
//
val () =
the_filpathlst_ppush(fp) in (unit_v() | ())
//
end // end of [the_filpathlst_push]
//
implement
the_filpathlst_ppush(fp) =
let
  val x0 = the_filpath[]
  val () = the_filpath[] := fp
  val (vbox pf | p0) = ref_get_viewptr(the_filpathlst)
  val () = !p0 := list_vt_cons(x0, !p0)
in
  // nothing
end // end of [the_filpathlst_ppush]
//
(* ****** ****** *)

local

fun
filename_occurs
  (fp0: filpath): bool = let
//
fun
loop
{n:nat} .<n>.
(
  fps: !list_vt(filpath, n)
) :<> bool = (
//
case+ fps of
| list_vt_nil
    ((*void*)) => false
  // list_vt_nil
| list_vt_cons
    (fp1, fps) =>
  (
    (fp0 = fp1) orelse loop(fps)
  ) // list_vt_cons
//
) (* end of [loop] *)
//
in
  loop(!p0) where
  {
    val (vbox(pf)|p0) =
    ref_get_viewptr(the_filpathlst)
  }
end // end of [filename_occurs]

in (* in-of-local *)

implement
the_filpathlst_pushck
  (fp0) =
(
  pf | isexi
) where
{
//
val
(pf|()) =
the_filpathlst_push(fp0)
val
isexi =
(
  if
  filpath_isnot_dummy(fp0)
  then filename_occurs(fp0) else false
) : bool // end of [val]
//
} (* end of [the_filpathlst_pushck] *)

end // end of [local]

(* ****** ****** *)

implement
the_filpath_fprint
  (out) =
(
 fprintln_filpath_full2(out, fp)
) where
{
  val fp = !p0 where
  {
  val (vbox(pf)|p0) =
  ref_get_viewptr(the_filpath)
  }
}
//
implement
the_filpathlst_fprint
  (out) = let
//
  val (vbox(pf)|p0) =
  ref_get_viewptr(the_filpathlst)
//
in
$effmask_ref
(
 list_vt_foreach<filpath>(!p0)
) where
{
implement
list_vt_foreach$fwork<filpath><void>
  (fp, env) = fprintln_filpath_full2(out, fp)
}
end // end of [the_filpathlst_fprint]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_filpath.dats] *)
