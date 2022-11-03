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
SYM = "./../SATS/xsymbol.sats"
//
macdef
LIN_sym = $SYM.LIN_symbol
//
macdef
CLO_sym = $SYM.CLO_symbol
macdef
FNP_sym = $SYM.FNP_symbol
macdef
CFP_sym = $SYM.CFP_symbol
macdef
CFR_sym = $SYM.CFR_symbol
macdef
LCFP_sym = $SYM.LCFP_symbol
//
(*
macdef
CFLT_sym = $SYM.CFLT_symbol
macdef
FPTR_sym = $SYM.FPTR_symbol
macdef
CPTR_sym = $SYM.CPTR_symbol
macdef
CREF_sym = $SYM.CREF_symbol
*)
//
(*
macdef
CLOFLT_sym = $SYM.CLOFLT_symbol
macdef
FUNPTR_sym = $SYM.FUNPTR_symbol
macdef
CLOPTR_sym = $SYM.CLOPTR_symbol
macdef
CLOREF_sym = $SYM.CLOREF_symbol
*)
//
overload
= with $SYM.eq_symbol_symbol
overload
.name with $SYM.symbol_get_name
//
(* ****** ****** *)
//
#staload
MAP = "./../SATS/xsymmap.sats"
#staload
ENV = "./../SATS/xsymenv.sats"
//
(* ****** ****** *)
//
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)
implement
fprint_val<s1qua> = fprint_s1qua
implement
fprint_val<s2exp> = fprint_s2exp
(* ****** ****** *)

local

(* ****** ****** *)

fun
isplus
( s1t
: sort1): bool =
(
case+
s1t.node() of
| S1Tid0(tid) =>
  tid = $SYM.ADD_symbol
| _(*non-S1Tid0*) => false
)
fun
ismnus
( s1t
: sort1): bool =
(
case+
s1t.node() of
| S1Tid0(tid) =>
  tid = $SYM.SUB_symbol
| _(*non-S1Tid0*) => false
)
fun
isarrw
( s1t
: sort1): bool =
(
case+
s1t.node() of
| S1Tid0(tid) =>
  tid = $SYM.MSGT_symbol
| _(*non-S1Tid0*) => false
)

(* ****** ****** *)

fun
auxid0
( s1t0
: sort1): sort2 = let
//
val-
S1Tid0(tid) = s1t0.node()
val
opt = the_sortenv_find(tid)
//
in
//
case+ opt of
//
| ~None_vt() => S2Tid0(tid)
//
| ~Some_vt(s2t) =>
  (
    case+ s2t of
    | S2TXTsrt(s2t) => s2t
    | S2TXTsub
        (s2v, _) => s2v.sort()
      // S2TXTsub
(*
    | S2TXTerr _(*loc*) => S2Tnone1(s1t0)
*)
  ) (* Some_vt *)
//
end // end of [auxid0]

(* ****** ****** *)

fun
auxapp1
( s1t0
: sort1): sort2 = let
//
val-
S1Tapp1
(s1t1, s1t2) = s1t0.node()
//
in
//
ifcase
| isplus(s1t1) =>
  sort2_polpos
  (trans12_sort(s1t2))
| ismnus(s1t1) =>
  sort2_polneg
  (trans12_sort(s1t2))
| _ (* else *) => let
    val
    s2t1 =
    trans12_sort(s1t1)
    //
    val
    s2ts =
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
  end
//
end // end of [auxapp1]

(* ****** ****** *)

fun
auxapp2
( s1t0
: sort1): sort2 = let
//
(*
val () =
println!
("\
trans12_sort: \
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
  S2Tapp(s2t1, list_pair(s2t2, s2t3))
end // end of [else]
//
end // end of [auxapp2]

(* ****** ****** *)

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
| S1Tid0 _ => auxid0(s1t0)
//
| S1Tint(int) =>
  S2Tint(token2sint(int))
//
| S1Tapp _ => S2Tnone1(s1t0)
//
| S1Tapp1 _ => auxapp1(s1t0)
| S1Tapp2 _ => auxapp2(s1t0)
//
| S1Tlist _ => auxlist(s1t0)
//
| S1Tqual _ => S2Tnone1(s1t0)
//
| S1Tnone((*void*)) => S2Tnone0()
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
    | None() => S2Tnone0()
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
auxid0
( s1t0
: sort1
) : s2txt = let
//
val-
S1Tid0(tid) = s1t0.node()
//
val
opt = the_sortenv_find(tid)
//
in
//
case+ opt of
| ~
Some_vt(tx) => tx
| ~
None_vt((*void*)) =>
let
val s2t =
S2Tid0(tid) in S2TXTsrt(s2t)
end
//
end // end of [auxid0]
//
in
//
case+
s1t0.node() of
//
| S1Tid0 _ => auxid0(s1t0)
//
| _(*non-S1Tid0*) =>
  (
    S2TXTsrt(trans12_sort(s1t0))
  )
//
end // end of [trans12_stxt]

(* ****** ****** *)
//
(*
HX-2019-07-14:
Should a warning
be issued for 'lincloref'?
*)
//
implement
s1imp_get_lin(s1e0) =
let
  val-
  S1Eimp
  (s1es) = s1e0.node()
in
  s1explst_get_lin(s1es)
end // end of [s1imp_get_lin]
//
implement
s1imp_get_fc2(s1e0) =
let
  val-
  S1Eimp
  (s1es) = s1e0.node()
in
  s1explst_get_fc2(s1es)
end // end of [s1imp_get_fc2]
//
(* ****** ****** *)

implement
s1explst_get_lin
  (s1es) = let
//
fun
islin
(x0: s1exp): bool =
(
case+
x0.node() of
| S1Eid0(sym) =>
  (sym = LIN_sym)
| _ (*non-S1Eid0*) => false
)
//
in
//
auxlst(s1es) where
{
fun
auxlst
( xs
: s1explst): int =
(
case+ xs of
| list_nil() => 0
| list_cons(x0, xs) =>
  ifcase
  | islin(x0) => 1
  | _ (* else *) => auxlst(xs)
)
} (* end of [where] *)
//
end // end of [s1exp_get_lin]

implement
s1explst_get_fc2
  (s1es) = let
//
fun
fptr
(x0: s1exp): bool =
(
case+
x0.node() of
| S1Eid0(sym) =>
  (
  ifcase
  | sym =
    FNP_sym => true
(*
  | sym =
    FUNPTR_sym => true
*)
  | _ (* else *) => false
  )
| _ (*non-S1Eid0*) => false
)
fun
cflt
(x0: s1exp): bool =
(
case+
x0.node() of
| S1Eid0(sym) =>
  (
  ifcase
  | sym =
    CLO_sym => true
(*
  | sym =
    CFLT_sym => true
  | sym =
    CLOFLT_sym => true
*)
  | _ (* else *) => false
  )
| _ (* non-S1Eid0 *) => false
)
fun
cptr
(x0: s1exp): bool =
(
case+
x0.node() of
| S1Eid0(sym) =>
  (
  ifcase
  | sym =
    CFP_sym => true
(*
  | sym =
    CPTR_sym => true
  | sym =
    CLOPTR_sym => true
*)
  | _ (* else *) => false
  )
| _ (*non-S1Eid0*) => false
)
fun
cref
(x0: s1exp): bool =
(
case+
x0.node() of
| S1Eid0(sym) =>
  (
  ifcase
  | sym =
    CFR_sym => true
(*  | sym =
    CREF_sym => true
  | sym =
    CLOREF_sym => true
*)
  | _ (* else *) => false
  )
| _ (*non-S1Eid0*) => false
)
in
//
auxlst(s1es) where
{
fun
auxlst
( xs
: s1explst): funclo2 =
(
case+ xs of
| list_nil() =>
  (
    FC2fun()
  )
| list_cons(x0, xs) =>
  ifcase
  | fptr(x0) => FC2fun
  | cref(x0) => FC2cloref
  | cptr(x0) => FC2cloptr
  | cflt(x0) => FC2cloflt
  | _ (* else *) => auxlst(xs)
)
} (* end of [where] *)
//
end // end of [s1explst_get_fc2]
//
(* ****** ****** *)
//
(*
implement
s1exp_get_eff(s1e0) = S2EFFall()
*)
//
(* ****** ****** *)

implement
s1exp_get_s2cstlst
  (s1e0) =
let
(*
val () =
println!
("s1exp_get_s2cstlst: s1e0 = ", s1e0)
*)
in
case+
s1e0.node() of
|
S1Eid0(sid) => let
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
end // end of [S1Eid0]
| _(*rest-of-s1exp*) => list_nil()
end // end of [s1exp_get_s2cstlst]

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
        val s2t = S2Tnone0(*none*)
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
      val sid =
      sexpid_sym(id0)
      val s2v =
      s2var_make_idst(sid, s2t)
      val ((*void*)) =
      the_sexpenv_add_var(s2v)
      val ((*void*)) =
      (s2vs_ := list_vt_cons(s2v, s2vs_))
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
      val s2v1 =
      s2var_make_idst(sid, s2t)
      val ((*void*)) =
      the_sexpenv_add_var(s2v1)
      val ((*void*)) =
      (s2vs_ := list_vt_cons(s2v1, s2vs_))
//
      val s2ps1 =
      s2explst_revar_vt(s2ps, s2v, s2v1)
      val ((*void*)) =
      (s2ps_ := list_vt_reverse_append(s2ps1, s2ps_))
//
    } (* end of [where] *) // end of [list_cons]
  )
//
} (* end of [trans12_squalst] *)

(* ****** ****** *)

local
//
fun
isany
(sid: sym_t): int =
let
fun
auxcnt
( p0: ptr
, i0: int): int =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
  if
  (c0 = '_')
  then
  (
  auxcnt(p1, i0+1)
  ) where
  {
  val p1 =
  ptr0_succ<char>(p0)
  }
  else
  (
  if iseqz(c0) then i0 else (~1)
  ) (* end of [if] *)
end
in
  auxcnt(string2ptr(sid.name()), 0)
end (* end of [isany] *)
(*
fun
isdot
(sid: sym_t): int =
let
fun
auxcnt
( p0: ptr
, i0: int): int =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
  if
  (c0 = '.')
  then
  (
  auxcnt(p1, i0+1)
  ) where
  {
  val p1 =
  ptr0_succ<char>(p0)
  }
  else
  (
  if iseqz(c0) then i0 else (~1)
  ) (* end of [if] *)
end
in
  auxcnt(string2ptr(sid.name()), 0)
end (* end of [isdot] *)
*)
//
(* ****** ****** *)

fun
auxid0
( s1e0
: s1exp): s2exp = let
//
val-
S1Eid0
( sid ) =
s1e0.node((*void*))
//
val knd = isany(sid)
//
in
//
if
(knd > 0)
then
(
s2exp_any(knd)
)
else let
val
opt =
the_sexpenv_find(sid)
//
in
//
case+ opt of
| ~None_vt() => s2exp_none1(s1e0)
| ~Some_vt(s2i) => auxid0_s2i(s1e0, s2i)
//
end // end of [else]
//
end // end of [auxid0]

and
auxid0_var
( s1e0
: s1exp
, s2v0
: s2var): s2exp =
(
  s2exp_var(s2v0)
)
and
auxid0_cst
( s1e0
: s1exp
, s2cs
: s2cstlst): s2exp =
let
  val
  opt = s2cst_select_any(s2cs)
in
  case+ opt of
  | ~None_vt() => s2exp_none1(s1e0)
  | ~Some_vt(s2c0) => s2exp_cst(s2c0)
end
and
auxid0_s2i
( s1e0: s1exp
, s2i0: s2itm): s2exp =
(
//
case- s2i0 of
| S2ITMvar(s2v0) => auxid0_var(s1e0, s2v0)
| S2ITMcst(s2cs) => auxid0_cst(s1e0, s2cs)
//
) (* end of [auxid0_s2i] *)

(* ****** ****** *)

fun
isCBV0
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.CBV0_symbol
| _(*non-S1Eid0*) => false
)
fun
isCBV1
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.CBV1_symbol
| _(*non-S1Eid0*) => false
)
fun
isCBRF
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.CBRF_symbol
| _(*non-S1Eid0*) => false
)

(* ****** ****** *)

fun
isTOP0
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.QMNON_symbol
| _(*non-S1Eid0*) => false
)
fun
isTOP1
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.QMLIN_symbol
| _(*non-S1Eid0*) => false
)

(* ****** ****** *)

fun
isextp
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
(
(sid =
 $SYM.DLR_EXTBOX_symbol)
||
(sid =
 $SYM.DLR_EXTYPE_symbol) )
| _(*non-S1Eid0*) => false
)

fun
auxapp1
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
in(*in-of-let*)
//
case+
s1e1.node() of
//
| S1Eforall _ => auxapp1_uni_(s1e0)
| S1Eexists _ => auxapp1_exi_(s1e0)
//
| _ when
    isCBV0(s1e1) => auxapp1_cbv0_(s1e0)
| _ when
    isCBV1(s1e1) => auxapp1_cbv1_(s1e0)
| _ when
    isCBRF(s1e1) => auxapp1_cbrf_(s1e0)
//
| _ when
    isTOP0(s1e1) => auxapp1_top0_(s1e0)
| _ when
    isTOP1(s1e1) => auxapp1_top1_(s1e0)
//
| _ when
    isextp(s1e1) => auxapp1_extp_(s1e0)
//
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
(*
val narg =
(
case+
s1e2.node() of
| S1Elist(s1es) =>
  list_length<s1exp>(s1es)
| _(*non-S2Elist*) => 1
) : int // end of [val]
*)
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
| S1El1st(s1es) => s1es
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
val loc0 = s1e0.loc()
//
val s2es =
trans12_sexplst_cks(loc0, s1es, s2ts)
//
in
  s2exp_apps(loc0, s2e1, s2es)
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
| S1El1st(s1es) => s1es
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
(*
val () =
println!
("auxapp1_uni_: s1qs = ", s1qs)
*)
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
s2e2 =
trans12_sexp_ci(s1e2(*body*))
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
//
  let
    val s2vs =
    list_vt2t
    (list_vt_reverse(s2vs_))
    val s2ps =
    list_vt2t
    (list_vt_reverse(s2ps_))
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
s2e2 =
trans12_sexp_ci(s1e2(*body*))
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

and
auxapp1_cbv0_
( s1e0
: s1exp): s2exp = let
//
val CBV0 = 0 // ~
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val s2e2 =
  trans12_sexp(s1e2)
val s2t2 = s2e2.sort()
//
in
if
sort2_is_impred(s2t2)
then
s2exp_arg
(CBV0, s2e2) else auxapp1_a_(s1e0)
end // [auxapp1_cbv0_]
and
auxapp1_cbv1_
( s1e0
: s1exp): s2exp = let
//
val CBV1 = 1 // !
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val s2e2 =
  trans12_sexp(s1e2)
val s2t2 = s2e2.sort()
//
in
if
sort2_is_impred(s2t2)
then
s2exp_arg
(CBV1, s2e2) else auxapp1_a_(s1e0)
end // [auxapp1_cbv1_]
and
auxapp1_cbrf_
( s1e0
: s1exp): s2exp = let
//
val CBRF = ~1 // &
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val s2e2 =
  trans12_sexp(s1e2)
val s2t2 = s2e2.sort()
//
in
if
sort2_is_impred(s2t2)
then
s2exp_arg
(CBRF, s2e2) else auxapp1_a_(s1e0)
end // [auxapp1_cbrf_]

(* ****** ****** *)

and
auxapp1_top0_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
in
s2exp_top
( trans12_sexp_ci( s1e2 ) )
end // [auxapp1_top0_]
and
auxapp1_top1_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
in
s2exp_tpz
( trans12_sexp_ci( s1e2 ) )
end // [auxapp1_top1_]

(* ****** ****** *)
//
and
auxapp1_extp_
( s1e0
: s1exp): s2exp = let
//
val-
S1Eapp1
(s1e1, s1e2) = s1e0.node()
//
val s1es =
(
case+
s1e2.node() of
| S1El1st(s1es) => s1es
| _(*non-list*) => list_sing(s1e2)
) : s1explst // end of [val]
//
val
s2ta = // arg
the_sort2_type
val
s2tr = // res
let
val-
S1Eid0(sid) = s1e1.node()
in
ifcase
| sid =
  $SYM.DLR_EXTBOX_symbol =>
  (     the_sort2_tbox     )
| sid =
  $SYM.DLR_EXTYPE_symbol =>
  (     the_sort2_type     )
| _(*non-extp*) => the_sort2_type
end : sort2 // end of [val]
//
val
tnm1 =
(
case+ s1es of
|
list_nil() => ""
|
list_cons(x0, xs) =>
(
case+ x0.node() of
| S1Estr(s0) => token2sstr(s0) | _ => ""
)
) : string // end of [val]
val
s2es =
(
case+ s1es of
|
list_nil() =>
list_nil()
|
list_cons(x0, xs) =>
trans12_sexplst_ck(xs, s2ta)) : s2explst
//
in
//
s2e0 where
{
val s2e0 = s2exp_tyext(s2tr, tnm1, s2es)
(*
val ((*void*)) =
println!("trans12_sexp: ")
val ((*void*)) =
println!("auxapp1_extp_: s2e0 = ", s2e0)
*)
}
//
end // end of [auxapp1_extp_]

(* ****** ****** *)
//
fun
isANY
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.WCARD_symbol
| _(*non-S1Eid0*) => false
)
//
fun
isTOP
( s1e
: s1exp): bool =
(
case+
s1e.node() of
|
S1Eapp1
(s1e1, s1e2) =>
(
case+
s1e2.node() of
|
S1Enone(loc) =>
(
case+
s1e1.node() of
| S1Eid0(sid) =>
  sid = $SYM.QMNON_symbol
| _(*non-S1Eid0*) => false)
| _(*non-S1Enone1*) => false
)
| _(* non-S1Eapp1 *) => false
)
//
fun
isTPZ
( s1e
: s1exp): bool =
(
case+
s1e.node() of
|
S1Eapp1
(s1e1, s1e2) =>
(
case+
s1e2.node() of
|
S1Enone(loc) =>
(
case+
s1e1.node() of
| S1Eid0(sid) =>
  sid = $SYM.QMLIN_symbol
| _(*non-S1Eid0*) => false)
| _(*non-S1Enone1*) => false
)
| _(* non-S1Eapp1 *) => false
)
//
(* ****** ****** *)
//
fun
isAXCG
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.AXCG_symbol
| _(*non-S1Eid0*) => false
)
fun
isARRW
( s1e
: s1exp): bool =
(
case+
s1e.node() of
| S1Eid0(sid) =>
  sid = $SYM.MSGT_symbol
| _(*non-S1Eid0*) => false
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
in//let
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
isARRW(s1e1)
then let
//
var npf
  : int = ~1
//
val s2es =
(
  case+
  s1e2.node() of
  | S1El1st(xs) =>
    trans12_sexplst_ci(xs)
  | S1El2st(xs1, xs2) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () = (npf := length(xs1))
      val s2es1 = trans12_sexplst_cp(xs1)
      val s2es2 = trans12_sexplst_ct(xs2)
    }
  | _(*non-S1Elist*) =>
    list_sing
    (trans12_sexp_ci(s1e2))
) : s2explst // end-of-val
//
val s2e3 = trans12_sexp_ci(s1e3)
//
in
  s2exp_fun_all(npf, s2es, s2e3)
end // end of [then]
else
(
case+
s1e1.node() of
| S1Eimp _ =>
  let
  var npf
    : int = ~1
//
  val lin = s1imp_get_lin(s1e1)
  val fc2 = s1imp_get_fc2(s1e1)
//
  val fc2 =
  (
  if lin = 0 then fc2 else funclo2_linize(fc2)
  ) : funclo2
//
(*
  val eff = s1exp_get_eff(s1e1)
*)
//
  val s2es =
  (
  case+
  s1e2.node() of
  | S1El1st(xs) =>
    trans12_sexplst_ci(xs)
  | S1El2st(xs1, xs2) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () = (npf := length(xs1))
      val s2es1 = trans12_sexplst_cp(xs1)
      val s2es2 = trans12_sexplst_ct(xs2)
    }
  | _(*non-S1Elist*) =>
    list_sing
    (trans12_sexp_ci(s1e2))
  ) : s2explst
  val s2e3 = trans12_sexp_ci(s1e3)
  in
    s2exp_fun_full(fc2, npf, s2es, s2e3)
  end
|
_(*non-S1Eimp*) =>
(
ifcase
|
isAXCG(s1e1) =>
let
  val s2e2 =
  trans12_sexp_ci(s1e2)
(*
  val () =
  println!
  ("auxapp2_0_: s1e3 = ", s1e3)
*)
//
in
  s2exp_atx(s2e2, s2e3) where
  {
  val s2e3 =
  (
  ifcase
  | isANY(s1e3) =>
    (
    let
    val
    s2e2 =
    (
    case+
    s2e2.node() of
    | S2Earg
      (knd, s2e2) => s2e2 | _ => s2e2
    ) : s2exp // end of [val]
    in
    case+
    s2e2.node() of
    | S2Etop(s2e2) => s2e2 | _ => s2e2
    end
    )
  | isTOP(s1e3) =>
    (
    case+
    s2e2.node() of
    | S2Earg
      (knd, s2e2) => s2exp_top(s2e2)
    | _(*non-S2Earg*) => s2exp_top(s2e2)
    )
  | isTPZ(s1e3) =>
    (
    case+
    s2e2.node() of
    | S2Earg
      (knd, s2e2) => s2exp_tpz(s2e2)
    | _(*non-S2Earg*) => s2exp_tpz(s2e2)
    )
  | _(* else *) => trans12_sexp_ci(s1e3)
  ) : s2exp // end-of-val [s2e3]
  }
end
//
|
_ (* else *) =>
let
val
s2e1 =
trans12_sexp(s1e1) in auxapp2_1_(s1e0, s2e1)
end // end of [let]
)
) (* end of [else] *)
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
| _(*non-S2Tfun*) => S2Tnone0()
) : sort2 // end of [val]
//
val s2t3 =
(
case+
s2e1.sort() of
| S2Tfun(s2ts, _) =>
  sort2lst_get_at(s2ts, 1)
| _(*non-S2Tfun*) => S2Tnone0()
) : sort2 // end of [val]
//
val s2e2 = trans12_sexp_ck(s1e2, s2t2)
val s2e3 = trans12_sexp_ck(s1e3, s2t3)
//
in
  s2exp_app2(s1e0.loc(), s2e1, s2e2, s2e3)
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
auxl1st
( s1e0
: s1exp): s2exp = let
//
(*
val () =
println!
("\
trans12_sexp:\
 auxl1st: s1e0 = ", s1e0)
*)
//
val-
S1El1st(s1es) = s1e0.node()
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
end // end of [auxl1st]

(* ****** ****** *)

fun
auxl2st
( s1e0
: s1exp): s2exp = let
// 
(*
val () =
println!
("\
trans12_sexp:\
 auxl2st: s1e0 = ", s1e0)
*)
//
val-
S1El2st
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
end // end of [auxl2st]

(* ****** ****** *)

fun
auxtrcd11
( s1e0
: s1exp): s2exp = let
//
val-
S1Etrcd1
(knd, s1es) = s1e0.node()
//
val s2es =
trans12_sexplst_ci(s1es)
//
in
  s2exp_trcd11(knd, s2es)
end // end of [auxtrcd11]

fun
auxtrcd12
( s1e0
: s1exp): s2exp = let
//
val-
S1Etrcd1
( knd, xs1, xs2) = s1e0.node()
//
val
s2es1 = trans12_sexplst_cp(xs1)
val
s2es2 = trans12_sexplst_ct(xs2)
//
in
  s2exp_trcd12(knd, s2es1, s2es2)
end // end of [auxtrcd12]

(* ****** ****** *)

fun
auxtrcd21
( s1e0
: s1exp): s2exp = let
//
val-
S1Etrcd2
(knd, ls1es) = s1e0.node()
//
val ls2es =
trans12_labsexplst_ci(ls1es)
//
in
  s2exp_trcd21( knd, ls2es )
end // end of [auxtrcd21]

fun
auxtrcd22
( s1e0
: s1exp): s2exp = let
//
val-
S1Etrcd2
( knd
, lxs1, lxs2) = s1e0.node()
//
val
ls2es1 =
trans12_labsexplst_cp( lxs1 )
val
ls2es2 =
trans12_labsexplst_ct( lxs2 )
//
in
  s2exp_trcd22(knd, ls2es1, ls2es2)
end // end of [auxtrcd22]

(* ****** ****** *)

fun
auxqual0
( s1e0
: s1exp): s2exp = let
//
val
loc0 = s1e0.loc()
val-
S1Equal
( tok0
, s1e1) = s1e0.node()
//
fun
auxqid
( qua: token
, s1e: s1exp): s2exp =
let
//
val-
S1Eid0(sym) = s1e.node()
//
val
opt =
the_sexpenv_qfind(qua, sym)
//
in
case+ opt of
| ~
None_vt() => s2exp_none1(s1e0)
| ~
Some_vt(s2i) => auxqid_some(s2i)
end // end of [auxqid]
//
and
auxqid_some
( s2i0
: s2itm): s2exp =
(
case+ s2i0 of
| S2ITMvar(x0) => auxqid_s2var(x0)
| S2ITMcst(xs) => auxqid_s2cst(xs)
| S2ITMfmodenv _ => s2exp_none1(s1e0)
) (* end of [auxqid_some] *)
and
auxqid_s2var
( s2v0
: s2var): s2exp =
(
  s2exp_var(s2v0)
)
and
auxqid_s2cst
( s2cs
: s2cstlst): s2exp =
(
//
case- s2cs of
(*
|
list_nil() => s2exp_none1(s1e0)
*)
|
list_cons(s2c1, _) => s2exp_cst(s2c1)
//
) (* end of [auxqid_s2cst] *)

in
//
case+
s1e1.node() of
| S1Eid0 _ => auxqid(tok0, s1e1)
| _(*else*) => s2exp_none1(s1e0)
end (*let*) // end of [auxqual0]

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
| S1Eid0 _ => auxid0(s1e0)
//
| S1Eint(tok) =>
  s2exp_int(token2sint(tok))
//
(*
| S1Ebtf(tok) =>
  s2exp_btf(token2sbtf(tok))
*)
| S1Echr(tok) =>
  s2exp_chr(token2schr(tok))
//
(*
| S1Eflt of token
*)
//
| S1Estr(tok) =>
  s2exp_str(token2sstr(tok))
//
| S1Eapp1 _ => auxapp1(s1e0)
| S1Eapp2 _ => auxapp2(s1e0)
//
| S1El1st _ => auxl1st(s1e0)
| S1El2st _ => auxl2st(s1e0)
//
| S1Etrcd1
    (k0, _) => auxtrcd11(s1e0)
| S1Etrcd1
    (k0, _, _) => auxtrcd12(s1e0)
  // end of [S1Etrcd1]
//
| S1Etrcd2
    (k0, _) => auxtrcd21(s1e0)
| S1Etrcd2
    (k0, _, _) => auxtrcd22(s1e0)
  // end of [S1Etrcd2]
//
| S1Eanno(s1e1, s1t2) =>
  let
    val
    s2t2 = trans12_sort(s1t2)
  in
    trans12_sexp_ck(s1e1, s2t2)
  end
//
| S1Equal
  (tok0, d1e1) => auxqual0(s1e0)
//
| S1Enone(loc) => s2exp_none1(s1e0)
//
| _(*rest-of-s1exp*) => s2exp_none1(s1e0)
//
end // end of [trans12_sexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_sexp_ci
  (s1e0) = let
(*
val () =
println!
("trans12_sexp_ci: s1e0 = ", s1e0)
*)
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
    sort2_is_impred(s2e0.sort())
    then s2e0 else s2exp_cimp(s1e0.loc(), s2e0)
    // end of [if]
  end
//
end // end of [trans12_sexp_ci]

implement
trans12_sexp_cp
  (s1e0) = let
(*
val () =
println!
("trans12_sexp_cp: s1e0 = ", s1e0)
*)
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
    sort2_is_proof(s2e0.sort())
    then s2e0 else s2exp_cprf(s1e0.loc(), s2e0)
    // end of [if]
  end
//
end // end of [trans12_sexp_cp]

implement
trans12_sexp_ct
  (s1e0) = let
(*
val () =
println!
("trans12_sexp_ct: s1e0 = ", s1e0)
*)
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
    sort2_is_tcode(s2e0.sort())
    then s2e0 else s2exp_ctcd(s1e0.loc(), s2e0)
    // end of [if]
  end
//
end // end of [trans12_sexp_ct]

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
("trans12_sexp_ck: s2t0 = ", s2t0)
*)
//
in
//
case+
s1e0.node() of
|
_(*rest-of-s1exp*) =>
let
val s2e0 =
trans12_sexp(s1e0)
val s2t1 = s2e0.sort()
//
(*
val ((*void*)) =
println!
("trans12_sexp_ck: s2t1 = ", s2t1)
*)
//
in
if
s2t1 <= s2t0
then s2e0 else
s2exp_cast(s1e0.loc(), s2e0, s2t0)
end // end of [let]
//
end (* end of [trans12_sexp_ck] *)

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
trans12_sexplst_cp
  (s1es) =
list_vt2t(s2es) where
{
val
s2es =
list_map<s1exp><s2exp>
  (s1es) where
{
implement
list_map$fopr<s1exp><s2exp>
  (s1e) = trans12_sexp_cp(s1e)
// implement
}
} (* end of [trans12_sexplst_cp] *)

implement
trans12_sexplst_ct
  (s1es) =
list_vt2t(s2es) where
{
val
s2es =
list_map<s1exp><s2exp>
  (s1es) where
{
implement
list_map$fopr<s1exp><s2exp>
  (s1e) = trans12_sexp_ct(s1e)
// implement
}
} (* end of [trans12_sexplst_ct] *)

implement
trans12_sexplst_ci
  (s1es) =
list_vt2t(s2es) where
{
val
s2es =
list_map<s1exp><s2exp>
  (s1es) where
{
implement
list_map$fopr<s1exp><s2exp>
  (s1e) = trans12_sexp_ci(s1e)
// implement
}
} (* end of [trans12_sexplst_ci] *)

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
(loc0, s1es, s2ts) =
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
//
| list_nil() =>
  (
    case+ s2ts of
    | list_nil
        ((*void*)) => list_nil()
    | list_cons
        (s2t0, s2ts) =>
      (
      list_cons(s2e0, s2es)
      ) where
      {
        val s2e0 =
          s2exp_none0_s2t(s2t0)
        // end of [val]
        val s2es = auxlst(s1es, s2ts)
      }
  )
//
| list_cons(s1e0, s1es) =>
  (
    case+ s2ts of
    | list_nil() =>
      (
      list_cons(s2e0, s2es)
      ) where
      {
        val s2t0 =
          S2Tnone0()
        val s2e0 =
          trans12_sexp_ck(s1e0, s2t0)
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
trans12_labsexplst_ci
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
  | L0ABLsome(l0) => SLABELED(l0, trans12_sexp_ci(x0))
  )
)
//
} (* trans12_labsexplst_ci *)
implement
trans12_labsexplst_cp
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
  | L0ABLsome(l0) => SLABELED(l0, trans12_sexp_cp(x0))
  )
)
//
} (* trans12_labsexplst_cp *)
implement
trans12_labsexplst_ct
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
  | L0ABLsome(l0) => SLABELED(l0, trans12_sexp_ct(x0))
  )
)
//
} (* trans12_labsexplst_ct *)

(* ****** ****** *)
//
(*
implement
trans12_seff
  (s1f0) =
(
case+ s1f0 of
| S1EFFnone _ => S2EFFnil()
| S1EFFsome _ => S2EFFall()
) (* end of [trans12_seff] *)
*)
//
(* ****** ****** *)

implement
trans12_effsexpopt
  (opt0) =
(
case+ opt0 of
| EFFS1EXPnone() =>
  EFFS2EXPnone()
| EFFS1EXPsome(s1e) =>
  EFFS2EXPsome(trans12_sexp(s1e))
(*
| EFFS1EXPsome(s1f, s1e) =>
  EFFS2EXPsome(s2f, s2e) where
  {
    val s2f = trans12_seff(s1f)
    val s2e = trans12_sexp(s1e)
  }
*)
) (* end of [trans12_effsexpopt] *)

(* ****** ****** *)

implement
trans12_datype
  (s2t, d1t) = let
//
val
res =
(
case+ res of
|
None() =>
(
  s2t//tbox|vtbx
)
|
Some(s1t) =>
trans12_sort(s1t)):sort2
//
val
s2t0 = auxmargs(arg, res)
//
in
  s2cst_make_idst(sid, s2t0)
end where
{
//
val+
D1ATYPE
( sid, arg
, res, d1cs) = d1t.node((*void*))
//
fun
auxargs
( xs
: t1arglst
) : sort2lst =
(
case+ xs of
|
list_nil() =>
(
list_nil(*void*)
)
|
list_cons(x0, xs) =>
(
case+ x0.node() of
|
T1ARGsome(s1t, _) =>
list_cons
(trans12_sort(s1t), auxargs(xs))
)
) (* end of [auxargs] *)
//
fun
auxmargs
( xs
: t1marglst
, res: sort2): sort2 =
(
case+ xs of
|
list_nil() => res
|
list_cons(x0, xs) =>
(
case+ x0.node() of
|
T1MARGlist(t1as) =>
S2Tfun
(auxargs(t1as), auxmargs(xs, res))
)
) (* end of [auxmargs] *)
//
} (* end of [trans12_datype] *)

(* ****** ****** *)

implement
trans12_datypelst
  (s2t, d1ts) =
(
list_vt2t
(
list_map<d1atype><s2cst>(d1ts)
)
) where
{
//
implement
list_map$fopr<d1atype><s2cst>(d1t) = trans12_datype(s2t, d1t)
//
} (* trans12_datypelst *)

(* ****** ****** *)

(* end of [xats_trans12_staexp.dats] *)
