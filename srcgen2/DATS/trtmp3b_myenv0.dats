(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Wed Aug 23 19:51:02 EDT 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
//
local
val
stamper =
stamper_new((*0*))
in//local
fun
the_tmpstk_stamp_new
  ((*void*)): stamp =
  stamper.getinc((*void*))
endloc // the_tmpstk_stamp_new
//
(* ****** ****** *)

local

(* ****** ****** *)
//
datavwtp
tmpstk =
//
| tmpstk_nil of ()
//
| tmpstk_cons of
  (stamp, d3ecl, tmpstk)
//
| tmpstk_let0 of (tmpstk)
| tmpstk_loc0 of (tmpstk)
//
(* ****** ****** *)
//
datavwtp
tr3benv =
TR3BENV of
(
topmap
(d3eclist), tmpstk(*void*))
//
(* ****** ****** *)
#absimpl tmpstk_vtbx = tmpstk
(* ****** ****** *)
#absimpl tr3benv_vtbx = tr3benv
(* ****** ****** *)
//
fun
tmpstk_free_nil
  (stk: ~tmpstk): void =
(
case- stk of
| ~tmpstk_nil() => ((*void*)))
//
(* ****** ****** *)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
tmpstk_nilq
(   stk   ) =
(
case+ stk of
| !
tmpstk_nil() => true
| _(*non-nil*) => false
) (* end of [tmpstk_nilq(stk)] *)
//
(* ****** ****** *)
//
#implfun
tmpstk_poptop0
  (stk) = let
//
fnx
loop
( kxs
: tmpstk
, err: &sint >> _): tmpstk =
(
case+ kxs of
| !
tmpstk_nil() => kxs // err = 0
//
| ~
tmpstk_cons
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmpstk_let0 _ => (err := 1; kxs)
//
| !
tmpstk_loc0 _ => (err := 1; kxs)
//
) (*case+*)//end-of-[loop(kxs, err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk := loop(stk, err)) in err end
end (*let*)//end-[tmpstk_poptop0(stk)]
//
(* ****** ****** *)
//
#implfun
tmpstk_pshlet0
  (  stk  ) =
(
  stk := tmpstk_let0(stk))
//(*end of [tmpstk_pshlet0(stk)]*)
//
(* ****** ****** *)
//
#implfun
tmpstk_pshloc0
  (  stk  ) =
(
  stk := tmpstk_loc0(stk))
//(*end of [tmpstk_pshloc0(stk)]*)
//
(* ****** ****** *)
//
#implfun
tmpstk_poplet0
  (  stk  ) = let
//
fnx
loop
( kxs
: tmpstk
, err: &sint >> _): tmpstk =
(
case+ kxs of
| !
tmpstk_let0
(   kxs   ) => kxs // err = 0
| ~
tmpstk_cons
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmpstk_nil( ) => (err := 1; kxs)
//
| !
tmpstk_loc0 _ => (err := 1; kxs)
)
//
in//let
let
var
err: sint = 0
val
( ) =
(stk := loop(stk, err)) in err end
end (*let*) // end of [tmpstk_poplet0(stk)]
//
(* ****** ****** *)
//
#implfun
tmpstk_poploc0
  (  stk  ) = let
//
fnx
loop
( kxs
: tmpstk
, err: &sint >> _): tmpstk =
(
case+ kxs of
| !
tmpstk_loc0
(   kxs   ) => kxs // err = 0
| ~
tmpstk_cons
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmpstk_nil( ) => (err := 1; kxs)
//
| !
tmpstk_let0 _ => (err := 1; kxs)
)
//
in//let
let
var
err: sint = 0
val
( ) =
(stk := loop(stk, err)) in err end
end (*let*) // end of [tmpstk_poploc0(stk)]
//
(* ****** ****** *)
//
#implfun
tmpstk_insert_dcl
  (stk, dcl) =
let
val tag =
the_tmpstk_stamp_new() in//let
  stk := tmpstk_cons(tag, dcl, stk)
end (*let*)//end of [tmpstk_insert_dcl(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3benv_make_nil
  ((*nil*)) =
(
  TR3BENV(map1, tmpstk_nil)) where
{
  val map1 = topmap_make_nil((*nil*))
}(*where*) // end of [tr3benv_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr3benv_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR3BENV
(map1, map2) =>
let
//
var
tmpstk = map2
//
val nerr =
tmpstk_poptop0(tmpstk)
//
val (  ) = tmpstk_free_nil(tmpstk) endlet
//
)(*case+*)//end-of-(tr3benv_free_top(env0))
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(tr3benv...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_myenv0.dats] *)