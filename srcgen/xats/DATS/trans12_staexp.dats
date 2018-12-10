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
//
//
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
//
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

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

fun
auxid
( s1t0
: sort1): sort2 = let
//
val-
S1Tid(tid) = s1t0.node()
val
opt = the_sortenv_find(tid)
//
in
//
case+ opt of
//
| ~None_vt() => S2Tid(tid)
//
| ~Some_vt(s2t) =>
  (
    case+ s2t of
    | S2TXTsrt(s2t) => s2t
    | S2TXTsub
        (s2v, _) => s2v.sort()
      // S2TXTsub
    | _(* error *) => S2Tnone(s1t0)
  ) (* Some_vt *)
//
end // end of [auxid]

fun
auxapp1
( s1t0
: sort1): sort2 = let
//
val-
S1Tapp1
(s1t1, s1t2) = s1t0.node()
//
val s2t1 = trans12_sort(s1t1)
val s2ts =
(
  case+ s1t2.node() of
  | S1Tlist(xs) =>
    trans12_sortlst(xs)
  | _(*non-S1Tlist*) =>
    list_sing(trans12_sort(s1t2))
 ) : sort2lst // end of [val]
//
in
  S2Tapp(s2t1, s2ts)
end // end of [auxapp1]

fun
auxapp2
( s1t0
: sort1): sort2 = let
//
val () =
println!
("\
trans01_sort: \
auxapp2: s1t0 = ", s1t0)
//
val-
S1Tapp2
(s1t1, s1t2, s1t3) = s1t0.node()
//
in
//
if
isarrw(s1t1)
then let
  val s2ts =
  (
  case+ s1t2.node() of
  | S1Tlist(xs) =>
    trans12_sortlst(xs)
  | _(*non-S1Tlist*) =>
    list_sing(trans12_sort(s1t2))
  ) : sort2lst
  val s2t3 = trans12_sort(s1t3)
in
  S2Tfun(s2ts, s2t3)
end
else let
  val s2t1 = trans12_sort(s1t1)
  val s2t2 = trans12_sort(s1t2)
  val s2t3 = trans12_sort(s1t3)
in
  S2Tapp(s2t1, list_pair(s2t2, s2t2))
end // end of [else]
//
end // end of [auxapp2]

and
isarrw
( s1t
: sort1): bool =
(
case+
s1t.node() of
| S1Tid(tid) =>
  tid = $SYM.MSGT_symbol
| _(*non-S1Tid*) => false
)

fun
auxlist
( s1t0
: sort1): sort2 = let
//
val-
S1Tlist(s1ts) = s1t0.node()
//
in
  if
  list_is_sing(s1ts)
  then
  (
    trans12_sort(s1t)
  ) where
  {
    val s1t = list_head(s1ts)
  }
  else
  (
    S2Ttup(trans12_sortlst(s1ts))
  )
end // end of [auxlist]

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
case+
s1t0.node() of
//
| S1Tid _ => auxid(s1t0)
//
| S1Tint(int) =>
  S2Tint(token2sint(int))
//
| S1Tapp _ => S2Tnone(s1t0)
//
| S1Tapp1 _ => auxapp1(s1t0)
| S1Tapp2 _ => auxapp2(s1t0)
//
| S1Tlist _ => auxlist(s1t0)
//
| S1Tqual _ => S2Tnone(s1t0)
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
//
implement
trans12_sarg
  (s1a0) =
(
case+
s1a0.node() of
| S1ARGsome
    (tok, opt) => let
    val sym =
    sargid_sym(tok)
    val s2t =
    (
    case+ opt of
    | None() => the_sort2_int
    | Some(s1t) => trans12_sort(s1t)
    ) : sort2 // end of [val]
  in
    s2var_make_idst(sym, s2t)
  end // end of [S1ARGsome]
)
//
(* ****** ****** *)

implement
trans12_stxt
  (s1t0) = let
//
val () =
println!
("trans12_stxt: s1t0 = ", s1t0)
//
fun
auxid
( s1t0
: sort1
) : s2txt = let
//
val-
S1Tid(tid) = s1t0.node()
//
val
opt = the_sortenv_find(tid)
//
in
//
case+ opt of
| ~Some_vt(tx) => tx
| ~None_vt((*void*)) =>
  let
   val s2t = S2Tid(tid) in S2TXTsrt(s2t)
  end
//
end // end of [auxid]
//
in
//
case+
s1t0.node() of
//
| S1Tid _ => auxid(s1t0)
//
| _(*non-S1Tid*) =>
  (
    S2TXTsrt(trans12_sort(s1t0))
  )
//
end // end of [trans12_stxt]

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
| S1Eint(tok) =>
  s2exp_int(token2sint(tok))
//
| S1Enone((*void*)) => s2exp_none1(s1e0)
//
| _(*rest-of-s1exp*) => s2exp_none1(s1e0)
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
