(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 11 Aug 2024 03:44:27 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ vt:vt }
g_ptype
<a0rf(vt)>
( (*void*) ) =
(
pstrn("a0rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<a1rf(vt)>
( (*void*) ) =
(
pstrn("a1rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<a2rf(vt)>
( (*void*) ) =
(
pstrn("a2rf(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print
<a0rf(a)>
(   xs   ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = a0rf(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "a0rf("
in//let
(
  gseq_print1<xs><x0>(xs) )
end//let//end(g_print<a0rf(a)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print
<a1rf(a)>
(   xs   ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = a1rf(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "a1rf("
in//let
(
  gseq_print1<xs><x0>(xs) )
end//let//end(g_print<a1rf(a)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_length
<a0rf(x0)><x0>( A ) = 1 // singleton
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
a0rf_get(A) =
let
val
(pf|x0) =
a0rf_lget<x0>(A)
prval () =
owed_t0_elim0(pf) in x0 end
#impltmp
< x0:t0 >
a0rf_set(A, x) =
let
prval pf =
owed_t0_make((*0*)) in//let
a0rf_lset<x0>(pf | A, x) end
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a0rf_cget(A) =
let
//
val x1 = g_copy<x0>(x0)
//
prval() =
(
owed_vt_return0(pf,x1)) in x0 end
where
{
  val (pf | x0) = a0rf_lget<x0>(A)
}(*where*)//end-of-[a0rf_cget(...)]
//
#impltmp
< x0:vt >
a0rf_setf(A, x0) =
let
val () =
g_free<x0>(x1) in
  a0rf_lset<x0>(pf|A,x0) end//let
where
{
  val (pf | x1) = a0rf_lget<x0>(A)
}(*where*)//end-of-[a0rf_setf(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
$UN.gasz_lget$at$raw
<  a0rf(x0)  >< x0 >
 ( A, i ) = a0rf_lget<x0>(A) // i=0
#impltmp
{ x0:vt }
$UN.gasz_lset$at$raw
<  a0rf(x0)  >< x0 >
( pf | A,i,x ) = a0rf_lset<x0>(pf | A,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
a1rf_get$at =
$UN.gasz_get$at$raw<a1rf(x0)><x0>
#impltmp
< x0:t0 >
a1rf_set$at =
$UN.gasz_set$at$raw<a1rf(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1rf_cget$at =
$UN.gasz_cget$at$raw<a1rf(x0)><x0>
#impltmp
< x0:vt >
a1rf_setf$at =
$UN.gasz_setf$at$raw<a1rf(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
$UN.gasz_lget$at$raw
<  a1rf(x0)  >< x0 >
 ( A, i ) = a1rf_lget$at<x0>(A, i)
#impltmp
{ x0:vt }
$UN.gasz_lset$at$raw
<  a1rf(x0)  >< x0 >
( pf | A,i,x ) = a1rf_lset$at<x0>(pf | A,i,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axrf000.dats] *)
