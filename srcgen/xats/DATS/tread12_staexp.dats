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
// Start Time: June, 2019
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
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/tread12.sats"
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_sort2
  (s2t0) = ((*void*))
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_s2txt
  (s2tx) =
(
case+ s2tx of
| S2TXTsrt(s2t) =>
  tread12_sort2(s2t)
| S2TXTsub(s2v, s2ps) =>
  {
    val () = tread12_s2var(s2v)
    val () = tread12_s2explst(s2ps)
  }
//
(*
| S2TXTerr(loc0) =>
  {
    val () =
    trerr12_add(TRERR12s2txt(s2tx))
//
    val () =
    prerrln!(loc0, ": TRERR12(s2txt): ", s2tx);
  }
*)
//
)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_s2cst
  (s2c0) = () where
{
//
local
val
s2e0 =
s2cst_get_sexp(s2c0)
in // in-of-local
val () = tread12_s2exp(s2e0)
end // end-of-local
//
val () =
let
val
opt0 =
s2cst_get_d2conlst(s2c0)
in // in-of-let
case+ opt0 of
| ~
None_vt() => ((*void*))
| ~
Some_vt(d2cs) => tread12_d2conlst(d2cs)
end // end-of-let
//
} (* end of [tread12_s2cst] *)
//
implement
//{}(*tmp*)
tread12_s2cstlst(s2cs) =
(
list_foreach<s2cst>(s2cs)
) where
{
implement(env)
list_foreach$fwork<s2cst><env>(s2c, env) = tread12_s2cst(s2c)
} (* end of [tread12_s2cstlst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_s2var
  (s2v0) = ((*void*))
implement
//{}(*tmp*)
tread12_s2varlst
  (s2vs) = ((*void*))
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread12_s2exp(s2e0) = let
//
(*
val loc0 = s2e0.loc()
*)
//
(*
val () =
println!
("tread12_s2exp: s2e0 = ", s2e0)
*)
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
    val () = tread12_s2exp(s2e1)
    val () = tread12_s2explst(s2es)  
  }
//
| S2Etop(s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
  }
| S2Etpz(s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
  }
//
| S2Earg(knd0, s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
  }
| S2Eatx(s2e1, s2e2) =>
  {
    val () = tread12_s2exp(s2e1)
    val () = tread12_s2exp(s2e2)
  }
//
| S2Efun
  (fc0, npf, s2es, s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
    val () = tread12_s2explst(s2es)
  }
//
| S2Eexi(s2vs, s2ps, s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
    val () = tread12_s2explst(s2ps)
  }
| S2Euni(s2vs, s2ps, s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
    val () = tread12_s2explst(s2ps)
  }
//
| S2Elam(s2vs, s2e1) =>
  {
    val () = tread12_s2exp(s2e1)
  }
//
| S2Etyrec(knd, npf, ls2es) =>
  {
    val () = tread12_labs2explst(ls2es)
  }
//
| S2Ecimp
  (loc0, s2e1) =>
  {
//
    val () =
    trerr12_add
    (TRERR12s2exp(s2e0))
//
    val () = tread12_s2exp(s2e1)
//
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): ", s2e0);
//
  }
| S2Ecprf
  (loc0, s2e1) =>
  {
//
    val () =
    trerr12_add
    (TRERR12s2exp(s2e0))
//
    val () = tread12_s2exp(s2e1)
//
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): ", s2e0);
//
  }
| S2Ectcd
  (loc0, s2e1) =>
  {
//
    val () =
    trerr12_add
    (TRERR12s2exp(s2e0))
//
    val () = tread12_s2exp(s2e1)
//
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): ", s2e0);
//
  }
//
| S2Ecast
  (loc0, s2e1, s2t2) =>
  {
//
    val () =
    trerr12_add
    (TRERR12s2exp(s2e0))
//
    val () = tread12_s2exp(s2e1)
    val () = tread12_sort2(s2t2)
//
    val
    s2t1 = s2e1.sort((*void*))
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): s2e0 = ", s2e0);
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): s2t1 = ", s2t1);
    val () =
    prerrln!(loc0, ": TRERR12(s2exp): s2t2 = ", s2t2);
//
  }
//
| S2Enone0() => ()
| S2Enone1(loc, s1e) =>
  {
//
    val () =
    trerr12_add(TRERR12s2exp(s2e0))
//
    val () =
    prerrln!(loc, ": TRERR12(s2exp): ", s2e0);
//
  }
| S2Enone2(loc, s2e) =>
  {
//
    val () =
    trerr12_add(TRERR12s2exp(s2e0))
//
    val () =
    prerrln!(loc, ": TRERR12(s2exp): ", s2e0);
//
  }
//
| _(*rest-of-s2exp*) => () // HX: yet-to-be-implemented
//
end // end of [tread12_s2exp]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_s2expopt(opt) =
(
case+ opt of
| None() => ()
| Some(s2e) =>
  tread12_s2exp(s2e)
)
//
implement
//{}(*tmp*)
tread12_s2explst(s2es) =
(
list_foreach<s2exp>(s2es)
) where
{
implement(env)
list_foreach$fwork<s2exp><env>(s2e, env) = tread12_s2exp(s2e)
} (* end of [tread12_s2explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_labs2exp(ls2e) =
let
val+
SLABELED(lab, s2e) = ls2e
in
  tread12_s2exp(s2e)
end // end of [tread12_labs2exp]
//
implement
//{}(*tmp*)
tread12_labs2explst(ls2es) =
(
list_foreach<labs2exp>(ls2es)
) where
{
implement(env)
list_foreach$fwork<labs2exp><env>(ls2e, env) = tread12_labs2exp(ls2e)
} (* end of [tread12_labs2explst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread12_t2ype(t2p0) = let
(*
val () =
println!
("tread12_s2exp: s2e0 = ", s2e0)
*)
//
in
//
case+
t2p0.node() of
| _(*rest-of-s2exp*) => () // HX: yet-to-be-implemented
//
end // end of [tread12_t2ype]

(* ****** ****** *)

implement
//{}(*tmp*)
tread12_abstdf2(df2) =
(
case+ df2 of
| ABSTDF2none() => ()
| ABSTDF2some() => ()
| ABSTDF2lteq(t2p) =>
  {
  val () = tread12_t2ype(t2p)
  }
| ABSTDF2eqeq(s2e, t2p) =>
  {
  val () = tread12_s2exp(s2e)
  val () = tread12_t2ype(t2p)
  }
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_effs2expopt(opt) =
(
case+ opt of
| EFFS2EXPnone() => ()
| EFFS2EXPsome(s2e) => tread12_s2exp(s2e)
)
//
(* ****** ****** *)

(* end of [xats_tread12_staexp.dats] *)
