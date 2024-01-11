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
Wed Dec 27 11:34:52 EST 2023
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)

local
//
(* ****** ****** *)
//
datavwtp
linstk =
//
|
linstk_nil of ()
|
linstk_lam0 of linstk
|
linstk_let0 of linstk
|
linstk_dvar of
(d2var(*lin*), linstk)
|
linstk_dtyp of
(d2var(*lin*), s2typ, linstk)
|
linstk_dlft of
(d2var(*lin*), d4lft, linstk)
//
#absimpl linstk_vtbx = linstk
//
(* ****** ****** *)
//
datavwtp
tr34env =
TR34ENV of
(
d2varlst, linstk(*void*))
//
(* ****** ****** *)
#absimpl tr34env_vtbx = tr34env
(* ****** ****** *)
(* ****** ****** *)
in//local
(* ****** ****** *)
(* ****** ****** *)
//
fun
linstk_free_nil
(stk0: ~linstk): void =
(
case-
stk0 of ~linstk_nil() => ())
//
(* ****** ****** *)
//
#implfun
linstk_pshlam0
  (  stk0  ) =
(
  stk0 := linstk_lam0(stk0))
//(*end of [linstk_pshlam0(stk0)]*)
//
#implfun
linstk_pshlet0
  (  stk0  ) =
(
  stk0 := linstk_let0(stk0))
//(*end of [linstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
linstk_lamvars
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
|
linstk_let0
 (  stk1  ) => res1
*)
|
linstk_lam0
 (  stk1  ) => res1
|
linstk_dvar
(d2v0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
|
linstk_dtyp
(d2v0, t2p0, stk1) => loop(stk1, res1)
|
linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
)
}(*where*)//end-of-[linstk_lamvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_letvars
  (  stk0  ) =
(
loop(stk0, list_nil())
) where
{
fun
loop
( stk0:
! linstk
, res1: d2varlst): d2varlst =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
|
linstk_lam0
 (  stk1  ) => res1
*)
|
linstk_let0
 (  stk1  ) => res1
|
linstk_dvar
(d2v0, stk1) =>
loop(stk1, list_cons(d2v0, res1))
|
linstk_dtyp
(d2v0, t2p0, stk1) => loop(stk1, res1)
|
linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
)
}(*where*)//end-of-[linstk_letvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_poplam0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_lam0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
( d2v, kxs ) => loop(kxs, err)
| ~
linstk_dtyp
(d2v,t2p,kxs) => loop(kxs, err)
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_let0 _ => (err := 1; kxs)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplam0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_poplet0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_let0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
( d2v, kxs ) => loop(kxs, err)
| ~
linstk_dtyp
(d2v,t2p,kxs) => loop(kxs, err)
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplet0(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_insert_dtyp
(stk0, d2v1, t2p1) =
(
stk0 :=
linstk_dtyp
(d2v1, t2p1, stk0)) where
{
//
(*
val () =
prerrln
("linstk_insert_dtyp: d2v1 = ", d2v1)
val () =
prerrln
("linstk_insert_dtyp: t2p1 = ", t2p1)
*)
//
}(*where*)//end-of-[linstk_insert_dtyp(...)]
//
(* ****** ****** *)
//
#implfun
linstk_insert_dlft
(stk0, d2v1, lft1) =
(
stk0 :=
linstk_dlft
(d2v1, lft1, stk0)) where
{
//
(*
val () =
prerrln
("linstk_insert_dlft: d2v1 = ", d2v1)
val () =
prerrln
("linstk_insert_dlft: lft1 = ", lft1)
*)
//
}(*where*)//end-of-[linstk_insert_dlft(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_make_nil
  ((*nil*)) =
(
  TR34ENV
  (d2vs, linstk_nil)) where
{
  val d2vs = list_nil((*void*))
} (*where*)//end of [tr34env_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr34env_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR34ENV
(d2vs, map2) => d2vs where
{
//
var
linstk = map2//local lin-proofs
//
(*
val nerr = linstk_poptop0(linstk)
*)
//
val (  ) = linstk_free_nil(linstk) }
//
)(*case+*)//end-of-(tr34env_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_poplam0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_poplam0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_poplet0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
let
val nerr =
linstk_poplet0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshlam0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshlam0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshlet0
(     env0     ) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_pshlet0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_insert_dtyp
  (env0,d2v1,t2p1) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_insert_dtyp
  (linstk, d2v1, t2p1) ; $fold(env0) )
//
end(*let*)//end-of-(tr34env_insert_dtyp(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_insert_dlft
  (env0,d2v1,lft1) = let
//
val+
@TR34ENV
(d2vlst, !linstk) = env0
//
in//let
//
(
  linstk_insert_dlft
  (linstk, d2v1, lft1) ; $fold(env0) )
//
end(*let*)//end-of-(tr34env_insert_dlft(env0))
//
(* ****** ****** *)
(* ****** ****** *)

endloc (*local*) // end of [ local(tr34env...) ]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_myenv0.dats] *)
