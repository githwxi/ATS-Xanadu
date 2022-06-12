(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#include
"./../HATS/xatsopt.hats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)
//
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
//
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/trcmp30.sats"

(* ****** ****** *)
//
implement
fprint_val<h0typ> = fprint_h0typ
//
implement
fprint_val<h0pat> = fprint_h0pat
implement
fprint_val<h0exp> = fprint_h0exp
//
(* ****** ****** *)
//
implement
trcmp30_envless
  (prog) =
  (prog) where
{
//
val
env0 =
compenv_make_nil()
//
val
prog =
trcmp30_declist(env0, prog)
//
val () = compenv_free_nil(env0)
//
} (* end of [trcmp30_envless] *)
//
(* ****** ****** *)

implement
trcmp30_package
  (p3kg) = let
//
val+
D3TRANSD(rcd) = p3kg
//
val
d3cs =
(
case+
rcd.transd of
| None() =>
  list_nil((*void*))
| Some(d3cs) => d3cs
) : d3eclist // end-of-val
//
in
H0COMPED@{
  stadyn= rcd.stadyn
, source= rcd.source
, comped= Some(prog) } where
{
  val
  prog = trcmp30_envless(d3cs)
}
end // end of [trcmp30_package]

(* ****** ****** *)

implement
trcmp30_dvar
( d2v0 ) = let
//
val
opt =
the_dvarmap_search_opt(d2v0)
//
in
case+ opt of
| ~
Some_vt
( hdv1 ) => hdv1
| ~
None_vt() =>
let
  val
  hdv1 =
  h0var_make_dvar(d2v0)
in
the_dvarmap_insert_any(d2v0, hdv1); hdv1
end
end // end of [trcmp30_dvar]

(* ****** ****** *)
//
implement
trcmp30_dvaropt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d2v0) => Some(trcmp30_dvar(d2v0))
)
//
(* ****** ****** *)

implement
trcmp30_dcon
( d2c0 ) = let
//
val
opt =
the_dconmap_search_opt(d2c0)
//
in
case+ opt of
| ~
Some_vt
( hdc1 ) => hdc1
| ~
None_vt((*void*)) =>
let
  val
  hdc1 =
  h0con_make_dcon(d2c0)
in
the_dconmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [trcmp30_dcon]

implement
trcmp30_dcst
( d2c0 ) = let
//
val
opt =
the_dcstmap_search_opt(d2c0)
//
in
case+ opt of
| ~
Some_vt(hdc1) => hdc1
| ~
None_vt((*void*)) =>
let
  val
  hdc1 =
  h0cst_make_dcst(d2c0)
in
the_dcstmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [trcmp30_dcst]

(* ****** ****** *)
implement
trcmp30_dconlst
( d2cs ) =
list_vt2t
(
list_map<d2con><h0con>(d2cs)
) where
{
implement
list_map$fopr<d2con><h0con>(d2c) = trcmp30_dcon(d2c)
}
(* ****** ****** *)
implement
trcmp30_dcstlst
( d2cs ) =
list_vt2t
(
list_map<d2cst><h0cst>(d2cs)
) where
{
implement
list_map$fopr<d2cst><h0cst>(d2c) = trcmp30_dcst(d2c)
}
(* ****** ****** *)

local

(* ****** ****** *)

fun
trsubt2p
( env0:
! compenv
, t2p0: t2ype): h0typ =
trcmp30_type(t2p0) where
{
val
t2p0 =
t2ype_subst_compenv(t2p0, env0)
} (* end of [trsubt2p] *)

(* ****** ****** *)

fun
auxnil
( env0:
! compenv
, d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val
h0t0 = trsubt2p(env0, t2p0)
//
in
h0pat_make_node(loc0, h0t0, H0Pnil)
end

fun
auxany
( env0:
! compenv
, d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trsubt2p(env0, t2p0)
in
h0pat_make_node(loc0, h0t0, H0Pany)
end

(* ****** ****** *)

fun
auxvar
( env0:
! compenv
, d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hdv1 =
(
  trcmp30_dvar(d2v0)
) where
{
  val-
  D3Pvar(d2v0) = d3p0.node()
}
//
val hend = H0Pvar(hdv1)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxi00
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pi00(int) where
{
  val-
  D3Pi00(int) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxb00
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pb00(btf) where
{
  val-
  D3Pb00(btf) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxc00
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pc00(chr) where
{
  val-
  D3Pc00(chr) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxs00
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Ps00(str) where
{
  val-
  D3Ps00(str) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxint
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pint(tok0) where
{
  val-
  D3Pint(tok0) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxbtf
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pbtf(tok0) where
{
  val-
  D3Pbtf(tok0) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxchr
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pchr(tok0) where
{
  val-
  D3Pchr(tok0) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

fun
auxstr
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val
hend = H0Pstr(tok0) where
{
  val-
  D3Pstr(tok0) = d3p0.node()
}
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxdapp
( env0:
! compenv
, d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = d3p0.node()
//
val
h0f0 =
trcmp30_dpat(env0, d3f0)
val
h0ps =
trcmp30_dpatlst(env0, d3ps)
//
val
hend = H0Pdapp(h0f0, npf1, h0ps)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_trcd1
( env0:
! compenv
, d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Ptrcd1
( knd0
, npf1
, d3ps) = d3p0.node((*void*))
//
val
h0ps =
trcmp30_dpatlst(env0, d3ps)
//
val
hend = H0Ptrcd1(knd0, npf1, h0ps)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [aux_trcd1]

(* ****** ****** *)

in

(* ****** ****** *)

implement
trcmp30_dpat
( env0, d3p0 ) = let
//
#if(__XATSOPT_DEBUG__)
// (*
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val () =
println!
("trcmp30_dpat: loc0 = ", loc0)
val () =
println!
("trcmp30_dpat: d3p0 = ", d3p0)
val () =
println!
("trcmp30_dpat: t2p0 = ", t2p0)
//
// *)
#endif//__XATSOPT_DEBUG__
//
in(*in-of-let*)
//
case+
d3p0.node() of
//
|
D3Pnil() =>
auxnil(env0, d3p0)
|
D3Pany() =>
auxany(env0, d3p0)
//
|
D3Pvar _ =>
auxvar(env0, d3p0)
//
|
D3Pi00 _ => auxi00(d3p0)
|
D3Pb00 _ => auxb00(d3p0)
|
D3Pc00 _ => auxc00(d3p0)
|
D3Ps00 _ => auxs00(d3p0)
//
|
D3Pint _ => auxint(d3p0)
|
D3Pbtf _ => auxbtf(d3p0)
|
D3Pchr _ => auxchr(d3p0)
|
D3Pstr _ => auxstr(d3p0)
//
|
D3Pcon1(d2c0) =>
let
val
//
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
//
val
h0t0 =
trsubt2p(env0, t2p0)
val
hdc0 = trcmp30_dcon(d2c0)
//
in
h0pat_make_node
(loc0, h0t0, H0Pcon(hdc0))
end
//
|
D3Pdap1(d3f0) =>
let
val
loc0 = d3p0.loc()
//
val
t2p0 = d3p0.type()
val
h0t0 =
trsubt2p(env0, t2p0)
//
val
h0f0 =
trcmp30_dpat(env0, d3f0)
in
h0pat_make_node
(loc0, h0t0, H0Pdap1(h0f0))
end
//
|
D3Pbang(d3p1) =>
let
val
loc0 = d3p0.loc()
//
val
t2p0 = d3p0.type()
val
h0t0 =
trsubt2p(env0, t2p0)
//
val
h0p1 =
trcmp30_dpat(env0, d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pbang(h0p1))
end
|
D3Pflat(d3p1) =>
let
val
loc0 = d3p0.loc()
//
val
t2p0 = d3p0.type()
val
h0t0 =
trsubt2p(env0, t2p0)
//
val
h0p1 =
trcmp30_dpat(env0, d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pflat(h0p1))
end
|
D3Pfree(d3p1) =>
let
val
loc0 = d3p0.loc()
//
val
t2p0 = d3p0.type()
val
h0t0 =
trsubt2p(env0, t2p0)
//
val
h0p1 =
trcmp30_dpat(env0, d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pfree(h0p1))
end
|
D3Psap0
( d3p1
, sarg) =>
  trcmp30_dpat(env0, d3p1)
|
D3Psap1
( d3p1
, sarg) =>
  trcmp30_dpat(env0, d3p1)
//
|
D3Pdapp
( d3f0
, npf1, d3ps) => auxdapp(env0, d3p0)
|
D3Ptrcd1
( knd0
, npf1, d3ps) => aux_trcd1(env0, d3p0)
|
D3Panno
( d3p1
, s1e2, s2e2) => trcmp30_dpat(env0, d3p1)
//
| _(* rest-of_d3pat *) =>
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
H0Pnone1($UN.cast{ptr}(d3p0))
//
val () =
println!
("trcmp30_dpat: loc0 = ", loc0)
val () =
println!
("trcmp30_dpat: hend = ", "H0Pnone1(", d3p0, ")")
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [trcmp30_dpat]

end (*local*) // end of [local]

(* ****** ****** *)

implement
trcmp30_dpatlst
  (env0, d3ps) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3pat><h0pat>(d3ps)
) where
{
implement
list_map$fopr<d3pat><h0pat>(d3p0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val d3p0 = trcmp30_dpat(env0, d3p0)
in
let prval () = $UN.cast2void(env0) in d3p0 end
end
}
end // end of [trcmp30_dpatlst]

(* ****** ****** *)

implement
trcmp30_farg
( env0, f3a0 ) =
let
val
loc0 = f3a0.loc()
in
case+
f3a0.node() of
|
F3ARGsome_dyn
(npf0, d3ps) =>
let
  val
  h0ps =
  trcmp30_dpatlst(env0, d3ps)
in
  h0fag_make_node
  (loc0, H0FAGnpats(npf0, h0ps))
end
|
_ (* else *) =>
let
val hend = $UN.cast{ptr}(f3a0)
in
h0fag_make_node(loc0, H0FAGnone1(hend))
end
end (*let*) // end of [trcmp30_farg]

(* ****** ****** *)
//
implement
trcmp30_farglst
  (env0, f3as) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<f3arg><h0fag>(f3as)
) where
{
implement
list_map$fopr<f3arg><h0fag>(f3a0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val f3a0 = trcmp30_farg(env0, f3a0)
in
let
prval () = $UN.cast2void(env0) in f3a0
end
end
}
end (*let*) // end of [trcmp30_farglst]
//
(* ****** ****** *)
//
implement
trcmp30_ti3arg
  (ti3a) =
(
case+ ti3a of
| TI3ARGnone() =>
  HTIARGnone()
| TI3ARGsome(t2ps) =>
  HTIARGsome(trcmp30_typelst(t2ps))
)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
trsubt2p
( env0:
! compenv
, t2p0: t2ype): h0typ =
trcmp30_type(t2p0) where
{
val
t2p0 =
t2ype_subst_compenv(t2p0, env0)
} (* end of [trsubt2p] *)

(* ****** ****** *)

fun
auxi00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Ei00(int) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ei00(int))
end // end of [auxi00]

fun
auxb00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Eb00(btf) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eb00(btf))
end // end of [auxb00]

fun
auxc00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Ec00(chr) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ec00(chr))
end // end of [auxc00]

fun
auxs00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Es00(str) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Es00(str))
end // end of [auxs00]

(* ****** ****** *)

fun
auxint
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Eint(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eint(tok))
end // end of [auxint]

(* ****** ****** *)

fun
auxbtf
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Ebtf(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ebtf(tok))
end // end of [auxbtf]

fun
auxchr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Echr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Echr(tok))
end // end of [auxchr]

(* ****** ****** *)

fun
auxflt
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Eflt(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eflt(tok))
end // end of [auxflt]

fun
auxstr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trcmp30_type(t2p0)
//
val-
D3Estr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Estr(tok))
end // end of [auxstr]

(* ****** ****** *)

fun
auxtop
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Etop(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Etop(tok))
end // end of [auxtop]

(* ****** ****** *)

fun
auxvar
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hdv1 =
(
  trcmp30_dvar(d2v0)
) where
{
  val-
  D3Evar(d2v0) = d3e0.node()
}
//
val hend = H0Evar(hdv1)
//
in
h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxkvar
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Ekvar
(k0, d2v0) = d3e0.node()
val
hdv1 = trcmp30_dvar(d2v0)
//
val hend = H0Ekvar(k0, hdv1)
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxfcon
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hdc1 =
(
  trcmp30_dcon(d2c0)
) where
{
  val-
  D3Efcon(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcon(hdc1))
end

(* ****** ****** *)

fun
auxfcst
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hdc1 =
(
  trcmp30_dcst(d2c0)
) where
{
  val-
  D3Efcst(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcst(hdc1))
end

(* ****** ****** *)

fun
auxtcon
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Etcon
( d2c0
, ti3a, ti2s) = d3e0.node()
//
val hdc1 = trcmp30_dcon(d2c0)
val htia = trcmp30_ti3arg(ti3a)
//
in
  h0exp_make_node
  (loc0, h0t0, H0Etcon(hdc1, htia))
end

(* ****** ****** *)

fun
auxtcst
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Etcst
( d2c0
, ti3a, ti2s) = d3e0.node()
//
val hdc1 = trcmp30_dcst(d2c0)
val htia = trcmp30_ti3arg(ti3a)
//
in
  h0exp_make_node
  (loc0, h0t0, H0Etcst(hdc1, htia))
end

(* ****** ****** *)

local
//
fun
auxs2vs
( sqas
: sq2arglst
, tqas
: tq2arglst): s2varlst =
let
  val s2vs = sqas.s2vs()
in
  case s2vs of
  | list_nil _ => tqas.s2vs()
  | list_cons _ => s2vs + tqas.s2vs()
end // end of [auxs2vs]
//
in(*in-of-local*)
//
fun
auxtimp
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val-
D3Etimp
( stmp
, d3e1, targ
, d3cl, tsub) = d3e0.node()
//
val
h0e1 =
(
  trcmp30_dexp( env0, d3e1 )
)
//
val
s2vs =
(
case-
d3cl.node() of
|
D3Cfundclst
( _, _, tqas, _) =>
tqas.s2vs((*void*))
|
D3Cimplmnt3
( _
, _, _
, sqas, tqas
, _, _, _, _, _, _) =>
(
auxs2vs(sqas, tqas)) where
{
fun
auxs2vs
( sqas
: sq2arglst
, tqas
: tq2arglst): s2varlst =
let
  val s2vs = sqas.s2vs()
in
  case s2vs of
  | list_nil _ => tqas.s2vs()
  | list_cons _ => s2vs + tqas.s2vs()
end // end of [auxs2vs]
}
) : s2varlst // end of [val s2vs]
//
val () =
compenv_push_timp
(env0, d3e0, s2vs, tsub)
//
val hdcl =
trcmp30_decl(env0, d3cl)
//
val () =
compenv_pop0_timp( env0 )
//
val targ = trcmp30_typelst(targ)
val tsub = trcmp30_typelst(tsub)
//
in
h0exp_make_node
( loc0, h0t0
, H0Etimp(stmp, h0e1, targ, hdcl, tsub))
end // end of [auxtimp]
//
end // end of [ local ]

(* ****** ****** *)
//
fun
auxsap0
( env0:
! compenv
, d3e0: d3exp): h0exp =
(
trcmp30_dexp(env0, d3e1)
) where
{
val-
D3Esap0
(d3e1, s2es) = d3e0.node()
//
} (* end of [auxsap0] *)
//
fun
auxsap1
( env0:
! compenv
, d3e0: d3exp): h0exp =
(
trcmp30_dexp(env0, d3e1)
) where
{
val-
D3Esap1
(d3e1, s2es) = d3e0.node()
//
} (* end of [auxsap1] *)
//
(* ****** ****** *)

fun
auxdapp
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Edapp(h0f0, npf1, h0es)
) where
{
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val h0f0 =
trcmp30_dexp(env0, d3f0)
val h0es =
trcmp30_dexplst(env0, d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_let
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Elet(hdcl, h0e1)
) where
{
val-
D3Elet
(d3cs, d3e1) = d3e0.node()
//
val
hdcl =
trcmp30_declist(env0, d3cs)
//
val h0e1 = trcmp30_dexp(env0, d3e1)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_let]

fun
aux_whr
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Elet(hdcl, h0e1)
) where
{
val-
D3Ewhere
(d3e1, d3cs) = d3e0.node()
//
val
hdcl =
trcmp30_declist(env0, d3cs)
//
val h0e1 = trcmp30_dexp(env0, d3e1)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_whr]

(* ****** ****** *)

fun
aux_pcon
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Epcon(h0e1, lab2)
) where
{
val-
D3Epcon
(d3e1, lab2) = d3e0.node()
//
val h0e1 = trcmp30_dexp(env0, d3e1)
//
} (* where *) // end-of-val
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_pbox
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
H0Epbox(h0e1, lab2, idx2)
) where
{
val-
D3Epbox
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = trcmp30_dexp(env0, d3e1)
//
} (* where *) // end-of-val
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_proj
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eproj(h0e1, lab2, idx2)
) where
{
val-
D3Eproj
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = trcmp30_dexp(env0, d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_plft
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eplft(h0e1, lab2, idx2)
) where
{
val-
D3Eplft
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = trcmp30_dexp(env0, d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_pptr
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Epptr(h0e1, lab2, idx2)
) where
{
val-
D3Epptr
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = trcmp30_dexp(env0, d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_seqn
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eseqn(h0es, h0e1)
) where
{
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
val
h0es =
trcmp30_dexplst(env0, d3es)
val h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_trcd1
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
 H0Etrcd1(knd0, npf1, h0es)
) where
{
val-
D3Etrcd1
( knd0
, npf1, d3es) = d3e0.node()
val
h0es = trcmp30_dexplst(env0, d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_assgn
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eassgn
  (h0e1(*l*), h0e2(*r*))
) where
{
val-
D3Eassgn
( d3e1
, d3e2 ) = d3e0.node()
val h0e1 = trcmp30_dexp(env0, d3e1)
val h0e2 = trcmp30_dexp(env0, d3e2)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_assgn]

(* ****** ****** *)
//
fun
aux_if0
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eift1(h0e1, h0e2, opt3)
) where
{
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
h0e2 = trcmp30_dexp(env0, d3e2)
val
opt3 = trcmp30_dexpopt(env0, opt3)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_if0]
//
fun
aux_if1
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Eift1(h0e1, h0e2, opt3)
) where
{
val-
D3Eif1
( d3e1
, d3e2
, opt3, tinv) = d3e0.node()
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
h0e2 = trcmp30_dexp(env0, d3e2)
val
opt3 = trcmp30_dexpopt(env0, opt3)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_if1]
//
(* ****** ****** *)
//
fun
aux_cas0
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Ecase(knd0, h0e1, hcls)
) where
{
val-
D3Ecas0
( knd0
, d3e1, dcls) = d3e0.node()
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
hcls = trcmp30_dclaulst(env0, dcls)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_cas0]
//
fun
aux_cas1
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Ecase(knd0, h0e1, hcls)
) where
{
val-
D3Ecas1
( knd0
, d3e1
, dcls, tinv) = d3e0.node()
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
hcls = trcmp30_dclaulst(env0, dcls)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_cas1]
//
(* ****** ****** *)

fun
aux_lam
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val hend =
(
  H0Elam( knd, hfas, body )
) where
{
val-
D3Elam
( knd
, f3as, res1
, arrw, body) = d3e0.node()
//
val
hfas =
trcmp30_farglst(env0, f3as)
val
body = trcmp30_dexp(env0, body)
//
} (* where *)
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val hend =
(
 H0Efix
 ( knd0, fid1, hfas, body )
) where
{
val-
D3Efix
( knd0
, fid1
, f3as, res1
, arrw, body) = d3e0.node()
//
val fid1 = trcmp30_dvar(fid1)
//
val
hfas =
trcmp30_farglst( env0, f3as )
val body = trcmp30_dexp(env0, body)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_try0
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
(
  H0Etry0(knd0, h0e1, hcls)
) where
{
val-
D3Etry0
( knd0
, d3e1, dcls) = d3e0.node()
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
hcls = trcmp30_dclaulst(env0, dcls)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_try0]

(* ****** ****** *)

fun
aux_addr
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Eaddr( h0e1 ) where
{
//
val-
D3Eaddr(d3e1) = d3e0.node( )
//
val h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_addr]

(* ****** ****** *)

fun
aux_flat
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Eflat( h0e1 ) where
{
//
val-
D3Eflat(d3e1) = d3e0.node( )
//
val h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_flat]

(* ****** ****** *)

fun
aux_talf
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Etalf( h0e1 ) where
{
//
val-
D3Etalf(d3e1) = d3e0.node( )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_talf]

(* ****** ****** *)

fun
aux_fold
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Efold( h0e1 ) where
{
//
val-
D3Efold(d3e1) = d3e0.node( )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_fold]

(* ****** ****** *)

fun
aux_eval
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
H0Eeval( knd0, h0e1 ) where
{
//
val-
D3Eeval
(knd0, d3e1) = d3e0.node( )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_eval]

(* ****** ****** *)

fun
aux_free
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
H0Efree( knd0, h0e1 ) where
{
//
val-
D3Efree
(knd0, d3e1) = d3e0.node( )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_free]

(* ****** ****** *)

fun
aux_raise
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Eraise(h0e1) where
{
//
val-
D3Eraise(d3e1) = d3e0.node()
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_raise]

(* ****** ****** *)

fun
aux_lazy
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend = H0Elazy( h0e1 ) where
{
//
val-
D3Elazy(d3e1) = d3e0.node( )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_lazy]

(* ****** ****** *)

fun
aux_llazy
( env0:
! compenv
, d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
H0Ellazy( h0e1, h0es ) where
{
//
val-
D3Ellazy
(d3e1, d3es) = d3e0.node(  )
//
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
h0es = trcmp30_dexplst(env0, d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_llazy]

(* ****** ****** *)

in(*in-of-local*)

implement
trcmp30_dexp
(env0, d3e0) = let
//
#if(__XATSOPT_DEBUG__)
(*
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val () =
println!
("trcmp30_dexp: loc0 = ", loc0)
val () =
println!
("trcmp30_dexp: d3e0 = ", d3e0)
val () =
println!
("trcmp30_dexp: t2p0 = ", t2p0)
*)
#endif//__XATSOPT_DEBUG__
//
in
//
case+
d3e0.node() of
//
|
D3Ei00 _ => auxi00(d3e0)
|
D3Eb00 _ => auxb00(d3e0)
|
D3Ec00 _ => auxc00(d3e0)
|
D3Es00 _ => auxs00(d3e0)
//
|
D3Eint _ => auxint(d3e0)
|
D3Ebtf _ => auxbtf(d3e0)
|
D3Echr _ => auxchr(d3e0)
|
D3Eflt _ => auxflt(d3e0)
|
D3Estr _ => auxstr(d3e0)
//
|
D3Etop _ => auxtop(env0, d3e0)
//
|
D3Evar _ => auxvar(env0, d3e0)
|
D3Ekvar _ => auxkvar(env0, d3e0)
//
|
D3Efcon _ => auxfcon(env0, d3e0)
|
D3Efcst _ => auxfcst(env0, d3e0)
//
|
D3Etcon _ => auxtcon(env0, d3e0)
|
D3Etcst _ => auxtcst(env0, d3e0)
//
|
D3Etimp _ => auxtimp(env0, d3e0)
//
|
D3Esap0 _ => auxsap0(env0, d3e0)
|
D3Esap1 _ => auxsap1(env0, d3e0)
//
|
D3Edapp _ => auxdapp(env0, d3e0)
//
| D3Elet _ => aux_let(env0, d3e0)
|
D3Ewhere _ => aux_whr(env0, d3e0)
//
|
D3Epcon _ => aux_pcon(env0, d3e0)
|
D3Epbox _ => aux_pbox(env0, d3e0)
//
|
D3Eproj _ => aux_proj(env0, d3e0)
|
D3Eplft _ => aux_plft(env0, d3e0)
|
D3Epptr _ => aux_pptr(env0, d3e0)
//
|
D3Eseqn _ => aux_seqn(env0, d3e0)
//
|
D3Etrcd1 _ => aux_trcd1(env0, d3e0)
//
|
D3Eassgn _ => aux_assgn(env0, d3e0)
//
| D3Eif0 _ => aux_if0(env0, d3e0)
| D3Eif1 _ => aux_if1(env0, d3e0)
//
| D3Ecas0 _ => aux_cas0(env0, d3e0)
| D3Ecas1 _ => aux_cas1(env0, d3e0)
//
| D3Elam _ => aux_lam(env0, d3e0)
| D3Efix _ => aux_fix(env0, d3e0)
//
| D3Etry0 _ => aux_try0(env0, d3e0)
//
| D3Eaddr _ => aux_addr(env0, d3e0)
| D3Eflat _ => aux_flat(env0, d3e0)
| D3Etalf _ => aux_talf(env0, d3e0)
//
| D3Efold _ => aux_fold(env0, d3e0)
//
| D3Eeval _ => aux_eval(env0, d3e0)
| D3Efree _ => aux_free(env0, d3e0)
//
| D3Eraise _ => aux_raise(env0, d3e0) 
//
| D3Elazy _ => aux_lazy(env0, d3e0)
| D3Ellazy _ => aux_llazy(env0, d3e0)
//
|
D3Eanno
( d3e1
, s1e, s2e) => trcmp30_dexp(env0, d3e1)
|
D3Eexist1
( _, d3e1 ) => trcmp30_dexp(env0, d3e1)
//
|
D3Enone0 _ =>
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
in
h0exp_make_node(loc0, h0t0, H0Enone0())
end // end of [let]
//
| _(*rest-of_d3exp*) =>
let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
h0t0 = trsubt2p(env0, t2p0)
//
val
hend =
H0Enone1($UN.cast{ptr}(d3e0))
//
val () =
println!
("trcmp30_dexp: loc0 = ", loc0)
val () =
println!
("trcmp30_dexp: hend = ", "H0Enone1(", d3e0, ")")
//
in
h0exp_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [trcmp30_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
trcmp30_dexpopt
(env0, opt0) =
(
case+ opt0 of
|
None() => None()
|
Some(d3e0) =>
Some(trcmp30_dexp(env0, d3e0))
)
//
(* ****** ****** *)
//
implement
trcmp30_dexplst
  (env0, d3es) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3exp><h0exp>(d3es)
) where
{
implement
list_map$fopr<d3exp><h0exp>(d3e0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val d3e0 = trcmp30_dexp(env0, d3e0)
in
let prval () = $UN.cast2void(env0) in d3e0 end
end
}
end // end of [trcmp30_dexplst]
//
(* ****** ****** *)
//
implement
trcmp30_dgua
(env0, d3g0) =
let
val
loc0 = d3g0.loc()
in
case+
d3g0.node() of
|
D3GUAexp(d3e1) =>
let
val
h0e1 = trcmp30_dexp(env0, d3e1)
in
h0gua_make_node(loc0, H0GUAexp(h0e1))
end
|
D3GUAmat(d3e1, d3p2) =>
let
val
h0e1 = trcmp30_dexp(env0, d3e1)
val
h0p2 = trcmp30_dpat(env0, d3p2)
in
h0gua_make_node(loc0, H0GUAmat(h0e1, h0p2))
end
end // end of [trcmp30_dgua]
//
implement
trcmp30_dgualst
  (env0, d3gs) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3gua><h0gua>(d3gs)
) where
{
implement
list_map$fopr<d3gua><h0gua>(d3g0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val h0g0 = trcmp30_dgua(env0, d3g0)
in
let prval () = $UN.cast2void(env0) in h0g0 end
end
}
end // end of [trcmp30_dgualst]
//
(* ****** ****** *)
//
implement
trcmp30_dclau
( env0, d3cl ) =
let
val
loc0 = d3cl.loc()
in
//
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
let
val
h0gp =
trcmp30_dgpat(env0, d3gp)
in
h0clau_make_node(loc0, H0CLAUpat(h0gp))
end
|
D3CLAUexp(d3gp, d3e1) =>
let
val
h0gp =
trcmp30_dgpat(env0, d3gp)
val
h0e1 = trcmp30_dexp(env0, d3e1)
in
h0clau_make_node(loc0, H0CLAUexp(h0gp, h0e1))
end
//
end // end of [trcmp30_dclau]
//
implement
trcmp30_dgpat
( env0, d3gp ) =
let
val
loc0 = d3gp.loc()
in
//
case+
d3gp.node() of
|
D3GPATpat(d3p1) =>
let
val
h0p1 =
trcmp30_dpat(env0, d3p1)
in
h0gpat_make_node(loc0, H0GPATpat(h0p1))
end
|
D3GPATgua(d3p1, d3gs) =>
let
val
h0p1 =
trcmp30_dpat(env0, d3p1)
val
h0gs =
trcmp30_dgualst(env0, d3gs)
in
h0gpat_make_node(loc0, H0GPATgua(h0p1, h0gs))
end
//
end // end of [trcmp30_dgpat]
//
implement
trcmp30_dclaulst
  (env0, dcls) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3clau><h0clau>(dcls)
) where
{
implement
list_map$fopr<d3clau><h0clau>(dcl0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val hcl0 = trcmp30_dclau(env0, dcl0)
in
let prval () = $UN.cast2void(env0) in hcl0 end
end
}
end // end of [trcmp30_dclaulst]
//
(* ****** ****** *)

local

(* ****** ****** *)
fun
trsubt2p
( env0:
! compenv
, t2p0: t2ype): h0typ =
trcmp30_type(t2p0) where
{
val
t2p0 =
t2ype_subst_compenv(t2p0, env0)
} (* end of [trsubt2p] *)
(* ****** ****** *)

fun
aux_include
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cinclude
( tok
, src // g1exp
, knd // stadyn
, opt1, opt2) = d3cl.node()
//
val opt2 =
(
case+ opt2 of
|
None() => None()
|
Some(d3cs) =>
Some(trcmp30_declist(env0, d3cs))
) : h0dclistopt // end-of-val
//
in
h0dcl_make_node
( loc0
, H0Cinclude(tok, src, knd, opt1, opt2))
end (*let*) // end of [aux_include]

(* ****** ****** *)

(*
fun
aux_abstype
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cabstype
(s2c1, def2) = d3cl.node()
//
val
htc1 = trcmp30_scst( s2c1 )
//
val () =
(
case- def2 of
(*
|
ABSTDF2none() => ((*void*))
*)
|
ABSTDF2some() => ((*void*))
|
ABSTDF2lteq
(tdef) =>
let
val
tdef = t2ype_normize(tdef)
in
htc1.abstdf2(trcmp30_type(tdef))
end
|
ABSTDF2eqeq
(sdef, tdef) =>
let
val
tdef = t2ype_normize(tdef)
in
htc1.abstdf2(trcmp30_type(tdef))
end
) : void // end-of[val ()]
//
val () =
println!
("aux_abstype: loc0 = ", loc0)
val () =
println!
("aux_abstype: s2c1 = ", s2c1)
val () =
println!
("aux_abstype: def2 = ", def2)
val () =
println!
("\
aux_abstype: \
htc1.abstdf2 = ",htc1.abstdf2())
//
in
h0dcl_make_node
( loc0,
  H0Cnone1($UN.cast{ptr}(d3cl)) )
end (*let*) // end of [aux_abstype]
*)
fun
aux_abstype
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cabstype
(s2c1, def2) = d3cl.node()
//
val
htc1 = trcmp30_scst( s2c1 )
//
in
h0dcl_make_node
( loc0
, H0Cabstype(htc1, htc1.abstdf2()))
end (*let*) // end of [aux_abstype]

(* ****** ****** *)

fun
aux_excptcon
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cexcptcon
( d1cl
, d2cs) = d3cl.node()
//
fun
auxd2cs
( d2cs
: d2conlst): h0conlst =
(
case+ d2cs of
|
list_nil() =>
list_nil()
|
list_cons
(d2c1, d2cs) =>
let
  val hdc1 =
  trcmp30_dcon(d2c1)
in
  list_cons(hdc1, auxd2cs(d2cs))
end
)
//
in
//
let
val hdcs = auxd2cs(d2cs)
in
h0dcl_make_node(loc0, H0Cexcptcon(hdcs))
end
//
end // end of [aux_excptcon]

(* ****** ****** *)

fun
aux_datatype
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cdatatype
( d1cl
, s2cs) = d3cl.node()
//
val
htcs =
trcmp30_scstlst(s2cs)
//
(*
val
((*void*)) =
auxs2cs(s2cs, htcs) where
{
fun
auxs2cs
( s2cs: s2cstlst
, htcs: htcstlst): void =
(
case+ s2cs of
|
list_nil() => ()
|
list_cons(s2c1, s2cs) =>
let
val-
list_cons
(htc1, htcs) = htcs
val opt =
s2cst_get_d2conlst(s2c1)
in
case- opt of
(*
| ~
None_vt() =>
auxs2cs(s2cs, htcs)
*)
| ~
Some_vt(d2cs) =>
auxs2cs(s2cs, htcs) where
{
val
hdcs =
trcmp30_dconlst(d2cs)
val () = htc1.hdconlst(hdcs)
}
end // end of [Some]
)
} (*where*) // end of [val]
*)
//
in
h0dcl_make_node(loc0, H0Cdatatype(htcs))
end // end of [aux_datatype]

(* ****** ****** *)

fun
aux_valdclst
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvaldclst
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! compenv
, v3d0
: d3valdecl): h0valdecl =
let
//
val+
D3VALDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
trcmp30_dpat(env0, pat)
val def =
trcmp30_dexpopt(env0, def)
//
in
H0VALDECL
( @{loc=loc,pat=pat,def=def} )
end // end of [auxv3d0]
and
auxv3ds
( env0:
! compenv
, v3ds
: d3valdeclist
)
: h0valdeclist = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3valdecl><h0valdecl>(v3ds)
) where
{
implement
list_map$fopr<
  d3valdecl><h0valdecl>(v3d0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val hvd0 = auxv3d0(env0, v3d0)
in
let
prval() = $UN.cast2void(env0) in hvd0
end
end
}
end
//
in
let
val hvds = auxv3ds(env0, v3ds)
in
h0dcl_make_node
(loc0, H0Cvaldclst(knd, mopt, hvds))
end
end (*let*) // end of [aux_valdclst]

(* ****** ****** *)

fun
aux_vardclst
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvardclst
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! compenv
, v3d0
: d3vardecl): h0vardecl =
let
//
val+
D3VARDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val ini = rcd.ini
//
val hdv =
trcmp30_dvar(d2v)
val wth =
trcmp30_dvaropt(wth)
val ini =
trcmp30_dexpopt(env0, ini)
//
in
H0VARDECL
(
@{loc=loc,hdv=hdv,wth=wth,ini=ini}
)
end // end of [auxv3d0]
and
auxv3ds
( env0:
! compenv
, v3ds
: d3vardeclist
)
: h0vardeclist = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<
  d3vardecl><h0vardecl>(v3ds)
) where
{
implement
list_map$fopr<
  d3vardecl><h0vardecl>(v3d0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val hvd0 = auxv3d0(env0, v3d0)
in
let
prval() = $UN.cast2void(env0) in hvd0
end
end
}
end
//
in
let
  val
  hvds = auxv3ds(env0, v3ds)
in
h0dcl_make_node
(loc0, H0Cvardclst(knd, mopt, hvds))
end
end (*let*) // end of [aux_vardclst]

(* ****** ****** *)

fun
aux_fundclst
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundclst
( knd
, mopt
, tqas
, f3ds) = d3cl.node()
//
fun
auxf3d0
( env0:
! compenv
, f3d0
: d3fundecl): h0fundecl =
let
val+
D3FUNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val f3g = rcd.f3g
val def = rcd.def
val rtp = rcd.rtp
//
val nam = trcmp30_dvar(nam)
val hdc = trcmp30_dcst(d2c)
val hfg =
(
case+ f3g of
|
None() =>
None()
|
Some(f3as) =>
Some
(trcmp30_farglst(env0, f3as))
) : h0faglstopt // end-of-val
val rtp = trsubt2p(env0, rtp)
//
val
def = trcmp30_dexpopt(env0, def)
//
in
H0FUNDECL(
@{
 loc=loc,nam=nam
,hdc=hdc,hfg=hfg,def=def,rtp=rtp}
) (* HFUNDECL *)
end // end of [auxf3d0]
and
auxf3ds
( env0:
! compenv
, f3ds
: d3fundeclist
)
: h0fundeclist = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3fundecl><h0fundecl>(f3ds)
) where
{
implement
list_map$fopr<d3fundecl><h0fundecl>(f3d0) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val hfd0 = auxf3d0(env0, f3d0)
in
let prval () = $UN.cast2void(env0) in hfd0 end
end
}
end
//
in(*in-of-let*)
//
let
val
tqas =
trcmp30_tqas(tqas)
val
hfds = auxf3ds(env0, f3ds)
in
h0dcl_make_node
( loc0
, H0Cfundclst(knd, mopt, tqas, hfds))
end // end of [let]
//
end (*let*) // end of [aux_fundclst]

(* ****** ****** *)

fun
aux_implmnt3
( env0:
! compenv
, d3cl: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimplmnt3
( knd
, stmp, mopt
, sqas, tqas
, id2c, ti3a
, ti2s, f3as
, res1, body) = d3cl.node()
//
local
//
fun
auxs2vs
( s2vs
: s2varlst
, htvs
: htvarlst): htvarlst =
(
case+ s2vs of
|
list_nil() => htvs
|
list_cons(s2v1, s2vs) =>
let
val
htv1 = trcmp30_svar(s2v1)
in
list_cons
(htv1, auxs2vs(s2vs, htvs))
end // end of [list_cons]
)
//
in
//
val
htvs = list_nil()
val
htvs =
auxs2vs(tqas.s2vs(), htvs)
val
htvs =
auxs2vs(sqas.s2vs(), htvs)
//
end // end of [local]
//
val htqa =
(
case+ htvs of
|
list_nil() =>
None((*void*))
|
list_cons _ =>
Some
(
htqarg_make_htvarlst(loc0, htvs)
)
) : htqargopt // end-of-val
//
val
d2c0 =
(
case+ id2c of
|
IMPLD2CST1(_, d2cs) =>
let
  val-
  list_cons
  (d2c0, _) = d2cs in d2c0
end
|
IMPLD2CST2
(_, d2cs, opt0) =>
let
val-Some(d2c0) = opt0 in d2c0
end
) : d2cst // end-of-val
//
val
hdc0 = trcmp30_dcst(d2c0)
//
val
htia = trcmp30_ti3arg(ti3a)
//
val
hfas =
trcmp30_farglst(env0, f3as)
//
val
body = trcmp30_dexp(env0, body)
//
val
hend =
H0Cimplmnt3
( knd
, stmp, mopt
, htqa, hdc0, htia, hfas, body)
in
h0dcl_make_node(loc0, hend(*implmnt*))
end // end of [aux_implmnt3]

(* ****** ****** *)

in(*in-of-local*)

implement
trcmp30_decl
(env0, d3cl) = let
//
val
loc0 = d3cl.loc()
//
(*
val () =
println!
("trcmp30_decl: d3cl = ", d3cl)
*)
//
in(*in-of-local*)
//
case+
d3cl.node() of
//
|
D3Cstatic
(tok, d3cl) => let
  val
  hdcl =
  trcmp30_decl(env0, d3cl)
in
  h0dcl_make_node
  (loc0, H0Cstatic(tok, hdcl))
end
|
D3Cextern
(tok, d3cl) => let
val
hdcl =
trcmp30_decl(env0, d3cl)
in
  h0dcl_make_node
  (loc0, H0Cextern(tok, hdcl))
end
//
|
D3Clocal
(head, body) => let
val
head =
trcmp30_declist(env0, head)
val
body =
trcmp30_declist(env0, body)
in
  h0dcl_make_node
  ( loc0, H0Clocal(head, body) )
end
//
|
D3Cinclude _ => aux_include(env0, d3cl)
//
(*
(*
HX-2022-04-29:
Should this one be added? Why?
*)
|
D3Cstaload _ => aux_staload(env0, d3cl)
*)
//
|
D3Cabstype _ => aux_abstype(env0, d3cl)
//
|
D3Cexcptcon _ => aux_excptcon(env0, d3cl)
|
D3Cdatatype _ => aux_datatype(env0, d3cl)
//
|
D3Cvaldclst _ => aux_valdclst(env0, d3cl)
|
D3Cvardclst _ => aux_vardclst(env0, d3cl)
//
|
D3Cfundclst _ => aux_fundclst(env0, d3cl)
//
|
D3Cimplmnt3 _ => aux_implmnt3(env0, d3cl)
|
_(* rest-of-d3exp *) =>
(
  h0dcl_make_node(loc0, node)
) where
{
  val node = H0Cnone1($UN.cast{ptr}(d3cl))
} (* end of [rest-of-d3exp] *)
//
end (*let*) // end of [trcmp30_decl]

end // end of [local]

(* ****** ****** *)

implement
trcmp30_declist
  (env0, d3cs) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3ecl><h0dcl>(d3cs)
) where
{
implement
list_map$fopr<d3ecl><h0dcl>(d3cl) =
let
val env0 =
$UN.castvwtp0{compenv}(env0)
val hdcl = trcmp30_decl(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in hdcl end
end
}
end // end of [trcmp30_declist]

(* ****** ****** *)
(*
//
HX-2022-01-30:
This code is moved to
[trcmp30_staexp.dats]
//
implement
trcmp30_tqarg
  (tqa0) =
(
  htqarg_make(loc0, htvs)
) where
{
val loc0 = tqa0.loc()
val htvs =
trcmp30_svarlst(tqa0.s2vs())
}

implement
trcmp30_tqarglst
  (tqas) =
list_vt2t(tqas) where
{
val
tqas =
list_map<tq2arg><htqarg>
  (tqas) where
{
implement
list_map$fopr<tq2arg><htqarg>(tqa) = trcmp30_tqarg(tqa)
}
} (* end of [trcmp30_tqarglst] *)
//
*)
(* ****** ****** *)

(* end of [xats_trcmp30_dynexp.dats] *)
