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
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_dexp
  (d1e0) = let
//
val
loc0 = d1e0.loc()
//
val () =
println!
("trans12_dexp: d1e0 = ", d1e0)
//
in (* in-of-let *)
//
case-
d1e0.node() of
| _(*rest-of-D1EXP*) =>
  exit_errmsg
  (1, "trans12_dexp: yet-to-be-implemented!\n")
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
list_vt2t(d1es) where
{
val
d1es =
list_map<d1exp><d2exp>
  (d1es) where
{
  implement
  list_map$fopr<d1exp><d2exp> = trans12_dexp
}
} (* end of [trans12_dexplst] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_abssort
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cabssort
(knd, tok) =
d1c0.node((*void*))
//
val tid = sortid_sym(tok)
val s2ta = t2abs_new(tid)
val s2tx =
  S2TXTsrt(S2Tbas(T2BASabs(s2ta)))
//
in
  the_sortenv_add(tid, s2tx);
  d2ecl_make_node(loc0, D2Cabssort(d1c0))
end // end of [aux_abssort]

(* ****** ****** *)

fun
aux_stacst0
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cstacst0
( knd
, sid, arg, res) =
d1c0.node((*void*))
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
s2t0 =
auxmargs(arg, trans12_sort(res))
val
s2c0 = s2cst_make_idst(sid, s2t0)
//
val () = the_sexpenv_add_cst(s2c0)
//
val () =
println!
("tran12_decl: aux_stacst0: s2t0 = ", s2t0)
val () =
println!
("tran12_decl: aux_stacst0: s2c0 = ", s2c0)
//
in
  d2ecl_make_node(loc0, D2Cstacst0(d1c0))
end // end of [aux_stacst0]

(* ****** ****** *)

fun
aux_sortdef
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Csortdef
(knd, tid, def0) =
d1c0.node((*void*))
//
val sym = sortid_sym(tid)
//
in (* in-of-let *)
//
case+
def0.node() of
| S1RTDEFsort(s1t) =>
  let
    val s2tx = trans12_stxt(s1t)
  in
    the_sortenv_add(sym, s2tx);
    d2ecl_make_node(loc0, D2Csortdef(d1c0))
  end
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
            S2TXTsrt(S2Tnone())
          )
        | Some(s1t) => trans12_stxt(s1t)
      ) : s2txt // end of [val]
//
      val s2t =
      (
        case+ tx0 of
        | S2TXTsrt(s2t) => s2t
        | S2TXTsub(s2v, _) => s2v.sort()
        | S2TXTerr((*void*)) => S2Tnone()
      ) : sort2 // end of [val]
//
      val id0 =
        sargid_sym(tok)
      val s2v1 =
        s2var_make_idst(id0, s2t)
//
      val (pf0|()) =
        the_sexpenv_pushnil()
      val ((*void*)) =
        the_sexpenv_add_var(s2v1)
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
        | S2TXTerr((*void*)) => list_nil(*void*)
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
        d2ecl_make_node(loc0, D2Csortdef(d1c0))
      end
    end
  ) (* end of [S1RTDEFsubset] *)
//
end // end of [aux_sortdef]

(* ****** ****** *)

fun
aux_sexpdef
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Csexpdef
( knd
, sid
, arg, res, body) = d1c0.node()
//
val (pf0|()) =
the_sexpenv_pushnil()
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
| list_nil() =>
  (
  case res of
  | None() =>
    trans12_sexp(body)
  | Some(s1t) =>
    trans12_sexp_ck
    (body, trans12_sort(s1t))
  )
| list_cons(x0, xs) =>
  let
    val
    s2vs = trans12_smarg(x0)
    val () = 
    the_sexpenv_add_varlst(s2vs)
  in
    s2exp_lam(s2vs, auxlams(xs, res, body))
  end // end of [list_cons]
)
//
} (* end of [val] *)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val () =
println!
("\
trans12_decl:\
 aux_sexpdef: s2e0 = ", s2e0)
//
val
s2c0 =
s2cst_make_idst(sid, s2e0.sort())
//
in
  the_sexpenv_add_cst(s2c0);
  d2ecl_make_node(loc0, D2Csexpdef(d1c0))
end // end of [aux_sexpdef]

(* ****** ****** *)

fun
aux_datasort
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cdatasort
(knd, d1ts) = d1c0.node()
//
val s2ts =
auxd1ts(d1ts) where
{
//
fun
auxd1t
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
end // end of [auxd1t]
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
  list_map$fopr<d1tsort><sort2>(d1t) = auxd1t(d1t)
} (* end of [auxd1ts] *)
}
//
val () =
auxd1ts(d1ts, s2ts) where
{
fun
auxd1t
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
| list_nil() => ()
| list_cons(s1c0, s1cs) =>
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
)
//
in
let
  val+
  D1TSORT(tok, s1cs) = d1t0.node() in loop(s1cs)
end
end // end of [auxd1t]
and
auxd1ts
( d1ts
: d1tsortlst,
  s2ts: sort2lst): void =
(
case+ d1ts of
| list_nil() => ()
| list_cons(d1t0, d1ts) =>
  let
    val-
    list_cons
    (s2t0, s2ts) = s2ts
    val () = auxd1t(d1t0, s2t0) in auxd1ts(d1ts, s2ts)
  end // end of [auxd1ts]
) (* end of [auxd1ts] *)
}
//
in
  d2ecl_make_node(loc0, D2Cdatasort(d1c0))
end // end of [aux_datasort]

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_decl
  (d1c0) = let
//
val
loc0 = d1c0.loc()
//
val () =
println!
("trans12_decl: d1c0 = ", d1c0)
//
in (* in-of-let *)
//
case-
d1c0.node() of
//
| D1Cnone() => d2ecl_none1(d1c0)
| D1Cnone(_) => d2ecl_none1(d1c0)
//
| D1Cabssort _ => aux_abssort(d1c0)
//
| D1Cstacst0 _ => aux_stacst0(d1c0)
//
| D1Csortdef _ => aux_sortdef(d1c0)
//
| D1Csexpdef _ => aux_sexpdef(d1c0)
//
| D1Cdatasort _ => aux_datasort(d1c0)
//
| _(*rest-of-D1ECL*) => d2ecl_none1(d1c0)
//
end // end of [trans12_decl]

end // end of [local]

(* ****** ****** *)

implement
trans12_declist
  (d1cs) =
list_vt2t(d1cs) where
{
val
d1cs =
list_map<d1ecl><d2ecl>
  (d1cs) where
{
  implement
  list_map$fopr<d1ecl><d2ecl> = trans12_decl
}
} (* end of [trans12_declist] *)

(* ****** ****** *)

(* end of [xats_trans12_dynecl.dats] *)
