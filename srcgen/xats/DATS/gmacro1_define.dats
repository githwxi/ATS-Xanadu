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
#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
implement
fprint_val<sym_t> = fprint_symbol
(* ****** ****** *)
abstype g1mid_tbox = ptr
(* ****** ****** *)
typedef g1mid = g1mid_tbox
typedef g1mas = List0(g1mid)
(* ****** ****** *)
//
datatype g1mac =
//
| G1Mid0 of g1mid
//
| G1Mint of int
| G1Mbtf of bool
| G1Mstr of string
//
| G1Mlam of
  (g1mas, g1mac(*body*))
| G1Mapp of
  (g1mac(*fun*), g1maclst)
//
| G1Mnone0 of () // HX: EMPTY
//
| G1Mg1exp of (g1exp) // ERROR!
//
| G1Ms1exp of (s1exp) // ERROR!
| G1Md1exp of (d1exp) // ERROR!
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
case+ g1m0 of
|
G1Mid0(x0) =>
fprint!(out, "G1Mid0(", x0, ")")
//
|
G1Mint(i0) =>
fprint!(out, "G1Mint(", i0, ")")
|
G1Mbtf(i0) =>
fprint!(out, "G1Mbtf(", i0, ")")
|
G1Mstr(cs) =>
fprint!(out, "G1Mstr(", cs, ")")
//
|
G1Mlam(gmas, g1m1) =>
fprint!
( out
, "G1Mlam(", gmas, "; ", g1m1, ")")
|
G1Mapp(g1f0, g1ms) =>
fprint!
( out
, "G1Mapp(", g1f0, "; ", g1ms, ")")
//
| G1Mnone0() =>
  fprint!(out, "G1Mnone0()")
//
| G1Mg1exp(g1e1) =>
  fprint!(out, "G1Mnone1(", g1e1, ")")
| G1Ms1exp(s1e1) =>
  fprint!(out, "G1Mnone1(", s1e1, ")")
| G1Md1exp(d1e1) =>
  fprint!(out, "G1Mnone1(", d1e1, ")")
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
T_IDENT_alp(nam) => symbol_make(nam)
|
T_IDENT_sym(nam) => symbol_make(nam)
//
) (* end of [auxarg] *)
and
auxargs
( g1as
: g1arglst): g1mas =
list_vt2t
(
list_map<g1arg><g1mid>(g1as) where
{
implement
list_map$fopr<g1arg><g1mid>(g1a) = auxarg0(g1a)
}
) (* end of [auxargs] *)

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
( g1e0: g1exp ): g1mac =
(
case+
g1e0.node() of
|
G1Eid0(gid) =>
G1Mid0(gid)
|
G1Eint(tok) =>
(
G1Mint(int)
) where
{
val
int =
(
case-
tok.node() of
|
T_INT1(rep) =>
g0string2int(rep)
) : int // end-of-val
}
//
|
G1Eapp1
(g1f0, g1e1) =>
let
  val
  g1f0 =
  auxg1e0(g1f0)
in
  G1Mapp(g1f0, g1ms) where
{
  val
  g1ms =
  (
  case+
  g1e1.node() of
  | G1Elist(g1es) =>
    auxg1es(g1es)
  | _ (*non-G1Elist*) =>
    list_sing(auxg1e0(g1e1))
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
G1Mapp
(g1f0, list_pair(g1e1, g1e2))
end
|
G1Enone0((*void*)) => G1Mnone0()
|
_ (*rest-of-g1exp*) => G1Mg1exp(g1e0)
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
G1Mlam
(args, auxgmas(gmas, def1))
end // list_cons
) (* end of [auxgmas] *)

(* ****** ****** *)

in(*in-of-local*)

implement
trans11_g1mac
(gmas, def1) =
auxgmas(gmas, def1) where
{
//
val def1 =
(
case+ def1 of
|
None() =>
G1Mnone0() | Some(g1e) => auxg1e0(g1e)
) : g1mac // end-of-val
//
} (* end of [trans11_g1mac] *)

end // end of [local]

(* ****** ****** *)
//
extern
fun
trs1exp_gmac: s1exp -> g1mac
extern
fun
trd1exp_gmac: d1exp -> g1mac
//
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
  G1Ms1exp(s1e0)
end (* end of [trs1exp_gmac] *)

(* ****** ****** *)

implement
trd1exp_gmac(d1e0) =
let
//
val () =
println!
("trd1exp_gmac: d1e0 = ", d1e0)
//
in
  G1Md1exp(d1e0)
end (* end of [trd1exp_gmac] *)

(* ****** ****** *)

(*
implement
trg1mac_sexp(loc0, g1m0) =
let
//
val () =
println!
("trg1mac_sexp: g1m0 = ", g1m0)
//
in
d2exp_make_node(loc0, S2Eg1mac(g1m0))
end (* end of [trs1exp_gmac] *)
*)

(* ****** ****** *)

implement
trg1mac_dexp(loc0, g1m0) =
let
//
val () =
println!
("trg1mac_dexp: g1m0 = ", g1m0)
//
in
//
case+ g1m0 of
|
G1Mint(int) =>
d2exp_make_node(loc0, D2Ei00(int))
|
G1Mbtf(btf) =>
d2exp_make_node(loc0, D2Eb00(btf))
|
G1Mstr(str) =>
d2exp_make_node(loc0, D2Es00(str))
|
_(* rest-of-g1mac *) =>
d2exp_make_node(loc0, D2Eg1mac(g1m0))
end (* end of [trs1exp_gmac] *)

(* ****** ****** *)

abstbox g1menv_tbox = ptr
typedef g1menv = g1menv_tbox

(* ****** ****** *)

static
fun
g1menv_extend
( kxs
: g1menv
, k0:g1mid, x0:g1mac): g1menv
static
fun
g1menv_search_opt
( kxs
: g1menv
, key: g1mid): Option_vt(g1mac)

(* ****** ****** *)

local

absimpl
g1menv_tbox = List0(@(g1mid, g1mac))

in (* in-of-local *)

implement
g1menv_extend
(kxs, k0, x0) =
list_cons(@(k0, x0), kxs)

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

(* end of [xats_gmacro1_define.dats] *)
