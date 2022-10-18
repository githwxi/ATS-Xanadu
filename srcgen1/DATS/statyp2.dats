(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN="prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
//
implement
t2ype_isdat
  (t2p0) =
(
case+
t2p0.node() of
| T2Pcst(s2c0) =>
  s2cst_isdat(s2c0)
| T2Papp(t2pf, _) =>
  t2ype_isdat(t2pf)
| _ (*rest-of-t2ype*) => false
)
//
(* ****** ****** *)

local

typedef
t2ype_struct =
@{ 
  t2ype_sort= sort2
, t2ype_node= t2ype_node
} (* absimpl *)
absimpl
t2ype_tbox = ref(t2ype_struct)

in (* in-of-local *)
//
implement
t2ype_make_node
  (s2t0, node) =
(
ref<t2ype_struct>
@{
  t2ype_sort= s2t0
, t2ype_node= node }
) (* end of [t2ype_make_node] *)
//
implement
t2ype_get_sort
  (t2p0) = t2p0->t2ype_sort
implement
t2ype_get_node
  (t2p0) = t2p0->t2ype_node
//
(*
implement
t2ype_set_sort
  ( t2p0, s2t0 ) =
  ( t2p0->t2ype_sort := s2t0 )
*)
//
end (*local*) // end of [local(t2ype_tbox)]

(* ****** ****** *)
//
implement
t2ype_make_name
  (s2t0, name) =
(
  t2ype_make_node(s2t0, T2Pbas(name))
)
//
(* ****** ****** *)

implement
t2ype_cst
(s2c0) = let
//
val s2t0 = s2c0.sort()
val node = T2Pcst(s2c0)
//
in
  t2ype_make_node(s2t0, node)
end

implement
t2ype_var
(s2v0) = let
//
val s2t0 = s2v0.sort()
val node = T2Pvar(s2v0)
//
in
  t2ype_make_node(s2t0, node)
end

(* ****** ****** *)

implement
t2ype_lft
(t2p0) = let
//
val node = T2Plft(t2p0)
val s2t0 = the_sort2_tbox
//
in
  t2ype_make_node(s2t0, node)
end // end of [t2ype_lft]

(* ****** ****** *)

implement
t2ype_app1
(t2pf, t2pa) = let
//
val s2tf = t2pf.sort()
(*
val s2ta = t2pa.sort()
*)
//
val-S2Tfun(_, s2tr) = s2tf
//
in
t2ype_make_node
( s2tr
, T2Papp(t2pf, list_sing(t2pa)))
end // end of [t2yp2_app1]

implement
t2ype_app2
( t2pf
, t2p1, t2p2) = let
//
val s2tf = t2pf.sort()
//
(*
val s2t1 = t2p1.sort()
val s2t2 = t2p2.sort()
*)
//
val-S2Tfun(_, s2tr) = s2tf
//
in
t2ype_make_node
( s2tr
, T2Papp(t2pf, list_pair(t2p1, t2p2)))
end // end of [t2yp2_app1]

(* ****** ****** *)
//
local
//
typedef
t2xtv_struct = @{
  t2xtv_loc= loc_t
,
  t2xtv_sort= sort2
,
  t2xtv_type= t2ype
,
  t2xtv_stamp= stamp
}
//
absimpl
t2xtv_tbox=ref(t2xtv_struct)
//
in (*in-of-local*)
//
implement
t2xtv_new
  (loc0) =
let
val
s2t0 = the_sort2_none
in
t2xtv_new_srt(loc0, s2t0)
end // end of [t2xtv_new]
//
implement
t2xtv_new_srt
  (loc0, s2t0) =
(
ref<t2xtv_struct>
@{
  t2xtv_loc= loc0
,
  t2xtv_sort= s2t0
,
  t2xtv_type= t2p0
,
  t2xtv_stamp=stamp
}
) where
{
val t2p0 = the_t2ype_none0
val stamp = t2xtv_stamp_new()
} (* end of [t2xtv_new_srt] *)
//
implement
t2xtv_get_loc
  (xtv) = xtv->t2xtv_loc
//
implement
t2xtv_get_sort
  (xtv) = xtv->t2xtv_sort
//
implement
t2xtv_get_type
  (xtv) = xtv->t2xtv_type
implement
t2xtv_set_type
  (xtv, t2p) =
  (xtv->t2xtv_type := t2p)
//
implement
t2xtv_get_stamp
  (xtv) = xtv->t2xtv_stamp
//
implement
eq_t2xtv_t2xtv
  (xtv1, xtv2) =
$STM.eq_stamp_stamp
(
  xtv1->t2xtv_stamp, xtv2->t2xtv_stamp
) (*eq_t2xtv_t2xtv*)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
t2ype_new(loc0) =
let
val
xtv =
t2xtv_new(loc0)
in
  t2ype_new_xtv(xtv)
end
//
implement
t2ype_new_xtv
  (xtv0) = let
//
val node = T2Pxtv(xtv0)
val s2t0 = the_sort2_none
//
in
  t2ype_make_node(s2t0, node)
end // end of [t2ype_new_xtv]
//
implement
t2ype_new_loc_var
  (loc0, s2v0) = let
//
val
s2t0 = s2v0.sort()
val
xtv0 =
t2xtv_new_srt(loc0, s2t0)
//
in
t2ype_new_srt_xtv(s2t0, xtv0)
end
//
implement
t2ype_new_srt_xtv
  (s2t0, xtv0) = let
//
val node = T2Pxtv(xtv0)
//
in
  t2ype_make_node( s2t0, node )
end // end of [t2ype_new_srt_xtv]
//
(* ****** ****** *)
//
implement
t2ype_exi
(s2vs, body) =
(
case+ s2vs of
| list_nil() => body
| list_cons _ => let
  val s2t0 = body.sort()
  in
    t2ype_make_node(s2t0, T2Pexi(s2vs, body))
  end // end of [list_cons]
)
//
implement
t2ype_uni
(s2vs, body) =
(
case+ s2vs of
| list_nil() => body
| list_cons _ => let
  val s2t0 = body.sort()
  in
    t2ype_make_node(s2t0, T2Puni(s2vs, body))
  end // end of [list_cons]
)
//
(* ****** ****** *)
//
implement
t2ype_fc2(fc2) =
t2ype_make_node
(the_sort2_none, T2Pfc2(fc2))
//
implement
t2ype_fun0
(loc, npf, arg, res) =
(
t2ype_fun1
(fc2, npf, arg, res)
) where
{
val fc2 = t2ype_new(loc)
} // end of [t2ype_fun0]
//
implement
t2ype_fun1
(fc2, npf, arg, res) = let
//
val node =
T2Pfun(fc2, npf, arg, res)
//
in
  t2ype_make_node(the_sort2_none, node)
end // end of [t2ype_fun1]
//
implement
t2ype_fun2
(fc2, npf, arg, res) =
t2ype_fun1(t2ype_fc2(fc2), npf, arg, res)
//
(* ****** ****** *)

implement
t2ype_tyrec
(s2t0, knd1, npf2, ltps) =
(
case+ knd1 of
| TYRECflt0() =>
  (
  case ltps of
  | list_nil _ => the_t2ype_void
  | list_cons _ =>
    t2ype_make_node
    (s2t0, T2Ptyrec(knd1, npf2, ltps))
  )
| _(*non-TYRECflt0*) =>
  (
    t2ype_make_node
    (s2t0, T2Ptyrec(knd1, npf2, ltps))
  )
) (* end of [t2ype_tyrec] *)

(* ****** ****** *)

implement
t2ype_un_data
  (t2p0) =
(
case+
t2p0.node() of
|
T2Papp(t2pf, t2ps) =>
(
case+
t2pf.node() of
| T2Pcst(s2c1) =>
  if
  s2cst_isdat(s2c1)
  then Some_vt(s2c1)
  else None_vt(*void*)
| _ (* non-T2Pbas *) => None_vt(*void*)
)
| _ (* non-T2Papp *) => None_vt(*void*)
) (* end of [t2ype_un_data] *)

(* ****** ****** *)

implement
t2ype_un_p2tr
  (t2p0) =
(
case+
t2p0.node() of
|
T2Papp(t2pf, t2ps) =>
(
case+
t2pf.node() of
| T2Pcst(s2c1) =>
  if
  s2c1 =
  the_p2tr_tbox.scst()  
  then
  let
  val-
  list_cons
  (t2pa, _) = t2ps in Some_vt(t2pa)
  end
  else None_vt(*void*)
| _ (* non-T2Pbas *) => None_vt(*void*)
)
| _ (* non-T2Papp *) => None_vt(*void*)
) (* end of [t2ype_un_p2tr] *)

(* ****** ****** *)
//
implement
t2ype_un_lazy
  (t2p0) =
(
case+
t2p0.node() of
|
T2Papp(t2pf, t2ps) =>
(
case+
t2pf.node() of
| T2Pcst(s2c1) =>
(
  if
  s2c1 =
  the_lazy_t0_x0.scst()
  then
  let
  val-
  list_cons
  (t2pa, _) = t2ps in Some_vt(t2pa)
  end
  else None_vt(*void*)
)
| _ (* non-T2Pbas *) => None_vt(*void*)
)
| _ (* non-T2Papp *) => None_vt(*void*)
)
//
implement
t2ype_un_llazy
  (t2p0) =
(
case+
t2p0.node() of
|
T2Papp(t2pf, t2ps) =>
(
case+
t2pf.node() of
| T2Pcst(s2c1) =>
(
  if
  s2c1 =
  the_lazy_vt_vx.scst()
  then
  let
  val-
  list_cons
  (t2pa, _) = t2ps in Some_vt(t2pa)
  end
  else None_vt(*void*)
)
| _ (* non-T2Pbas *) => None_vt(*void*)
)
| _ (* non-T2Papp *) => None_vt(*void*)
)
//
(* ****** ****** *)
//
// HX-2020-07-04:
// Please put the code below
// that requires initialization
//
(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
t2xtv_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

(* end of [xats_statyp2.dats] *)
