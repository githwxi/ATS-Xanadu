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
//
(*
Author: Hongwei Xi
//
Sat 16 Mar 2024 07:04:29 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload
"./../../../SATS/xsymmap.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
#typedef
d2vtop = topmap(i1valist)
#vwtpdef
d2vstk = stkmap(i1valist)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
datavwtp
iltstk =
//
|iltstk_nil of ( (*v0*) ) 
//
|iltstk_lam0 of ( iltstk ) 
|iltstk_let0 of ( iltstk ) 
//
|iltstk_ift0 of ( iltstk ) 
|iltstk_cas0 of ( iltstk ) 
//
|iltstk_cons of (i1let, iltstk)
//
(* ****** ****** *)
#absimpl iltstk_vtbx = iltstk
(* ****** ****** *)
//
datavwtp
envi0i1 =
ENVI0I1 of
(d2vtop,d2vstk,iltstk)
//
#absimpl envi0i1_vtbx = envi0i1
//
(* ****** ****** *)
(* ****** ****** *)
in//local
(* ****** ****** *)
(* ****** ****** *)
//
fun
iltstk_free_nil
(stk0: ~iltstk): void =
(
case-
stk0 of ~iltstk_nil() => ())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gl_print1<iltstk>(stk0) =
iltstk_fprint1
(gl_print$out<>( (*nil*) ), stk0)
//
(* ****** ****** *)
//
#implfun
iltstk_pshlam0
  (  stk0  ) =
(
  stk0 := iltstk_lam0(stk0))
//(*end of [iltstk_pshlam0(stk0)]*)
//
#implfun
iltstk_pshlet0
  (  stk0  ) =
(
  stk0 := iltstk_let0(stk0))
//(*end of [iltstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
iltstk_pshift0
  (  stk0  ) =
(
  stk0 := iltstk_ift0(stk0))
//(*end of [iltstk_pshift0(stk0)]*)
//
#implfun
iltstk_pshcas0
  (  stk0  ) =
(
  stk0 := iltstk_cas0(stk0))
//(*end of [iltstk_pshcas0(stk0)]*)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
envi0i1_make_nil
  ((*void*)) =
(
ENVI0I1
(d2vtop,d2vstk,iltstk)) where
{
  val iltstk = iltstk_nil()
  val d2vtop = topmap_make_nil()
  val d2vstk = stkmap_make_nil()
}(*where*) // end of [envi0i1_make_nil]
//
(* ****** ****** *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_pshlam0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshlam0(d2vstk);
iltstk_pshlam0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshlam0(env0))
//
(* ****** ****** *)
//
#implfun
envi0i1_pshlet0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshlet0(d2vstk);
iltstk_pshlet0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshlet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_pshift0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
iltstk_pshift0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshift0(env0))
//
(* ****** ****** *)
//
#implfun
envi0i1_pshcas0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshlam0(d2vstk);
iltstk_pshcas0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
endloc (*local*) // end of [ local(envi0i1...) ]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1_myenv0.dats] *)
(***********************************************************************)
