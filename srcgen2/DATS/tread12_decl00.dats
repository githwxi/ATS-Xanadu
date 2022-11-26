(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 12 Nov 2022 09:06:44 AM EST
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
//
fun
d2ecl_errck
(lvl0: sint
,d2cl: d2ecl): d2ecl =
let
val loc0 = d2cl.lctn()
in//let
d2ecl_make_node
(loc0, D2Cerrck(lvl0, d2cl))
end (*let*) // end-of(d2ecl_errck)
//
(* ****** ****** *)
//
fun
d2ecl_local0_errck
( loc0
: loc_t
, dcs1
: d2eclist
, dcs2
: d2eclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Clocal0(dcs1,dcs2)))
end (*let*) // end of [d2ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d2ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_static_errck]
//
fun
d2ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d2ecl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d2ecl_extern_errck]
//
(* ****** ****** *)
//
fun
d2ecl_sortdef_errck
( loc0: loc_t
, sym1: sym_t
, def2: s2tex): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Csortdef(sym1,def2)))
end (*let*) // end of [d2ecl_sortdef_errck]
//
(* ****** ****** *)
//
fun
d2ecl_abssort_errck
( loc0: loc_t
, sym1: sym_t): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0, D2Cabssort(  sym1  )))
end (*let*) // end of [d2ecl_abssort_errck]
//
(* ****** ****** *)
//
fun
d2ecl_sexpdef_errck
( loc0: loc_t
, s2c1: s2cst
, def2: s2exp): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Csexpdef(s2c1,def2)))
end (*let*) // end of [d2ecl_sexpdef_errck]
//
(* ****** ****** *)
//
fun
d2ecl_datasort_errck
( loc0: loc_t
, d1cl: d1ecl
, s2ts: sort2lst): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Cdatasort(d1cl,s2ts)))
end (*let*) // end of [d2ecl_datasort_errck]
//
(* ****** ****** *)

#implfun
tread12_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|
D2Cd1ecl _ => d2cl
//
|
D2Cstatic _ => f0_static(d2cl, err)
|
D2Cextern _ => f0_extern(d2cl, err)
//
|
D2Clocal0 _ => f0_local0(d2cl, err)
//
|
D2Cabssort _ => f0_abssort(d2cl, err)
//
|
D2Csortdef _ => f0_sortdef(d2cl, err)
|
D2Csexpdef _ => f0_sexpdef(d2cl, err)
//
|
D2Cdatasort _ => f0_datasort(d2cl, err)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2ecl_errck(lvl0, d2cl))
endlet // end of [ _ (* otherwise *) ]
//
) where // end of [case+(d2cl.node())]
{
(*
val (  ) =
prerrln("tread12_d2ecl: d2cl = ", d2cl)
*)
//
(* ****** ****** *)
//
fun
f0_static
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread12_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread12_d2ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d2ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_local0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread12_d2eclist(dcs1, err)
val dcs2 =
tread12_d2eclist(dcs2, err)
//
in
if
(e00=err)
then dcl else
d2ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_abssort
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cabssort(sym1) = dcl.node()
//
(*
HX-2022-11-26: checking symbol-error!
*)
//
in//let
if
(e00=err)
then dcl else
d2ecl_abssort_errck( dcl.lctn(), sym1 )
end (*let*) // end of [ f0_abssort(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_sortdef
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Csortdef
(sym1, def2) = dcl.node()
//
val
def2 = tread12_s2tex(def2, err)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_sortdef_errck( loc, sym1, def2 )
end (*let*) // end of [f0_sortdef(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_sexpdef
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Csexpdef
(s2c1, def2) = dcl.node()
//
val
def2 = tread12_s2exp(def2, err)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_sexpdef_errck( loc, s2c1, def2 )
end (*let*) // end of [f0_sexpdef(dcl,err)]
//
(* ****** ****** *)
//
local

(* ****** ****** *)
//
fun
f1_s2cst
( s2c: s2cst
, err: &sint >> _): void =
let
val s2t =
tread12_sort2(s2c.sort(), err)
end (*let*) // end of [f1_s2cst(...)]
//
fun
f1_s2cstlst
( s2cs
: s2cstlst
, err: &sint >> _): void =
(
case+ s2cs of
|
list_nil() => ()
|
list_cons(s2c1, s2cs) =>
let
  val () = f1_s2cst(s2c1, err)
  val () = f1_s2cstlst(s2cs, err)
end (*let*) // end of [list_cons(_,_)]
) (*case+*) // end of [f1_s2cstlst(...)]
//
(* ****** ****** *)

fun
f1_sort2lst
( s2ts
: sort2lst
, err: &sint >> _): void =
(
case+ s2ts of
|
list_nil() => ()
|
list_cons(s2t1, s2ts) =>
( f1_sort2(s2t1, err)
; f1_sort2lst(s2ts, err) )
) where
{
//
fun
f1_sort2
( s2t: sort2
, err: &sint >> _): void =
(
case+ s2t of
|
S2Tbas(t2b) =>
f1_t2bas(t2b, err) | _ => ())
//
and
f1_t2bas
( t2b: t2bas
, err: &sint >> _): void =
(
case+ t2b of
| T2Btdat(tdat) =>
  f1_s2cstlst(tdat.s2cs(), err)
| _(* non-T2Bdat *) => ( (*void*) )
)
//
} (*where*) // end of [f1_sort2lst(...)]

in//local
//
fun
f0_datasort
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cdatasort
(d1cl, s2ts) = dcl.node()
//
val () = f1_sort2lst(s2ts, err)
(*
val
s2ts = tread12_sort2lst(s2ts, err)
*)
//
in//let
if
(e00=err)
then (dcl) else
d2ecl_datasort_errck( loc, d1cl, s2ts )
end (*let*) // end of [f0_datasort(dcl,err)]
//
end (*local*) // end of [local(f0_datasort)]
//
(* ****** ****** *)
//
} (*where*) // end of [tread12_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread12_d2eclist
  (  dcls, err  ) =
list_tread12_fnp(dcls, err, tread12_d2ecl)
//
(* ****** ****** *)
#implfun
tread12_d2valdclist
  (  d2vs, err  ) =
list_tread12_fnp(d2vs, err, tread12_d2valdcl)
(* ****** ****** *)
#implfun
tread12_d2vardclist
  (  d2vs, err  ) =
list_tread12_fnp(d2vs, err, tread12_d2vardcl)
(* ****** ****** *)
#implfun
tread12_d2fundclist
  (  d2fs, err  ) =
list_tread12_fnp(d2fs, err, tread12_d2fundcl)
(* ****** ****** *)
#implfun
tread12_d2cstdclist
  (  d2cs, err  ) =
list_tread12_fnp(d2cs, err, tread12_d2cstdcl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_decl00.dats] *)
