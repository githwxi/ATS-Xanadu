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
// Start Time: November, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/nmspace.sats"
//
(* ****** ****** *)
//
vtypedef
nmitmlst_vt = List0_vt(nmitm)
vtypedef
nmitmlst2_vt = List0_vt(nmitmlst_vt)
vtypedef
savednmlst_vt = List0_vt@(nmitmlst_vt, nmitmlst2_vt)
//
(* ****** ****** *)
//
fun
nmitmlst_vt_free
  .<>.
(
  xs: nmitmlst_vt
) :<!wrt> void =
(
  list_vt_free<nmitm>(xs)
)
//
fun
nmitmlst2_vt_free
  {n:nat} .<n>.
(
  xss: list_vt(nmitmlst_vt, n)
) :<!wrt> void = 
(
case+ xss of
| ~list_vt_nil((*void*)) => ()
| ~list_vt_cons(xs, xss) => let
    val () =
      nmitmlst_vt_free(xs) in nmitmlst2_vt_free(xss)
    // end of [val]
  end // end of [list_vt_cons]
) (* end of [nmitmlist2_vt_free] *)
//
(* ****** ****** *)

local
//
val
the_nmitmlst =
ref<nmitmlst_vt>(list_vt_nil())
//
val
the_nmitmlst2 =
ref<nmitmlst2_vt>(list_vt_nil())
//
val
the_savednmlst =
ref<savednmlst_vt>(list_vt_nil())
//
in (* in-of-local *)

(* ****** ****** *)

implement
the_nmspace_top
  () = x0 where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val-list_vt_cons(x0, _) = (!p)
} // end of [the_nmspace_top]

implement
the_nmspace_ins
  (x0) = () where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val () = !p := list_vt_cons(x0, !p)
} // end of [the_nmspace_ins]

(* ****** ****** *)

implement
the_nmspace_find
  {a}(fopr) = let
//
vtypedef
fopr_t =
(nmitm) -<cloptr1> Option_vt(a)
//
fun
auxlst
( f0: !fopr_t
, xs: !nmitmlst_vt
) : Option_vt(a) =
(
case+ xs of
|
list_vt_nil() => None_vt()
|
list_vt_cons(x0, xs) =>
(
case+ f0(x0) of
| ~None_vt () => auxlst(f0, xs) | ans => ans
) // end of [list_vt_cons]
) (* end of [auxlst] *)
//
fun
auxlst2
( f0: !fopr_t
, xss: !nmitmlst2_vt
) : Option_vt(a) =
(
case+ xss of
|
list_vt_nil() => None_vt()
|
list_vt_cons(xs0, xss) =>
(
case+
auxlst(f0, xs0) of
| ~None_vt () => auxlst2(f0, xss) | ans => ans
) // end of [list_vt_cons]
) (* end of [auxlst2] *)
//
val ans = ans where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val ans =
  $effmask_ref(auxlst(fopr, !p))
}
//
in
//
let
val ans =
(
case+ ans of
| ~None_vt() =>
  (
    ans
  ) where
  {
    val
    (vbox pf | p) =
    ref_get_viewptr(the_nmitmlst2)
    val ans =
    $effmask_ref(auxlst2(fopr, !p))
  }
| _(* Some_vt *) => ans
) : Option_vt(a)
in
  cloptr_free($UN.castvwtp0(fopr)); ans
end
//
end // end of [the_nmspace_find]

(* ****** ****** *)

implement
the_nmspace_pop
  ((*void*)) =
{
//
val xs1 = xs1 where
{
  val
  (vbox pf | p) =
  ref_get_viewptr
  (the_nmitmlst2)
  val-
  ~list_vt_cons(xs1, xss) = !p
  val ((*void*)) = ( !p := xss )
}
//
val xs0 = xs0 where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val xs0 = !p
  val ((*void*)) = ( !p := xs1 )
}
//
val ((*void*)) = nmitmlst_vt_free(xs0)
//
} (* end of [the_nmspace_pop] *)

(* ****** ****** *)

implement
the_nmspace_push
  ((*void*)) =
{
val xs0 = xs0 where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val xs0 = !p
  val ((*void*)) = !p := list_vt_nil()
} (* end of [val] *)
//
val () = // push down
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst2)
  val ((*void*)) = !p := list_vt_cons(xs0, !p)
} (* end of [val] *)
//
} (* end of [the_nmspace_push] *)

(* ****** ****** *)

implement
the_nmspace_savecur
  () = () where {
//
val xs0 = xs0 where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst)
  val xs0 = !p; val () = !p := list_vt_nil()
} (* end of [val] *)
//
val xss = xss where
{
  val
  (vbox pf | p) =
  ref_get_viewptr(the_nmitmlst2)
  val xss = !p; val () = !p := list_vt_nil()
} (* end of [val] *)
//
val () = () where
{
  val (vbox pf | p) =
  ref_get_viewptr(the_savednmlst)
  val () = !p := list_vt_cons((xs0, xss), !p)
} (* end of [val] *)
//
} (* end of [the_nmspace_savecur] *)

(* ****** ****** *)

implement
the_nmspace_restore
  () = () where
{
//
val xy = xy where
{
val
(vbox pf | p) =
ref_get_viewptr(the_savednmlst)
val-
~list_vt_cons(xy, xys) = !p; val () = (!p := xys)
} (* end of [val] *)
//
val () = () where
{
val
(vbox pf | p) =
ref_get_viewptr(the_nmitmlst)
val () = nmitmlst_vt_free(!p); val () = (!p := xy.0)
} (* end of [val] *)
//
val () = () where
{
val
(vbox pf | p) =
ref_get_viewptr(the_nmitmlst2)
val () = nmitmlst2_vt_free(!p); val () = (!p := xy.1)
} (* end of [val] *)
//
} (* end of [the_nmspace_restore] *)

(* ****** ****** *)

implement
the_nmspace_locjoin
  () = let
//
val xs2 = xs2 where
{
val
(vbox(pf)|p0) =
ref_get_viewptr(the_nmitmlst2)
val-
~list_vt_cons(xs1, xss) = !p0
val-
~list_vt_cons(xs2, xss) = xss
val () = nmitmlst_vt_free(xs1); val () = (!p0 := xss)
} (* end of [val] *)
//
in
let
val
(vbox(pf)|p0) =
ref_get_viewptr(the_nmitmlst) in !p0 := list_vt_append(!p0, xs2)
end
end // end of [the_nmspace_locjoin]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_nmspace.dats] *)
