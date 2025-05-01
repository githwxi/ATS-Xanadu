(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu May  1 08:24:29 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a:t0 >
a0ref_get(A0) =
a0ref_dtget<a>(A0)
//
#impltmp
< a:vt >
a0ref_exch(A0, x0) =
(
$UN.castlin10{a}(x1)
) where
{
//
val x1 =
(
  a0ref_dtget<a>(A0))
//
val x0 =
(
  $UN.castlin10{?a}(x0))
//
val A1 =
$UN.cast10{a0ref(?a)}(A0)
//
val () =
XATSOPT_a0ref_set{?a}(A1, x0)
where
{
#extern
fun
XATSOPT_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam() }
//
} (*where*) // a0ref_exch(A0, x0)
//
(* ****** ****** *)
//
#impltmp
< a:vt >
a0ref_make_1val(x0) =
a0ptr2ref(a0ptr_make0_1val<a>(x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_tabulate$f1un
(n0, fopr) =
(
strn_vt2t
(strn_vt_tabulate$f1un<>(n0, fopr)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_tabulate$f1un
{n0: i0}
(n0, fopr) =
(
UN_strn_vt_cast(p0))
where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val i0 = 0(*start*)
val () = loop(p0, i0)
//
} where
{
//
#sexpdef
stmp = strtmp1_vt
//
fnx
loop
{i0:nat
|i0<=n0}
.<n0-i0>.
( p0: stmp(n0)
, i0: sint(i0)): void =
(
if
(i0 < n0)
then
(
loop(p0, suc(i0))) where
{
val c0 = fopr(i0)
val () =
strtmp_vt_set$at<>(p0, i0, c0)
}
) (* end-of-of[loop(p0, i0)] *)
//
} (*where*)//end-of-[strn_vt_tabulate]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
fpath_char$strmize
  (  fpx  ) =
XATSOPT_fpath_char$strmize(fpx)
where{
#extern
fun
XATSOPT_fpath_char$strmize
( fpx
: fpath): strm_vt(char) = $extnam()
}(*where*)//end-of-[fpath_char$strmize(fpx)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
mya1sz_strmize
  (  asz  ) =
XATSOPT_mya1sz_strmize(asz)
where{
#extern
fun
XATSOPT_mya1sz_strmize
{ x0:t0 }
( asz
: mya1sz(x0)): strm_vt(x0) = $extnam()
}(*where*)//end-of-[impltmp(mya1sz_strmize)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_make_nil
  ((*void*)) =
XATSOPT_mydict_make_nil((*void*))
where{
#extern
fun
XATSOPT_mydict_make_nil
{ k0:t0 }
{ x0:t0 }
((*void*)): mydict(k0, x0) = $extnam()
}(*where*)//end-of-[impltmp(mydict_make_nil())]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_get_keys
  (  map  ) =
XATSOPT_mydict_get_keys(map)
where{
#extern
fun
XATSOPT_mydict_get_keys
{ k0:t0 }
{ x0:t0 }
( map
: mydict(k0, x0)): mya1sz(k0) = $extnam()
}(*where*)//end-of-[impltmp(mydict_get_keys(map))]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_search$opt
  (map, key) =
XATSOPT_mydict_search$opt(map, key)
where{
//
#typedef
map = mydict(k0, x0)
//
#extern
fun
XATSOPT_mydict_search$opt
{k0:t0}{x0:t0}
(map: map, key: k0): optn_vt(x0) = $extnam()
//
}(*where*)//end-of-[impltmp(mydict_search$opt(...))]
//
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_insert$any
 (map, key, itm) =
XATSOPT_mydict_insert$any(map, key, itm)
where{
//
#typedef
map = mydict(k0, x0)
//
#extern
fun
XATSOPT_mydict_insert$any
{k0:t0}{x0:t0}
(map: map, key: k0, itm: x0): void = $extnam()
//
}(*where*)//end-of-[impltmp(mydict_insert$any(...))]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k0:t0 }
{ x0:t0 }
gmap_strmize
<mydict(k0,x0)><k0><x0>(kxs) =
strm_vt_map0
(
(*
HX:
It should be
given the name:
[gmap_key$strmize]
*)
gmap_strmize_key
<mydict(k0,x0)><k0><x0>(kxs)
) where
{
#impltmp
map$fopr0<k0><(k0,x0)>(k0) =
let
val-
~optn_vt_cons(x0) =
mydict_search$opt<k0><x0>(kxs, k0) in (k0, x0)
end//let
}(*where*)
//end(impltmp(gmap_strmize<mydict(k0,x0)><k0><x0>(kxs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k0:t0 }
{ x0:t0 }
gmap_strmize_key
<mydict(k0,x0)><k0><x0>(kxs) =
(
  mya1sz_strmize<k0>(mydict_get_keys<k0><x0>(kxs)))
//end-of(impltmp(gmap_strmize_key<mydict(k0,x0)><k0><x0>(kxs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_xlibext_tmplib.dats] *)
(***********************************************************************)
