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
Thu Nov  9 13:21:16 EST 2023
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
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
val
stamper =
stamper_new((*0*))
in//local
fun
the_tmqstk_stamp_new
  ((*void*)): stamp =
  stamper.getinc((*void*))
endloc // the_tmqstk_stamp_new
//
(* ****** ****** *)
(* ****** ****** *)
(*
local
*)
(* ****** ****** *)
//
datavwtp
tmqstk =
//
| tmqstk_nil of ()
//
| tmqstk_svts of
  ( s2vts, tmqstk )
//
| tmqstk_timp of
  ( timpl, tmqstk )
//
| tmqstk_decl of
  (stamp, d3ecl, tmqstk)
//
| tmqstk_dexp of
  (stamp, d3exp, tmqstk)
//
| tmqstk_let0 of (tmqstk)
| tmqstk_loc1 of (tmqstk)
| tmqstk_loc2 of (tmqstk)
//
(* ****** ****** *)
//
datavwtp
tr3cenv =
TR3CENV of
(
topmap
(d3eclist), tmqstk(*void*))
//
(* ****** ****** *)
#absimpl tmqstk_vtbx = tmqstk
(* ****** ****** *)
#absimpl tr3cenv_vtbx = tr3cenv
(* ****** ****** *)
//
fun
tmqstk_free_nil
(stk0: ~tmqstk): void =
(
case- stk0 of
| ~tmqstk_nil() => ((*void*)))
//
(* ****** ****** *)
(*
in//local
*)
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tmqstk_nilq
(   stk0   ) =
(
case+ stk0 of
| !
tmqstk_nil() => true
| _(*non-nil*) => false
) (* end of [tmqstk_nilq(stk0)] *)
//
(* ****** ****** *)
//
#implfun
tmqstk_pshlet0
  (  stk0  ) =
(
  stk0 := tmqstk_let0(stk0))
//(*end of [tmqstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
tmqstk_pshloc1
  (  stk0  ) =
(
  stk0 := tmqstk_loc1(stk0))
//(*end of [tmqstk_pshloc1(stk0)]*)
//
#implfun
tmqstk_pshloc2
  (  stk0  ) =
(
  stk0 := tmqstk_loc2(stk0))
//(*end of [tmqstk_pshloc2(stk0)]*)
//
(* ****** ****** *)
//
#implfun
tmqstk_poptop0
  (stk0) = let
//
fnx
loop
( kxs
: tmqstk
, err: &sint >> _): tmqstk =
(
case+ kxs of
| !
tmqstk_nil() => kxs // err = 0
//
| ~
tmqstk_decl
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmqstk_svts _ => (err := 1; kxs)
| !
tmqstk_timp _ => (err := 1; kxs)
//
| !
tmqstk_let0 _ => (err := 1; kxs)
//
| !
tmqstk_loc1 _ => (err := 1; kxs)
| !
tmqstk_loc2 _ => (err := 1; kxs)
//
) (*case+*)//end-of-[loop(kxs, err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*)//end-[tmqstk_poptop0(stk0)]
//
(* ****** ****** *)
//
#implfun
tmqstk_poplet0
  (  stk0  ) = let
//
fnx
loop
( kxs
: tmqstk
, err: &sint >> _): tmqstk =
(
case+ kxs of
| ~
tmqstk_let0
(   kxs   ) => kxs // err = 0
| ~
tmqstk_decl
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmqstk_nil( ) => (err := 1; kxs)
//
| !
tmqstk_svts _ => (err := 1; kxs)
| !
tmqstk_timp _ => (err := 1; kxs)
//
| !
tmqstk_loc1 _ => (err := 1; kxs)
| !
tmqstk_loc2 _ => (err := 1; kxs)
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
end (*let*) // end of [tmqstk_poplet0(stk)]
//
(* ****** ****** *)
//
#implfun
tmqstk_locjoin
  (  stk0  ) = let
//
fnx
poploc1
( kxs
: tmqstk
, kys
: tmqstk
, err: &sint >> _): tmqstk =
(
case+ kxs of
| ~
tmqstk_loc1
(   kxs   ) =>
(
  pshloc2(kxs, kys, err))
| ~
tmqstk_decl
(k1, x1, kxs) =>
(
  poploc1(kxs, kys, err))
//
| !
tmqstk_nil( ) =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc1: tmqstk_nil")
}
//
| !
tmqstk_svts =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc1: tmqstk_svts")
}
| !
tmqstk_timp =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc1: tmqstk_timp")
}
//
| !
tmqstk_let0 _ =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc1: tmqstk_let0")
}
| !
tmqstk_loc2 _ =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc1: tmqstk_loc1")
}
) (*case+*)//end of [poploc1(kxs,kys,err)]
//
and
poploc2
( kxs
: tmqstk
, kys
: tmqstk
, err: &sint >> _): tmqstk =
(
case+ kxs of
| ~
tmqstk_loc2
(   kxs   ) =>
(
  poploc1(kxs, kys, err))
| ~
tmqstk_decl
(k1, x1, kxs) =>
(
  poploc2(kxs, kys, err))
where {
val kys = tmqstk_decl(k1, x1, kys)
} (*where*)//end-of-[tmqstk_decl(...)]
//
| !
tmqstk_nil( ) =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc2: tmqstk_nil")
}
//
| !
tmqstk_svts _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc2: tmqstk_svts")
}
| !
tmqstk_timp _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc2: tmqstk_timp")
}
//
| !
tmqstk_let0 _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc2: tmqstk_let0")
}
| !
tmqstk_loc1 _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmqstk_locjoin: poploc2: tmqstk_loc1")
}
//
) (*case+*)//end of [poploc2(kxs,kys,err)]
//
and
pshloc2
( kxs
: tmqstk
, kys
: tmqstk
, err: &sint >> _): tmqstk =
(
case- kys of
| ~
tmqstk_nil() => kxs
| ~
tmqstk_decl
(k1, x1, kys) =>
(
pshloc2(kxs, kys, err))
where
{
  val kxs =
  tmqstk_decl(k1, x1, kxs) }
) (*case+*)//end of [pshloc2(kxs,kys,err)]
//
in//let
//
let
var err: sint = 0
//
val kxs = stk0
val kys = tmqstk_nil()
//
val ( ) =
(stk0 := poploc2(kxs, kys, err)) in (err)
end (*let*)
//
end (*let*) // end of [tmqstk_locjoin(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tmqstk_getstmp
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_svts
(svts, stk1) =>
(
  tmqstk_getstmp(stk1))
| !
tmqstk_timp
(timp, stk1) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_decl
(stmp, _, _) => ( stmp )
//
| !
tmqstk_let0
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_loc1
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
| !
tmqstk_loc2
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_nil() => the_stamp_nil
//
) (*case+*) // end of [tmqstk_getstmp(stk0)]
//
(* ****** ****** *)
//
#implfun
tmqstk_getsvts
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_svts
(svts, stk1) => (svts)
//
| !
tmqstk_timp
(timp, stk1) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_decl
(_, _, stk1) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_let0
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_loc1
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
| !
tmqstk_loc2
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_nil() => list_nil(*void*)
//
) (*case+*) // end of [tmqstk_getsvts(stk0)]
//
(* ****** ****** *)
//
#implfun
tmqstk_insert_decl
  (stk0, d3cl) =
let
//
val tsub =
tmqstk_getsvts(stk0)
//
val d3cl =
(
case+ tsub of
|
list_nil
((*void*)) => d3cl
|
list_cons _ =>
let
val loc0 =
d3cl.lctn((*void*))
in//let
d3ecl_make_node
(loc0, D3Ctmpsub(tsub, d3cl))
end(*let*)//end-of-[list_cons]
)
//
val tag0 =
the_tmqstk_stamp_new((*void*))
//
in//let
  stk0 := tmqstk_decl(tag0, d3cl, stk0)
end (*let*)//end-of-[tmqstk_insert_decl(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3cenv_make_nil
  ((*nil*)) =
(
  TR3CENV(map1, tmqstk_nil)) where
{
  val map1 = topmap_make_nil((*nil*))
}(*where*) // end of [tr3cenv_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr3cenv_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR3CENV
(map1, map2) =>
let
//
var
tmqstk = map2
//
val nerr = tmqstk_poptop0(tmqstk)
//
val (  ) = tmqstk_free_nil(tmqstk) endlet
//
)(*case+*)//end-of-(tr3cenv_free_top(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_poplet0
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val nerr =
tmqstk_poplet0(tmqstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr3cenv_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_pshlet0
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  tmqstk_pshlet0(tmqstk); $fold(env0))
//
end(*let*)//end-of-(tr3cenv_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_pshloc1
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  tmqstk_pshloc1(tmqstk); $fold(env0))
//
end(*let*)//end-of-(tr3cenv_pshloc1(env0))
//
#implfun
tr3cenv_pshloc2
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  tmqstk_pshloc2(tmqstk); $fold(env0))
//
end(*let*)//end-of-(tr3cenv_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_locjoin
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  tmqstk_locjoin(tmqstk); $fold(env0))
//
end(*let*)//end-of-(tr3cenv_locjoin(env0))
//
(* ****** ****** *)
//
(*
endloc (*local*) // end of [local(tr3cenv...)]
*)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_myenv0.dats] *)
