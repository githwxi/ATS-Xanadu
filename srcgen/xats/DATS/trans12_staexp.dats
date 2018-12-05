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
//
// Author: Hongwei Xi
// Start Time: December, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
MAP = "./../SATS/symmap.sats"
#staload
ENV = "./../SATS/symenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

fun
aux1
(rep: string): int =
auxmain
(10, string2ptr(rep), 0)
and
aux2
( bas: int
, rep: string): int =
auxmain
(bas, string2ptr(rep), 0)
and
auxmain
( b0: int
, p0: ptr
, r0: int): int =
(
let
val c0 =
$UN.ptr0_get<char>(p0)
in(* in-of-let *)
//
if
isdigit(c0)
then
(
  auxmain(b0, p0, r0)
) where
{
  val p0 = ptr_succ<char>(p0)
  val r0 = b0 * r0 + (c0 - '0')
}
else (r0) // end of [if]
//
end
) (* end of [auxmain] *)

in (* in-of-local *)

implement
token2sint(tok) =
(
case-
tok.node() of
//
| T_INT1(rep) => aux1(rep)
| T_INT2(bas, rep) => aux2(bas, rep)
| T_INT3(bas, rep, _) => aux2(bas, rep)
//
) (* end of [token2int] *)

end // end of [local]

(* ****** ****** *)

implement
sortid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [sortid_sym] *)

implement
sexpid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [sexpid_sym] *)

implement
dexpid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_srp(nm) => $SYM.symbol_make(nm)
| T_IDENT_dlr(nm) => $SYM.symbol_make(nm)
//
) (* end of [dexpid_sym] *)

(* ****** ****** *)

local

fun
auxid
( s1t0
: sort1): sort2 = let
//
val-
S1Tid
(tok) = s1t0.node()
val sym =
(
case-
tok.node() of
| T_IDENT_alp(sym) => sym
| T_IDENT_sym(sym) => sym
) : string // end of [val]
//
val
tid = $SYM.symbol_make(sym)
val
opt = the_sortenv_find(tid)
//
in
//
case+ opt of
| ~Some_vt(s2t) =>
  (
    case+ s2t of
    | S2TXTsrt(s2t) => s2t
    | _(*non-sort*) => S2Tnone(s1t0)
  )
| ~None_vt((*void*)) => S2Tnone(s1t0)
//
end // end of [auxid]

in (* in-of-local *)

implement
trans12_sort
  (s1t0) = let
//
(*
val () =
println!
("trans12_sort: s1t0 = ", s1t0)
*)
//
val loc0 = s1t0.loc()
//
in
//
case-
s1t0.node() of
//
| S1Tid _ => auxid(s1t0)
//
| S1Tint(int) =>
  S2Tint(token2sint(int))
//
| S1Tlist(s1ts) =>
  S2Ttup(trans12_sortlst(s1ts))
//
| S1Tnone((*void*)) => S2Tnone()
//
end // end of [trans12_sort]

end // end of [local]

(* ****** ****** *)

implement
trans12_sortopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(s1t) => Some(trans12_sort(s1t))
) (* end of [trans12_sortopt] *)

implement
trans12_sortlst
  (s1ts) =
list_vt2t(s2ts) where
{
val
s2ts =
list_map<sort1><sort2>
  (s1ts) where
{
  implement
  list_map$fopr<sort1><sort2> = trans12_sort
}
} (* end of [trans12_sortlst] *)

(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_sexp
  (s1e0) = let
//
(*
val () =
println!
("trans12_sort: s1e0 = ", s1e0)
*)
//
val loc0 = s1e0.loc()
//
in
//
case-
s1e0.node() of
//
| S1Enone() => s2exp_none1(s1e0)
//
end // end of [trans12_sexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_sexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(s1e) => Some(trans12_sexp(s1e))
) (* end of [trans12_sexpopt] *)

implement
trans12_sexplst
  (s1es) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s1exp><s2exp>
  (s1es) where
{
  implement
  list_map$fopr<s1exp><s2exp> = trans12_sexp
}
} (* end of [trans12_sexplst] *)

(* ****** ****** *)

(*
datatype
s1rtdef_node =
| S1RTDEFsort of sort1
| S1RTDEFsubset of (s1arg, s1explst)
*)

(* ****** ****** *)

(* end of [xats_trans12_staexp.dats] *)
