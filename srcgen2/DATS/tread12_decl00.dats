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
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
#symload lctn with d2cstdcl_get_lctn
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
d2ecl_stacst0_errck
( loc0: loc_t
, s2c1: s2cst
, s2t2: sort2): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Cstacst0(s2c1,s2t2)))
end (*let*) // end of [d2ecl_stacst0_errck]
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
d2ecl_abstype_errck
( loc0: loc_t
, s2c1: s2cst
, atdf: a2tdf): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Cabstype(s2c1,atdf)))
end (*let*) // end of [d2ecl_abstype_errck]
//
(* ****** ****** *)
//
fun
d2ecl_absopen_errck
( loc0: loc_t
, tknd: token
, simp: simpl): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1,d2ecl(loc0,D2Cabsopen(tknd,simp)))
end (*let*) // end of [d2ecl_absopen_errck]
//
(* ****** ****** *)
//
fun
d2ecl_absimpl_errck
( loc0: loc_t
, tknd: token
, simp: simpl
, sdef: s2exp): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1
,d2ecl(loc0, D2Cabsimpl(tknd,simp,sdef)))
end (*let*) // end of [d2ecl_absimpl_errck]
//
(* ****** ****** *)
//
fun
d2ecl_symload_errck
( loc0: loc_t
, tknd: token
, sym1: sym_t
, dptm: d2ptm): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1
,d2ecl(loc0, D2Csymload(tknd,sym1,dptm)))
end (*let*) // end of [d2ecl_symload_errck]
//
(* ****** ****** *)
//
fun
d2ecl_include_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g1e1: g1exp
, fopt: fpathopt
, dopt: d2eclistopt): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1,
d2ecl_make_node
( loc0
, D2Cinclude(knd0,tknd,g1e1,fopt,dopt)))
end (*let*) // end of [d2ecl_include_errck]
//
(* ****** ****** *)
//
fun
d2ecl_staload_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g1e1: g1exp
, fopt: fpathopt
, dres: s2taloadopt): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1,
d2ecl_make_node
( loc0
, D2Cstaload(knd0,tknd,g1e1,fopt,dres)))
end (*let*) // end of [d2ecl_staload_errck]
//
(* ****** ****** *)
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
(* ****** ****** *)
//
fun
d2ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2valdclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvaldclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d2ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d2vs
: d2vardclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cvardclst(tknd,d2vs)))
end (*let*) // end of [d2ecl_vardclst_errck]
//
(* ****** ****** *)
//
fun
d2ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t2qaglst
, d2cs
: d2cstlst
, d2fs
: d2fundclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl
  (loc0,D2Cfundclst(tknd,tqas,d2cs,d2fs)) )
end (*let*) // end of [d2ecl_fundclst_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_implmnt0_errck
( loc0
: loc_t
, tknd
: token
, sqas
: s2qaglst
, tqas
: t2qaglst
, dqid
: dimpl
, tias
: t2iaglst
, fags
: f2arglst
, sres: s2res(*tret*)
, d2e1: d2exp(*body*)): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(
lvl+1
,
d2ecl_make_node
( loc0
, D2Cimplmnt0
  ( tknd
  , sqas,tqas,dqid,tias,fags,sres,d2e1 ) ))
end (*let*) // end of [d2ecl_implmnt0_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_excptcon_errck
( loc0: loc_t
, d1cl: d1ecl
, d2cs: d2conlst): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cexcptcon(d1cl,d2cs)))
end (*let*) // end of [d2ecl_excptcon_errck]
//
(* ****** ****** *)
//
fun
d2ecl_datatype_errck
( loc0: loc_t
, d1cl: d1ecl
, s2cs: s2cstlst): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
(lvl+1, d2ecl(loc0,D2Cdatatype(d1cl,s2cs)))
end (*let*) // end of [d2ecl_datatype_errck]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2ecl_dynconst_errck
( loc0: loc_t
, tknd: token
, tqas: t2qaglst
, d2cs: d2cstdclist): d2ecl =
let
val lvl = 0
in//let
d2ecl_errck
( lvl+1
, d2ecl(loc0, D2Cdynconst(tknd,tqas,d2cs)))
end (*let*) // end of [d2ecl_dynconst_errck]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
tread12_d2ecl
  (d2cl, err) =
(
case+
d2cl.node() of
//
|D2Cnone0 _ => d2cl
|D2Cd1ecl _ => d2cl
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
D2Cstacst0 _ => f0_stacst0(d2cl, err)
//
|
D2Csortdef _ => f0_sortdef(d2cl, err)
|
D2Csexpdef _ => f0_sexpdef(d2cl, err)
//
|
D2Cabstype _ => f0_abstype(d2cl, err)
|
D2Cabsopen _ => f0_absopen(d2cl, err)
|
D2Cabsimpl _ => f0_absimpl(d2cl, err)
//
|
D2Csymload _ => f0_symload(d2cl, err)
//
|
D2Cinclude _ => f0_include(d2cl, err)
|
D2Cstaload _ => f0_staload(d2cl, err)
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 01:50:44 PM EDT
*)
//
|
D2Cdyninit _ => f0_dyninit(d2cl, err)
|
D2Cextcode _ => f0_extcode(d2cl, err)
//
(* ****** ****** *)
//
|
D2Cdatasort _ => f0_datasort(d2cl, err)
//
|
D2Cvaldclst _ => f0_valdclst(d2cl, err)
|
D2Cvardclst _ => f0_vardclst(d2cl, err)
|
D2Cfundclst _ => f0_fundclst(d2cl, err)
//
|
D2Cimplmnt0 _ => f0_implmnt0(d2cl, err)
//
|
D2Cexcptcon _ => f0_excptcon(d2cl, err)
|
D2Cdatatype _ => f0_datatype(d2cl, err)
//
|
D2Cdynconst _ => f0_dynconst(d2cl, err)
//
|
_(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2ecl_errck(lvl0, d2cl))
endlet // end of [  _(* otherwise *)  ]
//
) where// end of [ case+(d2cl.node()) ]
{
(* ****** ****** *)
(*
val (  ) =
prerrln("tread12_d2ecl: d2cl = ", d2cl)
*)
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
(err=e00)
then dcl else
d2ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
(* ****** ****** *)
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
(err=e00)
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
(err=e00)
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
(err=e00)
then dcl else
d2ecl_abssort_errck( dcl.lctn(), sym1 )
end (*let*) // end of [ f0_abssort(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_stacst0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cstacst0
(s2c1, s2t2) = dcl.node()
//
val
s2t2 = tread12_sort2(s2t2, err)
//
in//let
if
(err=e00)
then dcl else
d2ecl_stacst0_errck(loc, s2c1, s2t2)
end (*let*) // end of [ f0_stacst0(dcl,err) ]
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
(err=e00)
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
(err=e00)
then (dcl) else
d2ecl_sexpdef_errck( loc, s2c1, def2 )
end (*let*) // end of [f0_sexpdef(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_abstype
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cabstype
(s2c1, atdf) = dcl.node()
//
val
atdf = tread12_a2tdf(atdf, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_abstype_errck( loc, s2c1, atdf )
end (*let*) // end of [f0_abstype(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_absopen
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cabsopen
(tknd, simp) = dcl.node()
//
val
simp = tread12_simpl(simp, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_absopen_errck( loc, tknd, simp )
end (*let*) // end of [f0_absopen(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_absimpl
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cabsimpl
( tknd
, simp, sdef) = dcl.node()
//
val
simp = tread12_simpl(simp, err)
val
sdef = tread12_s2exp(sdef, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_absimpl_errck(loc,tknd,simp,sdef)
end (*let*) // end of [f0_absimpl(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_symload
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Csymload
( tknd
, sym1, dptm) = dcl.node()
//
val () =
(
case+ dptm of
|
D2PTMnone(dqid) => (err := err+1)
|
D2PTMsome(pval,d2i1) => ((*void*))
) (*case+*) // end of [val(*void*)]
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_symload_errck(loc,tknd,sym1,dptm)
end (*let*) // end of [f0_symload(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_include
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
(*
val loc = dcl.lctn()
*)
//
val-
D2Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl.node()
//
//
val loc = dcl.lctn()
//
(*
val () =
prerrln
("f0_include(12): loc = ", loc)
val () =
prerrln
("f0_include(12): dopt = ", dopt)
*)
//
val dopt =
(
case+ dopt of
|optn_nil() =>
 (err := err+1; optn_nil(*0*))
|optn_cons(dcls) =>
 optn_cons
 (tread12_d2eclist(dcls, err)))
: d2eclistopt // end of [val(dopt)]
//
in//let
(
if
(err=e00)
then (dcl) else
d2ecl_include_errck
(loc, knd0, tknd, gsrc, fopt, dopt) )
end (*let*) // end of [f0_include(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_staload
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dres) = dcl.node()
//
val fknd =
(
case+ dres of
|S2TALOADnone _ =>
 (err := err+1; 0)
|S2TALOADfenv _ => 1
|S2TALOADdpar _ => 2): sint//val(fknd)
//
(*
val () =
prerrln
("f0_staload(12): loc = ", loc)
val () =
prerrln
("f0_staload(12): gsrc = ", gsrc)
val () =
prerrln
("f0_staload(12): fopt = ", fopt)
val () =
prerrln
("f0_staload(12): dres = ", dres)
val () =
prerrln
("f0_staload(12): fknd = ", fknd)
*)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_staload_errck
( loc, knd0, tknd, gsrc, fopt, dres )
end (*let*) // end of [f0_staload(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 01:52:57 PM EDT
*)
//
fun
f0_dyninit
(dcl: d2ecl
,err: &sint >> _): d2ecl =
let
val-D2Cdyninit _ = dcl.node() in (dcl) end
//
fun
f0_extcode
(dcl: d2ecl
,err: &sint >> _): d2ecl =
let
val-D2Cextcode _ = dcl.node() in (dcl) end
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
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
(err=e00)
then (dcl) else
d2ecl_datasort_errck( loc, d1cl, s2ts )
end (*let*) // end of [f0_datasort(dcl,err)]
//
end (*local*) // end of [local(f0_datasort)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvaldclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread12_d2valdclist(d2vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_valdclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cvardclst
(tknd, d2vs) = dcl.node()
//
val d2vs =
tread12_d2vardclist(d2vs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_vardclst_errck(dcl.lctn(),tknd,d2vs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cfundclst
( tknd
, tqas
, d2cs, d2fs) = dcl.node()
//
(*
val tqas =
tread12_t2qaglst(tqas, err)
*)
val d2fs =
tread12_d2fundclist(d2fs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_fundclst_errck
( dcl.lctn() , tknd , tqas , d2cs , d2fs )
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cimplmnt0
(tknd
,sqas,tqas
,dqid
,tias,fags
,sres,body) = dcl.node()
//
val
sqas =
tread12_s2qaglst(sqas, err)
val
tqas =
tread12_t2qaglst(tqas, err)
//
val
tias =
tread12_t2iaglst(tias, err)
val
fags =
tread12_f2arglst(fags, err)
//
val
sres = tread12_s2res(sres, err)
val
body = tread12_d2exp(body, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_implmnt0_errck
(dcl.lctn(), tknd
,sqas, tqas, dqid, tias, fags, sres, body)
end (*let*) // end of [f0_implmnt0(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_excptcon
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cexcptcon
(d1cl, d2cs) = dcl.node()
//
val d2cs =
tread12_d2conlst(d2cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_excptcon_errck(dcl.lctn(),d1cl,d2cs)
end (*let*) // end of [f0_excptcon(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_datatype
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
//
val-
D2Cdatatype
(d1cl, s2cs) = dcl.node()
//
val s2cs =
tread12_s2cstlst(s2cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_datatype_errck(dcl.lctn(),d1cl,s2cs)
end (*let*) // end of [f0_datatype(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_dynconst
( dcl: d2ecl
, err: &sint >> _): d2ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D2Cdynconst
(tknd
,tqas, d2cs) = dcl.node()
//
val tqas =
  tread12_t2qaglst(tqas, err)
val d2cs =
  tread12_d2cstdclist(d2cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d2ecl_dynconst_errck(loc, tknd, tqas, d2cs)
end (*let*) // end of [f0_dynconst(dcl,err)]
//
(* ****** ****** *)
//
} (*where*) // end of [tread12_d2ecl(d2cl,err)]

(* ****** ****** *)
//
#implfun
tread12_s2qag
  (s2q0, err) =
(
s2q0 where
{ val
  s2vs = tread12_s2varlst(s2q0.s2vs(), err) }
) (*case+*) // end-of-[tread12_s2qag(s2q0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_t2qag
  (t2q0, err) =
(
t2q0 where
{ val
  s2vs = tread12_s2varlst(t2q0.s2vs(), err) }
) (*case+*) // end-of-[tread12_t2qag(t2q0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_t2iag
  (t2i0, err) =
let
val e00 = err
val s2es =
tread12_s2explst(t2i0.s2es(), err)
in//let
(
  t2i0 ) where
{
val () =
if
(e00 != err) then t2iag_set_s2es(t2i0,s2es) }
end (*let*) // end-of-[tread12_t2iag(t2i0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_simpl
  (simp, err) =
(
case+
simp.node() of
//
|SIMPLone1 _ => simp
//
|SIMPLall1 _ => simp where
{
// HX-2023-07-20: deadcode
  val () = (err := err + 1) }
//
|SIMPLopt2
(sqid, scs1, scs2) => simp where
{
val () =
(
case+ scs2 of
|list_nil() =>
(err := err+1) | list_cons _ => ())
}
) where
{
//
(*
  val loc0 = simp.lctn()
  val (  ) =
  prerrln("tread12_simpl: loc0 = ", loc0)
  val (  ) =
  prerrln("tread12_simpl: simp = ", simp)
*)
//
} (*where*) // end-of-[tread12_simpl(simp,err)]
//
(* ****** ****** *)
//
#implfun
tread12_dimpl
  (dimp, err) =
(
case+
dimp.node() of
|
DIMPLone1 _ => dimp
//
|
DIMPLall1
(dqid, d2cs) => dimp where
{
val () =
(
case+ d2cs of
|list_nil() =>
(err := err+1) | list_cons _ => ())
}
//
|DIMPLopt2(dqid, d2cs, dopt) => dimp
//
) where
{
//
(*
  val loc0 = dimp.lctn()
  val (  ) =
  prerrln("tread12_dimpl: loc0 = ", loc0)
  val (  ) =
  prerrln("tread12_dimpl: dimp = ", dimp)
*)
//
} (*where*) // end-of-[tread12_dimpl(dimp,err)]
//
(* ****** ****** *)
//
#implfun
tread12_a2tdf
  (atdf, err) =
(
case- atdf of
//
|A2TDFsome
((*void*)) => atdf
//
(*
|A2TDFdefn
(  sdef  ) => atdf
*)
//
|A2TDFlteq
(  sdef  ) =>
let
val e00 = err
val sdef =
tread12_s2exp(sdef, err)
in//let
if
(err=e00)
then atdf else A2TDFlteq(sdef) end
//
|A2TDFeqeq
(  sdef  ) =>
let
val e00 = err
val sdef =
tread12_s2exp(sdef, err)
in//let
if
(err=e00)
then atdf else A2TDFeqeq(sdef) end
//
) (*case-*) // end-of-[tread12_a2tdf(atdf,err)]
//
(* ****** ****** *)
//
#implfun
tread12_teqd2exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD2EXPnone() => tdxp
|
TEQD2EXPsome(teq1, d2e2) =>
let
val e00 = err
(*
val ( ) =
prerrln
("tread12_teqd2exp: d2e2 = ", d2e2)
*)
val d2e2 = tread12_d2exp(d2e2, err)
in//letp
if
(err=e00)
then tdxp else TEQD2EXPsome(teq1, d2e2)
endlet // end of [ TEQD2EXPsome( _,_ ) ]
) (*case+*)//end-(tread12_teqd2exp(tdxp,err))
//
(* ****** ****** *)
//
#implfun
tread12_wths2exp
  (wsxp, err) =
(
case+ wsxp of
|
WTHS2EXPnone() => wsxp
|
WTHS2EXPsome(twth, s2e1) =>
let
val e00 = err
(*
val ( ) =
prerrln
("tread12_wths2exp: s2e1 = ", s2e1)
*)
val s2e1 = tread12_s2exp(s2e1, err)
in//let
if
(err=e00)
then wsxp else WTHS2EXPsome(twth, s2e1)
endlet // end of [ WTHS2EXPsome( _,_ ) ]
) (*case+*)//end-(tread12_wths2exp(wsxp,err))
//
(* ****** ****** *)
//
#implfun
tread12_d2valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = d2valdcl_get_dpat(dval)
val
tdxp = d2valdcl_get_tdxp(dval)
val
wsxp = d2valdcl_get_wsxp(dval)
//
val
dpat = tread12_d2pat(dpat,err)
val
tdxp = tread12_teqd2exp(tdxp,err)
val
wsxp = tread12_wths2exp(wsxp,err)
//
in//let
if
(err=e00)
then (dval)
else d2valdcl( loc, dpat, tdxp, wsxp )
endlet // end-of-[tread12_d2valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
tread12_d2vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
//
val
dpid = d2vardcl_get_dpid(dvar)
val
vpid = d2vardcl_get_vpid(dvar)
val
sres = d2vardcl_get_sres(dvar)
val
dini = d2vardcl_get_dini(dvar)
//
val
sres = tread12_s2expopt(sres,err)
val
dini = tread12_teqd2exp(dini,err)
//
in//let
if
(err=e00)
then (dvar)
else d2vardcl(loc,dpid,vpid,sres,dini)
endlet // end-of-[tread12_d2vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
tread12_d2fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
//
val
dpid = d2fundcl_get_dpid(dfun)
val
farg = d2fundcl_get_farg(dfun)
val
sres = d2fundcl_get_sres(dfun)
val
tdxp = d2fundcl_get_tdxp(dfun)
val
wsxp = d2fundcl_get_wsxp(dfun)
//
val
farg =
tread12_f2arglst(farg, err)
//
val
sres = tread12_s2res(sres,err)
val
tdxp = tread12_teqd2exp(tdxp,err)
val
wsxp = tread12_wths2exp(wsxp,err)
//
in//let
if
(err=e00)
then (dfun)
else d2fundcl(loc,dpid,farg,sres,tdxp,wsxp)
endlet // end-of-[tread12_d2fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
tread12_d2cstdcl
  (dcst, err) =
let
//
val e00 = err
//
val loc = dcst.lctn()
//
val
dpid = d2cstdcl_get_dpid(dcst)
val
darg = d2cstdcl_get_darg(dcst)
val
sres = d2cstdcl_get_sres(dcst)
val
dres = d2cstdcl_get_dres(dcst)
//
val
darg =
tread12_d2arglst(darg, err)
val
sres = tread12_s2res(sres, err)
val
dres = tread12_teqd2exp(dres, err)
//
in//let
if
(err=e00)
then (dcst)
else d2cstdcl(loc, dpid, darg, sres, dres)
endlet // end-of-[tread12_d2cstdcl(out,dcst)]
//
(* ****** ****** *)
//
#implfun
tread12_d2eclist
  (  dcls, err  ) =
list_tread12_fnp(dcls, err, tread12_d2ecl)
//
(* ****** ****** *)
#implfun
tread12_s2qaglst
  (  sqas, err  ) =
list_tread12_fnp(sqas, err, tread12_s2qag)
#implfun
tread12_t2qaglst
  (  tqas, err  ) =
list_tread12_fnp(tqas, err, tread12_t2qag)
#implfun
tread12_t2iaglst
  (  tias, err  ) =
list_tread12_fnp(tias, err, tread12_t2iag)
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

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread12_decl00.dats] *)
