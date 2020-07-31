(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: July, 2020
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

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)

implement
tcomp30_sort
  (s2t0) = let
//
(*
val () =
println!
("tcomp30_sort: s2t0 = ", s2t0)
*)
//
in
//
case+ s2t0 of
//
| S2Tid0(sym) => HSTid0(sym)
| S2Tint(int) => HSTint(int)
//
| S2Tfun
  (s2ts, s2t1) =>
  let
  val
  hsts =
  tcomp30_sortlst(s2ts)
  in
  HSTfun
  (hsts, hst1) where
  {
    val
    hst1 = tcomp30_sort(s2t1)
  }
  end // end of [S2Tfun]
//
| _(*rest-of-sort2*) =>
  let
  val
  data =
  $UN.cast{ptr}(s2t0) in HSTnone1(data)
  end
//
end // end of [tcomp30_sort]
//
(* ****** ****** *)

implement
tcomp30_scst
  (s2c0) = let
//
val opt =
the_scstmap_search_opt(s2c0)
//
in
case+ opt of
| ~
Some_vt(htv1) => htv1
| ~
None_vt((*void*)) =>
let
val htv1 =
htcst_make_scst(s2c0)
in
the_scstmap_insert_any(s2c0, htv1); htv1
end
end // end of [tcomp30_scst]

(* ****** ****** *)

implement
tcomp30_sortlst(s2ts) =
list_vt2t
(
list_map<
  sort2><h0srt>(s2ts) where
{
implement
list_map$fopr<
  sort2><h0srt>(s2t) = tcomp30_sort(s2t)
}
) (* end of [tcomp30_sortlst] *)

(* ****** ****** *)

implement
tcomp30_scstlst(s2cs) =
list_vt2t
(
list_map<
  s2cst><htcst>(s2cs) where
{
implement
list_map$fopr<
  s2cst><htcst>(s2c) = tcomp30_scst(s2c)
}
) (* end of [tcomp30_scstlst] *)

(* ****** ****** *)

implement
tcomp30_svar
  (s2v0) = let
//
val opt =
the_svarmap_search_opt(s2v0)
//
in
case+ opt of
| ~
Some_vt(htv1) => htv1
| ~
None_vt((*void*)) =>
let
val htv1 =
htvar_make_svar(s2v0)
in
the_svarmap_insert_any(s2v0, htv1); htv1
end
end // end of [tcomp30_svar]

(* ****** ****** *)

implement
tcomp30_svarlst(s2vs) =
list_vt2t
(
list_map<
  s2var><htvar>(s2vs) where
{
implement
list_map$fopr<
  s2var><htvar>(s2v) = tcomp30_svar(s2v)
}
) (* end of [tcomp30_svarlst] *)

(* ****** ****** *)

implement
tcomp30_type
  (t2p0) = let
//
(*
//
val s2t0 = t2p0.sort()
//
val () =
println!
("tcomp30_type: t2p0 = ", t2p0)
val () =
println!
("tcomp30_type: s2t0 = ", s2t0)
*)
//
(*
val () =
println!
("tcomp30_type: hst0 = ", hst0)
*)
//
in
//
case+
t2p0.node() of
|
T2Pvar(s2v1) =>
let
val s2t0 = t2p0.sort()
val hst0 = tcomp30_sort(s2t0)
val htv1 = tcomp30_svar(s2v1)
in
h0typ_make_node(hst0, H0Tvar(htv1))
end
|
_(*rest-of-t2ype*) =>
let
//
val s2t0 = t2p0.sort()
val hst0 = tcomp30_sort(s2t0)
val data = $UN.cast{ptr}(t2p0)
//
in
h0typ_make_node(hst0, H0Tnone1(data))
end // end of [rest]
//
end // end of [tcomp30_type]

(* ****** ****** *)

(* end of [xats_tcomp30_statyp.dats] *)
