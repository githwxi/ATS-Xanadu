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
#staload "./../SATS/dynexp2.sats"
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
| tmpstk_loc1 of (tmpstk)
| tmpstk_loc2 of (tmpstk)
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
tmpstk_pshlet0
  (  stk  ) =
(
  stk := tmpstk_let0(stk))
//(*end of [tmpstk_pshlet0(stk)]*)
//
(* ****** ****** *)
//
#implfun
tmpstk_pshloc1
  (  stk  ) =
(
  stk := tmpstk_loc1(stk))
//(*end of [tmpstk_pshloc1(stk)]*)
//
#implfun
tmpstk_pshloc2
  (  stk  ) =
(
  stk := tmpstk_loc2(stk))
//(*end of [tmpstk_pshloc2(stk)]*)
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
tmpstk_loc1 _ => (err := 1; kxs)
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
| ~
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
tmpstk_loc1 _ => (err := 1; kxs)
| !
tmpstk_loc2 _ => (err := 1; kxs)
//
) (*case+*) // end of [loop(kxs,err)]
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
tmpstk_locjoin
  (  stk  ) = let
//
fnx
poploc1
( kxs
: tmpstk
, kys
: tmpstk
, err: &sint >> _): tmpstk =
(
case+ kxs of
| ~
tmpstk_loc1
(   kxs   ) =>
(
  pshloc2(kxs, kys, err))
| ~
tmpstk_cons
(k1, x1, kxs) =>
(
  poploc1(kxs, kys, err))
| !
tmpstk_nil( ) =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc1: tmpstk_nil")
}
//
| !
tmpstk_let0 _ =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc1: tmpstk_let0")
}
| !
tmpstk_loc2 _ =>
( err := 1;
  pshloc2(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc1: tmpstk_loc1")
}
) (*case+*)//end of [poploc1(kxs,kys,err)]
//
and
poploc2
( kxs
: tmpstk
, kys
: tmpstk
, err: &sint >> _): tmpstk =
(
case+ kxs of
| ~
tmpstk_loc2
(   kxs   ) =>
(
  poploc1(kxs, kys, err))
| ~
tmpstk_cons
(k1, x1, kxs) =>
(
  poploc2(kxs, kys, err))
where {
val kys = tmpstk_cons(k1, x1, kys)
} (*where*)//end-of-[tmpstk_cons(...)]
//
| !
tmpstk_nil( ) =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc2: tmpstk_nil")
}
//
| !
tmpstk_let0 _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc2: tmpstk_let0")
}
| !
tmpstk_loc1 _ =>
( err := 1;
  poploc1(kxs, kys, err)) where
{
val () = prerrln
("tmpstk_locjoin: poploc2: tmpstk_loc1")
}
//
) (*case+*)//end of [poploc2(kxs,kys,err)]
//
and
pshloc2
( kxs
: tmpstk
, kys
: tmpstk
, err: &sint >> _): tmpstk =
(
case- kys of
| ~
tmpstk_nil() => kxs
| ~
tmpstk_cons
(k1, x1, kys) =>
(
pshloc2(kxs, kys, err))
where
{
  val kxs =
  tmpstk_cons(k1, x1, kxs) }
) (*case+*)//end of [pshloc2(kxs,kys,err)]
//
in//let
//
let
var err: sint = 0
//
val kxs = stk
val kys = tmpstk_nil()
//
val ( ) =
(stk := poploc2(kxs, kys, err)) in err
end (*let*)
//
end (*let*) // end of [tmpstk_locjoin(stk)]

(* ****** ****** *)
//
#implfun
tmpstk_getstmp
  (  stk  ) =
(
case+ stk of
//
| !
tmpstk_cons
(tmp, _, _) => ( tmp )
//
| !
tmpstk_let0
(   stk   ) =>
(
  tmpstk_getstmp(stk))
//
| !
tmpstk_loc1
(   stk   ) =>
(
  tmpstk_getstmp(stk))
| !
tmpstk_loc2
(   stk   ) =>
(
  tmpstk_getstmp(stk))
//
| !
tmpstk_nil() => the_stamp_nil
//
) (*case+*) // end of [tmpstk_getstmp(stk)]
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
end (*let*)//end-of-[tmpstk_insert_dcl(...)]
//
(* ****** ****** *)
//
#implfun
tmpstk_search_cst
  (stk, d2c) =
(
list_vt_reverse0(res) where
{
val res = list_vt_nil()
val res = loop(stk, d2c, res) }
) where
{
//
fun
test
( dcl: d3ecl
, d2c: d2cst): bool =
(
case+
dcl.node() of
//
| D3Cfundclst _ =>
(
  d3ecl_impld2cq(dcl, d2c) )
//
| D3Cimpltmp _ =>
(
  d3ecl_impld2cq(dcl, d2c) )
//
| D3Ctmplocal
  (dcl1, dcls) => test(dcl, d2c)
//
| _(* otherwise *) => (   false   )
) where
{
//
(*
val () =
prerr("tmpstk_search_cst: ")
val () = prerrln("test: dcl = ", dcl)
val () = prerrln("test: d2c = ", d2c)
*)
//
}(*where*) // end of [ test(dcl, d2c) ]
//
fun
loop
( kxs:
! tmpstk
, d2c: d2cst
, res
: d3eclist_vt): d3eclist_vt =
(
case+ kxs of
//
| !
tmpstk_nil() => ( res )
//
| !
tmpstk_cons
(tmp, dcl, kxs) =>
loop(kxs, d2c, res) where
{
//
val res =
(
list_rappendx0_vt(dcs, res)
) where
{ val dcs =
  static_search_cst(dcl, d2c) }
//
val res =
( if
  test(dcl, d2c)
  then
  list_vt_cons(dcl, res) else res)
}
//
| !
tmpstk_let0(kxs) => loop(kxs,d2c,res)
| !
tmpstk_loc1(kxs) => loop(kxs,d2c,res)
| !
tmpstk_loc2(kxs) => loop(kxs,d2c,res)
//
) (*case+*)//end of [loop(kxs,d2c,res)]
//
(*
val () =
prerrln("tmpstk_search_cst: d2c = ", d2c)
*)
//
} (*where*)//end-of-[tmpstk_search_cst(...)]
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
val nerr = tmpstk_poptop0(tmpstk)
//
val (  ) = tmpstk_free_nil(tmpstk) endlet
//
)(*case+*)//end-of-(tr3benv_free_top(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_poplet0
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
let
val nerr =
tmpstk_poplet0(tmpstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr3benv_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_pshlet0
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
(
  tmpstk_pshlet0(tmpstk); $fold(env0))
//
end(*let*)//end-of-(tr3benv_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_pshloc1
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
(
  tmpstk_pshloc1(tmpstk); $fold(env0))
//
end(*let*)//end-of-(tr3benv_pshloc1(env0))
//
#implfun
tr3benv_pshloc2
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
(
  tmpstk_pshloc2(tmpstk); $fold(env0))
//
end(*let*)//end-of-(tr3benv_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_locjoin
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
(
  tmpstk_locjoin(tmpstk); $fold(env0))
//
end(*let*)//end-of-(tr3benv_locjoin(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_getstmp
(     env0     ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
let
val stmp =
tmpstk_getstmp
  (  tmpstk  ) in $fold(env0); stmp
end//let
//
end(*let*)//end-of-(tr3benv_getstmp(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_insert_dcl
(   env0, d3cl   ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
(
  tmpstk_insert_dcl
  (  tmpstk , d3cl  ) ; $fold(env0) )
//
end(*let*)//end-of-(tr3benv_insert_dcl(env0))
//
(* ****** ****** *)
//
#implfun
tr3benv_search_cst
(   env0, d2c0   ) = let
//
val+
@TR3BENV
(topmap, !tmpstk) = env0
//
in//let
//
let
val dcls =
tmpstk_search_cst
  ( tmpstk, d2c0 ) in $fold(env0); dcls
end//let
//
end(*let*)//end-of-(tr3benv_search_cst(env0))
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(tr3benv...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_myenv0.dats] *)
