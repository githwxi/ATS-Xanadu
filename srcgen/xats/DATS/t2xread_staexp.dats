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
//
#staload "./../SATS/staexp2.sats"
//
#staload "./../SATS/t2xread.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_sort2
  (s2t0) = ((*void*))
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_s2exp(s2e0) = let
//
(*
val loc0 = s2e0.loc()
*)
//
// (*
val () =
println!
("t2xread_s2exp: s2e0 = ", s2e0)
// *)
//
in
//
case+
s2e0.node() of
//
| S2Eint(int) => ()
| S2Echr(chr) => ()
//
| S2Ecst(s2c) => ()
| S2Evar(s2v) => ()
//
| S2Eapp(s2e1, s2es) =>
  {
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_s2explst<>(s2es)  
  }
//
| S2Efun
  ( fc0
  , lin, npf, s2es, s2e1) =>
  {
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_s2explst<>(s2es)
  }
//
| S2Eexi(s2vs, s2ps, s2e1) =>
  {
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_s2explst<>(s2ps)
  }
| S2Euni(s2vs, s2ps, s2e1) =>
  {
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_s2explst<>(s2ps)
  }
//
| S2Elam(s2vs, s2e1) =>
  {
    val () = t2xread_s2exp<>(s2e1)
  }
//
| S2Etyrec(knd, npf, ls2es) =>
  {
    val () = t2xread_labs2explst<>(ls2es)
  }
//
| S2Ecimp
  (loc0, s2e1) =>
  {
//
    val () =
    t2xerr_add(T2XERRs2exp(s2e0))
//
    val () = t2xread_s2exp<>(s2e1)
//
    val () =
    prerrln!(loc0, ": T2XERR(s2exp): ", s2e0);
//
  }
| S2Ecprf
  (loc0, s2e1) =>
  {
//
    val () =
    t2xerr_add(T2XERRs2exp(s2e0))
//
    val () = t2xread_s2exp<>(s2e1)
//
    val () =
    prerrln!(loc0, ": T2XERR(s2exp): ", s2e0);
//
  }
| S2Ectcd
  (loc0, s2e1) =>
  {
//
    val () =
    t2xerr_add(T2XERRs2exp(s2e0))
//
    val () = t2xread_s2exp<>(s2e1)
//
    val () =
    prerrln!(loc0, ": T2XERR(s2exp): ", s2e0);
//
  }
//
| S2Ecast
  (loc0, s2e1, s2t2) =>
  {
//
    val () =
    t2xerr_add(T2XERRs2exp(s2e0))
//
    val () = t2xread_s2exp<>(s2e1)
    val () = t2xread_sort2<>(s2t2)
//
    val () =
    prerrln!(loc0, ": T2XERR(s2exp): ", s2e0);
//
  }
//
| _(*rest-of-s2exp*) => ()
//
end // end of [t2xread_s2exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_s2expnul(opt) =
(
if
iseqz(opt)
then ((*void*))
else t2xread_s2exp(unsome(opt))
)
//
implement
{}(*tmp*)
t2xread_s2explst(s2es) =
(
list_foreach<s2exp>(s2es)
) where
{
implement(env)
list_foreach$fwork<s2exp><env>(s2e, env) = t2xread_s2exp<>(s2e)
} (* end of [t2xread_s2explst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_labs2exp(ls2e) =
let
val+
SLABELED(lab, s2e) = ls2e
in
  t2xread_s2exp<>(s2e)
end // end of [t2xread_labs2exp]
//
implement
{}(*tmp*)
t2xread_labs2explst(ls2es) =
(
list_foreach<labs2exp>(ls2es)
) where
{
implement(env)
list_foreach$fwork<labs2exp><env>(ls2e, env) = t2xread_labs2exp<>(ls2e)
} (* end of [t2xread_labs2explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_abstdf2(df2) =
(
case+ df2 of
| ABSTDF2none() => ()
| ABSTDF2some() => ()
| ABSTDF2lteq(s2e) => t2xread_s2exp<>(s2e)
| ABSTDF2eqeq(s2e) => t2xread_s2exp<>(s2e)
)

(* ****** ****** *)

(* end of [xats_t2xread_staexp.dats] *)
