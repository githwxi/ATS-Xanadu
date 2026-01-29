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
(*
Fri 06 Sep 2024 11:49:28 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ vt:vt }
g_ptcon
<optn_vt(vt)>
( (*void*) ) =
(
pstrn("optn_vt("))
//
#impltmp
{ vt:vt }
g_ptype
<optn_vt(vt)>
( (*void*) ) =
(
pstrn("optn_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
optn_vt_nil_
  ((*0*)) =
  optn_vt_nil((*0*))
#impltmp
< a: vt >
optn_vt_cons_
  (  x  ) =
(
  optn_vt_cons( x ))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
optn_vt_nilq1
  (xs) =
(
case+ xs of
| // !
optn_vt_nil() => true
| // !
optn_vt_cons _ => false)
#impltmp
{ x0:vt }
gseq_nilq1
<optn_vt(x0)><x0> =
optn_vt_nilq1<>{x0}(*void*)
//
(* ****** ****** *)
//
#impltmp
< a: vt >
optn_vt_nilq0
  (xs) =
(
case+ xs of
| ~
optn_vt_nil() => true
| ~
optn_vt_cons(x0) =>
let
val () =
g_free<a>(x0) in false end
)
#impltmp
{ x0:vt }
gseq_nilq0
<optn_vt(x0)><x0> =
optn_vt_nilq0<x0>(* void *)
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
optn_vt_consq1
  ( xs ) =
(
 not(optn_vt_nilq1<>(xs)))
#impltmp
< a: vt >
optn_vt_consq0
  ( xs ) =
(
 not(optn_vt_nilq0<a>(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_head0
  (xs) =
(
case+ xs of
| ~
optn_vt_cons(x0) => (x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-06:
Fri 06 Sep 2024 11:49:42 PM EDT
*)
//
#impltmp
{ x0:vt }
gseq$sep
<optn_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq$end
<optn_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq$beg
<optn_vt(x0)><x0>() = "optn_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<optn_vt(x0)>(xs) =
(
gseq_print0<optn_vt(x0)><x0>(xs)
)(*let*)//end-[g_print0<optn_vt>]
//
#impltmp
{ x0:vt }
g_print1
<optn_vt(x0)>(xs) =
(
gseq_print1<optn_vt(x0)><x0>(xs)
)(*let*)//end-[g_print1<optn_vt>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< a :vt >
optn_vt_length0 =
gseq_length0<optn_vt(x0)><x0>
*)
//
#impltmp
< a: vt >
optn_vt_length0
  (xs) =
(
case+ xs of
| ~
optn_vt_nil() => 0 | ~optn_vt_cons _ => 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< a: vt >
optn_vt_length1 =
gseq_length1<optn_vt(x0)><x0>
*)
//
#impltmp
< a: vt >
optn_vt_length1
  (xs) =
(
case+ xs of
| !
optn_vt_nil() => 0 | !optn_vt_cons _ => 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-22:
Mon Dec 22 12:15:42 PM EST 2025
*)
//
#impltmp
< x0:vt >
optn_vt_free
(    xs    ) =
(
case+ xs of
| ~
optn_vt_nil
( (*void*) ) => ()
| ~
optn_vt_cons
(    x1    ) => g_free<x0>(x1))
//
#impltmp
{ x0:vt }
g_free<
optn_vt(x0)> = optn_vt_free<x0>(*void*)
#impltmp
{ x0:vt }
gseq_free<
optn_vt(x0)><x0> = optn_vt_free<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_copy
(    xs    ) =
(
case+ xs of
|optn_vt_nil
( (*void*) ) => optn_vt_nil()
|optn_vt_cons
(    x1    ) =>
(
  optn_vt_cons(g_copy<x0>(x1))))
//
#impltmp
{ x0:vt }
g_copy<
optn_vt(x0)> = optn_vt_copy<x0>(*void*)
#impltmp
{ x0:vt }
gseq_copy<
optn_vt(x0)><x0> = optn_vt_copy<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_optn000_vt.dats] *)
(***********************************************************************)
