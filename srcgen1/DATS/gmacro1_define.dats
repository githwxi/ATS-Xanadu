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
// Start Time: October, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2020-10-04:
// For macros that may potentially
// result in capturing of variables.
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
//
implement
fprint_val<sym_t>
( out, sym ) =
fprint_symbol(out, sym)
//
implement
fprint_val<g1mac>
( out, g1m ) =
(
  fprint_g1mac(out, g1m)
)
//
(* ****** ****** *)
abstype g1mid_tbox = ptr
(* ****** ****** *)
typedef g1mid = g1mid_tbox
typedef g1mas = List0(g1mid)
(* ****** ****** *)
abstbox g1menv_tbox = ptr
typedef g1menv = g1menv_tbox
(* ****** ****** *)
//
datatype g1mac =
//
| G1Mid0 of g1mid
//
| G1Mint of int
| G1Mbtf of bool
| G1Mchr of char
| G1Mstr of string
//
| G1Mif0 of
  ( g1mac(*cond*)
  , g1mac(*then*)
  , g1mac(*else*) )
//
| G1Mlam0 of
  ( g1mas(*marg*)
  , g1mac(*body*) )
//
| G1Mapps of
  ( g1mac(*fun*)
  , g1maclst(*args*))
//
| G1Msubs of
  ( g1mac, g1menv )
//
| G1Msexp of (s1exp)
| G1Mdpat of (d1pat)
| G1Mdexp of (d1exp)
//
| G1Mnone0 of () // HX: EMPTY
//
| G1Mnone1 of (g1exp) // ERROR!
//
where g1maclst = List0(g1mac) // lists
//
(* ****** ****** *)
absimpl g1mid_tbox = sym_t
(* ****** ****** *)
absimpl g1mac_tbox = g1mac
(* ****** ****** *)
//
implement
print_g1mac
(g1m) =
fprint_g1mac(stdout_ref, g1m)
//
(* ****** ****** *)
//
implement
fprint_g1mac(out, g1m0) =
let
implement
fprint_val<g1mac> = fprint_g1mac
in
//
case+ g1m0 of
|
G1Mid0(x0) =>
fprint!(out, "G1Mid0(", x0, ")")
//
|
G1Mint(i0) =>
fprint!(out, "G1Mint(", i0, ")")
|
G1Mbtf(b0) =>
fprint!(out, "G1Mbtf(", b0, ")")
|
G1Mchr(c0) =>
fprint!(out, "G1Mchr(", c0, ")")
|
G1Mstr(cs) =>
fprint!(out, "G1Mstr(", cs, ")")
//
|
G1Mif0
( g1m1
, g1m2, g1m3) =>
fprint!
( out
, "G1Mif0("
, g1m1, "; ", g1m2, "; ", g1m3, ")")
//
|
G1Mlam0
(gmas, g1m1) =>
fprint!
( out
, "G1Mlam0(", gmas, "; ", g1m1, ")")
|
G1Mapps
(g1f0, g1ms) =>
fprint!
( out
, "G1Mapps(", g1f0, "; ", g1ms, ")")
//
|
G1Msubs
(g1m1, subs) =>
fprint!
( out
, "G1Msubs(", g1m1, "; ", "...", ")")
//
|
G1Msexp(s1e1) =>
fprint!( out, "G1Msexp(", s1e1, ")" )
|
G1Mdpat(d1p1) =>
fprint!( out, "G1Mdpat(", d1p1, ")" )
|
G1Mdexp(d1e1) =>
fprint!( out, "G1Mdexp(", d1e1, ")" )
//
| G1Mnone0() =>
  fprint!(out, "G1Mnone0()")
| G1Mnone1(g1e1) =>
  fprint!(out, "G1Mnone1(", g1e1, ")")
//
end (*let*) // end of [fprint_g1mac]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxarg0
( g1a0
: g1arg): g1mid =
(
case-
g1a0.node() of
//
|
T_IDENT_alp(nm) => symbol_make(nm)
|
T_IDENT_sym(nm) => symbol_make(nm)
//
) (* end of [auxarg] *)
and
auxargs
( g1as
: g1arglst): g1mas =
list_vt2t
(
list_map<
g1arg><g1mid>(g1as)) where
{ implement
  list_map$fopr<
  g1arg><g1mid>(g1a) = auxarg0(g1a)
} (*where*) // end of [auxargs]

(* ****** ****** *)

fun
auxmarg
(g1ma: g1marg): g1mas =
(
case-
g1ma.node() of
(*
| G1MARGsarg(g1as) => list_nil()
*)
| G1MARGdarg(g1as) => auxargs(g1as)
) (* end of [auxmarg] *)

(* ****** ****** *)

fun
auxg1e0
( g1e0
: g1exp )
: g1mac =
(
case+
g1e0.node() of
|
G1Eid0(gid) =>
G1Mid0(gid)
|
G1Eint(tok) =>
(
G1Mint(int)) where
{
(*
HX-2022-06-06:
Note that [g1mac]
can be used in statics
*)
val int = token2sint(tok)
}
//
|
G1Echr(tok) =>
(
G1Mchr(chr)) where
{
val chr = token2schr(tok)
}
//
|
G1Estr(tok) =>
(
G1Mstr(str)) where
{
val str = token2sstr(tok)
}
//
|
G1Eif0
(g1e1,
 g1e2, g1e3) =>
let
val g1m1 = auxg1e0(g1e1)
val g1m2 = auxg1e0(g1e2)
val g1m3 = auxg1e0(g1e3)
in
  G1Mif0(g1m1, g1m2, g1m3)
end
//
|
G1Eapp1
(g1f0, g1e1) =>
let
  val
  g1f0 =
  auxg1e0(g1f0)
in
  G1Mapps(g1f0, g1ms) where
{
val
g1ms =
(
case+
g1e1.node() of
| G1Elist(g1es) =>
  auxg1es(g1es)
| _ (*non-G1Elist*) =>
  let
  val g1m1 =
  auxg1e0(g1e1) in list_sing(g1m1)
  end
)
}
end // end of [G1Eapp1]
|
G1Eapp2
(g1f0, g1e1, g1e2) =>
let
  val
  g1f0 = auxg1e0(g1f0)
  val
  g1e1 = auxg1e0(g1e1)
  val
  g1e2 = auxg1e0(g1e2)
in
G1Mapps
(g1f0, list_pair(g1e1, g1e2))
end
|
G1Enone0((*void*)) => G1Mnone0()
|
_ (*rest-of-g1exp*) => G1Mnone1(g1e0)
)
and
auxg1es
( g1es
: g1explst): g1maclst =
list_vt2t
(
list_map<g1exp><g1mac>(g1es) where
{
implement
list_map$fopr<g1exp><g1mac>(g1e) = auxg1e0(g1e)
}
) (* end of [auxg1es] *)

(* ****** ****** *)

fun
auxgmas
( gmas
: g1marglst
, def1: g1mac): g1mac =
(
case+ gmas of
|
list_nil
((*void*)) => def1
|
list_cons
(g1ma, gmas) =>
let
  val
  args = auxmarg(g1ma)
in
G1Mlam0
(args, auxgmas(gmas, def1))
end // list_cons
) (* end of [auxgmas] *)

(* ****** ****** *)

in(*in-of-local*)

implement
trans11_g1mdef
( gmas, def1 ) =
auxgmas(gmas, def1) where
{
//
val def1 =
(
case+ def1 of
| Some(g1e1) =>
  auxg1e0(g1e1)
| None((*void*)) => G1Mnone0()
) : g1mac // end-of-val
//
} (* end of [trans11_g1mdef] *)

end // end of [local]

(* ****** ****** *)

implement
trs1exp_gmac(s1e0) =
let
//
val () =
println!
("trs1exp_gmac: s1e0 = ", s1e0)
//
in
  G1Msexp(s1e0)
end (* end of [trs1exp_gmac] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxid0
( d1e0
: d1exp): g1mac =
let
val-
D1Eid0
( tok ) = d1e0.node()
in
  G1Mid0(dexpid_sym(tok))
end // end of [auxid0]

(* ****** ****** *)

fun
auxint
( d1e0
: d1exp): g1mac =
(
G1Mint(int)) where
{
val-
D1Eint
( tok ) = d1e0.node()
val
int =
(
case-
tok.node() of
|
T_INT1(rep) => g0string2int(rep)
) : int // end-of-val
} (* end of [auxint] *)

(* ****** ****** *)

in(* in-of-local *)

implement
trd1exp_gmac(d1e0) =
let
//
val () =
println!
("trd1exp_gmac: d1e0 = ", d1e0)
//
in
//
case+
d1e0.node() of
| D1Eid0 _ => auxid0(d1e0)
| D1Eint _ => auxint(d1e0)
//
|
_(*rest-of-d1exp*) => G1Mdexp(d1e0)
//
end (* end of [trd1exp_gmac] *)

end // end of [local]

(* ****** ****** *)

static
fun
g1menv_nil(): g1menv
static
fun
g1menv_extend
( kxs
: g1menv
, k0:g1mid, x0:g1mac): g1menv
static
fun
g1menv_extends
( kxs
: g1menv
, ks: g1mas, xs: g1maclst): g1menv
static
fun
g1menv_search_opt
( kxs
: g1menv
, key: g1mid): Option_vt(g1mac)

(* ****** ****** *)

local

absimpl
g1menv_tbox =
List0(@(g1mid, g1mac))

in (* in-of-local *)

implement
g1menv_nil
((*void*)) = list_nil()

implement
g1menv_extend
(kxs, k0, x0) =
list_cons(@(k0, x0), kxs)

implement
g1menv_extends
(kxs, ks, xs) =
(
case+ ks of
|
list_nil() => kxs
|
list_cons(k0, ks) =>
(
case+ xs of
|
list_nil() =>
let
val x0 = G1Mnone0()
val kxs =
g1menv_extend(kxs, k0, x0)
in
g1menv_extends(kxs, ks, xs)
end
|
list_cons(x0, xs) =>
let
val kxs =
g1menv_extend(kxs, k0, x0)
in
g1menv_extends(kxs, ks, xs)
end
)
) (* end of [g1menv_extends] *)


implement
g1menv_search_opt
(kxs, key) =
auxlst(kxs) where
{
fun
auxlst
(kxs: g1menv): Option_vt(g1mac) =
(
case+ kxs of
|
list_nil() => None_vt()
|
list_cons(kx0, kxs) =>
if
(key = kx0.0)
then Some_vt(kx0.1) else auxlst(kxs)
) (* end of [auxlst] *)
} (* end of [g1menv_search_opt] *)

end // end of [local]

(* ****** ****** *)
//
static
fun
trans11_g1mac_subs
(body: g1mac, env0: g1menv): g1mac
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
isIOP1
( opnm
: sym_t
, g1f0
: g1mac
, g1ms
: g1maclst): bool =
(
case+ g1f0 of
|
G1Mid0(sym0) =>
(
if
(
opnm != sym0
)
then false else
(
case+ g1ms of
|
list_nil() => false
|
list_cons(g1m1, g1ms) =>
(
case+ g1m1 of
| G1Mint _ => true
| _ (*non-G1Mint*) => false
)
)
) (*if*) // end of [G1Mid0]
//
| _ (*non-G1Mid0*) => false)

(* ****** ****** *)

fun
isIOP2
( opnm
: sym_t
, g1f0
: g1mac
, g1ms
: g1maclst): bool =
(
case+ g1f0 of
|
G1Mid0(sym0) =>
(
if
(
opnm != sym0
)
then false else
(
case+ g1ms of
|
list_nil() => false
|
list_cons(g1m1, g1ms) =>
(
case+ g1ms of
|
list_nil() => false
|
list_cons(g1m2, g1ms) =>
(
case+ g1m1 of
|
G1Mint _ =>
(
case+ g1m2 of
| G1Mint _ => true
| _ (*non-G1Mint*) => false
)
| _ (*non-G1Mint*) => false
)
)
)
) (*if*) // end of [G1Mid0]
//
| _ (*non-G1Mid0*) => false)

(* ****** ****** *)
//
fun
isINEG
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP1(SUB_symbol, g1f0, g1ms)
//
(* ****** ****** *)
//
fun
isIADD
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(ADD_symbol, g1f0, g1ms)
fun
isISUB
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(SUB_symbol, g1f0, g1ms)
fun
isIMUL
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(MUL_symbol, g1f0, g1ms)
fun
isIDIV
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(DIV_symbol, g1f0, g1ms)
(*
fun
isIMOD
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(MOD_symbol, g1f0, g1ms)
*)
//
(* ****** ****** *)
//
fun
isILT
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(LT_symbol, g1f0, g1ms)
fun
isIGT
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(GT_symbol, g1f0, g1ms)
fun
isIEQ
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(EQ_symbol, g1f0, g1ms)
//
fun
isILTE
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(LTEQ_symbol, g1f0, g1ms)
fun
isIGTE
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(GTEQ_symbol, g1f0, g1ms)
fun
isIEQ2
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(EQEQ_symbol, g1f0, g1ms)
fun
isINEQ
( g1f0
: g1mac
, g1ms
: g1maclst): bool =
isIOP2(BANGEQ_symbol, g1f0, g1ms)
//
(* ****** ****** *)
//
fun
auxg1m0
( g1m0
: g1mac)
: g1mac =
(
//
case+ g1m0 of
//
| G1Mint _ => g1m0
| G1Mbtf _ => g1m0
| G1Mstr _ => g1m0
//
| G1Msexp _ => g1m0
| G1Mdexp _ => g1m0
//
| G1Mid0 _ => auxgmid(g1m0)
//
| G1Mif0 _ => auxcond(g1m0)
//
| G1Mapps _ => auxapps(g1m0)
//
| _(*rest-of-g1mac*) => g1m0
//
)
//
and
auxg1ms
( g1ms
: g1maclst
)
: g1maclst =
(
list_vt2t
(list_map<g1mac><g1mac>(g1ms))
) where
{
implement
list_map$fopr<
  g1mac><g1mac>(g1m) = auxg1m0(g1m)
} (* end of [auxg1ms] *)
//
(* ****** ****** *)
//
and
auxgmid
( g1m0
: g1mac): g1mac =
let
val-
G1Mid0(sym) = g1m0
val
opt =
the_gmacenv_find(sym)
in
case+ opt of
|
~None_vt() => g1m0
|
~Some_vt(g1m0) => auxg1m0(g1m0)
end // end of [auxgmid]
//
(* ****** ****** *)
//
and
auxcond
( g1m0
: g1mac): g1mac =
let
//
val-
G1Mif0
( g1m1
, g1m2, g1m3) = g1m0
//
val
g1m1 =
auxg1m0(g1m1)
//
in
//
case+
g1m1 of
//
|
G1Mbtf(btf) =>
if
btf
then auxg1m0(g1m2)
else auxg1m0(g1m3)
//
|
G1Mint(int) =>
if
(int != 0)
then auxg1m0(g1m2)
else auxg1m0(g1m3)
//
|
G1Mstr(str) =>
if
(str != "")
then auxg1m0(g1m2)
else auxg1m0(g1m3)
//
| _ (*non-redex*) =>
(
  G1Mif0(g1m1, g1m2, g1m3)
)
//
end // end of [auxcond]
//
(* ****** ****** *)
//
and
auxapps
( g1m0
: g1mac): g1mac =
let
//
val-
G1Mapps
(g1f0, g1ms) = g1m0
//
in
  auxapps_1(g1f0, g1ms)
end
//
and
auxapps_2
( g1f0
: g1mac
, g1ms
: g1maclst
) : g1mac =
(
case+ g1f0 of
|
G1Mlam0
(gmas, body) =>
(
trans11_g1mac_subs(body, env0)
) where
{
  val env0 =
  g1menv_nil((*void*))
  val env0 =
  g1menv_extends(env0, gmas, g1ms)
}
| _(*non-G1Mlam*) => G1Mapps(g1f0, g1ms)
)
//
and
auxapps_1
( g1f0
: g1mac
, g1ms
: g1maclst
) : g1mac =
let
//
val g1f0 = auxg1m0(g1f0)
val g1ms = auxg1ms(g1ms)
//
in
ifcase
//
|
isILT(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 < i2)
end // end of [isILT]
|
isIGT(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 > i2)
end // end of [isIGT]
|
isIEQ(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 = i2)
end // end of [isIEQ]
//
|
isILTE(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 <= i2)
end // end of [isILTE]
|
isIGTE(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 >= i2)
end // end of [isIGTE]
|
isINEQ(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mbtf(i1 != i2)
end // end of [isINEQ]
//
|
isIADD(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mint(i1 + i2)
end // end of [isIADD]
//
|
isISUB(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mint(i1 - i2)
end // end of [isISUB]
//
|
isIMUL(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mint(i1 * i2)
end // end of [isIMUL]
//
|
isIDIV(g1f0, g1ms) =>
let
val-
list_cons
(g1m1, g1ms) = g1ms
val-
list_cons
(g1m2, g1ms) = g1ms
val-G1Mint(i1) = g1m1
val-G1Mint(i2) = g1m2 in G1Mint(i1 / i2)
end // end of [isIDIV]
//
| _(*non-delta-redex*) => auxapps_2(g1f0, g1ms)
// end-of-ifcase
//
end // end of [auxapps_1]
//
in(* in-of-local *)
//
implement
trans11_g1mac
  (g1m0) =
(
  auxg1m0(g1m0)) where
{
//
(*
val () =
println!
("trans11_g1mac: g1m0 = ", g1m0)
*)
//
}(*where*)//end of [trans11_g1mac]
//
implement
trans11_g1mac_apps
  (g1f0, g1ms) =
(
  auxapps_1(g1f0, g1ms)) where
{
(*
val () =
println!
("trans11_g1mac_apps: g1f0 = ", g1f0)
val () =
println!
("trans11_g1mac_apps: g1ms = ", g1ms)
*)
}
//
end // end of [local]

(* ****** ****** *)

local
//
fun
auxg1m0
( g1m0
: g1mac
, env0: g1menv): g1mac =
(
case+ g1m0 of
//
| G1Mint _ => g1m0
| G1Mbtf _ => g1m0
| G1Mstr _ => g1m0
//
| G1Mid0 _ => auxgmid(g1m0, env0)
//
| G1Mif0 _ => auxcond(g1m0, env0)
//
| G1Mapps _ => auxapps(g1m0, env0)
//
|
_ (* else *) => G1Msubs(g1m0, env0)
//
)
//
and
auxg1ms
( g1ms
: g1maclst
, env0: g1menv): g1maclst =
list_vt2t
(
list_map<
  g1mac><g1mac>(g1ms)) where
{
implement
list_map$fopr<
  g1mac><g1mac>
( g1m0 ) = auxg1m0(g1m0, env0)
} (*where*) // end of [auxg1ms]
//
(* ****** ****** *)
//
and
auxgmid
( g1m0
: g1mac
, env0
: g1menv): g1mac =
let
//
val-
G1Mid0(sym) = g1m0
val
opt =
g1menv_search_opt(env0, sym)
//
in
case+ opt of
|
~Some_vt
( g1m1 ) => g1m1
|
~None_vt
((*nil*)) => let
//
val
opt = the_gmacenv_find(sym)
//
in
case+ opt of
|
~None_vt() => g1m0
|
~Some_vt(g1m1) => trans11_g1mac(g1m1)
end // end of [None_vt]
end // end of [auxgmid]
//
(* ****** ****** *)

and
auxcond
( g1m0
: g1mac
, env0
: g1menv): g1mac =
let
//
val-
G1Mif0
( g1m1
, g1m2, g1m3) = g1m0
//
val
g1m1 =
auxg1m0(g1m1, env0)
//
in
//
case+
g1m1 of
//
|
G1Mbtf(btf) =>
if
btf
then auxg1m0(g1m2, env0)
else auxg1m0(g1m3, env0)
//
|
G1Mint(int) =>
if
(int != 0)
then auxg1m0(g1m2, env0)
else auxg1m0(g1m3, env0)
//
|
G1Mstr(str) =>
if
(str != "")
then auxg1m0(g1m2, env0)
else auxg1m0(g1m3, env0)
//
| _ (*non-redex*) =>
(
let
val g1m2 =
G1Msubs(g1m2, env0)
val g1m3 =
G1Msubs(g1m3, env0)
in
  G1Mif0(g1m1, g1m2, g1m3)
end
)
//
end // end of [auxcond]

(* ****** ****** *)
//
and
auxapps
( g1m0
: g1mac
, env0
: g1menv): g1mac =
let
val-
G1Mapps
(
g1f0, g1ms) = g1m0
val
g1f0 = auxg1m0(g1f0, env0)
val
g1ms = auxg1ms(g1ms, env0)
in
trans11_g1mac_apps(g1f0, g1ms)
end // end of [auxapps]
//
in(*in-of-local*)

implement
trans11_g1mac_subs
  (g1m0, env0) =
(
  auxg1m0(g1m0, env0)) where
{
(*
val () =
println!
("trans11_g1mac_env: g1m0 = ", g1m0)
*)
}(*where*)//end of [trans11_g1mac_subs]

end // end of [local]

(* ****** ****** *)

implement
trg1mac_sexp
(loc0, g1m0) =
let
//
val () =
$tempenver(loc0)
//
in(*in-of-let*)
//
case+ g1m0 of
//
(*
| G1Mid0 _ => auxid0(g1m0)
*)
//
(*
| G1Mint _ => auxint(g1m0)
| G1Mbtf _ => auxbtf(g1m0)
| G1Mstr _ => auxstr(g1m0)
*)
//
(*
| G1Mapps _ => auxapps(g1m0)
*)
//
| _(* error *) =>
  let
    val
    s2t0 = S2Tnone0()
  in
    s2exp_make_node
    (s2t0, S2Eg1mac(loc0, g1m0))
  end
//
end where
{
//
(*
  val () =
  println!
  ("trg1mac_sexp: g1m0 = ", g1m0)
*)
//
} (*where*) // end of [trg1mac_sexp]

(* ****** ****** *)

implement
trg1mac_dpat
(loc0, g1m0) =
let
//
val () =
$tempenver(loc0)
//
fun
auxexp
( g1m0
: g1mac): d2pat =
trg1mac_dpat(loc0, g1m0)
fun
auxexplst
( g1ms
: g1maclst): d2patlst =
let
implement
list_map$fopr<
  g1mac><d2pat>(x) = auxexp(x)
in
list_vt2t
(list_map<g1mac><d2pat>(g1ms))
end
//
fun
auxid0
( g1m0
: g1mac): d2pat =
(
trans12_dpid(d1p0)
) where
{
val-
G1Mid0(sym) = g1m0
val
tok =
token_make_node
(loc0, T_IDENT(sym.name()))
val
d1p0 =
d1pat_make_node(loc0, D1Pid0(tok))
} // end of [auxid0]
//
fun
auxint
( g1m0
: g1mac): d2pat =
let
val-
G1Mint(int) = g1m0
in
d2pat_make_node(loc0, D2Pi00(int))
end // end of [auxint]
//
fun
auxbtf
( g1m0
: g1mac): d2pat =
let
val-
G1Mbtf(btf) = g1m0
in
d2pat_make_node(loc0, D2Pb00(btf))
end // end of [auxbtf]
//
fun
auxstr
( g1m0
: g1mac): d2pat =
let
val-
G1Mstr(str) = g1m0
in
d2pat_make_node(loc0, D2Ps00(str))
end // end of [auxstr]
//
fun
auxapps
( g1m0
: g1mac): d2pat =
let
val-
G1Mapps
(g1f0, g1ms) = g1m0
//
in
//
let
val
d2f0 = auxexp(g1f0)
val
d2ps = auxexplst(g1ms)
in
d2pat_make_node
(loc0, D2Pdapp(d2f0, (~1), d2ps))
end
//
end // end of [auxapp]
//
in
//
case+ g1m0 of
//
| G1Mid0 _ => auxid0(g1m0)
//
| G1Mint _ => auxint(g1m0)
| G1Mbtf _ => auxbtf(g1m0)
| G1Mstr _ => auxstr(g1m0)
//
| G1Mapps _ => auxapps(g1m0)
//
| _(* rest-of-g1mac *) =>
(
d2pat_make_node(loc0, D2Pg1mac(g1m0))
)
end where
{
//
(*
  val () =
  println!
  ("trg1mac_dpat: g1m0 = ", g1m0)
*)
//
} (*where*) // end of [trg1mac_dpat]

(* ****** ****** *)

implement
trg1mac_dexp
(loc0, g1m0) =
let
//
val () =
$tempenver(loc0)
//
fun
auxexp
( g1m0
: g1mac): d2exp =
trg1mac_dexp(loc0, g1m0)
fun
auxexplst
( g1ms
: g1maclst): d2explst =
let
implement
list_map$fopr<
  g1mac><d2exp>(x) = auxexp(x)
in
list_vt2t
(list_map<g1mac><d2exp>(g1ms))
end
//
fun
auxid0
( g1m0
: g1mac): d2exp =
(
trans12_deid(d1e0)
) where
{
val-
G1Mid0(sym) = g1m0
val
tok =
token_make_node
(loc0, T_IDENT(sym.name()))
val
d1e0 =
d1exp_make_node(loc0, D1Eid0(tok))
} // end of [auxid0]
//
fun
auxint
( g1m0
: g1mac): d2exp =
let
val-
G1Mint(int) = g1m0
in
d2exp_make_node(loc0, D2Ei00(int))
end // end of [auxint]
//
fun
auxbtf
( g1m0
: g1mac): d2exp =
let
val-
G1Mbtf(btf) = g1m0
in
d2exp_make_node(loc0, D2Eb00(btf))
end // end of [auxbtf]
//
fun
auxchr
( g1m0
: g1mac): d2exp =
let
val-
G1Mchr(chr) = g1m0
in
d2exp_make_node(loc0, D2Ec00(chr))
end // end of [auxchr]
//
fun
auxstr
( g1m0
: g1mac): d2exp =
let
val-
G1Mstr(str) = g1m0
in
d2exp_make_node(loc0, D2Es00(str))
end // end of [auxstr]
//
fun
auxapps
( g1m0
: g1mac): d2exp =
let
val-
G1Mapps
(g1f0, g1ms) = g1m0
//
in
//
let
val
d2f0 = auxexp(g1f0)
val
d2es = auxexplst(g1ms)
in
d2exp_make_node
(loc0, D2Edapp(d2f0, (~1), d2es))
end
//
end // end of [auxapp]
//
in
//
case+ g1m0 of
//
| G1Mid0 _ => auxid0(g1m0)
//
| G1Mint _ => auxint(g1m0)
| G1Mbtf _ => auxbtf(g1m0)
| G1Mchr _ => auxchr(g1m0)
| G1Mstr _ => auxstr(g1m0)
//
| G1Mapps _ => auxapps(g1m0)
//
| _(* rest-of-g1mac *) =>
(
d2exp_make_node(loc0, D2Eg1mac(g1m0))
)
end where
{
//
(*
  val () =
  println!
  ("trg1mac_dexp: g1m0 = ", g1m0)
*)
//
} (*where*) // end of [trg1mac_dexp]

(* ****** ****** *)

(* end of [xats_gmacro1_define.dats] *)
