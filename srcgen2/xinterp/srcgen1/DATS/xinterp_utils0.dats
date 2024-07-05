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
Sat Dec  9 11:14:33 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload ctag with d2con_get_ctag
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irvaltup_make_list
  (irvs) =
(
  a1rsz_make_list(irvs))
//
(* ****** ****** *)
//
#implfun
irvalrcd_make_list
  (livs) =
let
val rcd2 =
tmpmap_make_nil((*0*))
in//let
(
let
val () =
list_foreach
<l0irv>(livs) in rcd2 end
) where
{
#impltmp
foreach$work
<l0irv>(lirv) =
let
val+IRLAB(lab, irv) = lirv
in//let
//
case- lab of
|LABsym(sym) =>
let
val tmp =
(
  $SYM.symbl_get_stmp(sym) )
in//let
tmpmap_insert_any(rcd2,tmp,irv)
end//let
//
end//let//end(foreach$work(lirv))
} endlet//end-of-[irvalrcd_make_list]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irlft_deget
(  lval  ) =
(
case+ lval of
|
IRLFTref0(ref1) =>
let
//
val
opt1 = a0ref_get(ref1)
//
in//let
//
(
case+ opt1 of
|optn_nil
((*nil*)) => IRVnil()
|optn_cons irv1 => irv1)//case
//
end//let//end-of-[IRLFTref0(...)]
//
|
IRLFTpcon
(tknd, lab1, irv1) =>
(
case- irv1 of
|IRVcapp
(d2c1, irvs) =>
(
case- lab1 of
| LABint(idx1) =>
(
  a1rsz_get_at(irvs, idx1))))
//
) where
{
//
val () =
( prerrln
  ("irlft_deget: lval = ", lval))
//
}(*where*)//end-[irlft_deget(...)]
//
(* ****** ****** *)
//
#implfun
irlft_deset
(lval, rval) =
(
case+ lval of
//
|
IRLFTref0(ref1) =>
(
  a0ref_set(ref1, opt1)
) where
{
  val opt1 = optn_cons(rval) }
//
|
IRLFTpcon
(tknd, lab1, irv1) =>
(
case- irv1 of
|IRVcapp
(d2c1, irvs) =>
(
case- lab1 of
| LABint(idx1) =>
(
a1rsz_set_at(irvs,idx1,rval))))
//
) where
{
//
val () =
( prerrln
  ("irlft_deset: lval = ", lval))
val () =
( prerrln
  ("irlft_deset: rval = ", rval))
//
}(*where*)//end-[irlft_deset(...)]
//
(* ****** ****** *)
//
#implfun
irpat_valck
(irp0 , irv0) =
(
case+
irp0.node() of
//
|IRPany _ => true
|IRPvar _ => true
//
|IRPint(int1) =>
(
case+ irv0 of
|IRVint(int2) =>
(int1 = int2) | _ => false)
|IRPbtf(btf1) =>
(
case+ irv0 of
|IRVbtf(btf2) =>
(btf1 = btf2) | _ => false)
|IRPchr(chr1) =>
(
case+ irv0 of
|IRVchr(chr2) =>
(chr1 = chr2) | _ => false)
//
|IRPbang _ => (     true     )
//
|IRPcapp _ => f0_capp(irp0, irv0)
//
|IRPtup0 _ => f0_tup0(irp0, irv0)
|IRPtup1 _ => f0_tup1(irp0, irv0)
//
|_(*otherwise*) => (    false    )
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_capp
(irp0: irpat
,irv0: irval): bool =
let
//
val-
IRPcapp
( d2c1, irps) =
(
  irp0.node((*void*)))
//
in//let
(
case+ irv0 of
|
IRVcapp(d2c2, irvs) =>
let
//
val tag1 = d2c1.ctag()
and tag2 = d2c2.ctag()
//
(*
val () =
prerrln("f0_capp: tag1 = ", tag1)
val () =
prerrln("f0_capp: tag2 = ", tag2)
*)
//
in//let
//
if
(tag1 != tag2)
then false else
irpatlst_valck_tup(irps, irvs) end
| _ (*non-IRVcapp*) => (  false  ) )
end(*let*)//end-of-[f0_capp(irp0,irv0)]
//
(* ****** ****** *)
//
fun
f0_tup0
(irp0: irpat
,irv0: irval): bool =
let
//
val-
IRPtup0(irps) = irp0.node()
in//let
(
case+ irv0 of
//
(*
val () = ...
*)
|
IRVnil((*0*)) => (  true  )
//
|
IRVtup0(irvs) =>
irpatlst_valck_tup(irps, irvs)
//
|
_ (*non-IRVtup0*) => (  false  ) )
end(*let*)//end-of-[f0_tup0(irp0,irv0)]
//
(* ****** ****** *)
//
fun
f0_tup1
(irp0: irpat
,irv0: irval): bool =
let
//
val-
IRPtup1
( knd1, irps) = irp0.node()
//
in//let
(
case+ irv0 of
| IRVtup1(knd2, irvs) =>
(
  irpatlst_valck_tup(irps, irvs) )
| _ (*non-IRVtup1*) => (  false  ) )
end(*let*)//end-of-[f0_tup1(irp0,irv0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[irpat_valck(irp0,irv0)]
//
(* ****** ****** *)
//
local
//
fun
<irvalseq:t0>
irpatlst_valck
(irps: irpatlst
,irvs: irvalseq): bool =
let
//
#typedef x0 = irpat
#typedef y0 = irval
#typedef xs = irpatlst
#typedef ys = irvalseq
//
#impltmp
z2forall$test<x0,y0> = irpat_valck
//
in//let
gseq_z2forall<xs,ys><x0,y0>(irps,irvs)
end(*let*)//end-of-[ f0_tup0(irp0, irv0) ]
//
in//local
//
#implfun
irpatlst_valck_lst(irps, irvs) =
(
  irpatlst_valck<irvalist>(irps, irvs) )//fun
#implfun
irpatlst_valck_tup(irps, irvs) =
(
  irpatlst_valck<irvaltup>(irps, irvs) )//fun
//
end(*local*) // end-of-local(irpatlst_valck_...)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_match
( env0
, irp0, irv0) =
(
case+
irp0.node() of
//
|IRPany
((*00*)) => ()
|IRPvar
( d2v1 ) =>
(
irvar_match
(env0,d2v1,irv0))
//
|IRPint(int) => ((*void*))
|IRPbtf(btf) => ((*void*))
|IRPchr(chr) => ((*void*))
|IRPflt(flt) => ((*void*))
|IRPstr(str) => ((*void*))
//
|
IRPbang(irp) => ((*void*))
//
|
IRPcapp _ =>
(
  f0_capp(env0, irp0, irv0))
//
|
IRPtup0 _ =>
(
  f0_tup0(env0, irp0, irv0))
|
IRPtup1 _ =>
(
  f0_tup1(env0, irp0, irv0))
//
| _(*otherwise*) => (  (*void*)  )
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_capp
(env0:
!xintenv
,irp0: irpat
,irv0: irval): void =
let
//
(*
val () =
prerrln
("f0_capp: irp0 = ", irp0)
val () =
prerrln
("f0_capp: irv0 = ", irv0)
*)
//
val-
IRPcapp
( d2c1, irps) = irp0.node()
//
in//let
(
case+ irv0 of
|
IRVcapp
(d2c2, irvs) =>
let
val () =
irpcapp_match_lft
(env0, irv0, irps)
val () =
irpatlst_match_tup
(env0, irps, irvs) end | _ => ((*0*))
)
end(*let*)//end-of-[ f0_capp(irp0, irv0) ]
//
(* ****** ****** *)
//
fun
f0_tup0
(env0:
!xintenv
,irp0: irpat
,irv0: irval): void =
let
//
val-
IRPtup0(irps) = irp0.node()
//
in//let
(
case+ irv0 of
|
IRVtup0(irvs) =>
let
val () =
irpatlst_match_tup
(env0, irps, irvs) end | _ => ((*0*))
)
end(*let*)//end-of-[ f0_tup0(irp0, irv0) ]
//
(* ****** ****** *)
//
fun
f0_tup1
(env0:
!xintenv
,irp0: irpat
,irv0: irval): void =
let
//
(*
val () =
prerrln
("f0_tup1: irp0 = ", irp0)
val () =
prerrln
("f0_tup1: irv0 = ", irv0)
*)
//
val-
IRPtup1
( knd1, irps) = irp0.node()
//
in//let
(
case+ irv0 of
|
IRVtup1
(knd2, irvs) =>
let
val () =
irpatlst_match_tup
(env0, irps, irvs) end | _ => ((*0*))
)
end(*let*)//end-of-[ f0_tup1(irp0, irv0) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prerrln("irpat_match: irp0 = ", irp0)
val () =
prerrln("irpat_match: irv0 = ", irv0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[irpat_match(env0,irp0,irv0)]
//
(* ****** ****** *)
//
#implfun
irvar_match
( env0
, d2v0, irv0) =
(
xintenv_d2vins_any(env0, d2v0, irv0)
) where
{
//
val () =
prerrln("irvar_match: d2v0 = ", d2v0)
val () =
prerrln("irvar_match: irv0 = ", irv0)
//
}(*where*)//end-of-[irvar_match(env0,d2v0,irv0)]
//
(* ****** ****** *)
//
#implfun
ircst_match
( env0
, d2c0, irv0) =
(
xintenv_d2cins_any(env0, d2c0, irv0)
) where
{
//
val () =
prerrln("ircst_match: d2c0 = ", d2c0)
val () =
prerrln("ircst_match: irv0 = ", irv0)
//
}(*where*)//end-of-[ircst_match(env0,d2c0,irv0)]
//
(* ****** ****** *)
//
#implfun
fiarg_match
( env0
, fia0, irvs) =
(
case+ fia0 of
|
FIARG(irps) =>
irpatlst_match_lst(env0, irps, irvs))
where
{
//
(*
val () =
prerrln("fiarg_match: fia0 = ", fia0)
val () =
prerrln("fiarg_match: irvs = ", irvs)
*)
//
}(*where*)//end-of-[fiarg_match(env0,fia0,irvs)]
//
(* ****** ****** *)

#implmnt
irpcapp_match_lft
(env0, irv0, irps) =
(
gseq_iforeach<xs><x0>(irps)
) where
{
//
#typedef x0 = irpat
#vwtpdef e1 = xintenv
#typedef xs = irpatlst
//
val e1 = $UN.datacopy(env0)
//
#impltmp
iforeach$work
<x0>(i0 , x0) =
(
case+ x0.node() of
|
IRPbang(x1) =>
let
val lab1 = LABint(i0)
val-
IRPvar(d2v1) = x1.node()
val irv1 = IRVlft
(
IRLFTpcon(T_DOT,lab1,irv0)
)
val env0 =
(
  $UN.castlin10{e1}(e1) )
val (  ) =
irvar_match(env0,d2v1,irv1)
val env0 = $UN.delinear(env0)
end//let//end-of-[IRPbang(...)]
| _(*non-IRPbang*) => ( (*void*) )
)
//
}(*where*)//end-of-[irpatlst_match<...>(...)]

(* ****** ****** *)
//
local
//
fun
<irvalseq:t0>
irpatlst_match
( env0:
! xintenv
, irps: irpatlst
, irvs: irvalseq): void =
let
//
#typedef x0 = irpat
#typedef y0 = irval
#vwtpdef e1 = xintenv
#typedef xs = irpatlst
#typedef ys = irvalseq
//
val e1 = $UN.datacopy(env0)
//
#impltmp
z2foreach$work
<x0, y0>
(x0, y0) =
let
val e1 =
$UN.castlin10{e1}(e1)
val () =
irpat_match(e1, x0, y0)
val e1 = $UN.delinear(e1) in () end
//
(*
val () =
prerrln("irpatlst_match: irps = ", irps)
val () =
prerrln("irpatlst_match: irvs = ", irvs)
*)
//
in//let
  gseq_z2foreach<xs,ys><x0,y0>(irps, irvs)
end(*let*)//end-of-[irpatlst_match<...>(...)]
//
in//local
//
#implfun
irpatlst_match_lst
(env0, irps, irvs) =
let
(*
val () =
prerrln
("irpatlst_match_lst: irps = ", irps)
val () =
prerrln
("irpatlst_match_lst: irvs = ", irvs)
*)
in//let
  irpatlst_match<irvalist>(env0, irps, irvs)
end//let//end-of-[irpatlst_match_lst(env0,...)]
//
#implfun
irpatlst_match_tup
(env0, irps, irvs) =
let
(*
val () =
prerrln
("irpatlst_match_tup: irps = ", irps)
val () =
prerrln
("irpatlst_match_tup: irvs = ", irvs)
*)
in//let
  irpatlst_match<irvaltup>(env0, irps, irvs)
end//let//end-of-[irpatlst_match_tup(env0,...)]
//
(*
(*
HX-2023-12-24: This style should work!!!
*)
#implfun
irpatlst_match_lst = irpatlst_match<irvalist>
#implfun
irpatlst_match_tup = irpatlst_match<irvaltup>
*)
//
end(*local*) // end-of-local(irpatlst_match_...)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xintenv_fixins_all
  (env0, defs) =
(
loop(env0, defs)) where
{
fun
loop
( env0:
! xintenv
, irvs: irvalist): void =
(
case+ irvs of
|
list_nil
( (*0*) ) => ( (*void*) )
|
list_cons
(irv1, irvs) =>
(
case+ irv1 of
|
IRVfix0
( dpid, farg
, body, fenv) =>
let
val
irv1 =
IRVfixs
(dpid,farg,body,defs,fenv)
in//let
//
loop(env0, irvs) where
{
val () =
irvar_match(env0, dpid, irv1) }
//
end(*let*)//end-of-[ IRVfix0(...) ]
| _(*otherwise*) => loop(env0, irvs)
)
)
}(*where*)//end of [xintenv_fixins_all(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_utils0.dats] *)
(***********************************************************************)
