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
end // end of [auxapp1]

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
end

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
val s2e1 =
(
case+
s2e1.sort() of
| S2Tfun(_, s2t) => s2e1
| _(*non-S2Tfun*) =>
   s2exp_cast(s2e1, S2Tfun())
) : s2exp // end of [val]
//
val s2ts =
(
case+
s2e1.sort() of
| S2Tfun(s2ts, _) => s2ts
| _(*non-S2Tfun*) => list_nil()
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

(* ****** ****** *)

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
val
s2e1 = trans12_sexp(s1e1)
//
in
  auxapp2_1_(s1e0, s2e1(*f*))
end

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
val s2e1 =
(
case+
s2e1.sort() of
| S2Tfun(_, s2t) => s2e1
| _(*non-S2Tfun*) =>
   s2exp_cast(s2e1, S2Tfun())
) : s2exp // end of [val]
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
auxlist
( s1e0
: s1exp): s2exp = let
//
(*
val () =
println!
("auxlist: s1e0 = ", s1e0)
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
    s2exp_list(trans12_sexplst(s1es))
  )
end // end of [auxlist]

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
| S1Elist(_) => auxlist(s1e0)
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
("trans12_sort: s1e0 = ", s1e0)
val () =
println!
("trans12_sort: s1t0 = ", s1t0)
*)
//
in

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

implement
trans12_sexplst_ck
  (s1es, s2t0) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s1exp><s2exp>
  (s1es) where
{
  implement
  list_map$fopr<s1exp><s2exp>(s1e) = trans12_sexp_ck(s1e, s2t0)
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

(*
datatype
s1rtdef_node =
| S1RTDEFsort of sort1
| S1RTDEFsubset of (s1arg, s1explst)
*)

(* ****** ****** *)

(* end of [xats_trans12_staexp.dats] *)
