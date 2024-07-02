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
  (sint, s2vts, tmqstk)
//
| tmqstk_timp of
  (stamp, d3ecl, tmqstk)
| tmqstk_decl of
  (stamp, d3ecl, tmqstk)
//
| tmqstk_let0 of (tmqstk)
| tmqstk_loc1 of (tmqstk)
| tmqstk_loc2 of (tmqstk)
//
(* ****** ****** *)
//
(*
HX-2024-01-09:
[topmap] is not yet used
*)
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
tmqstk_pshsvts
( stk0, svts ) =
let
val
nimp = tmqstk_getnimp(stk0)
in//let
(
stk0 :=
tmqstk_svts(nimp+1, svts, stk0))
end(*let*)//end[tmqstk_pshsvts(...)]
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
//
#implfun
tmqstk_popsvts
  (  stk0  ) = let
//
fnx
loop
( kxs
: tmqstk
, err: &sint >> _): tmqstk =
(
case+ kxs of
//
| ~
tmqstk_svts
( _, _, kxs) => kxs // err = 0
//
| !
tmqstk_timp
(k1, x1, kxs) => loop(kxs, err)
| ~
tmqstk_decl
(k1, x1, kxs) => loop(kxs, err)
//
| !
tmqstk_nil( ) => (err := 1; kxs)
//
| !
tmqstk_let0 _ => (err := 1; kxs)
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
(* ****** ****** *)
//
#implfun
tmqstk_getnimp
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_nil
((*void*)) => (  0  )
//
| !
tmqstk_svts
( nimp
, svts, stk1) => nimp
//
| !
tmqstk_timp
(_, _, stk1) =>
(
  tmqstk_getnimp(stk1))
//
| !
tmqstk_decl
(_, _, stk1) =>
(
  tmqstk_getnimp(stk1))
//
| !
tmqstk_let0
(   stk1   ) =>
(
  tmqstk_getnimp(stk1))
//
| !
tmqstk_loc1
(   stk1   ) =>
(
  tmqstk_getnimp(stk1))
| !
tmqstk_loc2
(   stk1   ) =>
(
  tmqstk_getnimp(stk1))
//
) (*case+*) // end of [tmqstk_getnimp(stk0)]
//
(* ****** ****** *)
//
#implfun
tmqstk_getstmp
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_nil
( (*nil*) ) =>
( the_stamp_nil )
//
| !
tmqstk_svts
(_, _, stk1) =>
(
  tmqstk_getstmp(stk1))
| !
tmqstk_timp
(_, _, stk1) =>
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
tmqstk_nil
((*void*)) =>
(
  list_nil(*void*))
//
| !
tmqstk_svts
( nimp
, svts, stk1) => svts
//
| !
tmqstk_timp
(_, _, stk1) =>
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
) (*case+*) // end of [tmqstk_getsvts(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tmqstk_insert_timp
(stk0, stmp, d3cl) =
(
stk0 :=
tmqstk_timp
(stmp, d3cl, stk0)) where
{
//
(*
val () =
prerrln
("tmqstk_insert_timp: stmp = ", stmp)
val () =
prerrln
("tmqstk_insert_timp: d3cl = ", d3cl)
*)
//
}(*where*)//end-of-[tmqstk_insert_timp(...)]
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
| // toplevel
list_nil
((*void*)) => d3cl
| // embedded
list_cons _ =>
(*
HX-2023-11-22:
re-stamping needed
for an embedded impltmp!
*)
d3ecl_impsub(1, tsub, d3cl))
//
val stmp =
the_tmqstk_stamp_new((*void*))
//
in//let
(
  stk0 :=
  tmqstk_decl(stmp, d3cl, stk0) )
end where
{
(*
val () =
prerrln
("tmqstk_insert_decl: d3cl = ", d3cl)
*)
}(*where*)//end-of-[tmqstk_insert_decl(...)]
//
(* ****** ****** *)
//
#implfun
tmqstk_search_dcst
  (stk0, dcst) =
(
list_vt_reverse0(res)
) where {
val
res = list_vt_nil(*0*)
val
res = loop(stk0,dcst,res)
} where {
//
fun
test
( dcl: d3ecl
, d2c: d2cst): bool =
(
case+
dcl.node() of
//
|
D3Cfundclst _ =>
(
  d3imp_d2csteq(dcl, d2c) )
//
|
D3Cimplmnt0 _ =>
(
  d3imp_d2csteq(dcl, d2c) )
//
|
D3Ctmpsub
(tsub, dcl2) => test(dcl2, d2c)
//
|
D3Ctmplocal
(dcl1, dcls) => tests(dcls, d2c)
//
|
_(* otherwise *) => (   false   )
) where
{
//
(*
//
val () =
prerr("tmqstk_search_dcst:")//val()
val () =
prerrln("test: dcl = ", dcl)//val()
//
val () =
prerr("tmqstk_search_dcst:")//val()
val () =
prerrln("test: d2c = ", d2c)//val()
//
*)
//
}(*where*) // end of [test(dcl, d2c)]
//
and
tests
( dcls
: d3eclist
, d2c: d2cst): bool =
(
case+ dcls of
|
list_nil() => false
|
list_cons(dcl1, dcls) =>
(
  if test(dcl1, d2c)
  then true else tests(dcls, d2c))
)(*case+*) // end of [tests(dcls, d2c)]
//
fun
loop
( kxs:
! tmqstk
, d2c: d2cst
, res
: d3eclist_vt): d3eclist_vt =
(
case+ kxs of
//
| !
tmqstk_nil
( (*nil*) ) => ( res )
//
| !
tmqstk_decl
(tmp, dcl, kxs) =>
(
loop(kxs,d2c,res) ) where
{
//
val res =
(
list_rappendx0_vt(dcs, res)
) where
{ val dcs =
  static_search_dcst(dcl, d2c) }
//
val res =
( if
  test(dcl, d2c)
  then
  list_vt_cons(dcl, res) else res)
//
}(*where*)//end-of[tmqstk_decl(...)]
//
| !
tmqstk_svts
(imp, vts, kxs) => loop(kxs,d2c,res)
| !
tmqstk_timp
(tmp, dcl, kxs) => loop(kxs,d2c,res)
//
| !
tmqstk_let0(kxs) => loop(kxs,d2c,res)
//
| !
tmqstk_loc1(kxs) => loop(kxs,d2c,res)
| !
tmqstk_loc2(kxs) => loop(kxs,d2c,res)
//
) where
{
//
(*
val () =
prerr("tmqstk_search_dcst:")
val () = prerrln("loop: d2c = ", d2c)
*)
//
(*
val () =
prerr("tmqstk_search_dcst:")
val () = prerrln("loop: res = ", res)
*)
//
}(*where*) // end of [loop(kxs,d2c,res)]
//
(*
val () =
prerrln("tmqstk_search_dcst: d2c = ", d2c)
*)
//
}(*where*)//end-of-[tmqstk_search_dcst(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3cenv_make_nil
  ((*nil*)) =
(
  TR3CENV
  (map1, tmqstk_nil)) where
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
#implfun
tr3cenv_pshsvts
( env0 , svts ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  $fold(env0)) where
{
  val () = tmqstk_pshsvts(tmqstk, svts)
}
//
end(*let*)//end(tr3cenv_pshsvts(env0,svts))
//
(* ****** ****** *)
//
#implfun
tr3cenv_popsvts
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
tmqstk_popsvts(tmqstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr3cenv_popsvts(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3cenv_getnimp
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val nimp =
tmqstk_getnimp
  (  tmqstk  ) in $fold(env0); nimp
end//let
//
end(*let*)//end-of-(tr3cenv_getnimp(env0))
//
#implfun
tr3cenv_getstmp
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val stmp =
tmqstk_getstmp
  (  tmqstk  ) in $fold(env0); stmp
end//let
//
end(*let*)//end-of-(tr3cenv_getstmp(env0))
//
#implfun
tr3cenv_getsvts
(     env0     ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val svts =
tmqstk_getsvts
  (  tmqstk  ) in $fold(env0); svts
end//let
//
end(*let*)//end-of-(tr3cenv_getsvts(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3cenv_insert_timp
( env0, stmp, d3cl ) =
let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
tmqstk_insert_timp
(tmqstk, stmp, d3cl) ; $fold(env0) )
//
end(*let*)//end-of-(tr3cenv_insert_timp(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_insert_decl
(   env0, d3cl   ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
(
  tmqstk_insert_decl
  (  tmqstk , d3cl  ) ; $fold(env0) )
//
end(*let*)//end-of-(tr3cenv_insert_decl(env0))
//
(* ****** ****** *)
//
#implfun
tr3cenv_search_dcst
(   env0, d2c0   ) = let
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val dcls =
tmqstk_search_dcst
  ( tmqstk, d2c0 ) in $fold(env0); dcls
end//let
//
end(*let*)//end-of-(tr3cenv_search_dcst(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tmqstk_impltmprecq
( stk0:
! tmqstk
, d3cl: stamp
, t2js: t2jaglst): stamp =
(
case+ stk0 of
|
tmqstk_nil
( (*nil*) ) =>
the_stamp_nil(*void*)
//
|
tmqstk_timp
(stmp, dcl1, stk1) =>
(
if
d3imp_stampeq
(dcl1 , d3cl)
then
(
let
val
test =
tmpequal_d3cl_t2js(dcl1, t2js)
//
(*
val () =
prerr("tmqstk_impltmprecq:")
val () =
prerrln("tmpequal: test = ", test)
*)
//
in//let
//
if test
then stmp else
(
tmqstk_impltmprecq(stk1,d3cl,t2js))
end//let// end-of-then
) else
(
tmqstk_impltmprecq(stk1,d3cl,t2js))
) where
{
//
(*
val () =
prerr("tmqstk_impltmprecq:")
val () =
prerrln("tmqstk_timp: dcl1 = ", dcl1)
*)
//
}(*where*)//end-of-[tmqstk_timp(...)]
//
|
tmqstk_svts
(_, _, stk1) =>
tmqstk_impltmprecq(stk1, d3cl, t2js)
//
|
tmqstk_decl
(stmp
,dcl1, stk1) => // HX: speedup?
tmqstk_impltmprecq(stk1, d3cl, t2js)
//
|
tmqstk_let0(stk1) =>
tmqstk_impltmprecq(stk1, d3cl, t2js)
|
tmqstk_loc1(stk1) =>
tmqstk_impltmprecq(stk1, d3cl, t2js)
|
tmqstk_loc2(stk1) =>
tmqstk_impltmprecq(stk1, d3cl, t2js)
//
) where
{
//
(*
val () = // d3cl: stamp
prerrln("tmqstk_impltmprecq: d3cl = ", d3cl)
val () =
prerrln("tmqstk_impltmprecq: t2js = ", t2js)
*)
//
}(*where*) // end-of-[tmqstk_impltmprecq(...)]
//
#implfun
tr3cenv_impltmprecq
(env0, d3cl, t2js) =
let
//
val
tmp0 =
d3imp_get_stmp(d3cl)
//
val+
@TR3CENV
(topmap, !tmqstk) = env0
//
in//let
//
let
val test =
tmqstk_impltmprecq
(tmqstk, tmp0, t2js) in $fold(env0); test
end//let
//
end where
{
//
(*
val () =
prerrln("tr3cenv_impltmprecq: d3cl = ", d3cl)
val () =
prerrln("tr3cenv_impltmprecq: t2js = ", t2js)
*)
//
}(*where*) // end-of-(tr3cenv_impltmprecq(env0))
//
(* ****** ****** *)
//
(*
endloc (*local*) // end of [ local(tr3cenv...) ]
*)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trtmp3c_myenv0.dats] *)
