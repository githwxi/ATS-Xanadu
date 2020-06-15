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
// Start Time: September, 2018
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
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp1.sats"
//
#staload "./../SATS/tread01.sats"
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_sort1(s1t0) = ()
//
implement
//{}(*tmp*)
tread01_sort1opt(opt0) =
(
case+ opt0 of
| None() => ()
| Some(s1t0) => tread01_sort1(s1t0)
)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread01_s1arg
  (s1a0) = let
//
(*
//
val loc0 = s1a0.loc()
//
val () =
println!
("tread01_s1arg: s1a0 = ", s1a0)
*)
//
in
//
case+
s1a0.node() of
| S1ARGsome
  (id0, opt) =>
  {
(*
    val () = tread01_s1eid(id0)
*)
    val () = tread01_sort1opt(opt)
  }
end // end of [tread01_s1arg]

(* ****** ****** *)

implement
//{}(*tmp*)
tread01_s1marg
  (s1ma) = let
//
(*
val () =
println!
("tread01_s1marg: s1ma = ", s1ma)
*)
//
in
//
case+
s1ma.node() of
| S1MARGlist(s1as) =>
  {
    val () = tread01_s1arglst(s1as)
  }
//
end // end of [tread01_s1marg]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_s1arglst
  (s1as) =
(
list_foreach<s1arg>(s1as)
) where
{
implement(env)
list_foreach$fwork<s1arg><env>(s1a, env) = tread01_s1arg(s1a)
} (* end of [tread01_s1arglst] *)
//
implement
//{}(*tmp*)
tread01_s1marglst
  (smas) =
(
list_foreach<s1marg>(smas)
) where
{
implement(env)
list_foreach$fwork<s1marg><env>(sma, env) = tread01_s1marg(sma)
} (* end of [tread01_s1marglst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread01_t1arg
  (t1a0) = let
//
(*
val () =
println!
("tread01_t1arg: t1a0 = ", t1a0)
*)
//
in
//
case+
t1a0.node() of
| T1ARGsome
  (s0t, opt) =>
  {
    val () = tread01_sort1(s0t)
(*
    val () = tread01_tokenopt(opt)
*)
  }
//
end // end of [tread01_t1arg]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_t1marg
  (t1ma) = let
//
(*
val () =
println!
("tread01_t1marg: t1ma = ", t1ma)
*)
//
in
//
case+
t1ma.node() of
| T1MARGlist(t1as) =>
  {
    val () = tread01_t1arglst(t1as)
  }
//
end // end of [tread01_t1marg]
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_t1arglst
  (t1as) =
(
list_foreach<t1arg>(t1as)
) where
{
implement(env)
list_foreach$fwork<t1arg><env>(t1a, env) = tread01_t1arg(t1a)
} (* end of [tread01_t1arglst] *)
//
implement
//{}(*tmp*)
tread01_t1marglst
  (tmas) =
(
list_foreach<t1marg>(tmas)
) where
{
implement(env)
list_foreach$fwork<t1marg><env>(tma, env) = tread01_t1marg(tma)
} (* end of [tread01_t1marglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_s1exp(s1e0) = ()
//
implement
//{}(*tmp*)
tread01_s1expopt(opt0) =
(
case+ opt0 of
| None() => ()
| Some(s1e0) => tread01_s1exp(s1e0)
)
//
implement
//{}(*tmp*)
tread01_s1explst(s1es) =
(
list_foreach<s1exp>(s1es)
) where
{
implement(env)
list_foreach$fwork<s1exp><env>(s1e, env) = tread01_s1exp(s1e)
} (* end of [tread01_s1explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_s1qua(s1q0) = ()
//
implement
//{}(*tmp*)
tread01_s1qualst(s1qs) =
(
list_foreach<s1qua>(s1qs)
) where
{
implement(env)
list_foreach$fwork<s1qua><env>(s1q, env) = tread01_s1qua(s1q)
} (* end of [tread01_s1qualst] *)
//
(* ****** ****** *)

(* end of [xats_tread01_staexp.dats] *)
