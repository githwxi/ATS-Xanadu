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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 27 Aug 2022 02:42:37 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload lctn with d1exp_get_lctn
#symload lctn with d1ecl_get_lctn
(* ****** ****** *)
#symload node with s2exp_get_node
#symload node with s2typ_get_node
(* ****** ****** *)
#symload lctn with d2var_get_lctn
#symload name with d2var_get_name
#symload styp with d2var_get_styp
#symload sexp with d2var_get_sexp
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload lctn with d2exp_get_lctn
(* ****** ****** *)
(* ****** ****** *)
//
fn0
s2typ_subst0
( t2p0: s2typ
, svts: s2vts): s2typ =
(
case+ svts of
|list_nil() => t2p0
|list_cons _ =>
(
s2typ_subst0(t2p0, svts))
)(*case+*) // s2typ_subst0
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2var_linq(d2v0) =
(
 s2typ_linq(d2v0.styp()))
#implfun
d2var_prfq(d2v0) =
(
 s2typ_prfq(d2v0.styp()))
//
#implfun
d2var_mutq(d2v0) =
let
val t2p0 = d2v0.styp()
in//let
//
case+
t2p0.node() of
|
T2Plft(t2p1) => (  true  )
|
_(*non-T2Plft*) => (false)
//
end//let
//end-of-[d2var_mutq(d2v0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2pat_none0
(  loc0  ) =
d2pat_make_node
(loc0, D2Pnone0((*void*)))
//
#implfun
d2pat_none1
(  dpat  ) =
d2pat_make_node
(
dpat.lctn(),D2Pnone1(dpat))
#implfun
//
d2pat_none2
(  dpat  ) =
d2pat_make_node
(
dpat.lctn(),D2Pnone2(dpat))
//
(* ****** ****** *)
//
#implfun
d2pat_any
(  loc0  ) =
(
d2pat(loc0, D2Pany((*0*))))
//
(* ****** ****** *)
//
#implfun
d2pat_var
(loc0, dvar) =
(
 d2pat(loc0, D2Pvar(dvar)))
//
(* ****** ****** *)
//
#implfun
d2pat_btf
(loc0, sym1) =
(
 d2pat(loc0, D2Pbtf(sym1)))
//
(* ****** ****** *)
//
(*
#implfun
d2pat_sym0
(loc0,
 drpt, d1e0, dpis) =
d2pat_make_node
(loc0
,D2Psym0(drpt, d1e0, dpis))
*)
//
(* ****** ****** *)
//
#implfun
d2pat_con
(loc0, dcon) =
(
 d2pat(loc0, D2Pcon(dcon)))
#implfun
d2pat_cons
(loc0, d2cs) =
(
case+ d2cs of
//
|list_nil
((*nil*)) =>
let
val
drpt = d2rpt_new1(loc0)
in//let
d2pat_make_node
(loc0, D2Pcons(drpt, d2cs))
end//let
//
|list_cons
(d2c1, dcs2) =>
(
case+ dcs2 of
|list_nil() =>
(
 d2pat(loc0, D2Pcon(d2c1)))
|list_cons _ =>
let
val
drpt = d2rpt_new1(loc0)
in//let
(
d2pat_make_node
(loc0, D2Pcons(drpt, d2cs)))
end//let
) (*end-[list_cons(...)]*)
) (*case+*)//d2pat_cons(...)
//
(* ****** ****** *)
//
#implfun
d2pat_sapp
(loc0, d2f0, s2vs) =
(
d2pat_make_node
(loc0, D2Psapp(d2f0, s2vs)))
//
(* ****** ****** *)
//
#implfun
d2pat_a2pp
(loc0,d2f0,d2a1,d2a2) =
(
d2pat_dapp
(loc0,d2f0,npf1,d2as)
) where
{
val
npf1 = -1
val
d2as =
list_pair( d2a1, d2a2 ) }
//
#implfun
d2pat_dapp
(loc0,d2f0,npf1,d2as) =
(
d2pat_make_node
(loc0
,D2Pdapp(d2f0, npf1, d2as)))
//
(* ****** ****** *)
//
#implfun
d2exp_none0
(  loc0  ) =
(
d2exp_make_node
(loc0, D2Enone0((*void*))))
//
#implfun
d2exp_none1
(  dexp  ) =
d2exp_make_node
(
dexp.lctn(),D2Enone1(dexp))
//
#implfun
d2exp_none2
(  dexp  ) =
d2exp_make_node
(
dexp.lctn(),D2Enone2(dexp))
//
(* ****** ****** *)
//
#implfun
d2exp_var
(loc0, dvar) =
(
  d2exp(loc0, D2Evar(dvar)))
//
(* ****** ****** *)
//
#implfun
d2exp_btf
(loc0, sym1) =
(
  d2exp(loc0, D2Ebtf(sym1)))
//
#implfun
d2exp_top
(loc0, sym1) =
(
  d2exp(loc0, D2Etop(sym1)))
//
(* ****** ****** *)
//
#implfun
d2exp_con
(loc0, dcon) =
(
  d2exp(loc0, D2Econ(dcon)))
//
#implfun
d2exp_cst
(loc0, dcst) =
(
  d2exp(loc0, D2Ecst(dcst)))
//
(* ****** ****** *)
//
#implfun
d2exp_cons
(loc0, d2cs) =
(
case+ d2cs of
|list_nil() =>
d2exp
(loc0, D2Econs(d2cs))
|list_cons(d2c1, dcs2) =>
(
case+ dcs2 of
|list_nil() =>
d2exp(loc0, D2Econ(d2c1))
|list_cons _ =>
d2exp(loc0, D2Econs(d2cs))))
//
#implfun
d2exp_csts
(loc0, d2cs) =
(
case+ d2cs of
|list_nil() =>
d2exp
(loc0, D2Ecsts(d2cs))
|list_cons(d2c1, dcs2) =>
(
case+ dcs2 of
|list_nil() =>
d2exp(loc0, D2Ecst(d2c1))
|list_cons _ =>
d2exp(loc0, D2Ecsts(d2cs))))
//
(* ****** ****** *)
#implfun
d2exp_sym0
( loc0
, drxp, d1e0, dpis) =
d2exp_make_node
( loc0
, D2Esym0(drxp,d1e0,dpis))
(* ****** ****** *)
//
#implfun
d2exp_sapp
(loc0, d2f0, s2es) =
d2exp_make_node
(loc0, D2Esapp(d2f0, s2es))
#implfun
d2exp_tapp
(loc0, d2f0, s2es) =
d2exp_make_node
(loc0, D2Etapp(d2f0, s2es))
//
(* ****** ****** *)
//
#implfun
d2exp_a2pp
(loc0,d2f0,d2a1,d2a2) =
d2exp_dapp
(loc0,d2f0,npf1,d2as) where
{
val
npf1 = -1
val
d2as = list_pair(d2a1,d2a2)}
//
#implfun
d2exp_dapp
(loc0,d2f0,npf1,d2as) =
(
d2exp_make_node
( loc0
, D2Edapp(d2f0, npf1, d2as)))
//
(* ****** ****** *)
//
#implfun
d2exp_proj
(loc0
,tknd,drxp,dlab,dtup) =
(
d2exp_make_node
( loc0
, D2Eproj
  (tknd, drxp, dlab, dtup)) )
//
(* ****** ****** *)
//
local
//
datatype
f2env = F2ENV of
( lcsrc
, $MAP.topmap(g1mac)
, $MAP.topmap(s2tex)
, $MAP.topmap(s2itm)
, $MAP.topmap(d2itm))
//
#absimpl f2env_tbox = f2env
//
in//local
//
#implfun
f2env_of_d2parsed
  (d2par) =
(
F2ENV
( lcsrc
, g1mac
, s2tex, s2itm, d2itm)) where
{ 
val
lcsrc = d2par.source()
val
d2env = d2par.t2penv()
val+
D2TOPENV
(g1mac, s2tex, s2itm, d2itm) = d2env
}
//
#implfun
f2env_get_g1macenv
  (f2env) =
let
val+
F2ENV
( lcsrc
, g1mac, s2tex
, s2itm, d2itm) = f2env in g1mac end
//
#implfun
f2env_get_sort2env
  (f2env) =
let
val+
F2ENV
( lcsrc
, g1mac, s2tex
, s2itm, d2itm) = f2env in s2tex end
//
#implfun
f2env_get_s2expenv
  (f2env) =
let
val+
F2ENV
( lcsrc
, g1mac, s2tex
, s2itm, d2itm) = f2env in s2itm end
//
#implfun
f2env_get_d2expenv
  (f2env) =
let
val+
F2ENV
( lcsrc
, g1mac, s2tex
, s2itm, d2itm) = f2env in d2itm end
//
endloc (*local*) // end of [ local(f2env) ]
//
(* ****** ****** *)
//
local
//
val
stamper = stamper_new((*0*))
//
val
_(*nil*) = stamper.getinc((*0*))
//
in//local
fun
the_d2con_stamp_new
  ((*void*)): stamp = stamper.getinc((*0*))
endloc(*local*)//end-of[the_d2con_stamp_new]
//
(* ****** ****** *)
//
local
//
val
stamper = stamper_new((*0*))
//
val
_(*nil*) = stamper.getinc((*0*))
//
in//local
fun
the_d2cst_stamp_new
  ((*void*)): stamp = stamper.getinc((*0*))
endloc(*local*)//end-of[the_d2cst_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new((*0*))
//
val
_(*nil*) = stamper.getinc((*0*))
//
in//local
fun
the_d2var_stamp_new
  ((*void*)): stamp = stamper.getinc((*0*))
endloc(*local*)//end-of[the_d2var_stamp_new]
//
(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef
tag_t = sint
#typedef
t2qas = t2qaglst
(* ****** ****** *)
//
fun
dconid_sym
(tok0: token): sym_t =
(
case-
tok0.node() of
| T_IDALP(nam1) =>
  symbl_make_name(nam1)
| T_IDSYM(nam1) =>
  symbl_make_name(nam1) )
//
(* ****** ****** *)
//
datatype
d2con =
D2CON of
( loc_t // lctn
, sym_t // name
, tag_t // ctag
, t2qas // tqas
, s2exp // sexp
, stamp // stmp // unicity
, s2typ // styp // erasure
, s2typ // xtyp // matching
)
datavwtp
d2con_vt =
D2CON_vt of
( loc_t // lctn
, sym_t // name
, tag_t // ctag
, t2qas // tqas
, s2exp // sexp
, stamp // stmp // unicity
, s2typ // styp // erasure
, s2typ // xtyp // matching
)
//
#absimpl d2con_tbox = d2con
//
(* ****** ****** *)
//
in//local
//
#implfun
d2con_get_lctn
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in loc0 end
//
#implfun
d2con_get_name
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in sym0 end
//
#implfun
d2con_get_ctag
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in ctag end
//
#implfun
d2con_get_tqas
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in tqas end
//
#implfun
d2con_get_sexp
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in s2e0 end
//
#implfun
d2con_get_stmp
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in stmp end
//
#implfun
d2con_get_styp
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in t2p0 end
//
#implfun
d2con_get_xtyp
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in xt2p end
//
(* ****** ****** *)
//
#implfun
d2con_get_narg
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas
,s2e0
,stmp
,t2p0
,xt2p) = d2c0 in auxmain(s2e0)
end where
{
fun
auxmain
(s2e0: s2exp): sint =
(
case-
s2e0.node() of
//
|
S2Euni0
(s2vs,s2ps,s2e1) => auxmain(s2e1)
//
|
S2Efun1
(f2cl
,npf1,s2es,s2e1) => list_length(s2es)
//
(*
| _(*otherwise*) => (-1) // HX: ERROR!
*)
//
)
} (*where*) // end of [d2con_get_narg]
//
(* ****** ****** *)
//
#implfun
d2con_set_ctag
( d2c0, tag0 ) =
let
val
d2c0 =
$UN.castlin10{d2con_vt}(d2c0)
val+
@D2CON_vt
(loc0,
 sym0,
!ctag,
 tqas,
 sexp,
 stmp,
 t2p0,xt2p) = d2c0 in (ctag := tag0)
end (*let*) // end of [d2con_set_ctag]
//
(* ****** ****** *)
//
#implfun
d2con_set_sexp
( d2c0, s2e0 ) =
let
val
d2c0 =
$UN.castlin10{d2con_vt}(d2c0)
val+
@D2CON_vt
(loc0,
 sym0,
 ctag,
 tqas,
!sexp,
 stmp,
 t2p0,xt2p) = d2c0 in (sexp := s2e0)
end (*let*) // end of [d2con_set_sexp]
//
(* ****** ****** *)
//
#implfun
d2con_make_idtp
(tok0,tqas,sexp) =
let
//
val ctag = (-1)
//
val loc0 = tok0.lctn()
val sym0 = dconid_sym(tok0)
val t2p0 = s2exp_stpize(sexp)
//
val stmp = the_d2con_stamp_new()
//
val xt2p =
(
  s2typ_subst0(t2p0, svts)) where
{
  val svts =
  s2vts_make_lctn_tqas(loc0, tqas) }
//
in//let
D2CON
( loc0
, sym0
, ctag, tqas, sexp, stmp, t2p0, xt2p)
end (*let*) // end of [d2con_make_idtp]
//
(* ****** ****** *)
//
end (*local*) // end of [local(d2con_tbox)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef
t2qas = t2qaglst
(* ****** ****** *)
//
fun
dcstid_sym
(tok0: token): sym_t =
(
case-
tok0.node() of
| T_IDALP(nam1) =>
  symbl_make_name(nam1)
| T_IDSYM(nam1) =>
  symbl_make_name(nam1) )
//
(* ****** ****** *)
//
datatype
d2cst =
D2CST of
( loc_t // lctn
, sym_t // name
, tnode // tknd
, t2qas // tqas
, s2exp // sexp
, stamp // stmp // unicity
, s2typ // styp // erasure
, s2typ // xtyp // matching
)
datavwtp
d2cst_vt =
D2CST_vt of
( loc_t // lctn
, sym_t // name
, tnode // tknd
, t2qas // tqas
, s2exp // sexp
, stamp // stmp // unicity
, s2typ // styp // erasure
, s2typ // xtyp // matching
)
//
#absimpl d2cst_tbox = d2cst
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
d2cst_get_lctn
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in loc0 end
//
#implfun
d2cst_get_name
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in sym0 end
//
#implfun
d2cst_get_tknd
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in tknd end
//
#implfun
d2cst_get_tqas
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in tqas end
//
#implfun
d2cst_get_sexp
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in s2e0 end
//
#implfun
d2cst_get_stmp
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in stmp end
//
#implfun
d2cst_get_styp
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in t2p0 end
//
#implfun
d2cst_get_xtyp
  (  d2c0  ) =
let
val+
D2CST
(loc0
,sym0
,tknd
,tqas,s2e0
,stmp
,t2p0,xt2p) = d2c0 in xt2p end
//
(* ****** ****** *)
//
#implfun
d2cst_set_styp
( d2c0, t2p0 ) =
let
val
d2v0 =
$UN.castlin10{d2cst_vt}(d2c0)
val+
@D2CST_vt
( loc0,
  sym0,
  tknd,
  tqas,
  sexp,
  stmp,
! styp,
  x2tp ) = d2v0 in styp := t2p0
end (*let*) // end of [d2cst_set_styp]
//
(* ****** ****** *)
//
#implfun
d2cst_set_xtyp
( d2c0, xt2p ) =
let
val
d2v0 =
$UN.castlin10{d2cst_vt}(d2c0)
val+
@D2CST_vt
( loc0,
  sym0,
  tknd,
  tqas,
  sexp,
  stmp,
  t2p0,
! xtyp ) = d2v0 in xtyp := xt2p
end (*let*) // end of [d2cst_set_xtyp]
//
(* ****** ****** *)
//
#implfun
d2cst_make_dvar
( tok0
, d2v0 , tqas ) =
let
//
val loc0 = d2v0.lctn()
val tknd = tok0.node()
val sym0 = d2v0.name((*0*))
val t2p0 = d2v0.styp((*0*))
val sexp = d2v0.sexp((*0*))
//
val stmp =
(
  the_d2cst_stamp_new((*void*)))
//
val xt2p = s2typ_none0((*void*))
(*
val xt2p =
//
(*
HX-2023-08-15:
Note that [d2v0] is not
yet assigned a proper type!
*)
//
(
  s2typ_subst0(t2p0, svts)) where
{
  val svts =
  s2vts_make_lctn_tqas(loc0, tqas) }
*)
//
in//let
(
D2CST
( loc0
, sym0
, tknd, tqas, sexp, stmp, t2p0, xt2p) )
end (*let*) // end of [d2cst_make_dvar]
//
(* ****** ****** *)
//
#implfun
d2cst_make_idtp
( tok0
, dpid
, tqas, sexp) =
let
//
val loc0 = dpid.lctn()
val tknd = tok0.node()
val sym0 = dcstid_sym(dpid)
val t2p0 = s2exp_stpize(sexp)
//
val stmp = the_d2cst_stamp_new()
//
val xt2p =
(
  s2typ_subst0(t2p0, svts)) where
{
  val svts =
  s2vts_make_lctn_tqas(loc0, tqas) }
//
in//let
(
D2CST
( loc0
, sym0
, tknd, tqas, sexp, stmp, t2p0, xt2p) )
end (*let*) // end of [d2cst_make_idtp]
//
end (*local*) // end of [local(d2cst_tbox)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef
t2qas = t2qaglst
(* ****** ****** *)
//
datatype
d2var =
D2VAR of
( loc_t // lctn
, sym_t // name
, t2qas // tqas
, s2exp // sexp
, s2typ // styp // erasure
, stamp // stmp // unicity
, sym_t // unam // name+stamp
)
datavwtp
d2var_vt =
D2VAR_vt of
( loc_t // lctn
, sym_t // name
, t2qas // tqas
, s2exp // sexp
, s2typ // styp // erasure
, stamp // stmp // unicity
, sym_t // unam // name+stamp
)
//
#absimpl d2var_tbox = d2var
//
in//local
//
#implfun
d2var_get_lctn
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in loc0 end
//
#implfun
d2var_get_name
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in sym0 end
//
#implfun
d2var_get_sexp
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in s2e0 end
//
#implfun
d2var_get_styp
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in t2p0 end
//
#implfun
d2var_get_stmp
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in stmp end
//
#implfun
d2var_get_unam
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0,t2p0
,stmp,unam) = d2v0 in unam end
//
(* ****** ****** *)
//
#implfun
d2var_set_sexp
( d2v0, s2e0 ) =
let
val
d2v0 =
$UN.castlin10{d2var_vt}(d2v0)
val+
@D2VAR_vt
( loc0,
  sym0,
  tqas,
! sexp,
  t2p0,
  stmp,
  unam ) = d2v0 in sexp := s2e0
end (*let*) // end of [d2var_set_sexp]
//
(* ****** ****** *)
//
#implfun
d2var_set_styp
( d2v0, t2p0 ) =
let
val
d2v0 =
$UN.castlin10{d2var_vt}(d2v0)
val+
@D2VAR_vt
( loc0,
  sym0,
  tqas,
  s2e0,
! styp,
  stmp,
  unam ) = d2v0 in styp := t2p0
end (*let*) // end of [d2var_set_styp]
//
(* ****** ****** *)
//
#implfun
d2var_new2_name
(  loc0,sym0  ) =
let
val tqas = list_nil()
val s2e0 = s2exp_none0()
val t2p0 = s2typ_none0()
//
val stmp =
the_d2var_stamp_new((*nil*))
//
val unam =
symbl_extend_stamp(sym0, stmp)
//
in//let
(
D2VAR
( loc0
, sym0,tqas,s2e0,t2p0,stmp,unam) )
end (*let*) // end of [d2var_new2_name]
//
end (*local*) // end of [local(d2var_tbox)]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d2pat =
D2PAT of
( loctn
, s2typ, d2pat_node)
datavwtp
d2pat_vt =
D2PAT_vt of
( loctn
, s2typ, d2pat_node)
//
#absimpl d2pat_tbox = d2pat
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d2pat_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
D2PAT(loc, t2p, nod) endlet
//
(* ****** ****** *)
//
#implfun
d2pat_get_lctn(d2p) =
let
val+
D2PAT(loc,t2p,nod) = d2p in loc
end
#implfun
d2pat_get_node(d2p) =
let
val+
D2PAT(loc,t2p,nod) = d2p in nod
end
#implfun
d2pat_get_styp(d2p) =
let
val+
D2PAT(loc,t2p,nod) = d2p in t2p
end
//
(* ****** ****** *)
//
#implfun
d2pat_set_styp
( d2p0, t2p0 ) =
let
//
val
d2p0 =
$UN.castlin10{d2pat_vt}(d2p0)
val+
@D2PAT_vt
(loc0,
!styp,node) = d2p0 in styp := t2p0
end (*let*) // end of [d2pat_set_styp]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d2pat)]

(* ****** ****** *)
//
local
//
datatype
d2exp =
D2EXP of
( loctn
, s2typ, d2exp_node)
datavwtp
d2exp_vt =
D2EXP_vt of
( loctn
, s2typ, d2exp_node)
//
#absimpl d2exp_tbox = d2exp
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d2exp_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
D2EXP(loc, t2p, nod) endlet
//
(* ****** ****** *)
//
#implfun
d2exp_get_lctn(d2e) =
let
val+
D2EXP(loc,t2p,nod) = d2e in loc
end
#implfun
d2exp_get_styp(d2e) =
let
val+
D2EXP(loc,t2p,nod) = d2e in t2p
end
#implfun
d2exp_get_node(d2e) =
let
val+
D2EXP(loc,t2p,nod) = d2e in nod
end
//
(* ****** ****** *)
//
#implfun
d2exp_set_styp
( d2e0, t2p0 ) =
let
//
val
d2e0 =
$UN.castlin10{d2exp_vt}(d2e0)
val+
@D2EXP_vt
(loc0,
!styp,node) = d2e0 in styp := t2p0
end (*let*) // end of [d2exp_set_styp]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d2exp)]
//
(* ****** ****** *)

local
//
datatype
d2rpt =
D2RPT of (d2pat)
datavwtp
d2rpt_vt =
D2RPT_vt of (d2pat)
//
#absimpl d2rpt_tbox = d2rpt
//
in (* in-of-local *)
//
#implfun
d2rpt_new1(loc0) =
D2RPT(d2pat_none0(loc0))
//
#implfun
d2rpt_get_dpat(drpt) =
let
val+
D2RPT(dpat) = drpt in dpat end
//
#implfun
d2rpt_set_dpat
( drpt, d2p0 ) =
let
//
val
drpt =
$UN.castlin10{d2rpt_vt}(drpt)
val+
@D2RPT_vt
( !dpat ) = drpt in dpat := d2p0
end (*let*) // end of [d2rpt_set_dpat]
//
endloc (*local*) // end of [local(d2rpt)]

(* ****** ****** *)

local
//
datatype
d2rxp =
D2RXP of (d2exp)
datavwtp
d2rxp_vt =
D2RXP_vt of (d2exp)
//
#absimpl d2rxp_tbox = d2rxp
//
in (* in-of-local *)
//
#implfun
d2rxp_new1(loc0) =
D2RXP(d2exp_none0(loc0))
//
#implfun
d2rxp_get_dexp(drxp) =
let
val+
D2RXP(dexp) = drxp in dexp end
//
#implfun
d2rxp_set_dexp
( drxp, d2e0 ) =
let
//
val
drxp =
$UN.castlin10{d2rxp_vt}(drxp)
val+
@D2RXP_vt
( !dexp ) = drxp in dexp := d2e0
end (*let*) // end of [d2rxp_set_dexp]
//
endloc (*local*) // end of [local(d2rxp)]

(* ****** ****** *)

local
//
datatype
f2arg =
F2ARG of
(
loctn, f2arg_node)
#absimpl
f2arg_tbox = f2arg
//
in (* in-of-local *)
//
#implfun
f2arg_make_node
(   loc,nod   ) = F2ARG(loc,nod)
//
#implfun
f2arg_get_lctn(f2a) =
let
  val+F2ARG(loc,nod) = f2a in loc
end
#implfun
f2arg_get_node(f2a) =
let
  val+F2ARG(loc,nod) = f2a in nod
end
//
endloc (*local*) // end of [local(f2arg)]

(* ****** ****** *)

local
//
datatype
d2gua =
D2GUA of
(
loctn, d2gua_node)
#absimpl
d2gua_tbox = d2gua
//
in (* in-of-local *)
//
#implfun
d2gua_make_node
(   loc,nod   ) = D2GUA(loc,nod)
//
#implfun
d2gua_get_lctn(d2g) =
let
  val+D2GUA(loc,nod) = d2g in loc
end
#implfun
d2gua_get_node(d2g) =
let
  val+D2GUA(loc,nod) = d2g in nod
end
//
endloc (*local*) // end of [local(d2gua)]

(* ****** ****** *)

local
//
datatype
d2gpt =
D2GPT of
(
loctn, d2gpt_node)
#absimpl
d2gpt_tbox = d2gpt
//
in (* in-of-local *)
//
#implfun
d2gpt_make_node
(   loc,nod   ) = D2GPT(loc,nod)
//
#implfun
d2gpt_get_lctn(gpt) =
let
  val+D2GPT(loc,nod) = gpt in loc
end
#implfun
d2gpt_get_node(gpt) =
let
  val+D2GPT(loc,nod) = gpt in nod
end
//
endloc (*local*) // end of [local(d2gpt)]

(* ****** ****** *)

local
//
datatype
d2cls =
D2CLS of
(
loctn, d2cls_node)
#absimpl
d2cls_tbox = d2cls
//
in (* in-of-local *)
//
#implfun
d2cls_make_node
(   loc,nod   ) = D2CLS(loc,nod)
//
#implfun
d2cls_get_lctn(cls) =
let
  val+D2CLS(loc,nod) = cls in loc
end
#implfun
d2cls_get_node(cls) =
let
  val+D2CLS(loc,nod) = cls in nod
end
//
endloc (*local*) // end of [local(d2cls)]

(* ****** ****** *)
//
#implfun
d2ecl_none0
(  loc0  ) =
d2ecl_make_node
(loc0,D2Cnone0((*void*)))
#implfun
d2ecl_none1
(  d2cl  ) =
d2ecl_make_node
(d2cl.lctn(),D2Cnone1(d2cl))
//
(* ****** ****** *)

local
//
datatype
d2ecl =
D2ECL of
(loctn, d2ecl_node)
//
#absimpl d2ecl_tbox = d2ecl
//
in (* in-of-local *)
//
#implfun
d2ecl_make_node
(   loc,nod   ) = D2ECL(loc,nod)
//
#implfun
d2ecl_get_lctn(dcl) =
let
  val+D2ECL(loc,nod) = dcl in loc
end
#implfun
d2ecl_get_node(dcl) =
let
  val+D2ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [local(d2ecl)]

(* ****** ****** *)

local
//
datatype
s2qag =
S2QAG of (loc_t, s2varlst)
//
#absimpl s2qag_tbox = s2qag
//
in (* in-of-local *)
//
#implfun
s2qag_get_lctn
  (  s2qa  ) =
let
val+
S2QAG
(loc0, s2vs) = s2qa in loc0 end
//
#implfun
s2qag_get_s2vs
  (  s2qa  ) =
let
val+
S2QAG
(loc0, s2vs) = s2qa in s2vs end
//
#implfun
s2qag_make_s2vs
( loc0 , s2vs ) = S2QAG(loc0, s2vs)
//
end (*local*) // end of [local(s2qag)]

(* ****** ****** *)

local
//
datatype
t2qag =
T2QAG of (loc_t, s2varlst)
//
#absimpl t2qag_tbox = t2qag
//
in (* in-of-local *)
//
#implfun
t2qag_get_lctn
  (  t2qa  ) =
let
val+
T2QAG
(loc0, s2vs) = t2qa in loc0 end
//
#implfun
t2qag_get_s2vs
  (  t2qa  ) =
let
val+
T2QAG
(loc0, s2vs) = t2qa in s2vs end
//
#implfun
t2qag_make_s2vs
( loc0 , s2vs ) = T2QAG(loc0, s2vs)
//
end (*local*) // end of [local(t2qag)]

(* ****** ****** *)

local
//
datatype
t2iag =
T2IAG of (loc_t, s2explst)
//
#absimpl t2iag_tbox = t2iag
//
datatype
t2iag_vt =
T2IAG_vt of (loc_t, s2explst)
//
in (* in-of-local *)
//
#implfun
t2iag_get_lctn
  (  t2ia  ) =
let
val+
T2IAG
(loc0, s2es) = t2ia in loc0 end
//
#implfun
t2iag_get_s2es
  (  t2ia  ) =
let
val+
T2IAG
(loc0, s2es) = t2ia in s2es end
//
#implfun
t2iag_make_s2es
( loc0 , s2es ) = T2IAG(loc0, s2es)
//
(* ****** ****** *)
//
#implfun
t2iag_set_s2es
(t2ia, ses2) =
let
val
t2ia =
$UN.castlin10{t2iag_vt}(t2ia)
val+
@T2IAG_vt
(loc0, !s2es) = t2ia in s2es := ses2
end (*let*) // end of [t2iag_set_s2es]
//
(* ****** ****** *)
//
end (*local*) // end of [local(t2iag)]

(* ****** ****** *)

local
//
datatype
t2jag =
T2JAG of (loc_t, s2typlst)
//
#absimpl t2jag_tbox = t2jag
//
datatype
t2jag_vt =
T2JAG_vt of (loc_t, s2typlst)
//
in (* in-of-local *)
//
#implfun
t2jag_get_lctn
  (  t2ja  ) =
let
val+
T2JAG
(loc0, t2ps) = t2ja in loc0 end
//
#implfun
t2jag_get_t2ps
  (  t2ja  ) =
let
val+
T2JAG
(loc0, t2ps) = t2ja in t2ps end
//
#implfun
t2jag_make_t2ps
( loc0 , t2ps ) = T2JAG(loc0, t2ps)
//
(* ****** ****** *)
//
#implfun
t2jag_set_t2ps
(t2ja, ses2) =
let
val
t2ja =
$UN.castlin10{t2jag_vt}(t2ja)
val+
@T2JAG_vt
(loc0, !t2ps) = t2ja in t2ps := ses2
end (*let*) // end of [t2jag_set_t2ps]
//
(* ****** ****** *)
//
end (*local*) // end of [local(t2jag)]

(* ****** ****** *)

local
//
datatype
simpl =
SIMPL of
(
loctn, simpl_node)
#absimpl
simpl_tbox = simpl
//
in (* in-of-local *)
//
#implfun
simpl_make_node
(   loc,nod   ) = SIMPL(loc,nod)
//
#implfun
simpl_get_lctn(s2i) =
let
  val+SIMPL(loc,nod) = s2i in loc
end
#implfun
simpl_get_node(s2i) =
let
  val+SIMPL(loc,nod) = s2i in nod
end
//
end (*local*) // end of [local(simpl)]

(* ****** ****** *)

local
//
datatype
dimpl =
DIMPL of
(
loctn, dimpl_node)
datatype
dimpl_vt =
DIMPL_vt of
(
loctn, dimpl_node)
//
#absimpl
dimpl_tbox = dimpl
//
in (* in-of-local *)
//
#implfun
dimpl_make_node
(   loc,nod   ) = DIMPL(loc,nod)
//
#implfun
dimpl_get_lctn(d2i) =
let
  val+DIMPL(loc,nod) = d2i in loc
end
#implfun
dimpl_get_node(d2i) =
let
  val+DIMPL(loc,nod) = d2i in nod
end
//
(* ****** ****** *)
//
#implfun
dimpl_set_node
  (dimp, ndx2) = let
//
val
dimp =
$UN.castlin10{dimpl_vt}(dimp)
//
val+
@DIMPL_vt
(loc0, !node) = dimp in node := ndx2
end (*let*) // end of [dimpl_set_node]
//
(* ****** ****** *)
//
end (*local*) // end of [local(dimpl)]

(* ****** ****** *)

local
//
datatype
d2arg =
D2ARG of
(
loctn, d2arg_node)
#absimpl
d2arg_tbox = d2arg
//
in (* in-of-local *)
//
#implfun
d2arg_make_node
(   loc,nod   ) = D2ARG(loc,nod)
//
#implfun
d2arg_get_lctn(d2a) =
let
  val+D2ARG(loc,nod) = d2a in loc
end
#implfun
d2arg_get_node(d2a) =
let
  val+D2ARG(loc,nod) = d2a in nod
end
//
endloc (*local*) // end of [local(d2arg)]

(* ****** ****** *)

local
//
datatype
d2valdcl =
D2VALDCL of
( loc_t
, d2pat
, teqd2exp, wths2exp)
//
#absimpl
d2valdcl_tbox = d2valdcl
//
in//local

#implfun
d2valdcl_get_lctn
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in lctn end

#implfun
d2valdcl_get_dpat
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end

#implfun
d2valdcl_get_tdxp
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end

#implfun
d2valdcl_get_wsxp
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end

(* ****** ****** *)

#implfun
d2valdcl_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D2VALDCL(lctn, dpat, tdxp, wsxp)
)

endloc (*local*) // end of [local(d2valdcl)]

(* ****** ****** *)

local
//
datatype
d2vardcl =
D2VARDCL of
( loc_t
, d2var
, d2varopt
, s2expopt, teqd2exp)
//
#absimpl
d2vardcl_tbox = d2vardcl
//
in//local

#implfun
d2vardcl_get_lctn
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in lctn end

#implfun
d2vardcl_get_dpid
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end

#implfun
d2vardcl_get_vpid
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end

#implfun
d2vardcl_get_sres
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end

#implfun
d2vardcl_get_dini
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end

(* ****** ****** *)

#implfun
d2vardcl_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D2VARDCL(lctn, dpid, vpid, sres, dini)
)

endloc (*local*) // end of [ local(d2vardcl) ]

(* ****** ****** *)

local
//
datatype
d2fundcl =
D2FUNDCL of
( loc_t
, d2var
, f2arglst
, s2res
, teqd2exp, wths2exp)
//
#absimpl
d2fundcl_tbox = d2fundcl
//
in//local

#implfun
d2fundcl_get_lctn
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in lctn end

#implfun
d2fundcl_get_dpid
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in dpid end

#implfun
d2fundcl_get_farg
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in farg end

#implfun
d2fundcl_get_sres
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in sres end

(* ****** ****** *)

#implfun
d2fundcl_get_tdxp
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in tdxp end

#implfun
d2fundcl_get_wsxp
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in wsxp end

(* ****** ****** *)

#implfun
d2fundcl_make_args
( lctn
, dpid, farg, sres, tdxp, wsxp) =
(
D2FUNDCL
(lctn, dpid, farg, sres, tdxp, wsxp))

endloc (*local*) // end of [ local(d2fundcl) ]

(* ****** ****** *)

local
//
datatype
d2cstdcl =
D2CSTDCL of
( loc_t
, d2cst
, d2arglst
, s2res, d2res)
//
#absimpl
d2cstdcl_tbox = d2cstdcl
//
in//local

#implfun
d2cstdcl_get_lctn
  (  dcst  ) = let
val+
D2CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in lctn end

(* ****** ****** *)

#implfun
d2cstdcl_get_dpid
  (  dcst  ) = let
val+
D2CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dpid end

(* ****** ****** *)

#implfun
d2cstdcl_get_darg
  (  dcst  ) = let
val+
D2CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in darg end

(* ****** ****** *)

#implfun
d2cstdcl_get_sres
  (  dcst  ) = let
val+
D2CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in sres end

(* ****** ****** *)

#implfun
d2cstdcl_get_dres
  (  dcst  ) = let
val+
D2CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dres end

(* ****** ****** *)

#implfun
d2cstdcl_make_args
(loc0, d2c1, d2as, sres, dres) =
D2CSTDCL(loc0, d2c1, d2as, sres, dres)

endloc (*local*) // end of [ local(d2cstdcl) ]

(* ****** ****** *)

local
//
datatype
d2parsed =
D2PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d1topenv // t1penv
,
d2topenv // t2penv
,
d2eclistopt)//program
//
#absimpl
d2parsed_tbox = d2parsed
//
in//local

(* ****** ****** *)

#implfun
d2parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_stadyn]

(* ****** ****** *)

#implfun
d2parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_nerror]

(* ****** ****** *)

#implfun
d2parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_source]

(* ****** ****** *)

#implfun
d2parsed_get_t1penv
  (dpar) =
(
  t1penv ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_t1penv]

(* ****** ****** *)

#implfun
d2parsed_get_t2penv
  (dpar) =
(
  t2penv ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_t2penv]

(* ****** ****** *)

#implfun
d2parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d2parsed_make_args
( stadyn
, nerror, source
, t1penv, t2penv, parsed) =
(
D2PARSED
( stadyn
, nerror, source
, t1penv, t2penv, parsed)) where
{
(*
val () =
prerrsln
("d2parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d2parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d2parsed) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp2.dats] *)
