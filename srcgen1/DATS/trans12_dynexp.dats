(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: December, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
SYM = "./../SATS/xsymbol.sats"
#staload
MAP = "./../SATS/xsymmap.sats"
#staload
ENV = "./../SATS/xsymenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/mylib00.sats"
#staload "./../DATS/mylib00.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)

#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)
(* ****** ****** *)
implement
fprint_val<token> = fprint_token
(* ****** ****** *)
implement
fprint_val<s1qua> = fprint_s1qua
(* ****** ****** *)
//
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
//
(* ****** ****** *)
//
implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
//
(* ****** ****** *)
//
implement
fprint_val<d1pat> = fprint_d1pat
implement
fprint_val<d2pat> = fprint_d2pat
//
implement
fprint_val<d1exp> = fprint_d1exp
implement
fprint_val<d2exp> = fprint_d2exp
//
(* ****** ****** *)

implement
fprint_val<f1arg> = fprint_f1arg
implement
fprint_val<f2arg> = fprint_f2arg

(* ****** ****** *)

implement
fprint_val<sq2arg> = fprint_sq2arg
implement
fprint_val<tq2arg> = fprint_tq2arg

(* ****** ****** *)
//
extern
fun
{x:t0p}
list_isnot_sing
{n:int}
(xs: list(INV(x), n)):<> bool(n != 1)
implement
{x}(*tmp*)
list_isnot_sing (xs) =
(
  case+ xs of
  | list_sing(x) => false | _ =>> true
)
// end of [list_isnot_sing]
//
(* ****** ****** *)
//
(*
HX-2020-07:
A nullary constructor C can
be written as C (instead of C())
*)
//
fun
d2pat_dap0
(d2p0: d2pat): d2pat =
let
val loc0 = d2p0.loc()
in
d2pat_make_node(loc0, D2Pdap0(d2p0))
end
//
(* ****** ****** *)
//
fun
my_d2pat_con1
( loc0
: loc_t
, d2c0
: d2con): d2pat =
let  
val
narg = d2c0.narg()
val
d2p0 = d2pat_con1(loc0, d2c0)
in
if
(narg>0)
then d2p0 else d2pat_dap0(d2p0)
end // end of [my_d2pat_con1]

(* ****** ****** *)
//
fun
my_d2pat_sapp
( loc0
: loc_t
, d2p1
: d2pat
, s2vs
: s2varlst): d2pat =
(
case-
d2p1.node() of
| D2Pdap0(d2p1) =>
  d2pat_dap0
  (
  d2pat_sapp(loc0, d2p1, s2vs)
  )
| _ (* non-D2Pdap0 *) =>
  d2pat_sapp(loc0, d2p1, s2vs)
)
//
(* ****** ****** *)
//
fun
my_d2pat_dapp
( loc0
: loc_t
, d2f0
: d2pat
, npf1: int
, d2as
: d2patlst): d2pat =
let
(*
val () =
println!
("my_d2pat_dapp: d2f0 = ", d2f0)
val () =
println!
("my_d2pat_dapp: d2as = ", d2as)
*)
in
//
case+
d2f0.node() of
|
D2Pdap0(d2f0) =>
(
case+ d2as of
|
list_nil() =>
d2pat_dapp(loc0, d2f0, npf1, d2as)
|
list_cons(d2a1, _) =>
(
case+
d2a1.node() of
| D2Parg() => 
  d2pat_make_node
  ( loc0, D2Pdap1(d2f0) )
| _(*non-D2Parg*) =>
  d2pat_dapp(loc0, d2f0, npf1, d2as)
)
) (* D2Pdap0 *)
|
_ (* non-D2Pdap0 *) =>
(
case+ d2as of
|
list_nil() =>
d2pat_dapp(loc0, d2f0, npf1, d2as)
|
list_cons(d2a1, _) =>
(
case+
d2a1.node() of
| D2Parg() =>
  d2pat_make_node
  ( loc0, D2Pdap1(d2f0) )
| _(*non-D2Parg*) =>
  d2pat_dapp(loc0, d2f0, npf1, d2as)
) (* end of [list_cons] *)
) (* end of [non-D2Pdap0] *)
//
end (*let*) // end of [my_d2pat_dapp]
//
(* ****** ****** *)
//
fun
my_d2exp_dapp
( loc0
: loc_t
, d2f0
: d2exp
, npf1: int
, d2as
: d2explst): d2exp =
(
case+
d2f0.node() of
|
D2Edap0(d2f0) =>
d2exp_dapp(loc0, d2f0, npf1, d2as)
|
_ (*non-D2Edap0*) =>
d2exp_dapp(loc0, d2f0, npf1, d2as)
)
//
(* ****** ****** *)
//
fun
d2exp_dap0
(d2e0: d2exp): d2exp =
let
val loc0 = d2e0.loc()
in
d2exp_make_node(loc0, D2Edap0(d2e0))
end
//
(* ****** ****** *)
//
fun
my_d2exp_con1
( loc0
: loc_t
, d2c0
: d2con): d2exp =
let  
val
narg = d2c0.narg()
val
d2e0 = d2exp_con1(loc0, d2c0)
in
if
(narg>0)
then d2e0 else d2exp_dap0(d2e0)
end // end of [my_d2exp_con1]
//
(* ****** ****** *)
//
fun
my_d2exp_sapp
( loc0
: loc_t
, d2e1
: d2exp
, s2es
: s2explst): d2exp =
(
case-
d2e1.node() of
| D2Edap0(d2e1) =>
  d2exp_dap0
  (
  d2exp_sapp(loc0, d2e1, s2es)
  )
| _ (* non-D2Edap0 *) =>
  d2exp_sapp(loc0, d2e1, s2es)
)
//
(* ****** ****** *)
//
fun
my_d2exp_tapp
( loc0
: loc_t
, d2e1
: d2exp
, s2es
: s2explst): d2exp =
(
case-
d2e1.node() of
| D2Edap0(d2e1) =>
  d2exp_dap0
  (
  d2exp_tapp(loc0, d2e1, s2es)
  )
| _ (* non-D2Edap0 *) =>
  d2exp_tapp(loc0, d2e1, s2es)
)
//
(* ****** ****** *)

implement
trans12_dtyp
( d1t0
: d1typ): d2typ = let
//
val
loc0 = d1t0.loc()
//
(*
val () =
println!
("trans12_dtyp: d1t0 = ", d1t0)
*)
//
in
//
case+
d1t0.node() of
|
D1TYPsome
(tok0, opt1) =>
let
//
val
sym0 =
dexpid_sym(tok0)
val
opt1 =
trans12_sexpopt(opt1)
val
opt2 =
the_dexpenv_find(sym0)
//
in(*in-of-let*)
//
case+ opt2 of
//
| ~
None_vt() =>
d2typ_make_node
( loc0
, D2TYPsome_tok(tok0, opt1))
//
| ~
Some_vt(d2i0) =>
(
case+ d2i0 of
|
D2ITMvar(d2v0) =>
d2typ_make_node
( loc0
, D2TYPsome_var(d2v0, opt1))
|
_ (*non-D2ITMvar*) =>
d2typ_make_node
( loc0
, D2TYPsome_tok(tok0, opt1))
)
//
end // end of [D1TYPsome]
//
end // end of [trans12_dtyp]

(* ****** ****** *)

local

(* ****** ****** *)
overload =
with
$SYM.eq_symbol_symbol
(* ****** ****** *)

fun
isany
( sym
: sym_t): bool =
(
ifcase
| sym=WCARD => true
| _(* else *) => false
) where
{
macdef WCARD = $SYM.WCARD_symbol
} (* end of [isany] *)

(* ****** ****** *)

fun
isbtf
( sym
: sym_t): bool =
(
ifcase
| sym=TRUE => true
| sym=FALSE => true
| _(* else *) => false
) where
{
macdef TRUE = $SYM.TRUE_symbol
macdef FALSE = $SYM.FALSE_symbol
} (* end of [isbtf] *)

(* ****** ****** *)

fun
auxbs1
( d1p0
: d1pat): d2pat =
(
trans12_dpat(d1p1)
) where
{
//
val-
D1Pbs1(d1p1) = d1p0.node()
//
}(*where*)//end-of(auxbs1)

(* ****** ****** *)

fun
auxint
( d1p0
: d1pat): d2pat =
let
val
loc0 = d1p0.loc()
val-
D1Pint(tok) = d1p0.node()
in
d2pat_make_node(loc0, D2Pint(tok))
end (*let*) // end of [auxint]

fun
auxchr
( d1p0
: d1pat): d2pat =
let
val
loc0 = d1p0.loc()
val-
D1Pchr(tok) = d1p0.node()
in
d2pat_make_node(loc0, D2Pchr(tok))
end (*let*) // end of [auxchr]

fun
auxstr
( d1p0
: d1pat): d2pat =
let
val
loc0 = d1p0.loc()
val-
D1Pstr(tok) = d1p0.node()
in
d2pat_make_node(loc0, D2Pstr(tok))
end (*let*) // end of [auxstr]

(* ****** ****** *)

fun
auxid0
( d1p0
: d1pat): d2pat = let
//
val-
D1Pid0
( tok ) = d1p0.node()
//
val
sym =
dexpid_sym(tok)
val
opt =
the_gmacenv_find(sym)
//
in
//
case- opt of
|
~None_vt() =>
(
  auxid0_d1pat(d1p0)
)
|
~Some_vt(g1m0) =>
let
val
loc0 = d1p0.loc()
val
g1m0 =
trans11_g1mac(g1m0)
in
  trg1mac_dpat(loc0, g1m0)
end
//
end // end of [auxid0(d1p0)]

and
auxid0_d1pat
( d1p0
: d1pat): d2pat = let
//
val-
D1Pid0
( tok ) = d1p0.node()
//
val
sym = dexpid_sym(tok)
//
(*
val opt = None_vt((*void*))
*)
val
opt = the_dexpenv_find(sym)
//
in
//
case+ opt of
//
| ~
None_vt() =>
auxid0_none
(d1p0, sym(*d2var*))
| ~
Some_vt(d2i) =>
auxid0_d2itm
(d1p0, sym(*d2var*), d2i(*d2con*))
//
end // end of [auxid0_d1pat]

and
auxid0_none
( d1p0: d1pat
, name: sym_t): d2pat =
let
  val loc0 = d1p0.loc()
in
//
ifcase
|
isany(name) =>
(
d2pat_make_node(loc0, D2Pany())
)
|
isbtf(name) =>
let
val-
D1Pid0(tok) = d1p0.node()
in
d2pat_make_node(loc0, D2Pbtf(tok))
end
| _ (* else *) =>
let
val
d2v0 = d2var_new2(loc0, name)
in
d2pat_make_node(loc0, D2Pvar(d2v0))
end
//
end // end of [auxid0_none]

(*
and
auxid0_d2itm
( d1p0: d1pat
, name: sym_t
, d2i0: d2itm): d2pat =
let
  val loc0 = d1p0.loc()
in
  d2pat_make_node(loc0, D2Pnone1(d1p0))
end // end of [auxid0_d2itm]
*)
and
auxid0_d2itm
( d1p0: d1pat
, name: sym_t
, d2i0: d2itm): d2pat =
(
case+ d2i0 of
//
| D2ITMcon(xs) =>
  auxid0_d2con(d1p0, xs)
//
| D2ITMvar _ =>
  auxid0_d2var(d1p0, name)
| D2ITMcst _ =>
  auxid0_d2cst(d1p0, name)
| D2ITMsym(_, dpis) =>
  auxid0_d2sym(d1p0, dpis)
) (* end of [auxid0_d2itm] *)

and
auxid0_d2con
( d1p0: d1pat
, d2cs: d2conlst): d2pat =
let
val loc0 = d1p0.loc()
in
//
if
list_isnot_sing(d2cs)
then
(
  d2pat_con2(loc0, d2cs)
)
else
let
  val d2c0 = d2cs.head()
in
  my_d2pat_con1(loc0, d2c0)
end (*let*) // end-of-[if]
//
end // end of [auxid0_d2con]
//
and
auxid0_d2var
( d1p0: d1pat
, name: sym_t): d2pat =
(
  auxid0_none(d1p0, name)
)
and
auxid0_d2cst
( d1p0: d1pat
, name: sym_t): d2pat =
(
  auxid0_none(d1p0, name)
)
//
and
auxid0_d2sym
( d1p0
: d1pat
, dpis
: d2pitmlst): d2pat =
let
val loc0 = d1p0.loc()
in
d2pat_sym0(loc0, d1p0, dpis)
end(*let*)//end-of(auxid0_d2sym)

(* ****** ****** *)
static
fun
auxmain(d1p0: d1pat): d2pat
(* ****** ****** *)

fun
auxapp1
( d1p0
: d1pat): d2pat = let
//
val-
D1Papp1
( d1p1
, d1p2) = d1p0.node()
//
fun
isBANG
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "!")
|
_(*non-T_IDENT_sym*) => false
)
| _(*  non-D1Pid0  *) => false
)
fun
isFLAT
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "@")
|
_(*non-T_IDENT_sym*) => false
)
| _(*  non-D1Pid0  *) => false
)
fun
isFREE
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "~")
|
_(*non-T_IDENT_sym*) => false
)
| _(*  non-D1Pid0  *) => false
)
//
in
//
ifcase
//
|
isBANG(d1p1) =>
let
  val
  d2p2 = trans12_dpat(d1p2)
in
  d2pat_make_node
  (d1p0.loc(), D2Pbang(d2p2))
end
|
isFLAT(d1p1) =>
let
  val
  d2p2 = trans12_dpat(d1p2)
in
  d2pat_make_node
  (d1p0.loc(), D2Pflat(d2p2))
end
|
isFREE(d1p1) =>
let
  val
  d2p2 = trans12_dpat(d1p2)
in
  d2pat_make_node
  (d1p0.loc(), D2Pfree(d2p2))
end
//
| _ (* else *) =>
(
case+
d1p2.node() of
//
|
D1Psarg(s1as) =>
let
//
  val
  loc0 = d1p0.loc()
//
  val d2p1 =
  trans12_dpat(d1p1)
  val s2vs =
  trans12_sarglst(s1as)
//
(*
  val () =
  println!
  ("auxapp1: d2p1 = ", d2p1)
  val () =
  println!
  ("auxapp1: s2vs = ", s2vs)
(*
// HX: s2vs needs to be re-sorted!
*)
*)
//
in
  my_d2pat_sapp(loc0, d2p1, s2vs)
end // end of [D1Psqarg]
//
|
_(*rest-of-d1pat*) => auxapp10(d1p0)
)
//
end // end of [auxapp1]

and
auxapp10
( d1p0
: d1pat): d2pat = let
//
(*
val
loc0 = d1p0.loc()
val () =
println!
("auxapp10: loc0 = ", loc0)
val () =
println!
("auxapp10: d1p0 = ", d1p0)
*)
//
val-
D1Papp1
( d1p1
, d1p2) = d1p0.node()
//
val d2p1 = auxmain(d1p1)
//
val npf2 =
(
case+
d1p2.node() of
| D1Pl2st(d1ps, _) =>
  list_length<d1pat>(d1ps)
| _(* non-D2Plist *) => ~1): int
//
val d2ps =
(
case+
d1p2.node() of
|
D1Pl1st
( d1ps ) => trans12_dpatlst(d1ps)
|
D1Pl2st
(d1ps1, d1ps2) =>
(
  d2ps1 + d2ps2) where
{
  val d2ps1 = trans12_dpatlst(d1ps1)
  val d2ps2 = trans12_dpatlst(d1ps2)
}
|
_(* non-D2Plist *) =>
let
val d2p2 =
trans12_dpat(d1p2)
val d2p2 =
d2pat_any2arg(d2p2) in list_sing(d2p2)
end where
{
fun
d2pat_any2arg
(d2p0: d2pat): d2pat =
(
case+
d2p0.node() of
|
D2Pany() =>
d2pat_make_node
(d2p0.loc(), D2Parg()) | _(*else*) => d2p0
)
}
) : d2patlst // end of [val]
//
in
//
my_d2pat_dapp(d1p0.loc(), d2p1, npf2, d2ps)
//
end (*let*) // end of [auxapp10]

(* ****** ****** *)

fun
auxapp2
( d1p0
: d1pat): d2pat = let
//
val loc0 = d1p0.loc()
//
val-
D1Papp2
( d1f0
, d1p1, d1p2) = d1p0.node()
//
val d2f0 = trans12_dpat(d1f0)
val d2p1 = trans12_dpat(d1p1)
val d2p2 = trans12_dpat(d1p2)
//
val d2as = list_pair(d2p1, d2p2)
//
in
d2pat_app2(loc0, d2f0, d2p1, d2p2)
end (*let*) // end of [auxapp2(d1p0)]

(* ****** ****** *)

fun
auxl1st
( d1p0
: d1pat): d2pat = let
//
(*
val () =
println!
("auxl1st: d1p0 = ", d1p0)
*)
//
val-
D1Pl1st(d1ps) = d1p0.node()
//
in
//
if
list_is_sing(d1ps)
then
trans12_dpat(d1ps.head())
else
(
d2pat_trcd1
(d1p0.loc(), knd, npf, d2ps)
) where
{
  val knd = 0
  val npf = ~1
  val d2ps = trans12_dpatlst(d1ps)
}
//
end // end of [auxl1st]

(* ****** ****** *)

fun
auxl2st
( d1p0
: d1pat): d2pat = let
//
(*
val () =
println!
("auxl2st: d1p0 = ", d1p0)
*)
//
val-
D1Pl2st
(d1ps1, d1ps2) = d1p0.node()
//
in
(
d2pat_trcd1
(d1p0.loc(), knd, npf, d2ps1+d2ps2)
) where {
  val knd = 0
  val npf = length(d1ps1)
  val d2ps1 = trans12_dpatlst(d1ps1)
  val d2ps2 = trans12_dpatlst(d1ps2)
}
end // end of [auxl2st]

(* ****** ****** *)

fun
auxtrcd11
( d1p0
: d1pat): d2pat = let
//
val
loc0 = d1p0.loc()
//
val-
D1Ptrcd1
(tok, d1ps) = d1p0.node()
//
val knd =
(
case-
tok.node() of T_TRCD1(k0) => k0
) : int // end of [val]
//
in
//
(
d2pat_trcd1
(loc0, knd, npf, d2ps)) where
{
val npf = ~1
val d2ps = trans12_dpatlst(d1ps)
} (*where*)
//
end (*let*) // end of [ auxtrcd11 ]

(* ****** ****** *)

fun
auxtrcd12
( d1p0
: d1pat): d2pat = let
//
val
loc0 = d1p0.loc()
//
val-
D1Ptrcd1
( tok
, d1ps1, d1ps2) = d1p0.node()
//
val knd1 =
(
case-
tok.node() of T_TRCD1(k0) => k0
) : int // end of [val]
//
in
(
d2pat_trcd1
( loc0
, knd1
, npf2, d2ps1+d2ps2)) where {
//
val npf2 = length(d1ps1)
//
val d2ps1 = trans12_dpatlst(d1ps1)
val d2ps2 = trans12_dpatlst(d1ps2)
//
} (*where*)
end (*let*) // end of [ auxtrcd12 ]

(* ****** ****** *)

implement
auxmain(d1p0) =
(
case-
d1p0.node() of
//
| D1Pid0 _ => auxid0(d1p0)
//
| D1Pint _ => auxint(d1p0)
| D1Pchr _ => auxchr(d1p0)
| D1Pstr _ => auxstr(d1p0)
//
| D1Pbs1 _ => auxbs1(d1p0)
//
| D1Papp1 _ => auxapp1(d1p0)
//
| D1Papp2 _ => auxapp2(d1p0)
//
| D1Pl1st _ => auxl1st(d1p0)
| D1Pl2st _ => auxl2st(d1p0)
//
| D1Ptrcd1
  (tok, d1ps) => auxtrcd11(d1p0)
| D1Ptrcd1
  ( tok
  , xs1, xs2) => auxtrcd12(d1p0)
//
| D1Panno
(d1p1, s1e2) =>
(
  d2pat_make_node
  ( d1p0.loc()
  , D2Panno(d2p1, s1e2, s2e2))
) where
{
  val d2p1 = trans12_dpat(d1p1)
  val s2e2 = trans12_sexp_ci(s1e2)
} (* end of [D1Panno] *)
//
|
_(*rest-of-d1pat*) => d2pat_none1(d1p0)
//
(*
|
_(*rest-of-D1PAT*) =>
(
exit_errmsg
(1, "auxmain: yet-to-be-implemented!\n")
)
*)
) (* case *) // end of [auxmain(d1p0)]

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_dpid
  (d1p0) =
(
auxid0_d1pat(d1p0))

(* ****** ****** *)

implement
trans12_dpat
  (d1p0) =
(
  auxdpat(auxmain(d1p0))
) where
{
//
val
loc0 = d1p0.loc((*void*))
//
(*
val () =
println!
("trans12_dpat: loc0 = ", loc0)
val () =
println!
("trans12_dpat: d1p0 = ", d1p0)
*)
//
fun
auxdpat
( d2p0
: d2pat): d2pat =
(
case+
d2p0.node() of
|
D2Psym0
(d1p0, _) =>
auxid0_d2var
( d1p0
, dexpid_sym(tok)) where
{
  val-
  D1Pid0(tok) = d1p0.node()
}
| _(* non-D2Psym0 *) => d2p0
) (* case *) // end-of-[auxdpat]
//
} (*where*)//end-of(trans12_dpat)

end // end of [local]

(* ****** ****** *)

implement
trans12_dpatlst
  (d1ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d1pat><d2pat>
  (d1ps) where
{
implement
list_map$fopr<d1pat><d2pat>(d1p) = trans12_dpat(d1p)
}
} (* end of [trans12_dpatlst] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxdyn
( f1a0
: f1arg): f2arg = let
//
val-
F1ARGsome_dyn
  (d1p0) = f1a0.node()
//
var
npf: int = (~1)
//
val
d2ps =
(
case+
d1p0.node() of
|
D1Pl1st
( d1ps ) =>
auxd1ps(d1ps)
|
D1Pl2st
(xs1, xs2) =>
(
npf :=
length(xs1); ys1 + ys2
) where
{
val ys1 = auxd1ps(xs1)
val ys2 = auxd1ps(xs2)
}
| _(*non-D1Plist*) =>
(
  list_sing(auxd1p0(d1p0))
)
) : d2patlst // end of [val]
//
val () =
the_trans12_add_patlst(d2ps)
//
in
//
f2arg_make_node
( f1a0.loc()
, F2ARGsome_dyn(npf, d2ps))
//
end where
{
val auxd1p0 = trans12_dpat
val auxd1ps = trans12_dpatlst
} (*where*) // end of [auxdyn]

(* ****** ****** *)

fun
auxmet
( f1a0
: f1arg): f2arg = let
//
val-
F1ARGsome_met
  (s1es) = f1a0.node((*void*))
//
val s2es = trans12_sexplst(s1es)
//
in
//
f2arg_make_node
(f1a0.loc(), F2ARGsome_met(s2es))
//
end // end of [auxmet]

(* ****** ****** *)

fun
auxsta
( f1a0
: f1arg): f2arg = let
//
val-
F1ARGsome_sta
  (s1qs) = f1a0.node()
//
(*
val () =
println!
("auxsta: s1qs = ", s1qs)
*)
//
var s2vs_
  : s2varlst_vt =
  list_vt_nil(*void*)
var s2ps_
  : s2varlst_vt =
  list_vt_nil(*void*)
//
val ((*void*)) =
trans12_squalst(s1qs, s2vs_, s2ps_)
//
val s2vs =
  list_vt2t(list_vt_reverse(s2vs_))
val s2ps =
  list_vt2t(list_vt_reverse(s2ps_))
//
in
//
f2arg_make_node
(f1a0.loc(), F2ARGsome_sta(s2vs, s2ps))
//
end (* let *) // end of [auxsta]

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_farg
  (f1a0) =
(
//
case+
f1a0.node() of
| F1ARGsome_dyn _ => auxdyn(f1a0)
| F1ARGsome_sta _ => auxsta(f1a0)
| F1ARGsome_met _ => auxmet(f1a0)
//
) (* end of [trans12_farg] *)

implement
trans12_farglst
  (f1as) =
list_vt2t
(
list_map<f1arg><f2arg>(f1as)
) where
{
implement
list_map$fopr<
f1arg><f2arg>(f1a) = trans12_farg(f1a)
} (*where*) // end of [trans12_farglst]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
extern
fun
trans12_farglst_nex1
( f1as
: f1arglst, nex: int): f2arglst
//
extern
fun
trans12_farglst_wtp0
( f1as
: f1arglst, wtp: s2exp): f2arglst
//
(* ****** ****** *)
//
extern
fun
trans12_farglst_nex2
( f2as: f2arglst
, nex: int, res: effs2expopt): f2arglst
//
(* ****** ****** *)

local

(* ****** ****** *)
overload =
with
$SYM.eq_symbol_symbol
(* ****** ****** *)
fun
isAXCG
( sann
: s1exp): bool =
(
case+
sann.node() of
|
S1Eapp2
(s1e1, s1e2, s1e3) =>
(
case+
s1e1.node() of
| S1Eid0(sid) =>
  sid = $SYM.AXCG_symbol
| _(*non-S1Eid0*) => false
)
| _ (* S1Eapp2 *) => false
)
(* ****** ****** *)

fun
auxdyn
( f1a0
: f1arg): f2arg = let
//
val-
F1ARGsome_dyn
  (d1p0) = f1a0.node()
//
var
npf: int = (~1)
//
val
d2ps =
(
case+
d1p0.node() of
|
D1Pl1st
( d1ps ) =>
auxd1ps(d1ps)
|
D1Pl2st
(xs1, xs2) =>
(
npf :=
length(xs1); ys1 + ys2
) where
{
val ys1 = auxd1ps(xs1)
val ys2 = auxd1ps(xs2)
}
| _(*non-D1Plist*) =>
(
  list_sing(auxd1p0(d1p0))
)
) : d2patlst // end of [val]
//
val () =
the_trans12_add_patlst(d2ps)
//
in
//
f2arg_make_node
(f1a0.loc(), F2ARGsome_dyn(npf, d2ps))
//
end where
{
//
fun
auxd1p0
( d1p0
: d1pat): d2pat =
(
case+
d1p0.node() of
|
D1Panno
(d1p1, sann) =>
(
if
isAXCG(sann)
then
let
val-
S1Eapp2
( s1e1
, s1e2
, s1e3) = sann.node()
val
d2p1 = trans12_dpat(d1p1)
val
s2e2 = trans12_sexp_ci(s1e2)
in
d2pat_make_node
( d1p0.loc()
, D2Panno(d2p1, sann, s2e2))
end else trans12_dpat( d1p0 )
)
|
_(*non-D1Panno*) => trans12_dpat(d1p0)
)
//
and
auxd1ps
( d1ps
: d1patlst)
: d2patlst =
(
case+ d1ps of
|
list_nil() => list_nil()
|
list_cons(d1p1, d1ps) =>
list_cons(auxd1p0(d1p1), auxd1ps(d1ps))
)
//
} (*where*) // end of [auxdyn]

in(*in-of-local*)

implement
trans12_farglst_nex1
( f1as, nex ) =
(
if
(nex > 0)
then auxf1as(f1as)
else trans12_farglst(f1as)) where
{
fun
auxf1as
( f1as
: f1arglst): f2arglst =
(
case+ f1as of
|
list_nil() => list_nil()
|
list_cons
(f1a1, f1as) =>
(
list_cons
(f2a1, auxf1as(f1as))) where
{
val f2a1 =
(
case+
f1a1.node() of
|
F1ARGsome_dyn _ =>
(
case+ f1as of
|
list_nil() => auxdyn(f1a1)
|
list_cons _ => trans12_farg(f1a1)
)
|
F1ARGsome_sta _ => trans12_farg(f1a1)
|
F1ARGsome_met _ => trans12_farg(f1a1)
) : f2arg // end of val [f2a1]
}
) (* end of [list_cons] *)
//
} (*where*)//end-of[trans12_farglst_nex1]

end // end of [local]

(* ****** ****** *)
//
implement
trans12_farglst_wtp0
  (f1as, s2f0) =
(
trans12_farglst(f1as)) where
{
// (*
val () =
println!
("trans12_farglst_wtp0: f1as = ", f1as)
val () =
println!
("trans12_farglst_wtp0: s2f0 = ", s2f0)
// *)
} (*where*)//end-of[trans12_farglst_wtp0]
//
(* ****** ****** *)


local

(* ****** ****** *)
overload =
with
$SYM.eq_symbol_symbol
(* ****** ****** *)
fun
isAXCG
( sann
: s1exp): bool =
(
case+
sann.node() of
|
S1Eapp2
(s1e1, s1e2, s1e3) =>
(
case+
s1e1.node() of
| S1Eid0(sid) =>
  sid = $SYM.AXCG_symbol
| _(*non-S1Eid0*) => false
)
| _ (* S1Eapp2 *) => false
)
(* ****** ****** *)

fun
auxd2p0
( d2p0
: d2pat): d2pat =
(
case+
d2p0.node() of
|
D2Panno
( d2p1
, sann, s2e2) =>
(
if
isAXCG(sann)
then
let
val-
S1Eapp2
( s1e1
, s1e2
, s1e3) = sann.node()
val
s2e3 = trans12_sexp_ci(s1e3)
val
satx = s2exp_atx(s2e2, s2e3)
in
d2pat_make_node
( d2p0.loc()
, D2Panno(d2p1, sann, satx))
end else d2p0 // end of [if]
)
| _(* non-D2Panno *) => d2p0
) (*case*) // end of [auxd2p0]

fun
auxd2ps
( d2ps
: d2patlst): d2patlst =
(
case+ d2ps of
|
list_nil() => list_nil()
|
list_cons
(d2p0, d2ps) =>
list_cons
(d2p0, d2ps) where
{
  val d2p0 = auxd2p0(d2p0)
  val d2ps = auxd2ps(d2ps)
}
) (*case*) // end of [auxd2ps]

(* ****** ****** *)

fun
auxf2a0
( f2as
: f2arglst)
: Option_vt(f2arg) =
(
case+ f2as of
|
list_nil() => None_vt()
|
list_cons(f2a1, f2as) =>
(
case+ f2as of
|
list_nil() =>
(
case+
f2a1.node() of
|
F2ARGsome_dyn
( npf1, d2ps ) =>
let
val d2ps = auxd2ps(d2ps)
in
Some_vt
(
f2arg_make_node
( f2a1.loc()
, F2ARGsome_dyn(npf1, d2ps))
)
end
|
_(*non-dyn*) => None_vt(*void*)
) (* end of [list_nil] *)
|
list_cons _ => auxf2a0(f2as)
)
) where
{
val () =
println!("auxf2a0: f2as = ", f2as)
} (*where*) (* end of [auxf2a0] *)

(* ****** ****** *)

fun
auxf2as
( f2as
: f2arglst
, f2a0: f2arg): f2arglst =
(
case+ f2as of
|
list_nil() =>
list_nil()
|
list_cons
(f2a1, f2as) =>
(
case+ f2as of
| list_nil() =>
  list_sing(f2a0)
| list_cons _ =>
  list_cons
  (f2a1, auxf2as(f2as, f2a0))
)
) (*case*) // end of [auxf2as]

(* ****** ****** *)

fun
auxmain
( f2as: f2arglst
, nex1: int
, res2: effs2expopt): f2arglst =
let
val () =
auxnex1
(nex1, sres) where
{
val-
EFFS2EXPsome(sres) = res2
fun
auxnex1
( nex1: int
, sres: s2exp): void =
if
(nex1 > 0)
then let
val-
S2Eexi
( s2vs
, s2ps
, sres) = sres.node()
val () =
the_sexpenv_add_s2vs(s2vs)
in
  auxnex1( nex1 - 1, sres )
end
}
//
in
case+
auxf2a0(f2as) of
| ~
None_vt() => f2as
| ~
Some_vt(f2a0) => auxf2as(f2as, f2a0)
end (*let*) // end of [auxmain]

(* ****** ****** *)

in

implement
trans12_farglst_nex2
(f2as, nex1, res2) =
if
(nex1 <= 0)
then f2as
else f2as where
{
val (pf0|()) =
the_sexpenv_pushnil()
//
val f2as =
auxmain(f2as, nex1, res2)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
} (*where*) // [trans12_farglst_nex2]

end // end of [local]

(* ****** ****** *)
//
implement
trans12_stqua
  (st1q) =
(
case+ st1q of
ST1QUAsome
(loc0, s1qs) =>
(
ST2QUAsome
(loc0, s2vs, s2ps)
) where
{
//
var s2vs_
  : s2varlst_vt =
  list_vt_nil(*void*)
var s2ps_
  : s2varlst_vt =
  list_vt_nil(*void*)
val ((*void*)) =
trans12_squalst(s1qs, s2vs_, s2ps_)
//
val s2vs =
  list_vt2t(list_vt_reverse(s2vs_))
val s2ps =
  list_vt2t(list_vt_reverse(s2ps_))
}
) (* end of [ST1QUAsome] *)
//
(* ****** ****** *)

implement
trans12_stinv
  (tinv) = let
//
val () =
println!
("trans12_stinv: tinv = ", tinv)
//
fun
auxd1ts
( d1ts
: d1typlst): d2typlst =
(
case+ d1ts of
|
list_nil() =>
list_nil()
|
list_cons(d1t1, d1ts) =>
let
val
d2t1 = trans12_dtyp(d1t1)
in
  list_cons(d2t1, auxd1ts(d1ts))
end
)
//
fun
auxstqs
( stqs
: st1qualst): st2qualst =
(
case+ stqs of
|
list_nil() =>
list_nil()
|
list_cons(st1q, stqs) =>
let
val
st2q = trans12_stqua(st1q)
in
  list_cons(st2q, auxstqs(stqs))
end
)
//
in
case+ tinv of
ST1INVsome
(loc0, stqs, d1ts) =>
ST2INVsome
(loc0, stqs, d2ts) where
{
val (pf0|()) =
the_sexpenv_pushnil()
//
val stqs = auxstqs(stqs)
val d2ts = auxd1ts(d1ts)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
} (* end of [ST1INVsome] *)
//
end // end of [trans12_stinv]

(* ****** ****** *)

local

(* ****** ****** *)

fun
isbtf
( tok
: token): bool =
(
case+
tok.node() of
| T_IDENT_alp(s0) =>
  (s0="true" || s0="false")
| _(*non-IDENT_alp*) => false
)

(* ****** ****** *)

fun
istop
( tok
: token): bool =
(
case+
tok.node() of
| T_IDENT_alp(s0) => (s0="_")
| _(*non-IDENT_alp*) => false
)

(* ****** ****** *)

fun
auxid0
( d1e0
: d1exp): d2exp = let
//
val-
D1Eid0
( tok ) = d1e0.node()
//
val
sym =
dexpid_sym(tok)
val
opt =
the_gmacenv_find(sym)
//
in
//
case- opt of
|
~None_vt() =>
(
  auxid0_d1exp(d1e0)
)
|
~Some_vt(g1m0) =>
let
val
loc0 = d1e0.loc()
val
g1m0 =
trans11_g1mac(g1m0)
in
  trg1mac_dexp(loc0, g1m0)
end
//
end // end of [auxid0]

and
auxid0_d1exp
( d1e0
: d1exp): d2exp = let
//
val-
D1Eid0(tok) = d1e0.node()
//
val
sym = dexpid_sym(tok)
val
opt = the_dexpenv_find(sym)
//
in//let
//
case+ opt of
|
~None_vt() =>
(
ifcase
| isbtf(tok) =>
  (
    d2exp_btf(loc0, tok)
  ) where
  {
    val loc0 = d1e0.loc()
  }
| istop(tok) =>
  (
    d2exp_top(loc0, tok)
  ) where
  {
    val loc0 = d1e0.loc()
  }
| _(* else *) => d2exp_none1(d1e0)
)
|
~Some_vt
 ( d2i ) => auxid0_d2itm(d1e0, d2i)
end // end of [auxid0]

and
auxid0_d2itm
( d1e0
: d1exp
, d2i0
: d2itm): d2exp =
(
case- d2i0 of
| D2ITMvar(x0) =>
  auxid0_d2var(d1e0, x0)
| D2ITMcon(xs) =>
  auxid0_d2con(d1e0, xs)
| D2ITMcst(xs) =>
  auxid0_d2cst(d1e0, xs)
| D2ITMsym(_, dpis) =>
  auxid0_d2sym(d1e0, dpis)
) (* end of [auxid0_d2itm] *)
and
auxid0_d2var
( d1e0
: d1exp
, d2v0
: d2var): d2exp =
(
  d2exp_var(d1e0.loc(), d2v0)
)
and
auxid0_d2con
( d1e0
: d1exp
, d2cs
: d2conlst): d2exp =
(
//
if
list_isnot_sing(d2cs)
then
d2exp_con2(loc0, d2cs)
else
let
val
d2c0 = d2cs.head()
in
my_d2exp_con1(loc0, d2c0)
end // end of [if]
//
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxid0_con] *)
and
auxid0_d2cst
( d1e0
: d1exp
, d2cs
: d2cstlst): d2exp =
(
//
if
list_isnot_sing(d2cs)
then
d2exp_cst2(loc0, d2cs)
else
d2exp_cst1(loc0, d2cs.head())
//
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxid0_cst] *)
and
auxid0_d2sym
( d1e0
: d1exp
, dpis
: d2pitmlst): d2exp =
(
  d2exp_sym0(loc0, d1e0, dpis)
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxid0_d2sym] *)
//
(* ****** ****** *)

fun
auxint
( d1e0
: d1exp): d2exp = let
//
val loc0 = d1e0.loc()
//
val-
D1Eint(tok) = d1e0.node()
//
in
  d2exp_int(loc0, tok)
end // end of [auxint]

fun
auxchr
( d1e0
: d1exp): d2exp = let
//
val loc0 = d1e0.loc()
//
val-
D1Echr(tok) = d1e0.node()
//
in
  d2exp_chr(loc0, tok)
end // end of [auxchr]

fun
auxflt
( d1e0
: d1exp): d2exp = let
//
val loc0 = d1e0.loc()
//
val-
D1Eflt(tok) = d1e0.node()
//
in
  d2exp_flt(loc0, tok)
end // end of [auxflt]

fun
auxstr
( d1e0
: d1exp): d2exp =
(
d2exp_str(loc0, tok)
) where
{
//
val loc0 = d1e0.loc()
val-
D1Estr(tok) = d1e0.node()
//
}(*where*)//end-of(auxstr)

(* ****** ****** *)

fun
auxbs1
( d1e0
: d1exp): d2exp =
(
trans12_dexp(d1e1)
) where
{
//
val-
D1Ebs1(d1e1) = d1e0.node()
//
}(*where*)//end-of(auxbs1)

(* ****** ****** *)

local
//
vtypedef
tq2argopt =
Option_vt(tq2arg)
//
fun
auxtqa0
( d2e0
: d2exp
)
: tq2argopt =
(
case+
d2e0.node() of
|
D2Edap0(d2e1) => auxtqa0(d2e1)
|
_(*non-D2Edap0*) => auxtqa0_dn(d2e0, 0)
)
//
and
auxtqa0_up
( tqas
: tq2arglst
, i0: int
)
: tq2argopt =
(
case+ tqas of
|
list_nil() =>
(
  None_vt()
)
|
list_cons(tqa0, tqas) =>
(
if i0 <= 0
then Some_vt(tqa0)
else auxtqa0_up(tqas, i0-1)
)
) (* end of [auxtqa0_up] *)
//
and
auxtqa0_dn
( d2e0
: d2exp
, i0: int
) : tq2argopt =
(
case+
d2e0.node() of
//
|
D2Ecst1(d2c1) =>
(
  auxtqa0_up(tqas, i0)
) where
{
  val tqas = d2c1.tqas()
(*
  val (  ) =
  println!("auxtqa0_dn: d2c1 = ", d2c1)
  val (  ) =
  println!("auxtqa0_dn: tqas = ", tqas)
*)
}
//
|
D2Econ1(d2c1) =>
(
  auxtqa0_up(tqas, i0)
) where
{
  val tqas = d2c1.tqas()
(*
  val (  ) =
  println!("auxtqa0_dn: d2c1 = ", d2c1)
  val (  ) =
  println!("auxtqa0_dn: tqas = ", tqas)
*)
}
//
|
D2Etapp(d2e1, _) =>
(
  auxtqa0_dn(d2e1, i0+1) )
//
|
_ (* otherwise *) => None_vt() where
{
(*
  val (  ) =
  println!("auxtqa0_dn: else = ", d2e0)
*)
}
//
) (* end of [auxtqa0_dn] *)

in(*in-of-local*)

fun
auxtapp_s2es
( d2e1
: d2exp
, s2es
: s2explst
)
: s2explst =
let
//
val
loc0 = d2e1.loc()
val
opt0 = auxtqa0(d2e1)
//
in
//
case+ opt0 of
//
|
~None_vt() => 
(
  auxover(s2es)
) where
{
fun
auxover
( s2es
: s2explst
)
: s2explst =
(
case+ s2es of
|
list_nil() =>
list_nil()
|
list_cons
(s2e1, s2es) =>
(
  list_cons
  (s2e1, auxover(s2es))
) where
{
val
s2e1 = s2exp_none2(loc0, s2e1)
}
) (* end of [auxover] *)
} (* end of [None_vt] *)
//
|
~Some_vt(tqa0) =>
(
  auxstck(s2vs, s2es)
) where
{
//
val s2vs = tqa0.s2vs()
//
fun
auxstck
( s2vs
: s2varlst
, s2es
: s2explst): s2explst =
(
case s2vs of
|
list_nil() =>
(
case+ s2es of
|
list_nil() =>
list_nil()
|
list_cons(s2e1, s2es) =>
let
val
s2e1 = s2exp_none2(loc0, s2e1)
in
list_cons(s2e1, auxstck(s2vs, s2es))
end
) (* end of [list_nil] *)
|
list_cons(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
list_sing(s2e1) where
{
val k0 = 2 (*many*)
val s2e1 = s2exp_any(k0)
}
|
list_cons
(s2e1, s2es) =>
let
//
val
s2t0 = s2v0.sort()
val
s2e1 =
s2exp_tqacast(loc0, s2e1, s2t0)
in
list_cons(s2e1, auxstck(s2vs, s2es))
end
) (* end of [list_cons] *)
) (* end of [ auxstck ] *)
} (* end of [ Some_vt ] *)
//
end // end of [auxtapp_s2es]

end // end of [local]

(* ****** ****** *)

fun
auxapp1
( d1e0
: d1exp): d2exp = let
//
val-
D1Eapp1
( d1e1
, d1e2) = d1e0.node()
//
fun
isAMP
(d1e: d1exp): bool =
(
case+
d1e.node() of
| D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "&")
|
_(*non-T_IDENT_sym*) => false
)
|
_(* non-D1Eid0-d1exp *) => false
)
fun
isBANG
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "!")
|
_(* non-T_IDENT_sym *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
(*
fun
isFLAT
(d1e: d1exp): bool =
(
case+
d1e.node() of
| D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym(x) => (x = "@")
|
_(*non-T_IDENT_sym*) => false
)
|
_(* non-D1Eid0-d1exp *) => false
)
*)
//
fun
isADDR
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$addr")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
fun
isEVAL
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$eval")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
fun
isFOLD
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$fold")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
fun
isFREE
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$free")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
fun
isLAZY
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$lazy")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
fun
isLLAZY
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$llazy")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
fun
isRAISE
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_dlr(x) => (x = "$raise")
|
_(* non-T_IDENT_dlr *) => (false)
)
|
_(* non-D1Eid0-d1exp *) => (false)
)
//
in
//
ifcase
//
| isAMP(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eaddr(d2e2))
  end
| isBANG(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eeval(d2e2))
  end
//
(*
| isFLAT(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eflat(d2e2))
  end
*)
//
| isADDR(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eaddr(d2e2))
  end
| isEVAL(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eeval(d2e2))
  end
| isFOLD(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Efold(d2e2))
  end
| isFREE(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Efree(d2e2))
  end
//
| isLAZY(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Elazy(d2e2))
  end // end of [isLAZY]
| isLLAZY(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    case+
    d2e2.node() of
    |
    D2Eseqn(d2es, d2e2) =>
    d2exp_make_node
    (d1e0.loc(), D2Ellazy(d2e2, d2es))
    |
    _(*non-D2Eseqn*) =>
    d2exp_make_node
    (d1e0.loc(), D2Ellazy(d2e2, list_nil))
  end // end of [isLLAZY]
//
| isRAISE(d1e1) =>
  let
    val d2e2 =
    trans12_dexp(d1e2)
  in
    d2exp_make_node
    (d1e0.loc(), D2Eraise(d2e2))
  end
//
| _ (* else *) =>
(
case+
d1e2.node() of
//
|
D1Esqarg(s1es) =>
let
  val
  loc0 = d1e0.loc()
  val d2e1 =
  trans12_dexp(d1e1)
  val s2es =
  trans12_sexplst(s1es)
in
  my_d2exp_sapp(loc0, d2e1, s2es)
end // end of [D1Esqarg]
//
|
D1Etqarg(s1es) =>
let
//
  val
  loc0 = d1e0.loc()
//
  val d2e1 =
  trans12_dexp(d1e1)
  val s2es =
  trans12_sexplst(s1es)
//
  val s2es =
  auxtapp_s2es(d2e1, s2es)
//
in
  my_d2exp_tapp(loc0, d2e1, s2es)
end // end of [D1Etqarg]
//
|
_(*rest-of-d1exp*) => auxapp10(d1e0)
)
//
end // end of [auxapp1]

and
auxapp10
( d1e0
: d1exp): d2exp = let
//
val-
D1Eapp1
( d1e1
, d1e2) = d1e0.node()
//
val d2e1 = trans12_dexp(d1e1)
//
in
case+
d2e1.node() of
| D2Eg1mac _ =>
  auxapp11(d1e0, d2e1, d1e2)
| _(*non-D2Eg1mac*) =>
  auxapp12(d1e0, d2e1, d1e2)
end

and
auxapp11
( d1e0: d1exp
, d2e1: d2exp
, d1e2: d1exp): d2exp =
let
//
val
g1f0 =
(
case-
d2e1.node() of
|
D2Eg1mac(g1f0) => g1f0
) : g1mac // end-of-val
val
g1ms =
(
case+
d1e2.node() of
|
D1El1st(d1es) =>
auxd1es(d1es)
|
D1El2st(d1es1, d1es2) =>
(
  g1ms1 + g1ms2
) where
{
val g1ms1 = auxd1es(d1es1)
val g1ms2 = auxd1es(d1es2)
}
|
_(* non-D2Elist *) =>
let
val g1m2 =
auxd1e0(d1e2) in list_sing(g1m2)
end
) : g1maclst // end of [val]
//
in
trg1mac_dexp
( d1e0.loc()
, trans11_g1mac_apps(g1f0, g1ms))
end where
{
fun
auxd1e0
( x0
: d1exp )
: g1mac = trd1exp_gmac(x0)
fun
auxd1es
( xs
: d1explst )
: g1maclst =
list_vt2t
(list_map<d1exp><g1mac>(xs)) where
{
implement
list_map$fopr<d1exp><g1mac>(x0) = auxd1e0(x0)
}
} (*where*) // end of [auxapp11]

and
auxapp12
( d1e0: d1exp
, d2e1: d2exp
, d1e2: d1exp): d2exp =
let
//
val npf2 =
(
case+
d1e2.node() of
| D1El2st(d1es, _) =>
  list_length<d1exp>(d1es)
| _(* non-D2Elist *) => ~1): int
//
val d2es =
(
case+
d1e2.node() of
|
D1El1st(d1es) =>
trans12_dexplst(d1es)
|
D1El2st(d1es1, d1es2) =>
(
  d2es1 + d2es2
) where
{
  val
  d2es1 = trans12_dexplst(d1es1)
  val
  d2es2 = trans12_dexplst(d1es2)
}
|
_(* non-D2Elist *) =>
let
  val d2e2 =
  trans12_dexp(d1e2) in list_sing(d2e2)
end
) : d2explst // end of [val]
//
in
//
my_d2exp_dapp(d1e0.loc(), d2e1, npf2, d2es)
//
end (*let*) // end of [auxapp12]

(* ****** ****** *)

fun
auxapp2
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
//
val-
D1Eapp2
( d1e1
, d1e2
, d1e3) = d1e0.node()
//
in
//
ifcase
|
isASSGN(d1e1) =>
let
//
val
d2e2 = trans12_dexp(d1e2)
val
d2e3 = trans12_dexp(d1e3)
//
(*
val () =
println!
("auxapp2: d2e2 = ", d2e2)
val () =
println!
("auxapp2: d2e3 = ", d2e3)
*)
//
in
//
case+
d2e2.node() of
|
D2Edapp
( d2f0
, npf1, darg) =>
(
case+
d2f0.node() of
|
D2Ebrack
(d2ps, d2es) =>
let
//
// HX:
// A[idx] := itm
//
val d2es =
list_vt2t
(
list_extend(d2es, d2e3)
)
val d2f0 =
d2exp_make_node
( loc0
, D2Ebrack(d2ps, d2es) )
in
d2exp_make_node
( loc0
, D2Edapp(d2f0, npf1, darg) )
end // end of [D2Ebrack]
|
_(*non-D2Ebrack*) =>
  d2exp_make_node
  (loc0, D2Eassgn(d2e2, d2e3))
)
|
_(* non-D2Edapp *) =>
  d2exp_make_node
  (loc0, D2Eassgn(d2e2, d2e3))
//
end//isASSGN
//
| _ (* else *) =>
let
val d2e1 = trans12_dexp(d1e1)
val d2e2 = trans12_dexp(d1e2)
val d2e3 = trans12_dexp(d1e3)
in
d2exp_app2(loc0, d2e1, d2e2, d2e3)
end // end of [non-assignment]
//
end where
{
  fun
  isASSGN
  (d1e: d1exp): bool =
  (
    case+
    d1e.node() of
    |
    D1Eid0(tok) =>
    (
    case+ tok.node() of
    |
    T_IDENT_sym
      ( sym ) => (sym = ":=")
    | _(*non-T_IDENT*) => false
    )
    | _ (* non-D1Eid0 *) => false
  ) (* end of [isASSGN] *)
} (* where *)  // end of [auxapp2]

(* ****** ****** *)

fun
auxlet
( d1e0
: d1exp): d2exp = let
//
val-
D1Elet
( d1cs
, d1es) = d1e0.node()
//
val
(pf0|()) =
the_trans12_pushnil()
//
val d2cs =
  trans12_declist(d1cs)
val d2e2 =
let
//
val
loc2 =
let
val-
list_cons
(d1e0, d1es) = d1es
in
  auxlst1(d1e0.loc(), d1es)
end // end of [val]
//
in
  trans12_dexpseq(loc2, d1es)
end where
{
fun
auxlst1
( loc0: loc_t
, d1es: d1explst): loc_t =
(
case+ d1es of
| list_nil() => loc0
| list_cons(d1e1, d1es) =>
  auxlst2(loc0, d1e1, d1es)
)
and
auxlst2
( loc0: loc_t
, d1e1: d1exp
, d1es: d1explst): loc_t =
(
case+ d1es of
| list_nil() =>
  (loc0 + d1e1.loc())
| list_cons(d1e1, d1es) =>
  auxlst2(loc0, d1e1, d1es)
)
} (* end of [where] *)
//
val
((*void*)) =
the_trans12_popfree(pf0|(*void*))
//
in
  d2exp_let(d1e0.loc(), d2cs, d2e2)
end // end of [auxlet]

(* ****** ****** *)

fun
auxwhere
( d1e0
: d1exp): d2exp = let
//
val-
D1Ewhere
( d1e1
, d1cs) = d1e0.node()
//
val
(pf0|()) =
the_trans12_pushnil()
//
val d2cs =
  trans12_declist(d1cs)
//
val d2e1 = trans12_dexp(d1e1)
//
val
((*void*)) =
the_trans12_popfree(pf0|(*void*))
//
in
  d2exp_where(d1e0.loc(), d2e1, d2cs)
end // end of [auxwhere]

(* ****** ****** *)

fun
auxl1st
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
//
val-
D1El1st(d1es) = d1e0.node()
//
in
//
if
list_is_sing(d1es)
then
trans12_dexp(d1es.head())
else
(
d2exp_trcd1
(loc0, knd, npf, d2es)
) where
{
  val knd = 0
  val npf = ~1
  val d2es = trans12_dexplst(d1es)
}
//
end // end of [auxl1st]

fun
auxl2st
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
//
val-
D1El2st
(xs1, xs2) = d1e0.node()
//
in
(
d2exp_trcd1
(loc0, knd, npf, ys1 + ys2)
) where {
  val knd = 0
  val npf = list_length(xs1)
  val ys1 = trans12_dexplst(xs1)
  val ys2 = trans12_dexplst(xs2)
}
end // end of [auxl2st]

(* ****** ****** *)
//
fun
auxnone
( d1e0
: d1exp): d2exp =
(
  d2exp_none0(d1e0.loc())
)
//
(* ****** ****** *)

fun
auxseqn
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
val-
D1Eseqn
(d1es1, d1es2) = d1e0.node()
//
in
  trans12_dexpseq(loc0, d1es1+d1es2)
end // end of [auxseqn]

(* ****** ****** *)
//
fun
aux_trcd11
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
val-
D1Etrcd1
(tok, d1es) = d1e0.node()
//
val knd =
let
val-
T_TRCD1(knd) = tok.node() in knd
end
val npf = ~1
val d2es = trans12_dexplst(d1es)
//
in
  d2exp_trcd1(loc0, knd, npf, d2es)
end // end of [aux_trcd11]
//
fun
aux_trcd12
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
//
val-
D1Etrcd1
( tok
, xs1, xs2) = d1e0.node()
//
val knd =
let
val-
T_TRCD1(knd) = tok.node() in knd
end
val npf = list_length(xs1)
//
val d2es =
(
  list_append(ys1, ys2)
) where
{
  val ys1 = trans12_dexplst(xs1)
  val ys2 = trans12_dexplst(xs2)
} (* end of [val] *)
//
in
  d2exp_trcd1(loc0, knd, npf, d2es)
end // end of [aux_trcd12]
//
(* ****** ****** *)
//
fun
aux_brack
( d1e0
: d1exp): d2exp = let
val
loc0 = d1e0.loc()
val-
D1Ebrack
( d1es ) = d1e0.node()
//
val
dpis =
let
val sym =
$SYM.LRBRACK_symbol
val
opt =
the_dexpenv_find(sym)
in
//
case+ opt of
| ~
None_vt() =>
(
  list_nil()
)
| ~
Some_vt(d2i) =>
(
case+ d2i of
|
D2ITMsym
(_, dpis) => dpis
| _ => list_nil(*void*)
) (* Some_vt *)
end : d2pitmlst // end of [val]
//
val d2es =
trans12_dexplst(d1es)
//
in
  d2exp_make_node
  (loc0, D2Ebrack(dpis, d2es))
end // end of [aux_brack]
//
(* ****** ****** *)
//
fun
aux_dtsel
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
val-
D1Edtsel
(lab, arg) = d1e0.node()
//
val
dpis =
let
//
val
opt =
label_get_sym(lab)
//
fun
auxsym
( sym
: sym_t): d2pitmlst =
let
//
val
opt =
the_dexpenv_find(sym)
//
in//let
//
case+ opt of
| ~
None_vt() =>
(
  list_nil()
)
| ~
Some_vt(d2i) =>
(
case+ d2i of
|
D2ITMsym(_, dpis) => dpis
|
_(*non-D2ITMsym*) => list_nil()
) (* Some_vt *)
//
end // end of [auxsym]
//
in (*in-of-let*)
//
case+ opt of
| ~None_vt() => list_nil()
| ~Some_vt(sym) => auxsym(sym)
//
end : d2pitmlst
//
var npf: int = ~1
//
val arg =
(
case+ arg of
|
None() =>
None(*void*)
|
Some(d1e) =>
(
  Some(d2es)
) where
{
val d2es =
(
case+
d1e.node() of
|
D1El1st(d1es1) =>
(
  trans12_dexplst(d1es1)
)
|
D1El2st
(d1es1, d1es2) =>
let
  val () =
  (npf := length(d1es1))
  val d2es1 =
    trans12_dexplst(d1es1)
  val d2es2 =
    trans12_dexplst(d1es2)
in
  list_append(d2es1, d2es2)
end
|
_(*non-D1Elist*) =>
list_sing(trans12_dexp(d1e))
) : d2explst // end of [val]
}
) : d2explstopt // end of [val]
//
in
d2exp_make_node
(loc0, D2Edtsel(lab, dpis, npf, arg))
end // end of [aux_dtsel]
//
(* ****** ****** *)

fun
aux_qual0
( d1e0
: d1exp): d2exp = let
//
val
loc0 = d1e0.loc()
val-
D1Equal
( tok0
, d1e1) = d1e0.node()
//
fun
auxqid
( qua: token
, d1e: d1exp): d2exp =
let
//
val-
D1Eid0(tok) = d1e.node()
//
val
sym = dexpid_sym(tok)
val
opt =
the_dexpenv_qfind(qua, sym)
//
in
case+ opt of
| ~
None_vt() => d2exp_none1(d1e0)
| ~
Some_vt(d2i) => auxqid_some(d2i)
end // end of [auxqid]
//
and
auxqid_some
( d2i0
: d2itm): d2exp =
(
case+ d2i0 of
| D2ITMvar(x0) => auxqid_d2var(x0)
| D2ITMcon(xs) => auxqid_d2con(xs)
| D2ITMcst(xs) => auxqid_d2cst(xs)
| D2ITMsym(_, dpis) => auxqid_d2sym(dpis)
) (* end of [auxqid_some] *)
and
auxqid_d2var
( d2v0
: d2var): d2exp =
(
  d2exp_var(d1e0.loc(), d2v0)
)
and
auxqid_d2con
( d2cs
: d2conlst): d2exp =
(
//
if
list_isnot_sing(d2cs)
then
d2exp_con2(loc0, d2cs)
else
let
val
d2c0 = d2cs.head()
in
my_d2exp_con1(loc0, d2c0)
end // end of [if]
//
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxqid_d2con] *)
and
auxqid_d2cst
( d2cs
: d2cstlst): d2exp =
(
//
if
list_isnot_sing(d2cs)
then
d2exp_cst2(loc0, d2cs)
else
d2exp_cst1(loc0, d2cs.head())
//
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxqid_d2cst] *)
and
auxqid_d2sym
( dpis
: d2pitmlst): d2exp =
(
  d2exp_sym0(loc0, d1e0, dpis)
) where
{
  val loc0 = d1e0.loc()
} (* end of [auxqid_d2sym] *)
//
in
//
case+
d1e1.node() of
| D1Eid0 _ => auxqid(tok0, d1e1)
| _(*else*) => d2exp_none1(d1e0)
//
end // end of [aux_qual0]

(* ****** ****** *)

fun
aux_exists
( d1e0
: d1exp): d2exp =
(
auxlst
( sqas
, trans12_dexp(d1e1))
) where
{
//
fun
auxlst
( sqas
: d1explst
, d2e1: d2exp): d2exp =
(
case+ sqas of
|
list_nil() => d2e1
|
list_cons
(s1qa, sqas) =>
let
val-
D1Esqarg
(s1es) = s1qa.node()
val
s2es =
trans12_sexplst(s1es)
val
loc1 =
s1qa.loc() + d2e1.loc()
val
d2e1 = auxlst(sqas, d2e1)
in
d2exp_make_node
(loc1, D2Eexist1(s2es, d2e1))
end (*let*) // [list_cons]
)
//
val-
D1Eexists
(tok0, sqas, d1e1) = d1e0.node()
//
} (*where*) // end of [aux_exists]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
trans12_deid
  (d1e0) =
(
auxid0_d1exp(d1e0)
)

(* ****** ****** *)

implement
trans12_dexp
  (d1e0) = let
//
val
loc0 = d1e0.loc((*void*))
//
(*
val () =
println!
("trans12_dexp: d1e0 = ", d1e0)
*)
//
in (* in-of-let *)
//
case-
d1e0.node() of
//
| D1Eid0 _ => auxid0(d1e0)
//
| D1Eint _ => auxint(d1e0)
| D1Echr _ => auxchr(d1e0)
| D1Eflt _ => auxflt(d1e0)
| D1Estr _ => auxstr(d1e0)
//
| D1Ebs1 _ => auxbs1(d1e0)
//
| D1Eapp1 _ => auxapp1(d1e0)
| D1Eapp2 _ => auxapp2(d1e0)
//
| D1Elet _ => auxlet(d1e0)
//
| D1Ewhere _ => auxwhere(d1e0)
//
| D1El1st _ => auxl1st(d1e0)
| D1El2st _ => auxl2st(d1e0)
//
| D1Enone _ => auxnone(d1e0)
| D1Eseqn _ => auxseqn(d1e0)
//
|
D1Etrcd1
(k0, xs) => aux_trcd11(d1e0)
|
D1Etrcd1
(k0, xs, ys) => aux_trcd12(d1e0)
//
| D1Ebrack _ => aux_brack(d1e0)
| D1Edtsel _ => aux_dtsel(d1e0)
//
| D1Eif0 // simple
  (d1e1, d1e2, opt3) =>
  (
    d2exp_make_node
    ( loc0
    , D2Eif0(d2e1, d2e2, opt3))
  ) where
  {
    val d2e1 = trans12_dexp(d1e1)
    val d2e2 = trans12_dexp(d1e2)
    val opt3 = trans12_dexpopt(opt3)
  } (* end of [D1Eif0] *)
| D1Eif1 // stinvar
  ( d1e1
  , d1e2, opt3, tinv) =>
  (
    d2exp_make_node
    ( loc0
    , D2Eif1
      (d2e1, d2e2, opt3, tinv) )
  ) where
  {
    val d2e1 = trans12_dexp(d1e1)
    val d2e2 = trans12_dexp(d1e2)
    val opt3 = trans12_dexpopt(opt3)
    val tinv = trans12_stinv(tinv)
  } (* end of [D1Eif0] *)
//
| D1Ecas0
  (tok, d1e1, dcls) =>
  (
    d2exp_make_node
    ( loc0
    , D2Ecas0(knd, d2e1, dcls))
  ) where
  {
    val knd =
    (
    case-
    tok.node() of T_CASE(knd) => knd
    ) : int // end of [val]
    val d2e1 = trans12_dexp(d1e1)
    val dcls = trans12_dclaulst(dcls)
  } (* end of [D1Ecas0] *)
| D1Ecas1
  ( tok
  , d1e1, dcls, tinv) =>
  (
    d2exp_make_node
    ( loc0
    , D2Ecas0(knd, d2e1, dcls))
  ) where
  {
    val knd =
    (
    case-
    tok.node() of T_CASE(knd) => knd
    ) : int // end of [val]
    val d2e1 = trans12_dexp(d1e1)
    val dcls = trans12_dclaulst(dcls)
    val tinv = trans12_stinv(tinv)
  } (* end of [D1Ecas1] *)
//
| D1Elam
  ( knd
  , f1as, tres, arrw, body) =>
  let
  val
  (pf0|()) =
  the_trans12_pushnil()
//
  val f2as =
    trans12_farglst(f1as)
  val tres =
    trans12_effsexpopt(tres)
  val body = trans12_dexp(body)
//
  val
  ((*void*)) =
  the_trans12_popfree(pf0|(*void*))
  in
    d2exp_make_node
    ( loc0
    , D2Elam(knd, f2as, tres, arrw, body))
  end
//
| D1Efix
  ( knd
  , fid, f1as, tres, arrw, body) =>
  let
//
  val
  (pf0|()) =
  the_trans12_pushnil()
//
  val
  d2v = d2var_new1(fid)
  val ((*void*)) =
  the_dexpenv_add_var(d2v)
//
  val f2as =
    trans12_farglst(f1as)
  val tres =
    trans12_effsexpopt(tres)
  val body = trans12_dexp(body)
//
  val
  ((*void*)) =
  the_trans12_popfree(pf0|(*void*))
  in
    d2exp_make_node
    ( loc0
    , D2Efix
      (knd, d2v, f2as, tres, arrw, body))
  end
//
| D1Etry0
  (tok, d1e1, d1cls) =>
  (
    d2exp_make_node
    ( loc0
    , D2Etry0(tok, d2e1, d2cls))
  ) where
  {
    val d2e1 = trans12_dexp(d1e1)
    val d2cls = trans12_dclaulst(d1cls)
  } (* end of [D1Etry0] *)
//
| D1Eanno
  (d1e1, s1e2) =>
  ( d2exp_make_node
    ( loc0
    , D2Eanno(d2e1, s1e2, s2e2))
  ) where
  {
    val d2e1 = trans12_dexp(d1e1)
    val s2e2 = trans12_sexp_ci(s1e2)
  } (* end of [D1Eanno] *)
//
| D1Equal
  (tok0, d1e1) => aux_qual0(d1e0)
//
| D1Eexists
  (tok0, sqas, d1e1) => aux_exists(d1e0)
//
| _(*rest-of-d1exp*) => d2exp_none1(d1e0)
//
(*
| _(*rest-of-D1EXP*) =>
  (
    exit_errmsg
    (1, "trans12_dexp: yet-to-be-implemented!\n")
  )
*)
//
end // end of [trans12_dexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d1e) => Some(trans12_dexp(d1e))
) (* end of [trans12_dexpopt] *)

implement
trans12_dexplst
  (d1es) =
list_vt2t(d2es) where
{
val
d2es =
list_map<d1exp><d2exp>
  (d1es) where
{
implement
list_map$fopr<d1exp><d2exp>(d1e) = trans12_dexp(d1e)
}
} (* end of [trans12_dexplst] *)

(* ****** ****** *)

implement
trans12_dexpseq
  (loc0, d1es) = let
//
(*
val () =
println!
("trans12_dexpseq: d1es = ", d1es)
*)
//
fun
auxlst1
( d1es
: d1explst )
: (d2explst, d2exp) =
(
case+ d1es of
| list_nil() =>
  let
  val d2e1 =
  d2exp_none0(loc0)
  in
    (list_nil(), d2e1)
  end
| list_cons
  (d1e1, d1es) =>
  auxlst2
  (d1e1, d1es, list_vt_nil())
)
and
auxlst2
( d1e1
: d1exp
, d1es
: d1explst
, d2es
: List0_vt(d2exp) )
: (d2explst, d2exp) =
(
case+ d1es of
| list_nil() =>
  (d2es, d2e1) where
  {
    val d2e1 =
    trans12_dexp(d1e1)
    val d2es =
    list_vt2t
    (list_vt_reverse(d2es))
  }
| list_cons
  (d1e2, d1es) =>
  auxlst2
  (d1e2, d1es, d2es) where
  {
    val d2e1 = 
    trans12_dexp(d1e1)
    val d2es =
    list_vt_cons(d2e1, d2es)
  }
) (* end of [auxlst2] *)
//
val (d2es, d2e1) = auxlst1(d1es)
//
in
//
case+ d2es of
|
list_nil _ => d2e1
|
list_cons _ =>
d2exp_make_node(loc0, D2Eseqn(d2es, d2e1))
//
end // end of [trans12_dexpseq]

(* ****** ****** *)

implement
trans12_dgua
  (d1g0) =
(
//
case+
d1g0.node() of
| D1GUAexp
  (d1e) =>
  d2gua_make_node
  ( d1g0.loc()
  , D2GUAexp(trans12_dexp(d1e))
  )
| D1GUAmat
  (d1e, d1p) =>
  d2gua_make_node
  ( d1g0.loc()
  , D2GUAmat(trans12_dexp(d1e), trans12_dpat(d1p))
  )
//
) (* end of [trans12_dgua] *)

(* ****** ****** *)

implement
trans12_dgualst
  (d1gs) =
  (d2gs) where
{
//
val d2gs = auxlst(d1gs)
//
} where
{
fun
auxlst
(d1gs: d1gualst): d2gualst =
(
case+ d1gs of
| list_nil() =>
  list_nil()
| list_cons
  (d1g0, d1gs) => let
     val d2g0 =
       trans12_dgua(d1g0)
     // end of [val]
     val ((*void*)) =
       the_trans12_add_gua(d2g0)
     // end of [val]
   in
     list_cons(d2g0, auxlst(d1gs))
   end
)
} (* end of [trans12_dgualst] *)

(* ****** ****** *)

implement
trans12_dclau
  (d1cl) =
(
//
case+
d1cl.node() of
| D1CLAUgpat
  (d1gp) =>
  let
    val d2gp =
    trans12_dgpat(d1gp)
  in
    d2clau_make_node
    (d1cl.loc(), D2CLAUpat(d2gp))
  end // end of [let]
| D1CLAUclau
  (d1gp, d1e0) =>
  let
//
    val d2gp =
    (
      trans12_dgpat(d1gp)
    )
//
    val
    (pf0|()) =
    the_trans12_pushnil()
    val () =
    (
      the_trans12_add_gpat(d2gp)
    )
    val d2e0 = trans12_dexp(d1e0)
    val
    ((*void*)) =
    the_trans12_popfree(pf0|(*void*))
//
  in
    d2clau_make_node
    (d1cl.loc(), D2CLAUexp(d2gp, d2e0))
  end // end of [let]
//
) (* end of [trans12_dclau] *)

(* ****** ****** *)

implement
trans12_dgpat
  (d1gp) = let
//
val
loc0 = d1gp.loc()
//
in (* in-of-let *)
//
case+
d1gp.node() of
|
D1GPATpat
(d1p) =>
d2gpat_make_node
( loc0
, D2GPATpat(trans12_dpat(d1p))
)
|
D1GPATgua
(d1p, d1gs) =>
let
val
d2p = trans12_dpat(d1p)
//
val
(pf0|()) =
the_trans12_pushnil()
val () =
(
  the_trans12_add_pat(d2p)
)
val
d2gs = trans12_dgualst(d1gs)
val
((*void*)) =
the_trans12_popfree(pf0|(*void*))
//
in
d2gpat_make_node(loc0, D2GPATgua(d2p, d2gs))
end
//
end (* end of [trans12_dgpat] *)

(* ****** ****** *)

implement
trans12_dclaulst
  (d1cls) =
list_vt2t(d2cls) where
{
val
d2cls =
list_map<d1clau><d2clau>
  (d1cls) where
{
implement
list_map$fopr<d1clau><d2clau>(d1cl) = trans12_dclau(d1cl)
}
} (* end of [trans12_dclaulst] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_define
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cdefine
( tok, gid0
, gmas, def1) = d1cl.node()
//
val
sym0 = gexpid_sym(gid0)
//
val
gmac =
trans11_g1mdef(gmas, def1)
//
val () =
the_gmacenv_add(sym0, gmac)
//
in
d2ecl_make_node
( loc0 , D2Cd1ecl( d1cl ) )
end // end-of-[aux_define(d1cl)]

(* ****** ****** *)

fun
aux_include
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cinclude
( tok
, src1, knd2
, fopt, body) = d1cl.node()
//
val body =
(
case+ body of
| None() => None()
| Some(dcls) =>
  Some(trans12_declist(dcls))
) : d2eclistopt // end-of-val
//
in
//
d2ecl_make_node
( loc0
, D2Cinclude
  (tok, src1, knd2, fopt, body))
//
end // end-of-[aux_include(d1cl)]

(* ****** ****** *)

fun
aux_staload
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cstaload
( tok0
, src1, knd2
, fopt
, flag, body) = d1cl.node()
//
var
flag: int
val
body =
(
(
case+ body of
|
None() =>
(
auxg1exp(src1)
) where
{
val () = (flag := 0)
}
|
Some(d1cs) =>
let
val
res =
auxd1cls(fopt, d1cs)
in
flag := res.0; Some(res.1)
end
) (* case *)
: fmodenvopt // end-of-val
) where
{
fun
auxg1exp
( src
: g1exp
) : fmodenvopt =
(
case+
src.node() of
|
G1Eid0 _ => auxg1eid(src)
|
G1Eapp2
(_, _, src) => auxg1eid(src)
//
|
_ (* else *) => None((*void*))
//
) // end of [auxd1exp]
and
auxg1eid
( src
: g1exp
) : fmodenvopt =
(
case+
src.node() of
|
G1Eid0(sym) =>
(
case+ opt of
| ~None_vt() => None()
| ~Some_vt(m0) => Some(m0)
) where
{
  val
  opt =
  the_qualist_find_sym(sym)
}
| _ (*else*) => None((*void*))
) // end of [auxg1eid]
//
fun
auxd1cls
( fopt
: filpathopt
, d1cs: d1eclist
)
:
(int, fmodenv) = let
//
val-
Some(fp0) = fopt
val
mopt =
trans12_staload_find(fp0)
//
in (*in-of-let*)
//
case+ mopt of
|
~None_vt() =>
(0(*nshare*), menv) where
{
val
(pf0 | ()) =
the_trans12_savecur((*void*))
//
val d2cs = trans12_declist(d1cs)
//
val envs =
the_trans12_restore(pf0|(*nil*))
//
val menv =
fmodenv_make
( fp0
, envs.0(*gmac*)
, envs.1, envs.2, envs.3, d2cs )
//
val
((*void*)) =
trans12_staload_add( fp0, menv )
//
} (* end of [None_vt] *)
|
~Some_vt(menv) => (1(*shared*), menv)
//
end // end of [auxd1cls]
} (* where *) // end-of-val
//
val () =
(
case+ body of
|
None() => ((*void*))
|
Some(menv) =>
let
val nmopt = g1exp_nmspace(src1)
in//let
case+ nmopt of
| ~
None_vt() =>
the_nmspace_open(menv)
| ~
Some_vt(nm0) =>
(
the_sexpenv_add
(nm0, S2ITMfmodenv(menv)))
end // end of [Some]
) : void // end of val
//
in//let
//
d2ecl_make_node
( loc0
, D2Cstaload
( tok0, src1, knd2, fopt, flag, body))
//
end // end of [aux_staload(d1cl)]

(* ****** ****** *)

fun
aux_abssort
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cabssort
(knd, tok) =
d1cl.node((*void*))
//
val tid = sortid_sym(tok)
val s2ta = t2abs_new(tid)
val s2tx =
  S2TXTsrt(S2Tbas(T2BASabs(s2ta)))
//
in
the_sortenv_add(tid, s2tx);
d2ecl_make_node(loc0, D2Cabssort(tid))
end // end of [aux_abssort(d1cl)]

(* ****** ****** *)

fun
aux_stacst0
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cstacst0
( knd
, sid, arg, res) =
d1cl.node((*void*))
//
fun
auxargs
( xs
: t1arglst
) : sort2lst =
(
case+ xs of
| list_nil() =>
  (
  list_nil(*void*)
  )
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1ARGsome(s1t, _) =>
    list_cons
    (trans12_sort(s1t), auxargs(xs))
  )
) (* end of [auxargs] *)
//
fun
auxmargs
( xs: t1marglst
, res: sort2): sort2 =
(
case+ xs of
| list_nil() => res
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1MARGlist(t1as) =>
    S2Tfun
    (auxargs(t1as), auxmargs(xs, res))
  )
) (* end of [auxmargs] *)
//
val
res = trans12_sort(res)
val
s2t0 = auxmargs(arg, res)
val
s2c0 = s2cst_make_idst(sid, s2t0)
//
val () = the_sexpenv_add_cst(s2c0)
//
(*
val () =
println!
("aux_stacst0: s2t0 = ", s2t0)
val () =
println!
("aux_stacst0: s2c0 = ", s2c0)
*)
//
in
  d2ecl_make_node(loc0, D2Cstacst0(s2c0, s2t0))
end // end of [aux_stacst0(d1cl)]

(* ****** ****** *)

fun
aux_sortdef
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Csortdef
(knd, tid, def0) =
d1cl.node((*void*))
//
val sym = sortid_sym(tid)
//
in (* in-of-let *)
//
case+
def0.node() of
//
| S1RTDEFsort(s1t) =>
  let
    val s2tx = trans12_stxt(s1t)
  in
    the_sortenv_add(sym, s2tx);
    d2ecl_make_node(loc0, D2Csortdef(sym, s2tx))
  end
//
| S1RTDEFsbst(s1a, s1ps) =>
  (
  case+ s1a.node() of
  | S1ARGsome(tok, opt) =>
    let
//
      val tx0 =
      (
        case+ opt of
        | None() =>
          (
            S2TXTsrt(S2Tnone0())
          )
        | Some(s1t) => trans12_stxt(s1t)
      ) : s2txt // end of [val]
//
      val s2t =
      (
        case+ tx0 of
        | S2TXTsrt(s2t) => s2t
        | S2TXTsub(s2v, _) => s2v.sort()
(*
        | S2TXTerr _(*loc*) => S2Tnone0()
*)
      ) : sort2 // end of [val]
//
      val id0 =
        sargid_sym(tok)
      // end of [val]
      val s2v1 =
        s2var_make_idst(id0, s2t)
      // end of [val]
//
      val (pf0|()) =
        the_sexpenv_pushnil()
      // end of [val]
      val ((*void*)) =
        the_sexpenv_add_var(s2v1)
      // end of [val]
//
      val s2ps1 =
      (
        case+ tx0 of
        | S2TXTsrt(s2t) =>
          (
            trans12_sexplst_ck
            (s1ps, the_sort2_bool)
          ) (* S2TXTsrt *)
        | S2TXTsub(s2v, s2ps) =>
          (
            s2ps1 + s2ps2
          ) where
          {
            val s2ps1 =
            s2explst_revar(s2ps, s2v, s2v1)
            val s2ps2 = trans12_sexplst(s1ps)
          }
(*
        | S2TXTerr _(*loc*) => list_nil(*void*)
*)
      ) : s2explst // end of [val]
//
      val ((*void*)) =
        the_sexpenv_popfree(pf0|(*void*))
      // end of [val]
//
    in
      let
        val
        s2tx =
        S2TXTsub(s2v1, s2ps1)
      in
        the_sortenv_add(sym, s2tx);
        d2ecl_make_node(loc0, D2Csortdef(sym, s2tx))
      end
    end
  ) (* end of [S1RTDEFsubset] *)
//
end // end of [aux_sortdef]

(* ****** ****** *)

fun
aux_sexpdef
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
(*
val () =
println!
("aux_sexpdef: loc0 = ", loc0)
val () =
println!
("aux_sexpdef: d1cl = ", d1cl)
*)
//
val-
D1Csexpdef
( knd, sid
, arg, res, body) = d1cl.node()
//
val
(pf0|()) =
(
the_sexpenv_pushnil())
//
val
s2e0 =
(
auxlams(arg, res, body)
) where
{
//
fun
auxlams
( arg
: s1marglst
, res
: sort1opt
, body: s1exp): s2exp =
(
case+ arg of
|
list_nil() =>
(
  case res of
  | None() =>
    trans12_sexp(body)
  | Some(s1t) =>
    trans12_sexp_ck
    (body, trans12_sort(s1t))
)
|
list_cons(x0, xs) =>
let
  val
  s2vs = trans12_smarg(x0)
  val () = 
  the_sexpenv_add_s2vs(s2vs)
in
  s2exp_lam
  (s2vs, auxlams(xs, res, body))
end // end of [list_cons]
)
//
} (* where *) // end of [val]
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
(*
val () =
println!
("aux_sexpdef: knd = ", knd)
val () =
println!
("aux_sexpdef: s2e0 = ", s2e0)
*)
//
val
s2t0 =
s2e0.sort()
val
s2e0 =
(
auxck1(knd, s2t0)
) where
{
fun
auxck1
( knd: token
, s2t1: sort2): s2exp =
let
val-
T_SEXPDEF(knd) = knd.node()
in
//
ifcase
//
| (knd < 0) => s2e0
//
| (knd=PROPSORT) =>
  auxck2(s2t0, the_sort2_prop)
| (knd=VIEWSORT) =>
  auxck2(s2t0, the_sort2_view)
(*
| (knd=TFLTSORT) =>
  auxck2(s2t0, the_sort2_tflt)
*)
| (knd=TYPESORT) =>
  auxck2(s2t0, the_sort2_type)
| (knd=VWTPSORT) =>
  auxck2(s2t0, the_sort2_vwtp)
| _(* SEXPDEF *) =>
  let val () = assertloc(false) in s2e0 end
//
end // end of [let]
//
and
auxck2
( s2tf: sort2
, s2t1: sort2): s2exp =
(
//
case+ s2tf of
//
|
S2Tfun
(_, s2tf) => auxck2(s2tf, s2t1)
//
|
_(*non-S2Efun*) =>
(
  if
  (s2tf <= s2t1)
  then s2e0 else let
    val
    s2t1 = auxst0(s2t1)
  in
    s2exp_cast(loc0, s2e0, s2t1)
  end
) where
{
  fun
  auxst0(s2tf: sort2): sort2 =
  (
    case+ s2tf of
    | S2Tfun(s2ts, s2tf) =>
      S2Tfun(s2ts, auxst0(s2tf))
    | _ (* non-S2Tfun *) => s2tf
  )
}
) where
{
//
(*
val () =
println!
("aux_sexpdef: auxck2: s2tf = ", s2tf)
val () =
println!
("aux_sexpdef: auxck2: s2t1 = ", s2t1)
*)
//
} (* end of auxck2 *)
//
} (* end of [where] *) // end of [val]
//
val
s2t0 = s2e0.sort()
val
t2p0 = s2exp_erase(s2e0)
val
s2c0 =
s2cst_make_idst(sid, s2t0)
//
val () = stamp_s2cst(s2c0)
val () = stamp_s2cst_sexp(s2c0, s2e0)
val () = stamp_s2cst_type(s2c0, t2p0)
//
in
let
//
val () = the_sexpenv_add_cst(s2c0)
in//let
d2ecl_make_node(loc0, D2Csexpdef(s2c0, s2e0))
end//let
end // end of [aux_sexpdef(d1cl)]

(* ****** ****** *)

fun
aux_abstdef
( arg
: t1marglst
, def: abstdf1
, res: sort2): abstdf2 =
(
case+ def of
| ABSTDF1some() =>
  ABSTDF2some((*void*))
| ABSTDF1lteq(s1e) =>
  (
    ABSTDF2lteq(t2p)
  ) where
  {
    val s2e =
    auxfck(arg, s1e, res)
    val t2p = s2exp_erase(s2e)
  }
| ABSTDF1eqeq(s1e) =>
  (
    ABSTDF2eqeq(s2e, t2p)
  ) where
  {
    val s2e =
    auxfck(arg, s1e, res)
    val t2p = s2exp_erase(s2e)
  }
) where
{
fun
auxfck
( t1ms
: t1marglst
, s1e: s1exp
, res: sort2): s2exp =
(
case+ t1ms of
| list_nil() =>
  trans12_sexp_ck(s1e, res)
| list_cons(t1m0, t1ms) =>
  let
  val+
  T1MARGlist(t1as) = t1m0.node()
  in
  case- res of
  | S2Tfun(s2ts, res) =>
    let
    val
    s2vs = auxsvs(t1as, s2ts)
    val () =
    the_sexpenv_add_s2vs(s2vs)
    in
      s2exp_lam(s2vs, auxfck(t1ms, s1e, res))
    end
  end // end of [list_cons]
)
and
auxsvs
( t1as: t1arglst
, s2ts: sort2lst): s2varlst =
(
case+ t1as of
| list_nil() =>
  list_nil()
| list_cons(t1a0, t1as) =>
  let
  val-
  list_cons(s2t0, s2ts) = s2ts
  val+
  T1ARGsome(_, opt) = t1a0.node()
  val s2v0 =
  (
  case+ opt of
  | None() =>
    let
    val
    sid = sargid_new()
    in
      s2var_make_idst(sid, s2t0)
    end    
  | Some(tok) =>
    let
    val
    sid = sargid_sym(tok)
    in
      s2var_make_idst(sid, s2t0)
    end
  ) : s2var // end of [val]
  in
    list_cons(s2v0, auxsvs(t1as, s2ts))
  end
)
} (* end of [aux_abstdef] *)

and
aux_abstype
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cabstype
( knd, sid
, arg, res, def) = d1cl.node()
//
fun
auxargs
( xs
: t1arglst
) : sort2lst =
(
case+ xs of
| list_nil() =>
  (
  list_nil(*void*)
  )
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1ARGsome(s1t, _) =>
    list_cons
    (trans12_sort(s1t), auxargs(xs))
  )
) (* end of [auxargs] *)
//
fun
auxmargs
( xs: t1marglst
, res: sort2): sort2 =
(
case+ xs of
| list_nil() => res
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1MARGlist(t1as) =>
    S2Tfun
    (auxargs(t1as), auxmargs(xs, res))
  )
) (* end of [auxmargs] *)
//
val
res =
(
(
case+ res of
| None() =>
  auxst(knd)
| Some(s1t) =>
  trans12_sort(s1t)
)
: sort2
) where
{
fun
auxst
(knd: token): sort2 =
(
let
val-
T_ABSTYPE(knd) = knd.node()
in
//
ifcase
//
| (knd=PROPSORT) => the_sort2_prop
| (knd=VIEWSORT) => the_sort2_view
//
| (knd=TBOXSORT) => the_sort2_tbox
(*
| (knd=TFLTSORT) => the_sort2_tflt
*)
| (knd=TYPESORT) => the_sort2_type
//
| (knd=VTBXSORT) => the_sort2_vtbx
| (knd=VWTPSORT) => the_sort2_vwtp
//
| _(* SEXPDEF *) =>
  let
//
(*
    val () =
    println!("auxst: knd = ", knd)
*)
//
    val () =
    assertloc(false) in the_sort2_vwtp
  end
//
end // end-of-let
)
} (* end of [val] *)
//
val
s2t0 =
auxmargs(arg, res)
//
val (pf0|()) =
the_sexpenv_pushnil()
val
def0 =
aux_abstdef(arg, def, s2t0)
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val
s2c0 =
s2cst_make_idst(sid, s2t0)
//
val () =
stamp_s2cst(s2c0)
val () =
stamp_s2cst_abst(s2c0, def0)
//
val () = the_sexpenv_add_cst(s2c0)
//
(*
val () =
println!("aux_abstype: s2t0 = ", s2t0)
val () =
println!("aux_abstype: s2c0 = ", s2c0)
*)
//
in
  d2ecl_make_node(loc0, D2Cabstype(s2c0, def0))
end // end of [aux_abstype]

(* ****** ****** *)

local
//
typedef s2vs = s2varlst
//
fun
auxsqid
( sqid
: sq0eid): impls2cst =
(
  IMPLS2CST1(sqid, s2cs)
) where
{
val s2cs =
(
case+ sqid of
|
SQ0EIDnone(id0) =>
let
val-
I0DNTsome
  (tok) = id0.node()
// end of [val]
val sym = sexpid_sym(tok)
val opt = the_sexpenv_find(sym)
in
case+ opt of
| ~
None_vt() =>
list_nil(*void*)
| ~
Some_vt(s2i) =>
(
case+ s2i of
| S2ITMcst(s2cs) => s2cs | _ => list_nil()
) (* end of [Some_vt] *)
end
|
SQ0EIDsome(qua, id0) =>
let
val-
I0DNTsome
  (tok) = id0.node()
// end of [val]
val sym = sexpid_sym(tok)
val opt = the_sexpenv_qfind(qua, sym)
in
case+ opt of
| ~
None_vt() =>
list_nil(*void*)
| ~
Some_vt(s2i) =>
(
case+ s2i of
| S2ITMcst(s2cs) => s2cs | _ => list_nil()
) (* end of [Some_vt] *)
end
) : s2cstlst // end-of-val
} (* where *) (* end of [auxsqid] *)

fun
auxsmas
( sqid
: impls2cst
, smas
: s1marglst)
: s2varlstlst = let
//
val
svss =
(
list_map<s1marg><s2vs>(smas)
) where
{
implement
list_map$fopr<
  s1marg><s2vs>(sma) = trans12_smarg(sma)
} (* end of [svss] *)
//
in
  list_vt2t{ s2varlst }(svss)
end // end of [auxsmas]

fun
auxlams
( svss
: s2varlstlst
, res1: sort1opt, s1e2: s1exp
) : s2exp =
(
case+ svss of
| list_nil() =>
  (
  case res1 of
  | None() =>
    trans12_sexp_ci(s1e2)
  | Some(s1t) =>
    trans12_sexp_ck
    (s1e2, trans12_sort(s1t))
  )
| list_cons(s2vs, svss) =>
  let
    val () = 
    the_sexpenv_add_s2vs(s2vs)
  in
    s2exp_lam(s2vs, auxlams(svss, res1, s1e2))
  end
)

in (* in-of-local *)

fun
aux_absopen
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cabsopen
( knd
, sqid) = d1cl.node()
//
val sqid = auxsqid(sqid)
//
in
  d2ecl_make_node(loc0, D2Cabsopen(knd, sqid))
end // end of [aux_absopen]

fun
aux_absimpl
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cabsimpl
( knd
, sqid
, smas
, res1
, s1e2) = d1cl.node()
//
val sqid = auxsqid(sqid)
val svss = auxsmas(sqid, smas)
//
val (pf0|()) =
the_sexpenv_pushnil()
//
val s2e2 =
auxlams(svss, res1, s1e2)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
  d2ecl_make_node(loc0, D2Cabsimpl(knd, sqid, s2e2))
end // end of [aux_absimpl]

end // end of [local]

(* ****** ****** *)

fun
aux_fundclst
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cfundclst
( knd
, mopt
, tqas
, f1ds) = d1cl.node()
//
val
isr =
decmodopt_rec(mopt)
val
isr =
(
ifcase
|
isr > 0 => true
|
isr < 0 => false
|
_(* else *) =>
(
funkind_isrec(fnk)
) where
{
val-T_FUN(fnk) = knd.node()
}
) : bool // endval
//
val
tqas =
trans12_tqarglst(tqas)
//
val
(pf0|()) =
the_sexpenv_pushnil( )
//
val () =
the_sexpenv_add_tqas(tqas)
//
val d2vs =
let
val
d2vs = auxd2vs(f1ds)
fun
loop
(d2vs: d2varlst): void =
(
case+ d2vs of
|
list_nil() => ()
|
list_cons(d2v0, d2vs) =>
let
val () = d2v0.tqas(tqas) in loop(d2vs)
end
)
in (*in-of-let*)
let
val () = loop(d2vs) in d2vs
end
end // end=of-let // end-of-val
//
val d2cs =
auxd2vs_rec(isr, d2vs, f1ds)
//
val f2ds =
auxf1ds(d1cl, d2vs, d2cs, f1ds)
//
val ((*void*)) =
auxd2vs_nrc(isr, d2cs, f1ds)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
  d2ecl_make_node
  (loc0, D2Cfundclst(knd, mopt, tqas, f2ds))
end where
{
//
//
fun
ishdr
( f1d0
: d1fundecl): bool =
let
val+
D1FUNDECL(rcd) = f1d0
in
case+ rcd.def of
| None() => true
| Some(d1e1) => isext(d1e1)
end
and
isext
( d1e1
: d1exp): bool =
(
case+
d1e1.node() of
| D1Eextnam _ => true
|
_ (*non-D1Eextnam*) => false
)
//
fun
auxd2vs
( f1ds
: d1fundeclist): d2varlst =
list_vt2t
(
list_map<d1fundecl><d2var>(f1ds)
) where
{
implement
list_map$fopr<d1fundecl><d2var>
  (f1d) =
(
  let
    val+
    D1FUNDECL(rcd) = f1d in d2var_new1(rcd.nam)
  end
) (* end of [list_map$fopr] *)
}
//
fun
auxf1d0
( d1cl
: d1ecl
, d2v0
: d2var
, d2c0
: d2cst
, f1d0
: d1fundecl )
: d2fundecl = let
//
val+
D1FUNDECL(rcd) = f1d0
//
val nam = d2v0
val d2c = d2c0
val loc = rcd.loc
//
val wtp =
(
case+ rcd.wtp of
|
WTHS1EXPnone
((*void*)) => None()
|
WTHS1EXPsome
(tok, s1e) =>
Some(trans12_sexp(s1e))
) : s2expopt // end-of-val
//
val nex = let
//
fun
aux_nex
(s1e0: s1exp): int =
(
case+
s1e0.node() of
|
S1Eapp1
(s1f0, s1e1) =>
(
case+
s1f0.node() of
|
S1Eexists(k0, _) =>
if
k0 <= 0
then 0 else
(1+aux_nex(s1e1))
|
_(*non-S1Eexi*) => 0
)
|
_(* non-S1Eapp1 *) => 0
) (* end of [aux_nex] *)
//
in
case+
rcd.res of
|
EFFS1EXPnone
() => (~1)
|
EFFS1EXPsome
(s1e0) => aux_nex(s1e0)
end : int // end-of-nex
//
(*
val () =
println!
("auxf1d0: nex = ", nex)
*)
//
val
(pf0|()) =
the_trans12_pushnil()
//
val f2g =
(
case+ wtp of
|
Some(wtp) =>
trans12_farglst_wtp0(rcd.arg, wtp)
|
None((*void*)) =>
trans12_farglst_nex1(rcd.arg, nex)
) : f2arglst // end-of-val
//
local
val opt = rcd.def
in(* in-of-local *)
val xnm =
(
case+ opt of
|
None() => None(*void*)
|
Some(d1e) =>
(
case+
d1e.node() of
|
D1Eextnam(gnm) => Some(gnm)
|
_(*D1Eextnam*) => None(*void*)
)
) : Option(g1nam) // end-of-val
//
val ( ) =
(
case+ xnm of
|
None() => ((*void*))
|
Some(gnm) =>
d2cst_set_xnam
(d2c, X2NAMsome(gnm))): void
//
val def =
(
case+ xnm of
|
Some _ => None()
|
None _ =>
trans12_dexpopt(opt)): d2expopt
//
end // end of [local]
//
val res =
trans12_effsexpopt(rcd.res)
//
val f2g =
trans12_farglst_nex2(f2g,nex,res)
//
val
((*void*)) =
the_trans12_popfree(pf0|(*void*))
//
in
D2FUNDECL(
@{
 loc=loc
,nam=nam
,d2c=d2c
,f2g=f2g,res=res,xnm=xnm,def=def,wtp=wtp}
) (* D2FUNDECL *)
end // end of [auxf1d0]
//
and
auxf1ds
( d1cl
: d1ecl
, d2vs
: d2varlst
, d2cs
: d2cstlst
, f1ds
: d1fundeclist )
: d2fundeclist =
(
case+ d2vs of
|
list_nil() =>
list_nil((*void*))
|
list_cons(d2v0, d2vs) =>
(
  list_cons(f2d0, f2ds)
) where
{
  val-
  list_cons
  (d2c0, d2cs) = d2cs
  val-
  list_cons
  (f1d0, f1ds) = f1ds
  val
  f2d0 =
  auxf1d0
  (d1cl, d2v0, d2c0, f1d0)
  val ((*void*)) =
  if
  ishdr(f1d0) then let
    val
    s2e0 =
    d2fundecl_get_sexp(f2d0)
    val
    t2p0 = s2exp_erase(s2e0)
  in
    d2cst_set_sexp(d2c0, s2e0);
    d2cst_set_type(d2c0, t2p0);
    d2var_set_sexp(d2v0, s2e0);
    d2var_set_type(d2v0, t2p0);
(*
println!("trans12_decl: aux_fundclst: auxf1ds: d2v0 = ", d2v0);
println!("trans12_decl: aux_fundclst: auxf1ds: t2p0 = ", t2p0);
*)
  end // end of [then] // end of [if]
  val
  f2ds =
  auxf1ds(d1cl, d2vs, d2cs, f1ds)
}
)
//
fun
auxd2vs_rec
( isr
: bool
, d2vs
: d2varlst
, f1ds
: d1fundeclist
) : d2cstlst =
(
case+ d2vs of
|
list_nil() =>
list_nil()
|
list_cons(d2v0, d2vs) =>
let
  val-
  list_cons
  (f1d0, f1ds) = f1ds
  val
  d2c0 =
  d2cst_make_dvar(d2v0)
  val () =
  if
  isr
  then the_dexpenv_add_var(d2v0)
  val () =
  if
  ishdr(f1d0)
  then the_dexpenv_add_cst(d2c0)
in
  list_cons
  (d2c0, auxd2vs_rec(isr, d2vs, f1ds))
end
)
//
fun
auxd2vs_nrc
( isr: bool
, d2cs: d2cstlst
, f1ds: d1fundeclist
) : void =
(
case+ d2cs of
|
list_nil() => ()
|
list_cons(d2c0, d2cs) =>
let
  val-
  list_cons
  (f1d0, f1ds) = f1ds
in
  if
  ishdr(f1d0)
  then
  (
  auxd2vs_nrc(isr, d2cs, f1ds)
  ) (* end of [then] *)
  else
  (
  let
    val () =
    the_dexpenv_add_cst(d2c0)
  in
    auxd2vs_nrc(isr, d2cs, f1ds)
  end
  ) (* end of [else] *)
end
)
//
} (* end of [aux_fundclst] *)

(* ****** ****** *)

fun
aux_valdclst
( d1cl
: d1ecl): d2ecl =
aux_valdclst_nrc(d1cl)

and
aux_valdclst_nrc
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cvaldclst
( knd
, mopt
, v1ds) = d1cl.node()
//
val
isr =
decmodopt_rec(mopt)
val
isr =
(
ifcase
| isr > 0 => true
| isr < 0 => false
| _(* default *) => false
) : bool // endval
//
val
d2ps = auxv1ds_d2p(v1ds)
//
val ((*void*)) =
(
if isr
then
the_trans12_add_patlst(d2ps)
else ((*void*))
) : void // end of [val ()]
//
val
v2ds = auxv1ds_d2c(v1ds, d2ps)
//
val ((*void*)) =
(
if not(isr)
then the_trans12_add_patlst(d2ps)
else ((*void*))
) : void // end of [val () ]
//
in
  d2ecl_make_node
  (loc0, D2Cvaldclst(knd, mopt, v2ds))
end where
{
//
fun
auxv1d0_d2p
( v1d0
: d1valdecl): d2pat =
let
//
val+
D1VALDECL(rcd) = v1d0
//
in
  trans12_dpat(rcd.pat)
end // end of [auxv1d0_d2p]
fun
auxv1ds_d2p
( v1ds
: d1valdeclist): d2patlst =
list_vt2t
(
list_map<d1valdecl><d2pat>(v1ds)
) where
{
implement
list_map$fopr<d1valdecl><d2pat>(x0) = auxv1d0_d2p(x0)
} (* end of [auxv1ds_d2p] *)
//
fun
auxv1d0_d2c
( v1d0
: d1valdecl
, d2p0: d2pat): d2valdecl = let
//
val+
D1VALDECL(rcd) = v1d0
//
val def = trans12_dexpopt(rcd.def)
//
val wtp =
(
case+ rcd.wtp of
| WTHS1EXPnone
    ((*void*)) => None()
| WTHS1EXPsome
    (tok, s1e) => Some(trans12_sexp(s1e))
) : s2expopt // end of [val]
//
in
  D2VALDECL
  (@{loc=rcd.loc,pat=d2p0,def=def,wtp=wtp})
end // end of [auxv1d0_d2c]
fun
auxv1ds_d2c
( v1ds
: d1valdeclist
, d2ps: d2patlst): d2valdeclist =
(
case+ v1ds of
| list_nil() =>
  list_nil()
| list_cons(v1d0, v1ds) =>
  let
  val-
  list_cons(d2p0, d2ps) = d2ps
  in
    list_cons
    (auxv1d0_d2c(v1d0, d2p0), auxv1ds_d2c(v1ds, d2ps))
  end
) (* end of [auxv1ds_d2c] *)
//
} (* end of [aux_valdclst] *)

(* ****** ****** *)

fun
aux_vardclst
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cvardclst
( knd
, mopt
, v1ds) = d1cl.node()
//
val v2ds = auxv1ds(v1ds)
//
in
  d2ecl_make_node
  (loc0, D2Cvardclst(knd, mopt, v2ds))
end where
{
//
fun
auxv1d0
( v1d0
: d1vardecl
)
: d2vardecl = let
//
val+
D1VARDECL(rcd) = v1d0
//
val loc = rcd.loc
//
val
d2v =
d2var_new1(rcd.nam)
//
val wth =
(
case+ rcd.wth of
| None() => None()
| Some(wth) =>
  Some(d2var_new1(wth))
) : d2varopt // end-of-val
//
val res =
(
case+ rcd.res of
| None() => None()
| Some(s1e) =>
  Some(trans12_sexp(s1e))
) : s2expopt // end-of-val
//
val ini =
(
case+ rcd.ini of
| TEQD1EXPnone
  ((*void*)) => None()
| TEQD1EXPsome
  (teq, d1e) =>
  Some(trans12_dexp(d1e))
) : d2expopt // end-of-val
//
val () = the_dexpenv_add_var(d2v)
//
val () =
(
case+ wth of
| None() => ()
| Some(d2v) => the_dexpenv_add_var(d2v)
)
//
in
//
D2VARDECL
(@{loc=loc,d2v= d2v,wth=wth,res=res,ini=ini})
//
end // end of [auxv1d0]
//
and
auxv1ds
( v1ds
: d1vardeclist): d2vardeclist =
list_vt2t
(
list_map<d1vardecl><d2vardecl>(v1ds)
) where
{
implement
list_map$fopr<d1vardecl><d2vardecl>(v1d) = auxv1d0(v1d)
} (* end of [auxv1ds] *)
//
} (* end of [aux_vardclst] *)

(* ****** ****** *)

local

fun
auxdqid
( dqid
: dq0eid): impld2cst =
(
  IMPLD2CST1(dqid, d2cs)
) where
{
//
(*
val () =
println!
("auxdqid: dqid = ", dqid)
*)
//
val d2cs =
(
case+ dqid of
//
|
DQ0EIDnone(id0) =>
let
  val-
  I0DNTsome
    (tok) = id0.node()
  // end of [val]
  val sym = dexpid_sym(tok)
  val opt = the_dexpenv_find(sym)
in//let
case+ opt of
| ~
None_vt() =>
  list_nil()
| ~
Some_vt(d2i) =>
( case+ d2i of
| D2ITMcst(d2cs) => d2cs | _ => list_nil()
) (* end of [Some_vt] *)
end // end-of-(DQ0EIDnone(id0))
//
|
DQ0EIDsome(qua, id0) =>
let
  val-
  I0DNTsome
    (tok) = id0.node()
  // end of [val]
  val sym = dexpid_sym(tok)
  val opt = the_dexpenv_qfind(qua, sym)
in//let
case+ opt of
| ~
None_vt() =>
  list_nil()
| ~
Some_vt(d2i) =>
( case+ d2i of
| D2ITMcst(d2cs) => d2cs | _ => list_nil()
) (* end of [Some_vt] *)
end // end of [DQ0EIDsome(qua,id0))
//
) : d2cstlst // end of [ val(d2cs) ]
//
(*
val () =
list_foritm<d2cst>(d2cs) where
{
implement
list_foritm$work<d2cst><void>
  (d2c, env) =
let
val loc =
d2cst_get_loc(d2c)
in//let
  println!("auxdqid: d2c = ", d2c, "(", loc, ")")
end//end-of-[let]
}
*)
//
} (* where *) // end of [auxdqid(dqid:dq0eid)] *)

(* ****** ****** *)

fun
auxid2c_tqas
( id2c
: impld2cst
, tqas
: tq2arglst): void =
(
case- id2c of
| IMPLD2CST1(_, d2cs) =>
  (
  case+ d2cs of
  | list_nil() => ()
  | list_cons(d2c0, d2cs) =>
    (
    if
    isneqz(d2cs)
    then ((*void*))
    else
    auxtqas_test(d2c0.tqas(), tqas)
    )
  )
)
and
auxtqas_test
( xss: tq2as
, yss: tq2as): void =
(
case+ xss of
| list_nil() => ()
| list_cons(xs0, xss) =>
  (
  case+ yss of
  | list_nil() => ()
  | list_cons(ys0, yss) =>
    (
      auxtqas_test(xss, yss)
    ) where
    {
      val () =
      auxs2vs_test(xs0.s2vs(), ys0.s2vs())
    }
  )
) (* end of [auxtqas_test] *)
and
auxs2vs_test
( xvs: s2varlst
, yvs: s2varlst): void =
(
case+ xvs of
| list_nil() => ()
| list_cons(xv0, xvs) =>
  (
  case+ yvs of
  | list_nil() => ()
  | list_cons(yv0, yvs) =>
    (
      auxs2vs_test(xvs, yvs)
    ) where
    {
(*
      val () =
      println!("auxs2vs_test: xv0 = ", xv0)
      val () =
      println!("auxs2vs_test: yv0 = ", yv0)
*)
      val () =
      case+ yv0.sort() of
      | S2Tnone0() => yv0.sort(xv0.sort()) | _ => ()
    }
  )
) (* end of [auxs2vs_test] *)

(* ****** ****** *)

fun
auxf2a0_sexp
( f2a0: f2arg
, s2e0: s2exp): s2exp =
let
fun
auxdyn
(s2e0: s2exp): s2exp =
let
  val s2e0 = whnfize(s2e0)
in (* in-of-let *)
case+
s2e0.node() of
| S2Emet
  (_, s2e1) => auxdyn(s2e1)
| S2Euni
  (_, _, s2e1) => auxdyn(s2e1)
| S2Efun
  (_, _, s2es, s2e1) => s2e1
| _(* non-function *) => s2e0
end // end of [auxdyn]
//
and
auxsta
( s2e0: s2exp
, svs1: s2varlst): s2exp =
let
  val s2e0 = whnfize(s2e0)
in
  case+
  s2e0.node() of
//
  | S2Emet
    (_, s2e1) =>
    (
      auxsta(s2e1, svs1)
    )
//
  | S2Euni
    (svs0, s2ps, s2e1) =>
    auxsvs(svs0, svs1, s2e1)
//
  | _(*non-function*) => s2e0
//
end // end of [auxsta]
//
and
auxsvs
( svs0
: s2varlst
, svs1
: s2varlst
, s2e1: s2exp): s2exp =
(
let
(*
val () =
println!
("auxsvs: svs0 = ", svs0)
val () =
println!
("auxsvs: svs1 = ", svs1)
*)
in
case+ svs0 of
|
list_nil() => s2e1
|
list_cons(sv0, svs0) =>
(
case+ svs1 of
| list_nil() => s2e1
| list_cons(sv1, svs1) =>
  let
    val () =
    sv1.sort(sv0.sort())
  in
    s2exp_revar(s2e1, sv0, sv1)
  end where
  {
    val
    s2e1 = auxsvs(svs0, svs1, s2e1)
  }
)
end
)
in
case+
f2a0.node() of
| F2ARGsome_met _ => s2e0
| F2ARGsome_dyn _ => auxdyn(s2e0)
| F2ARGsome_sta(s2vs, _) => auxsta(s2e0, s2vs)
end

(* ****** ****** *)

fun
auxid2c_f1as
( id2c
: impld2cst
, f1as: f1arglst): f2arglst =
(
case- id2c of
| IMPLD2CST1(_, d2cs) =>
  (
  case+ d2cs of
  | list_nil() => 
    trans12_farglst(f1as)
  | list_cons(d2c0, d2cs) =>
    (
    if
    isneqz(d2cs)
    then
    trans12_farglst(f1as)
    else
    auxsexp_f1as(d2c0.sexp(), f1as)
    )
  )
) (* end of [auxid2c_f1as] *)
and
auxsexp_f1as
( s2e0: s2exp
, f1as: f1arglst): f2arglst =
(
let
(*
val () =
println!
("auxsexp_f1as: s2e0 = ", s2e0)
val () =
println!
("auxsexp_f1as: f1as = ", f1as)
*)
in
case+ f1as of
|
list_nil() =>
list_nil()
|
list_cons(f1a0, f1as) =>
(
  list_cons(f2a0, f2as)
) where
{
  val f2a0 = trans12_farg(f1a0)
  val s2e1 = auxf2a0_sexp(f2a0, s2e0)
  val f2as = auxsexp_f1as(s2e1, f1as)
}
end
) (* end of [auxsexp_f1as] *)

in (* in-of-local *)

fun
aux_implmnt0
( d1cl
: d1ecl): d2ecl =
aux_implmnt0_rec(d1cl)

and
aux_implmnt0_rec
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cimplmnt0
( knd
, mopt
, sqas, tqas
, dqid, tias
, f1as, tres
, teq1, d1e2) = d1cl.node()
//
val
id2c = auxdqid(dqid)
//
val
stmp = d2cimp_stamp_new()
//
val
sqas = trans12_sqarglst(sqas)
val
tqas = trans12_tqarglst(tqas)
//
(*
val () =
println!
("aux_implmnt0: id2c = ", id2c)
//
val () =
println!
("aux_implmnt0: sqas = ", sqas)
//
val () =
println!
("aux_implmnt0: tqas = ", tqas)
*)
//
val () =
auxid2c_tqas(id2c, tqas)
//
val
(pf0|()) =
the_trans12_pushnil((*void*))
//
val () =
(
list_foritm<sq2arg>(sqas)
) where
{
implement
list_foritm$work<sq2arg><void>
  (sq2a, env) =
  the_sexpenv_add_s2vs(sq2a.s2vs())
}
val () =
(
list_foritm<tq2arg>(tqas)
) where
{
implement
list_foritm$work<tq2arg><void>
  (tq2a, env) =
  the_sexpenv_add_s2vs(tq2a.s2vs())
}
//
val tias =
  trans12_tiarglst(tias)
//
val f2as =
  auxid2c_f1as(id2c, f1as)
//
val tres =
  trans12_effsexpopt(tres)
//
val d2e2 = trans12_dexp(d1e2)
//
val
((*void*)) =
the_trans12_popfree(pf0|(*void*))
//
in
//
let
val
nd2c =
impld2cst_nd2c(id2c)
in
if
nd2c = 1
then
d2ecl_make_node
( loc0
, D2Cimplmnt1
  ( knd, stmp, mopt
  , sqas, tqas, id2c, tias, f2as, tres, d2e2)
) (* d2ecl_make_node *)
else
d2ecl_make_node
( loc0
, D2Cimplmnt2
  ( knd, stmp, mopt
  , sqas, tqas, id2c, tias, f2as, tres, d2e2)
) (* d2ecl_make_node *)
end
//
end // end of [aux_implmnt0_rec]

end // end of [local]

(* ****** ****** *)

local

fun
auxsym
(x0: s0ymb): sym_t =
(
case+
x0.node() of
| S0YMBi0dnt
  (id) =>
  (
    dexpid_sym(tok)
  ) where
  {
    val-
    I0DNTsome(tok) = id.node()
  }
(*
| S0YMBdtlab
  (tok, l0) =>
  (
    $LAB.label_dotize(lab)
  ) where
  {
    val-
    L0ABLsome(lab) = l0.node()
  }
*)
| S0YMBbrack
  (tok1, tok2) => $SYM.LRBRACK_symbol
) (* end of [auxsym] *)

fun
auxdqid
( dqid
: dq0eid
, pval: int): d2pitm =
let
//
val opt =
(
case+ dqid of
| DQ0EIDnone(id0) =>
  let
    val
    sym = dexpid_sym(tok)
  in
    the_dexpenv_find(sym)
  end where
  {
    val-
    I0DNTsome(tok) = id0.node()
  }
| DQ0EIDsome(qua, id0) =>
  let
    val
    sym = dexpid_sym(tok)
  in
    the_dexpenv_qfind(qua, sym)
  end where
  {
    val-
    I0DNTsome(tok) = id0.node()
  }
) : d2itmopt_vt // end of [val]
//
in
//
case+ opt of
| ~None_vt() => D2PITMnone(dqid)
| ~Some_vt(d2i) => D2PITMsome(pval, d2i)
//
end // end of [auxdqid]

in (* in-of-local *)

fun
aux_symload
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Csymload
( tok
, sym
, dqid, opt) = d1cl.node()
//
(*
val () = prerrln!
("aux_symload: d1cl = ", d1cl)
*)
//
val pval =
(
case+ opt of
|
None() =>
(0)(*default*)
|
Some(int) =>
(
  token2sint(tok)
) where
{
val tok =
(
case+
int.node() of
|
T0INTsome(tok) => tok
|
_(*non-T0INTsome*) =>
(
$raise
XATSOPT_TRERR12_EXN())
where
{
//
val () =
prerrln!
("trans12-error: ", int.loc())
val () =
prerrln!("trans12-error: ", int)
//
}(*where*)
) : token // end-of-[val(tok)]
}
) : (int) // end-of-[val(pval)]
//
val
sym = auxsym(sym)
//
val
dpis = let
//
val opt =
the_dexpenv_find(sym)
//
in (* in-of-let *)
(
case+ opt of
| ~None_vt() =>
   list_nil()
| ~Some_vt(d2i) =>
  (
  case+ d2i of
  | D2ITMsym
    (_, dpis) => dpis
  | _(*else*) =>
    (
      list_sing
      (D2PITMsome(0, d2i))
    )
  )
) : d2pitmlst // end of [val]
end // end of [let]
//
val
dpi0 =
auxdqid(dqid, pval)
//
val ((*void*)) =
(
  the_dexpenv_add(sym, d2i)
) where
{
  val d2i =
  D2ITMsym
  (sym, list_cons(dpi0, dpis))
}
//
in
//
d2ecl_make_node
(loc0, D2Csymload(tok, sym, dpi0))
//
end // end of [aux_symload]

end // end of [ local(aux_symload) ]

(* ****** ****** *)

fun
aux_datasort
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cdatasort
(knd, d1ts) = d1cl.node()
//
val s2ts =
auxd1ts(d1ts) where
{
//
fun
auxd1t0
( d1t0
: d1tsort): sort2 = let
//
val+
D1TSORT
(tok, s1cs) = d1t0.node()
//
val tid = sortid_sym(tok)
//
val s2td = t2dat_new(tid)
val s2t0 = S2Tbas(T2BASdat(s2td))
//
in
  the_sortenv_add(tid, S2TXTsrt(s2t0)); s2t0
end // end of [auxd1t0]
//
and
auxd1ts
( d1ts
: d1tsortlst): sort2lst =
(
  list_vt2t
  (list_map<d1tsort><sort2>(d1ts))
) where
{
implement
list_map$fopr<d1tsort><sort2>(d1t) = auxd1t0(d1t)
} (* end of [auxd1ts] *)
}
//
val () =
auxd1ts(d1ts, s2ts) where
{
fun
auxd1t0
( d1t0
: d1tsort
, s2t0: sort2): void = let
//
fun
loop
( s1cs
: s1rtconlst): void =
(
//
case+ s1cs of
|
list_nil() => ()
|
list_cons(s1c0, s1cs) =>
let
  val+
  S1RTCON
  (tok, opt) = s1c0.node()
  val sid = sexpid_sym(tok)
  val arg =
  (
  case+ opt of
  | None() => list_nil()
  | Some(s1t) =>
    (
    case+ s1t.node() of
    | S1Tlist(s1ts) =>
      trans12_sortlst(s1ts)
    | _(*non-S1Tlist*) =>
      list_sing(trans12_sort(s1t))
    ) : sort2lst // end of [val]
  )
  val
  s2t1 = S2Tfun(arg, s2t0)
  val
  s2c0 =
  s2cst_make_idst(tok, s2t1)
(*
val () =
println!("aux_datasort: tok = ", tok)
val () =
println!("aux_datasort: s2t1 = ", s2t1)
*)
in
  the_sexpenv_add_cst(s2c0); loop(s1cs)
end // end of [list_cons]
//
) (*case+*) // end of [loop]
//
in
let
val+
D1TSORT(tok, s1cs) = d1t0.node() in loop(s1cs)
end
end (*let*) // end of [auxd1t0]
//
and
auxd1ts
( d1ts
: d1tsortlst,
  s2ts: sort2lst): void =
(
case+ d1ts of
|
list_nil() => ()
|
list_cons(d1t0, d1ts) =>
let
val-
list_cons
(s2t0, s2ts) = s2ts
val () =
auxd1t0(d1t0, s2t0) in auxd1ts(d1ts, s2ts)
end // end of [list_cons]
) (*case+*) // end of [auxd1ts]
}
//
in
d2ecl_make_node(loc0, D2Cdatasort(d1cl, s2ts))
end (*let*) // end of [aux_datasort]

(* ****** ****** *)

fun
aux_excptcon
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cexcptcon
(knd, d1cs) = d1cl.node()
//
val s2c0 =
the_excptn_ctype.scst()
val svss = list_nil(*void*)
val d2cs =
trans12_datconlst(s2c0, svss, d1cs)
//
in
let val () =
the_dexpenv_add_cons(d2cs)
in
d2ecl_make_node(loc0, D2Cexcptcon(d1cl, d2cs))
end
end // end of [aux_excptcon]

(* ****** ****** *)

fun
aux_datatype
( d1cl
: d1ecl): d2ecl = let
//
val
loc0 = d1cl.loc()
val-
D1Cdatatype
( tok // datatype
, d1ts
, wd1cs) = d1cl.node()
//
val
s2cs =
trans12_datypelst
  (s2t, d1ts) where
{
val s2t =
(
case-
tok.node() of
| T_DATATYPE(knd) =>
if
sortlin(knd) = 0
then the_sort2_tbox
else the_sort2_vtbx):sort2
}
//
val () =
the_sexpenv_add_csts(s2cs)
//
val
d2cs = aux_wdeclseq(wd1cs)
//
val () =
aux2_datypelst(s2cs, d1ts)
//
in
d2ecl_make_node(loc0, D2Cdatatype(d1cl, s2cs))
end // end of [aux_datatype]

and
aux_wdeclseq
( wd1cs
: wd1eclseq): d2eclist =
(
case+ wd1cs of
|
WD1CSnone() => list_nil()
|
WD1CSsome(d1cs) => trans12_declist(d1cs)
) (* end of [aux_wdeclseq] *)

and
aux2_datype
( s2c0: s2cst
, d1t0: d1atype): void =
let
//
(*
val () =
println!
("aux2_datype: s2c0 = ", s2c0)
val () =
println!
("aux2_datype: d2cs = ", d2cs)
*)
in
  the_dexpenv_add_cons(d2cs)
end where
{
//
val+
D1ATYPE
( knd0, tmas
, res1, d1cs) = d1t0.node()
//
val svss = aux2_tmarglst(tmas)
//
val
(pf0|()) =
the_sexpenv_pushnil()
val (  ) =
the_sexpenv_add_svss(svss)
val d2cs =
trans12_datconlst
(s2c0, svss, d1cs(*d1atconlst*))
val (  ) =
the_sexpenv_popfree(pf0|(*void*))
val (  ) =
s2cst_set_d2conlst
(s2c0(*datype*), d2cs(*d2conlst*))
val () =
trans12_tag_d2conlst
(s2c0(*datype*), d2cs(*d2conlst*))
//
} (* end of [aux2_datype] *)

and
aux2_tmarg
(x0: t1marg): s2varlst =
let
//
val+
T1MARGlist(t1as) = x0.node()
//
in
//
list_vt2t
(
list_map<t1arg><s2var>(t1as)
) where
{
//
implement
list_map$fopr<t1arg><s2var>
  (t1a) = let
//
  val+
  T1ARGsome
  (s1t, opt) = t1a.node()
  val s2t = trans12_sort(s1t)
  val sym =
  (
  case+ opt of
  | None() => $SYM.symbol_nil
  | Some(tok) => sargid_sym(tok)
  ) : sym_t // end of [val]
//
in
  s2var_make_idst(sym, s2t)
end // end of [list_map$fopr]
//
} (* end of [where] *)
//
end // end of [aux2_tmarg]

and
aux2_tmarglst
(xs: t1marglst): s2varlstlst =
(
case+ xs of
|
list_nil() => list_nil()
|
list_cons(x0, xs) =>
list_cons(aux2_tmarg(x0), aux2_tmarglst(xs))
)

and
aux2_datypelst
( s2cs: s2cstlst
, d1ts: d1atypelst): void =
(
case+ s2cs of
|
list_nil() => ()
|
list_cons(s2c0, s2cs) =>
let
  val-
  list_cons(d1t0, d1ts) = d1ts
in
  let
  val () =
  aux2_datype(s2c0, d1t0) in aux2_datypelst(s2cs, d1ts)
  end
end // end of [let]
) (* end of [aux2_datypelst] *)

(* ****** ****** *)

fun
aux_dynconst
( d1cl
: d1ecl
) : d2ecl = let
//
val
loc0 = d1cl.loc()
//
val-
D1Cdynconst
( knd
, tqas
, d1cs) = d1cl.node()
//
val
tqas =
trans12_tqarglst(tqas)
//
val
(pf0|()) =
the_sexpenv_pushnil((*void*))
//
local
fun
loop
(xs: tq2arglst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  loop(xs)) where
{
val () =
the_sexpenv_add_s2vs
( x0.s2vs((*void*)) )
} (*where*)
) (* end of [loop] *)
in
val ((*void*)) = loop(tqas)
end // end of [local]
//
val
d2cs =
aux_dcstdeclist(knd, tqas, d1cs)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val
((*void*)) =
the_dexpenv_add_csts(d2cs)
//
in
d2ecl_make_node
(loc0, D2Cdynconst(knd, tqas, d2cs))
end // end of [aux_dynconst]

and
aux_dcstdecl
( knd
: token
, tqas
: tq2arglst
, d1cl
: d1cstdecl): d2cst = let
//
val+D1CSTDECL(rcd) = d1cl
//
val (pf0|()) =
the_sexpenv_pushnil((*void*))
//
val
s2e0 =
auxarg1
(d1cl, 0, rcd.arg, rcd.res)
val ((*void*)) =
//
the_sexpenv_popfree( pf0 | (*void*) )
//
(*
val () =
println!
("aux_dcstdecl: knd = ", knd)
val () =
println!
("aux_dcstdecl: d1cl = ", d1cl)
val () =
println!
("aux_dcstdecl: tqas = ", tqas)
val () =
println!
("aux_dcstdecl: s2e0 = ", s2e0)
*)
//
(*
val () =
let
val
def1 = rcd.def
in
println!
("aux_dcstdecl: def1 = ", def1)
end // end of [val'
*)
//
fun
d2cxnam
( d2c0
: d2cst
, def1
: teqd1expopt): void =
(
case+ def1 of
|
TEQD1EXPnone
((*void*)) => ()
|
TEQD1EXPsome
(teq1, d1e2) =>
(
case+
d1e2.node() of
|
D1Eextnam(gnm) =>
let
val
xnam = X2NAMsome(gnm)
in
d2cst_set_xnam(d2c0, xnam)
end
| _(* non-D1Eextnam *) => ()
)
) (* end of [d2cxnam] *)
//
in
let
//
val nam = rcd.nam
val knd = knd.node()
//
val
d2c0 =
d2cst_make_idtp
(nam, knd, tqas, s2e0)
//
in
let
val () =
d2cxnam(d2c0, rcd.def) in d2c0
end
end
end // end of [aux_dcstdecl]

and
auxsid
( tok0
: token): s2exp =
let
//
val sid =
sexpid_sym(tok0)
val s1e0 =
s1exp_make_node
( tok0.loc()
, S1Eid0(sid)) in trans12_sexp_ci(s1e0)
end // end of [auxsid]

and
auxres0
( d1cl
: d1cstdecl
, res0
: effs1expopt): s2exp =
(
case+ res0 of
| EFFS1EXPnone
    () =>
  (
    the_s2exp_none0(*void*)
  )
| EFFS1EXPsome
    (s1e) => trans12_sexp(s1e)
  // EFFS1EXPsome
(*
| EFFS1EXPsome
    (s1f, s1e) => trans12_sexp(s1e)
  // EFFS1EXPsome
*)
) (* end of [auxres0] *)

and
auxarg1
( d1cl
: d1cstdecl
, nfc0: int
, d1as: d1arglst
, res0: effs1expopt): s2exp =
(
case+ d1as of
| list_nil() =>
  auxres0(d1cl, res0)
| list_cons(d1a0, d1as) =>
  auxarg2(d1cl, nfc0, d1a0, d1as, res0)
)

and
auxarg2
( d1cl
: d1cstdecl
, nfc0: int
, d1a0: d1arg
, d1as: d1arglst
, res0: effs1expopt): s2exp =
(
case+
d1a0.node() of
|
D1ARGsome_sta(s1qs) =>
let
//
  var s2vs_
    : s2varlst_vt =
    list_vt_nil(*void*)
  var s2ps_
    : s2varlst_vt =
    list_vt_nil(*void*)
  val ((*void*)) =
  trans12_squalst(s1qs, s2vs_, s2ps_)
//
in
let
val
s2vs =
list_vt2t
(list_vt_reverse(s2vs_))
val
s2ps =
list_vt2t
(list_vt_reverse(s2ps_))
val
s2e0 =
auxarg1
( d1cl
, nfc0+0
, d1as, res0) in s2exp_uni(s2vs, s2ps, s2e0)
end
end // end of [D1ARGsome_sta]
|
D1ARGsome_dyn1(tok0) =>
(*
let
//
val npf = ~1
//
val fc2 =
(
  if
  nfc0 <= 0
  then FC2fun() else FC2cloref
) : funclo2
//
val s2es =
  list_sing(auxsid(tok0))
val s2e0 =
  auxarg1(d1cl, nfc0+1, d1as, res0)
in
  s2exp_fun_full(fc2, npf, s2es, s2e0)
end // end of [let]
*)
let
  val npf = ~1
  val s2es = list_sing(auxsid(tok0))
in
  auxarg3(d1cl, nfc0, npf, s2es, d1as, res0)
end
|
D1ARGsome_dyn2(arg0, opt1) =>
let
//
  var npf: int = ~1
//
  val s2es =
  trans12_atyplst(arg0)
//
  val s2es =
  (
  case+ opt1 of
  | None() => s2es
  | Some(arg1) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () =
        (npf := list_length(s2es))
      val s2es1 = s2es
      val s2es2 = trans12_atyplst(arg1)
    }
  ) : s2explst // end-of-val
//
in
  auxarg3(d1cl, nfc0, npf, s2es, d1as, res0)
end
) (* end of [auxarg2]  *)

and
auxarg3
( d1cl
: d1cstdecl
, nfc0: int
, npf0: int
, s2es: s2explst
, d1as: d1arglst
, res0: effs1expopt): s2exp =
(
case+ d1as of
|
list_nil() =>
let
  val fc2 =
  ( if
    nfc0 <= 0
    then FC2fun()
    else FC2cloref ) : funclo2
(*
  val eff =
  (
  case+ res0 of
  | EFFS1EXPnone
    ((*void*)) => S2EFFnil()
  | EFFS1EXPsome
    (s1f, s1e) => trans12_seff(s1f)
  ) : s2eff // end of [val]
*)
  val s2e0 =
  (
  case+ res0 of
  | EFFS1EXPnone
      () =>
    (
      the_s2exp_none0(*void*)
    )
  | EFFS1EXPsome
      (s1e) => trans12_sexp(s1e)
    // EFFS1EXPsome
(*
  | EFFS1EXPsome
      (s1f, s1e) => trans12_sexp(s1e)
    // EFFS1EXPsome
*)
  ) : s2exp // end of [val]
in
  s2exp_fun_full(fc2, npf0, s2es, s2e0)
end
|
list_cons _ =>
let
  val fc2 =
  ( if
    nfc0 <= 0
    then FC2fun()
    else FC2cloref ) : funclo2
(*
  val eff = S2EFFnil()
*)
  val s2e0 =
    auxarg1(d1cl, nfc0+1, d1as, res0)
  // end of [val]
in
  s2exp_fun_full(fc2, npf0, s2es, s2e0)
end
)

and
aux_dcstdeclist
( knd
: token
, tqas
: tq2arglst
, d1cs
: d1cstdeclist): d2cstlst =
list_vt2t
(
list_map<d1cstdecl><d2cst>(d1cs)
) where
{
implement
list_map$fopr<d1cstdecl><d2cst>(d1c) = aux_dcstdecl(knd, tqas, d1c)
} (* end of [aux_dcstdeclist] *)

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_decl
  (d1cl) = let
//
val
loc0 = d1cl.loc()
//
(*
val () =
println!
("trans12_decl: loc0 = ", loc0)
val () =
println!
("trans12_decl: d1cl = ", d1cl)
*)
//
in (* in-of-let *)
//
case-
d1cl.node() of
//
| D1Cnone0( ) => d2ecl_none1(d1cl)
| D1Cnone1(_) => d2ecl_none1(d1cl)
//
| D1Cd0ecl(_) =>
  d2ecl_make_node(loc0, D2Cd1ecl(d1cl))
//
|
D1Cstatic
(tok, d1c) =>
let
val d2c = trans12_decl(d1c)
in
d2ecl_make_node(loc0, D2Cstatic(tok, d2c))
end
|
D1Cextern
(tok, d1c) =>
let
val d2c = trans12_decl(d1c)
in
d2ecl_make_node(loc0, D2Cextern(tok, d2c))
end
//
| D1Cdefine _ => aux_define(d1cl)
//
|
D1Clocal
(head, body) => let
val
(pf1|()) =
the_trans12_pushnil()
val head = trans12_declist(head)
val
(pf2|()) =
the_trans12_pushnil()
val body = trans12_declist(body)
val ((*void*)) =
the_trans12_locjoin(pf1, pf2 | (*none*))
in
d2ecl_make_node(loc0, D2Clocal(head, body))
end // end of [D1Clocal]
//
| D1Cinclude _ => aux_include(d1cl)
//
| D1Cstaload _ => aux_staload(d1cl)
//
| D1Cabssort _ => aux_abssort(d1cl)
//
| D1Cstacst0 _ => aux_stacst0(d1cl)
//
| D1Csortdef _ => aux_sortdef(d1cl)
//
| D1Csexpdef _ => aux_sexpdef(d1cl)
//
| D1Cabstype _ => aux_abstype(d1cl)
| D1Cabsopen _ => aux_absopen(d1cl)
| D1Cabsimpl _ => aux_absimpl(d1cl)
//
| D1Csymload _ => aux_symload(d1cl)
//
| D1Cdatasort _ => aux_datasort(d1cl)
//
| D1Cexcptcon _ => aux_excptcon(d1cl)
| D1Cdatatype _ => aux_datatype(d1cl)
//
| D1Cdynconst _ => aux_dynconst(d1cl)
//
| D1Cvaldclst _ => aux_valdclst(d1cl)
| D1Cvardclst _ => aux_vardclst(d1cl)
//
| D1Cfundclst _ => aux_fundclst(d1cl)
//
| D1Cimplmnt0 _ => aux_implmnt0(d1cl)
//
(* ****** ****** *)
//
| D1Cthen0
(   d1cls   ) =>
(
  d2ecl_make_node
  (d1cl.loc(), D2Cdclst(d2cls)))
where
{
  val d2cls = trans12_declist(d1cls)
}(*where*) // end-of-[D1Cthen0(d1cls)]
//
| D1Celse1
(   d1cls   ) =>
(
  d2ecl_make_node
  (d1cl.loc(), D2Cdclst(d2cls))
) where
{
  val d2cls = trans12_declist(d1cls)
}(*where*) // end-of-[D1Celse1(d1cls)]
//
(* ****** ****** *)
//
|D1Cifexp
( gexp
, dthn
, dels, dend) =>
let
//
val loc0 = d1cl.loc()
//
(*
val (  ) =
println!
("trans12_decl: loc0 = ", loc0)
val (  ) =
println!
("trans12_decl: d1cl = ", d1cl)
*)
//
val
test = g1exp_eval(gexp)
val
test = 
(
case+ test of
|
G1Vbtf
(test) => test | _ => false
) : bool//end-of-[val(test)]
//
in//let
//
if
test
then
(
case+ dthn of
|None() =>
d2ecl_dclst_nil(loc0)
|Some(dcl1) =>trans12_decl(dcl1))
else
(
case+ dels of
|None() =>
d2ecl_dclst_nil(loc0)
|Some(dcl1) => trans12_decl(dcl1))//if
//
end(*let*) // end-of-[D1Cifexp(gexp,...)]
//
(* ****** ****** *)
//
| _(*rest-of-D1ECL*) => d2ecl_none1(d1cl)
//
end // end of [trans12_decl(d1cl)]

end // end of [local(implement(trans12_decl))]

(* ****** ****** *)

implement
trans12_declist
  (d1cs) =
list_vt2t
(
list_map<d1ecl><d2ecl>(d1cs)
) where
{
implement
list_map$fopr<d1ecl><d2ecl>(d1c) = trans12_decl(d1c)
} (* end of [trans12_declist] *)

(* ****** ****** *)

(*
datatype
d1atcon_node =
| D1ATCON of
  (s1unilst, token, s1exp, s1expopt) 
*)
local

(* ****** ****** *)

fun
auxarg
( opt
: s1expopt
, npf
: &int >> _
) : s2explst =
(
case+ opt of
|
None() =>
list_nil()
|
Some(s1e0) =>
(
case+
s1e0.node() of
| S1El1st(s1es) =>
  trans12_sexplst(s1es)
| S1El2st(xs1, xs2) =>
  (
    s2es1 + s2es2
  ) where
  {
    val () = (npf := length(xs1))
    val s2es1 = trans12_sexplst(xs1)
    val s2es2 = trans12_sexplst(xs2)
  }
| _(*non-S1Elist*) =>
    list_sing(trans12_sexp(s1e0))
)
) (* end of [auxarg] *)

fun
auxind
( svss
: s2varlstlst
, s1is: s1explst
) : s2explstlst =
(
case+ s1is of
| list_nil _ => auxsvss(svss)
| list_cons _ => auxs1is(s1is)
) (* end of [auxind] *)

and
auxsvs
( s2vs
: s2varlst
) : s2explst =
list_vt2t
(
list_map<s2var><s2exp>(s2vs)
) where
{
implement
list_map$fopr<
  s2var><s2exp>(s2v) = s2exp_var(s2v)
} (* end of [auxsvs] *)

and
auxsvss
( svss
: s2varlstlst
) : s2explstlst =
(
case+ svss of
| list_nil() =>
  list_nil()
| list_cons(s2vs, svss) =>
  list_cons(auxsvs(s2vs), auxsvss(svss))
) (* end of [auxsvss] *)

and
auxs1is
( s1is
: s1explst
) : s2explstlst =
(
case+ s1is of
| list_nil() =>
  list_nil(*void*)
| list_cons(s1i0, s1is) =>
  (
  case+
  s1i0.node() of
  | S1El1st(s1es) =>
    (
    list_cons(s2es, auxs1is(s1is))
    ) where
    {
      val s2es = trans12_sexplst(s1es)
    }
  | S1El2st(xs1, xs2) =>
    (
    list_cons
    (s2es1 + s2es2, auxs1is(s1is))
    ) where
    {
      val s2es1 = trans12_sexplst(xs1)
      val s2es2 = trans12_sexplst(xs2)
    }
  | _(* non-S1Elist *) =>
    let
      val s2e0 = trans12_sexp(s1i0)
    in
      list_cons
      (list_sing(s2e0), auxs1is(s1is))
    end // end of [non-S1Elist]
  )
) (* end of [auxs1is] *)

fun
auxres
( loc0: loc_t
, s2e0: s2exp
, sess: s2explstlst
) : s2exp =
(
case+ sess of
|
list_nil() => s2e0
|
list_cons
(s2es, sess) =>
(
  auxres(loc0, s2e0, sess)
) where
{
  val
  s2e0 =
  s2exp_apps(loc0, s2e0, s2es)
}
) (* end of [auxres] *)

in (* in-of-local *)

implement
trans12_datcon
( s2c0
, tqas
, svss, d1cl) =
let
//
val (pf0|()) =
the_sexpenv_pushnil()
val s2e0 = auxuni(s1us)
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
d2con_make_idtp(tok0, tqas, s2e0)
end where
{
//
val+
D1ATCON
( s1us
, tok0
, s1is
, argopt) =
d1cl.node((*void*))
//
(*
val () =
println!
("trans12_datcon: tok0 = ", tok0)
*)
//
val loc0 = tok0.loc()
//
(*
val () =
println!
("trans12_datcon: s2us = ", s2us)
*)
//
fun
auxuni
(s1us: s1unilst): s2exp =
(
case+ s1us of
| list_nil() =>
  let
//
    var npf: int = ~1
//
    val ind =
      auxind(svss, s1is)
    val arg =
      auxarg(argopt, npf)
//
    val s2e0 =
      s2exp_cst(s2c0)
    val s2e0 =
      auxres(loc0, s2e0, ind)
//
  in
    s2exp_fun_nil(npf, arg, s2e0)
  end // end of [list_nil]
| list_cons(s1u0, s1us) =>
  let
//
    var s2vs_
      : s2varlst_vt = list_vt_nil()
    var s2ps_
      : s2explst_vt = list_vt_nil()
//
    val+S1UNIsome(s1qs) = s1u0.node()
//
    val () =
    trans12_squalst(s1qs, s2vs_, s2ps_)
//
  in
    let
      val s2vs =
      list_vt2t(list_vt_reverse(s2vs_))
      val s2ps =
      list_vt2t(list_vt_reverse(s2ps_))
    in
      s2exp_uni(s2vs, s2ps, auxuni(s1us))
    end // end of [let]
  end
)
//
} (*where*) // end of [trans12_datcon]

end // end of [local]

(* ****** ****** *)

local

fun
auxs2vs
( s2vs
: s2varlst): s2varlst =
(
case+
s2vs of
|
list_nil() =>
list_nil()
|
list_cons(x0, s2vs) =>
(
if
s2var_is_nil(x0)
then auxs2vs(s2vs)
else
list_cons(x0, auxs2vs(s2vs))
)
) (* end of [auxs2vs] *)

fun
auxtqas
( s2c0
: s2cst
, svss
: s2varlstlst): tq2arglst =
(
case+
svss of
|
list_nil() => list_nil()
|
list_cons
(s2vs, svss) =>
(
case s2vs of
|
list_nil _ =>
(
  auxtqas(s2c0, svss)
)
|
list_cons _ =>
let
val
s2vs = auxs2vs(s2vs)
val
tqa0 =
tq2arg_make(s2c0.loc(), s2vs)
in
list_cons(tqa0, auxtqas(s2c0, svss))  
end // end of [let]
)
) (* end of [auxtqas] *)

in(*in-of-local*)

implement
trans12_datconlst
(s2c0, svss, d1cs) =
list_vt2t
(
list_map<d1atcon><d2con>(d1cs)
) where
{
//
val tqas = auxtqas(s2c0, svss)
//
implement
list_map$fopr<
  d1atcon><d2con>(d1c) =
  trans12_datcon(s2c0, tqas, svss, d1c)
//
} (* end of [trans12_datconlst] *)

end // end of [local]

(* ****** ****** *)

implement
trans12_atyp(x0) =
(
  trans12_sexp_ci(s1e)
) where
{
//
val+
A1TYPsome
(s1e, opt) = x0.node()
//
} (* end of [trans12_atyp] *)

implement
trans12_atyplst
  (xs) =
list_vt2t
(
list_map<a1typ><s2exp>(xs)
) where
{
//
implement
list_map$fopr<a1typ><s2exp>(a1t) = trans12_atyp(a1t)
//
} (* trans12_atyplst *)

(* ****** ****** *)

implement
trans12_qarg(q1a) =
(
case+
q1a.node() of
|
Q1ARGsome(x0, opt) =>
let
//
val
opt = trans12_sortopt(opt)
//
val s2t =
(
case+ opt of
| Some(s2t) => s2t
| None((*void*)) => S2Tnone0()
) : sort2 // end of [val]
//
in
//
  let
    val
    sid = sexpid_sym(x0)
  in
    s2var_make_idst(sid, s2t)
  end
//
end // end of [trans12_qarg]
)

implement
trans12_qarglst
  (q1as) =
list_vt2t
(
list_map<q1arg><s2var>
  (q1as) where
{
implement
list_map$fopr<q1arg><s2var>(q1a) = trans12_qarg(q1a)
}
) (* end of [trans12_qarglst] *)

(* ****** ****** *)

implement
trans12_sqarg
  (sq1a) = let
//
val loc0 = sq1a.loc()
//
val-
SQ1ARGsome(q1as) = sq1a.node()
//
val s2vs = trans12_qarglst(q1as)
//
in
  sq2arg_make(loc0, s2vs)
end // end of [trans12_sqarg]

implement
trans12_sqarglst
  (sqas) =
list_vt2t(sqas) where
{
val
sqas =
list_map<sq1arg><sq2arg>
  (sqas) where
{
implement
list_map$fopr<sq1arg><sq2arg>(sqa) = trans12_sqarg(sqa)
}
} (* end of [trans12_sqarglst] *)

(* ****** ****** *)
//
implement
trans12_tqarg
  (tq1a) = let
//
val loc0 = tq1a.loc()
//
val-
TQ1ARGsome(q1as) = tq1a.node()
//
val s2vs = trans12_qarglst(q1as)
//
in
  tq2arg_make(loc0, s2vs)
end // end of [trans12_tqarg]
//
implement
trans12_tqarglst
  (tqas) =
list_vt2t
(
list_map<tq1arg><tq2arg>(tqas)
) where
{
implement
list_map$fopr<tq1arg><tq2arg>(tqa) = trans12_tqarg(tqa)
} (* end of [trans12_tqarglst] *)
//
(* ****** ****** *)
//
implement
trans12_tiarg
  (ti1a) = let
//
val
loc0 = ti1a.loc()
//
val-
TI1ARGsome
  (s1es) = ti1a.node()
//
val s2es = trans12_sexplst(s1es)
//
in
  ti2arg_make(loc0, s2es)
end // end of [trans12_tiarg]
//
implement
trans12_tiarglst
  (tias) =
list_vt2t
(
list_map<ti1arg><ti2arg>(tias)
) where
{
implement
list_map$fopr<ti1arg><ti2arg>(tia) = trans12_tiarg(tia)
} (* end of [trans12_tiarglst] *)
//
(* ****** ****** *)

(* end of [xats_trans12_dynexp.dats] *)
