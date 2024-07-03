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
(*
HX: Implementation in ATS2
Sun Nov 12 12:16:50 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: September, 2020
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
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
#staload "./../SATS/js1comp.sats"
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_flat
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALflat
( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDflat(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_flat]

(* ****** ****** *)

fun
aux_carg
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALcarg
( l1v1
, idx2 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0
  , L1CMDcarg(tres, l1v1, idx2) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_carg]

(* ****** ****** *)

fun
aux_cofs
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALcofs
( l1v1
, idx2 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0
  , L1CMDcofs(tres, l1v1, idx2) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_cofs]

(* ****** ****** *)

fun
aux_targ
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALtarg
( l1v1
, idx2 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0
  , L1CMDtarg(tres, l1v1, idx2) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_targ]

(* ****** ****** *)

fun
aux_eval1
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALeval1
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDeval1(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_eval1]

(* ****** ****** *)

fun
aux_eval2
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALeval2
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDeval2(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_eval2]

(* ****** ****** *)

fun
aux_eval3
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALeval3
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDeval3(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_eval3]

(* ****** ****** *)

fun
aux_free1
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALfree1
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDfree1(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_free1]

(* ****** ****** *)

fun
aux_free2
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALfree2
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDfree2(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_free2]

(* ****** ****** *)

fun
aux_free3
( env0: 
! compenv
, l1v0: l1val): l1val =
let
val
loc0 = l1v0.loc()
val-
L1VALfree3
 ( l1v1 ) = l1v0.node()
val
l1v1 =
js1comp_l1valize(env0, l1v1)
val
tres =
js1comp_ltmpnew_tmp0(env0, loc0)
val () =
let
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDfree3(tres, l1v1) )
in
  js1comp_lcmdadd_lcmd(env0, lcmd)
end
in
l1val_make_node(loc0, L1VALtmp(tres))
end // end of [aux_free3]

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)
//
implement
js1comp_l1valize
  (env0, l1v0) =
(
case+
l1v0.node() of
| L1VALflat _ =>
  aux_flat(env0, l1v0)
//
| L1VALcarg _ =>
  aux_carg(env0, l1v0)
| L1VALcofs _ =>
  aux_cofs(env0, l1v0)
//
| L1VALtarg _ =>
  aux_targ(env0, l1v0)
(*
| L1VALtptr _ =>
  aux_tptr(env0, l1v0)
*)
//
| L1VALeval1 _ =>
  aux_eval1(env0, l1v0)
| L1VALeval2 _ =>
  aux_eval2(env0, l1v0)
| L1VALeval3 _ =>
  aux_eval3(env0, l1v0)
//
| L1VALfree1 _ =>
  aux_free1(env0, l1v0)
| L1VALfree2 _ =>
  aux_free2(env0, l1v0)
| L1VALfree3 _ =>
  aux_free3(env0, l1v0)
//
| _ (*rest-of-l1val*) => (l1v0)
)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_js1comp_utils0.dats] *)
