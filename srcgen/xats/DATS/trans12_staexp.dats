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
//
(* ****** ****** *)
//
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

implement
fprint_val<s2exp> = fprint_s2exp

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
    | _(*error*) => S2Tnone(s1t0)
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
val s2t1 =
  trans12_sort(s1t1)
//
val s2ts =
(
case+
s1t2.node() of
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
auxapp2
( s1t0
: sort1): sort2 = let
//
(*
val () =
println!
("\
trans01_sort: \
auxapp2: s1t0 = ", s1t0)
*)
//
val-
S1Tapp2
( s1t1
, s1t2, s1t3) = s1t0.node()
//
in
//
if
isarrw(s1t1)
then let
  val s2ts =
  (
  case+
  s1t2.node() of
  | S1Tlist(xs) =>
    trans12_sortlst(xs)
  | _(*non-S1Tlist*) =>
    list_sing
    (trans12_sort(s1t2))
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
    | None() => S2Tnone()
    | Some(s1t) => trans12_sort(s1t)
    ) : sort2 // end of [val]
  in
    s2var_make_idst(sym, s2t)
  end // end of [S1ARGsome]
)
//
(* ****** ****** *)

implement
trans12_smarg
  (s1ma) =
(
case+
s1ma.node() of
| S1MARGlist(xs) => trans12_sarglst(xs)
)

(* ****** ****** *)

implement
trans12_sarglst
  (s1as) =
list_vt2t(s2vs) where
{
val
s2vs =
list_map<s1arg><s2var>
  (s1as) where
{
implement
list_map$fopr<s1arg><s2var> = trans12_sarg
}
} (* end of [trans12_sarglst] *)

(* ****** ****** *)

implement
trans12_stxt
  (s1t0) = let
//
(*
val () =
println!
("trans12_stxt: s1t0 = ", s1t0)
*)
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

implement
s1exp_get_lin(s1e0) = 0
implement
s1exp_get_fc2(s1e0) = FC2fun()
implement
s1exp_get_eff(s1e0) = S2EFFall()

(* ****** ****** *)

implement
s1exp_get_s2cstlst
  (s1e0) =
(
case+
s1e0.node() of
| S1Eid(sid) => let
    val
    opt =
    the_sexpenv_find(sid)
  in
    case+ opt of
    | ~None_vt() => list_nil()
    | ~Some_vt(s2i) =>
      (
        case+ s2i of
        | S2ITMcst(s2cs) => s2cs | _ => list_nil()
      )
  end // end of [S1Eid]
| _(*rest-of-s1exp*) => list_nil()
)

(* ****** ****** *)

implement
trans12_squalst
(s1qs, s2vs_, s2ps_) =
(
case+ s1qs of
| list_nil() => ()
| list_cons(s1q0, s1qs) =>
  (
  case+
  s1q0.node() of
  | S1QUAprop(s1p0) => let
      val
      s2p0 = trans12_sexp(s1p0)
    in
      s2ps_ := list_vt_cons(s2p0, s2ps_);
      trans12_squalst(s1qs, s2vs_, s2ps_)
    end
  | S1QUAvars(ids, opt) =>
    (
    case+ opt of
    | None() =>
      (
        auxids1(ids, s2t, s2vs_);
        trans12_squalst(s1qs, s2vs_, s2ps_)
      ) where
      {
        val s2t = S2Tnone(*none*)
      }
    | Some(s1t) =>
      let
      val s2tx = trans12_stxt(s1t)
      in
      case- s2tx of
      | S2TXTsrt(s2t) =>
        (
        auxids1(ids, s2t, s2vs_);
        trans12_squalst(s1qs, s2vs_, s2ps_)
        )
      | S2TXTsub(s2v, s2ps) =>
        (
        auxids2
        (ids, s2v, s2ps, s2vs_, s2ps_);
        trans12_squalst(s1qs, s2vs_, s2ps_)
        )
      end
    )
  )
) where
{
//
  fun
  auxids1
  ( ids
  : tokenlst, s2t: sort2
  , s2vs_: &s2varlst_vt >> _): void =
  (
  case+ ids of
  | list_nil() => ()
  | list_cons(id0, ids) =>
    (
      auxids1(ids, s2t, s2vs_)
    ) where
    {
      val sid = sexpid_sym(id0)
      val s2v = s2var_make_idst(sid, s2t)
      val ((*void*)) = the_sexpenv_add_var(s2v)
      val ((*void*)) = s2vs_ := list_vt_cons(s2v, s2vs_)
    }
  )
//
  fun
  auxids2
  ( ids
  : tokenlst
  , s2v: s2var
  , s2ps: s2explst
  , s2vs_: &s2varlst_vt >> _
  , s2ps_: &s2explst_vt >> _): void =
  (
  case+ ids of
  | list_nil() => ()
  | list_cons(id0, ids) =>
    (
      auxids2(ids, s2v, s2ps, s2vs_, s2ps_)
    ) where
    {
//
      val s2t = s2v.sort()
      val sid = sexpid_sym(id0)
//
      val s2v1 = s2var_make_idst(sid, s2t)
      val ((*void*)) = the_sexpenv_add_var(s2v1)
      val ((*void*)) = s2vs_ := list_vt_cons(s2v1, s2vs_)
//
      val s2ps1 = s2explst_revar_vt(s2ps, s2v, s2v1)
      val ((*void*)) = s2ps_ := list_vt_reverse_append(s2ps1, s2ps_)
//
    } (* end of [where] *) // end of [list_cons]
  )
//
} (* end of [trans12_squalst] *)

(* ****** ****** *)

local

fun
auxid
( s1e0
: s1exp): s2exp = let
//
val-
S1Eid(sid) = s1e0.node()
val
opt = the_sexpenv_find(sid)
//
in
//
case+ opt of
//
| ~None_vt() => s2exp_none1(s1e0)
//
| ~Some_vt(x) => auxid_s2i(s1e0, x)
//
end // end of [auxid]

and
auxid_s2i
( s1e0: s1exp
, s2i0: s2itm): s2exp =
(
case- s2i0 of
| S2ITMvar(x) => auxid_s2v(s1e0, x)
| S2ITMcst(xs) => auxid_s2cs(s1e0, xs)
) (* end of [auxid_itm] *)
and
auxid_s2v
( s1e0: s1exp
, s2v0: s2var): s2exp = s2exp_var(s2v0)
and
auxid_s2cs
( s1e0: s1exp
, s2cs: s2cstlst): s2exp =
(
case- s2cs of
| list_cons(s2c0, _) => s2exp_cst(s2c0)
) (* end of [auxid_s2cs] *)

(* ****** ****** *)

fun
auxapp1
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
in
//
case+
s1e1.node() of
| S1Eforall _ => auxapp1_uni_(s1e0)
| S1Eexists _ => auxapp1_exi_(s1e0)
| _(*rest-of-s1exp*) => auxapp1_a_(s1e0)
//
end // end of [auxapp1]

and
auxapp1_a_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val narg =
(
case+
s1e2.node() of
| S1Elist(s1es) =>
  list_length<s1exp>(s1es)
| _(*non-S2Elist*) => 1
) : int // end of [val]
//
val
s2cs =
s1exp_get_s2cstlst(s1e1)
(*
//
// HX-2018-12-25:
// This seems very costly!
//
val
s2cs =
(
list_filter<s2cst>(s2cs)
) where
{
implement
list_filter$pred<s2cst>
  (s2c) =
(
case+
s2c.sort() of
| S2Tfun(s2ts, _) =>
  (
    length(s2ts) = narg
  )
| _ (*non-S2Tfun*) => false
)
} (* end of [val] *)
val s2cs = list_vt2t{s2cst}(s2cs)
*)
//
in
//
case+ s2cs of
| list_nil() =>
  auxapp1_0_(s1e0)
| list_cons(x1, xs2) =>
  (
    if
    iseqz(xs2)
    then
    let
      val
      s2e1 = s2exp_cst(x1)
    in
      auxapp1_1_(s1e0, s2e1)
    end
    else
    (
      auxapp1_2_(s1e0, s2cs)
    ) (* end of [else] *)
  )
end // end of [auxapp1_a_]

and
auxapp1_0_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
( s1e1
, s1e2) = s1e0.node()
//
val s2e1 = trans12_sexp(s1e1)
//
in
  auxapp1_1_(s1e0, s2e1)
end // end of [auxapp1_0_]

and
auxapp1_1_
( s1e0
: s1exp
, s2e1
: s2exp): s2exp = let
//
val-
S1Eapp1
( s1e1
, s1e2) = s1e0.node()
//
val s1es =
(
case+
s1e2.node() of
| S1Elist(s1es) => s1es
| _(*non-list*) => list_sing(s1e2)
) : s1explst // end of [val]
//
val s2ts =
(
case+
s2e1.sort() of
| S2Tfun(s2ts, _) => s2ts
| _(*non-S2Tfun*) => list_nil(*void*)
) : sort2lst // end of [va]
//
val s2es =
trans12_sexplst_cks(s1es, s2ts)
//
in
  s2exp_apps(s2e1, s2es)
end // end of [auxapp1_1_]

and
auxapp1_2_
( s1e0
: s1exp
, s2cs
: s2cstlst
) : s2exp = let
//
val-
S1Eapp1
( s1e1
, s1e2) = s1e0.node()
//
val s1es =
(
case+
s1e2.node() of
| S1Elist(s1es) => s1es
| _(*non-list*) => list_sing(s1e2)
) : s1explst // end of [val]
//
val
s2es =
trans12_sexplst(s1es)
//
val opt =
s2cst_select_list(s2cs, s2es)
//
in
//
case+ opt of
| ~None_vt() =>
   auxapp1_0_(s1e0)
| ~Some_vt(s2c1) =>
   auxapp1_1_(s1e0, s2exp_cst(s2c1))
//
end // end of [auxapp1_2_]

and
auxapp1_uni_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val-
S1Eforall(s1qs) = s1e1.node()
//
var s2vs_
  : s2varlst_vt = list_vt_nil()
var s2ps_
  : s2explst_vt = list_vt_nil()
//
val (pf0|()) =
the_sexpenv_pushnil()
//
val
((*void*)) =
trans12_squalst(s1qs, s2vs_, s2ps_)
//
val
s2e2 = trans12_sexp(s1e2(*body*))
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
//
  let
    val s2vs =
    list_vt2t(list_vt_reverse(s2vs_))
    val s2ps =
    list_vt2t(list_vt_reverse(s2ps_))
  in
    s2exp_uni(s2vs, s2ps, s2e2(*body*))
  end
//
end // end of [auxapp1_uni_]

and
auxapp1_exi_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val-
S1Eexists
  (knd, s1qs) = s1e1.node()
//
var s2vs
  : s2varlst_vt = list_vt_nil()
var s2ps
  : s2explst_vt = list_vt_nil()
//
val (pf0|()) =
the_sexpenv_pushnil()
//
val
((*void*)) =
trans12_squalst(s1qs, s2vs, s2ps)
//
val
s2e2 = trans12_sexp(s1e2(*body*))
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
//
  let
    val s2vs =
    list_vt2t(list_vt_reverse(s2vs))
    val s2ps =
    list_vt2t(list_vt_reverse(s2ps))
  in
    s2exp_exi(s2vs, s2ps, s2e2(*body*))
  end
//
end // end of [auxapp1_exi_]

(* ****** ****** *)

fun
isarrw
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid(sid) =>
  sid = $SYM.MSGT_symbol
| _(*non-S1Eid*) => false
)

fun
auxapp2
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp2
( s1e1
, s1e2
, s1e3) = s1e0.node()
//
val
s2cs =
s1exp_get_s2cstlst(s1e1)
//
(*
//
// HX-2018-12-25:
// This seems very costly!
//
val
s2cs =
(
list_filter<s2cst>(s2cs)
) where
{
implement
list_filter$pred<s2cst>
  (s2c) =
(
case+
s2c.sort() of
| S2Tfun(s2ts, _) =>
  (
    length(s2ts) = 2
  )
| _ (*non-S2Tfun*) => false
)
} (* end of [val] *)
val s2cs = list_vt2t{s2cst}(s2cs)
*)
//
in
//
case+ s2cs of
| list_nil() =>
  auxapp2_0_(s1e0)
| list_cons(x1, xs2) =>
  (
    if
    iseqz(xs2)
    then
    let
      val
      s2e1 = s2exp_cst(x1)
    in
      auxapp2_1_(s1e0, s2e1)
    end
    else
    (
      auxapp2_2_(s1e0, s2cs)
    ) (* end of [else] *)
  )
//
end // end of [auxapp2]

and
auxapp2_0_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp2
( s1e1
, s1e2
, s1e3) = s1e0.node()
//
in
//
if
isarrw(s1e1)
then let
  var npf
    : int = 0
  val s2es =
  (
  case+
  s1e2.node() of
  | S1Elist(xs) =>
    trans12_sexplst(xs)
  | S1Elist(xs1, xs2) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () = (npf := length(xs1))
      val s2es1 = trans12_sexplst(xs1)
      val s2es2 = trans12_sexplst(xs2)
    }
  | _(*non-S1Elist*) =>
    list_sing
    (trans12_sexp(s1e2))
  ) : s2explst
  val s2e3 = trans12_sexp(s1e3)
in
  s2exp_fun_nil(npf, s2es, s2e3)
end // end of [then]
else
(
case+
s1e1.node() of
| S1Eimp _ =>
  let
  var npf
    : int = 0
  val fc2 = s1exp_get_fc2(s1e1)
  val lin = s1exp_get_lin(s1e1)
  val eff = s1exp_get_eff(s1e1)
  val s2es =
  (
  case+
  s1e2.node() of
  | S1Elist(xs) =>
    trans12_sexplst(xs)
  | S1Elist(xs1, xs2) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () = (npf := length(xs1))
      val s2es1 = trans12_sexplst(xs1)
      val s2es2 = trans12_sexplst(xs2)
    }
  | _(*non-S1Elist*) =>
    list_sing
    (trans12_sexp(s1e2))
  ) : s2explst
  val s2e3 = trans12_sexp(s1e3)
  in
    s2exp_fun_full
    (fc2, lin, eff, npf, s2es, s2e3)
  end
| _(*non-S1Eimp*) =>
  let
    val
    s2e1 =
    trans12_sexp(s1e1) in auxapp2_1_(s1e0, s2e1)
  end // end of [else]
)
//
end // end of [auxapp2_0_]

and
auxapp2_1_
( s1e0
: s1exp
, s2e1
: s2exp): s2exp = let
//
val-
S1Eapp2
( _
, s1e2
, s1e3) = s1e0.node()
//
val s2t2 =
(
case+
s2e1.sort() of
| S2Tfun(s2ts, _) =>
  sort2lst_get_at(s2ts, 0)
| _(*non-S2Tfun*) => S2Tnone()
) : sort2 // end of [val]
//
val s2t3 =
(
case+
s2e1.sort() of
| S2Tfun(s2ts, _) =>
  sort2lst_get_at(s2ts, 1)
| _(*non-S2Tfun*) => S2Tnone()
) : sort2 // end of [val]
//
val s2e2 = trans12_sexp_ck(s1e2, s2t2)
val s2e3 = trans12_sexp_ck(s1e3, s2t3)
//
in
  s2exp_app2(s2e1, s2e2, s2e3)
end // end of [auxapp2_1_]

and
auxapp2_2_
( s1e0
: s1exp
, s2cs
: s2cstlst) : s2exp = let
//
val-
S1Eapp2
( _
, s1e2
, s1e3) = s1e0.node()
//
val
s2e2 = trans12_sexp(s1e2)
val
s2e3 = trans12_sexp(s1e3)
//
val opt =
s2cst_select_bin
(s2cs, s2e2.sort(), s2e3.sort())
//
in
//
case+ opt of
| ~None_vt() =>
   auxapp2_0_(s1e0)
| ~Some_vt(s2c1) =>
   auxapp2_1_(s1e0, s2exp_cst(s2c1))
//
end // end of [auxapp2_2_]

(* ****** ****** *)

fun
auxlist1
( s1e0
: s1exp): s2exp = let
//
(*
val () =
println!
("\
trans12_sexp:\
 auxlist1: s1e0 = ", s1e0)
*)
//
val-
S1Elist(s1es) = s1e0.node()
//
in
  if
  list_is_sing(s1es)
  then
  (
    trans12_sexp(s1e)
  ) where
  {
    val s1e = list_head(s1es)
  }
  else
  (
    s2exp_list1(trans12_sexplst(s1es))
  )
end // end of [auxlist1]

fun
auxlist2
( s1e0
: s1exp): s2exp = let
// 
(*
val () =
println!
("\
trans12_sexp:\
 auxlist2: s1e0 = ", s1e0)
*)
//
val-
S1Elist
(s1es1, s1es2) = s1e0.node()
//
in
//
case+ s1es1 of
| list_nil() =>
  s2exp_list1(trans12_sexplst(s1es2))
| list_cons _ =>
  s2exp_list2
  (trans12_sexplst(s1es1), trans12_sexplst(s1es2))
//
end // end of [auxlist2]

(* ****** ****** *)

fun
auxtuple1
( s1e0
: s1exp): s2exp = let
//
val-
S1Etuple
(knd, s1es) = s1e0.node()
//
val s2es = trans12_sexplst(s1es)
//
in
  s2exp_tuple1(knd, s2es)
end // end of [auxtuple1]

fun
auxtuple2
( s1e0
: s1exp): s2exp = let
//
val-
S1Etuple
( knd, xs1, xs2) = s1e0.node()
//
val s2es1 = trans12_sexplst(xs1)
val s2es2 = trans12_sexplst(xs2)
//
in
  s2exp_tuple2(knd, s2es1, s2es2)
end // end of [auxtuple2]

(* ****** ****** *)

fun
auxrecord1
( s1e0
: s1exp): s2exp = let
//
val-
S1Erecord
(knd, ls1es) = s1e0.node()
//
val ls2es = trans12_labsexplst(ls1es)
//
in
  s2exp_record1(knd, ls2es)
end // end of [auxrecord1]

fun
auxrecord2
( s1e0
: s1exp): s2exp = let
//
val-
S1Erecord
( knd, lxs1, lxs2) = s1e0.node()
//
val ls2es1 = trans12_labsexplst(lxs1)
val ls2es2 = trans12_labsexplst(lxs2)
//
in
  s2exp_record2(knd, ls2es1, ls2es2)
end // end of [auxrecord2]

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_sexp
  (s1e0) = let
//
(*
val () =
println!
("trans12_sexp: s1e0 = ", s1e0)
*)
//
val loc0 = s1e0.loc()
//
in
//
case-
s1e0.node() of
//
| S1Eid _ => auxid(s1e0)
//
| S1Eint(tok) =>
  s2exp_int(token2sint(tok))
| S1Echr(tok) =>
  s2exp_chr(token2schr(tok))
(*
| S1Eflt of token
*)
(*
| S1Estr(tok) =>
  s2exp_str(token2sstr(tok))
*)
//
| S1Eapp1 _ => auxapp1(s1e0)
| S1Eapp2 _ => auxapp2(s1e0)
//
| S1Elist
    (_) => auxlist1(s1e0)
| S1Elist
    (_, _) => auxlist2(s1e0)
  // end of [S1Elist]
//
| S1Etuple
    (k0, _) => auxtuple1(s1e0)
| S1Etuple
    (k0, _, _) => auxtuple2(s1e0)
  // end of [S1Etuple]
//
| S1Erecord
    (k0, _) => auxrecord1(s1e0)
| S1Erecord
    (k0, _, _) => auxrecord2(s1e0)
  // end of [S1Erecord]
//
| S1Eanno(s1e1, s1t2) =>
  let
    val
    s2t2 = trans12_sort(s1t2)
  in
    trans12_sexp_ck(s1e1, s2t2)
  end
//
| S1Enone((*void*)) => s2exp_none1(s1e0)
//
| _(*rest-of-s1exp*) => s2exp_none1(s1e0)
//
end // end of [trans12_sexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_sexp_ck
  (s1e0, s2t0) = let
//
(*
val () =
println!
("trans12_sexp_ck: s1e0 = ", s1e0)
val () =
println!
("trans12_sexp_ck: s1t0 = ", s1t0)
*)
//
in
//
case+
s1e0.node() of
| _(*rest-of-s1exp*) =>
  let
    val s2e0 =
    trans12_sexp(s1e0)
  in
    if
    s2e0.sort() <= s2t0
      then s2e0
      else s2exp_cast(s2e0, s2t0)
    // end of [if]
  end
//
end // end of [trans12_sexp_ck]

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
list_vt2t(s2es) where
{
val
s2es =
list_map<s1exp><s2exp>
  (s1es) where
{
implement
list_map$fopr<s1exp><s2exp> = trans12_sexp
}
} (* end of [trans12_sexplst] *)

(* ****** ****** *)

implement
trans12_sexplst_ck
  (s1es, s2t0) =
list_vt2t(s2es) where
{
val
s2es =
list_map<s1exp><s2exp>
  (s1es) where
{
implement
list_map$fopr<s1exp><s2exp>
  (s1e) = trans12_sexp_ck(s1e, s2t0)
// implement
}
} (* end of [trans12_sexplst_ck] *)

implement
trans12_sexplst_cks
  (s1es, s2ts) =
(
  auxlst(s1es, s2ts)
) where
{
fun
auxlst
( s1es: s1explst
, s2ts: sort2lst): s2explst =
(
case+ s1es of
| list_nil() =>
  list_nil()
| list_cons
    (s1e0, s1es) =>
  (
    case+ s2ts of
    | list_nil() =>
      (
      list_cons(s2e0, s2es)
      ) where
      {
        val s2e0 =
        trans12_sexp_ck
        (s1e0, S2Tnone())
        val s2es = auxlst(s1es, s2ts)
      }
    | list_cons
        (s2t0, s2ts) =>
      (
      list_cons(s2e0, s2es)
      ) where
      {
        val s2e0 =
        trans12_sexp_ck
          (s1e0, s2t0(*arg*))
        val s2es = auxlst(s1es, s2ts)
      }
  )
)
} (* end of [trans12_sexplst_cks] *)

(* ****** ****** *)

implement
trans12_labsexplst
  (lxs) =
list_vt2t
(
list_map<labs1exp><labs2exp>(lxs)
) where
{
//
implement
list_map$fopr<labs1exp><labs2exp>
  (lx0) =
(
case+ lx0 of
| SL0ABLED
  (l0, _, x0) =>
  (
  case- l0.node() of
  | L0ABsome(l0) =>
    SLABELED(l0, trans12_sexp(x0))
  )
)
//
} (* trans12_labsexplst *)

(* ****** ****** *)

(* end of [xats_trans12_staexp.dats] *)
