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
// Start Time: August, 2018
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
"./../../xutl/SATS/mylibc.sats"
//
(* ****** ****** *)
//
#staload
SYM="./../SATS/symbol.sats"
#staload
FIX="./../SATS/fixity.sats"
//
#staload
ENV = "./../SATS/symenv.sats"
//
(* ****** ****** *)
//
#staload
LOC = "./../SATS/locinfo.sats"
overload + with $LOC.location_combine
overload print with $LOC.print_location
overload prerr with $LOC.prerr_location
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/filpath.sats"
#staload "./../SATS/filsrch.sats"
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/parsing.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/fixity.dats"
//
#staload
_(*TMP*) = "./../DATS/staexp1_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp1_print.dats"
//
(* ****** ****** *)
//
stadef
prcdv = $FIX.prcdv
macdef
int2prcdv = $FIX.int2prcdv
macdef
prcdv2int = $FIX.prcdv2int
//
(* ****** ****** *)
//
macdef
ASSOCnon = $FIX.ASSOCnon()
macdef
ASSOClft = $FIX.ASSOClft()
macdef
ASSOCrgt = $FIX.ASSOCrgt()
//
(* ****** ****** *)

stadef
fxitm = $FIX.fxitm
//
typedef
d1pitm = fxitm(d1pat)
typedef
d1pitmlst = List0(d1pitm)
//
typedef
d1eitm = fxitm(d1exp)
typedef
d1eitmlst = List0(d1eitm)
//
macdef
FXITMatm
(x) = $FIX.FXITMatm(,(x))
macdef
FXITMopr
(x, a) = $FIX.FXITMopr(,(x), ,(a))
//
(* ****** ****** *)

fun
fxitmlst_resolve_d1pat
( loc0: loc_t
, itms: d1pitmlst): d1pat =
(
$FIX.fxitmlst_resolve<d1pat>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<d1pat>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
  val d1p_node =
  (
    case+
    f1.node() of
    | D1Papp() =>
      D1Papp1(x0, x2)
    | _(*non-D1Papp*) =>
      D1Papp2(f1, x0, x2)
  ) : d1pat_node // end of [val]
in
  FXITMatm(d1pat_make_node(loc, d1p_node))
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<d1pat>
  (f0, x1) = let
in
//
case+
f0.node() of
| D1Pbs0() => let
    val d1p =
    d1pat_make_node
    (x1.loc(), D1Pbs1(x1))
  in
    FXITMopr(d1p, $FIX.infixtemp_fixty)
  end // end of [D1Pbs0]
| _(*non-D1Pbs0*) => let
   val loc =
   f0.loc() + x1.loc()
  in
    FXITMatm
    (
      d1pat_make_node(loc, d1p_node)
    ) where
    {
      val d1p_node = D1Papp1(f0, x1)
    }
  end // end of [non-D1Pbs0]
//
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<d1pat>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
  FXITMatm
  (
  d1pat_make_node(loc, D1Papp1(f1, x0))
  )
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxatm_none<d1pat>
  (loc) =
  d1pat_none(loc)
implement
$FIX.fxopr_get_loc<d1pat>
  (opr) = opr.loc()
//
implement
$FIX.fxitm_get_loc<d1pat>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<d1pat>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<d1pat>(itm)
//
val d1p =
d1pat_make_node(loc, D1Papp(*void*))
//
in
  $FIX.FXITMopr(d1p, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_d1pat]

(* ****** ****** *)

fun
fxitmlst_resolve_d1exp
( loc0: loc_t
, itms: d1eitmlst): d1exp =
(
$FIX.fxitmlst_resolve<d1exp>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<d1exp>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
  val d1e_node =
  (
    case+
    f1.node() of
    | D1Eapp() =>
      D1Eapp1(x0, x2)
    | _(*non-D1Eapp*) =>
      D1Eapp2(f1, x0, x2)
  ) : d1exp_node // end of [val]
in
  FXITMatm(d1exp_make_node(loc, d1e_node))
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<d1exp>
  (f0, x1) = let
in
//
case+
f0.node() of
| D1Ebs0() => let
    val d1e =
    d1exp_make_node
    (x1.loc(), D1Ebs1(x1))
  in
    FXITMopr(d1e, $FIX.infixtemp_fixty)
  end // end of [D1Ebs0]
| _(*non-D1Ebs0*) => let
   val loc =
   f0.loc() + x1.loc()
  in
    FXITMatm
    (
      d1exp_make_node(loc, d1e_node)
    ) where
    {
      val d1e_node = D1Eapp1(f0, x1)
    }
  end // end of [non-D1Ebs0]
//
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<d1exp>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
  FXITMatm
  (
  d1exp_make_node(loc, D1Eapp1(f1, x0))
  )
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxatm_none<d1exp>
  (loc) =
  d1exp_none(loc)
implement
$FIX.fxopr_get_loc<d1exp>
  (opr) = opr.loc()
//
implement
$FIX.fxitm_get_loc<d1exp>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<d1exp>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<d1exp>(itm)
//
val d1e =
d1exp_make_node(loc, D1Eapp(*void*))
//
in
  $FIX.FXITMopr(d1e, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_d1exp]

(* ****** ****** *)
//
extern
fun
trans01_qarg: q0arg -> q1arg
and
trans01_qarglst: q0arglst -> q1arglst
//
extern
fun
trans01_atyp: a0typ -> a1typ
and
trans01_atyplst: a0typlst -> a1typlst
//
extern
fun
trans01_darg: d0arg -> d1arg
and
trans01_darglst: d0arglst -> d1arglst
//
extern
fun
trans01_farg: f0arg -> f1arg
and
trans01_farglst: f0arglst -> f1arglst
//
extern
fun
trans01_sqarg: sq0arg -> sq1arg
and
trans01_sqarglst: sq0arglst -> sq1arglst
//
extern
fun
trans01_tiarg: ti0arg -> ti1arg
and
trans01_tiarglst: ti0arglst -> ti1arglst
//
extern
fun
trans01_tqarg: tq0arg -> tq1arg
and
trans01_tqarglst: tq0arglst -> tq1arglst
//
(* ****** ****** *)

implement
trans01_qarg
  (q0a0) = let
//
val loc0 = q0a0.loc()
//
in
//
case-
q0a0.node() of
(*
| Q0ARGnone(tok) =>
  (
    q1arg_make_node(loc0, Q1ARGnone(tok))
  )
*)
| Q0ARGsome(sid, opt) => let
//
    val-
    I0DNTsome(tok) = sid.node()
//
    val opt = trans01_sortopt(opt)
//
  in
    q1arg_make_node(loc0, Q1ARGsome(tok, opt))
  end (* end of [Q0ARGsome] *)
//
end // end of [trans01_qarg]

implement
trans01_qarglst
  (q0as) =
list_vt2t(q1as) where
{
  val
  q1as =
  list_map<q0arg><q1arg>
    (q0as) where
  {
    implement
    list_map$fopr<q0arg><q1arg> = trans01_qarg
  }
} (* end of [trans01_qarglst] *)

(* ****** ****** *)

implement
trans01_sqarg
  (sq0a) = let
//
val
loc0 = sq0a.loc()
//
in
//
case-
sq0a.node() of
| SQ0ARGsome
  (_, q0as, _) => let
    val q1as = trans01_qarglst(q0as)
  in
    sq1arg_make_node(loc0, SQ1ARGsome(q1as))
  end // end of [SQ0ARGsome]
//
end // end of [trans01_sqarg]

implement
trans01_sqarglst
  (sqas) =
list_vt2t(sqas) where
{
  val
  sqas =
  list_map<sq0arg><sq1arg>
    (sqas) where
  {
    implement
    list_map$fopr<sq0arg><sq1arg> = trans01_sqarg
  }
} (* end of [trans01_sqarglst] *)

(* ****** ****** *)

implement
trans01_tqarg
  (tq0a) = let
//
val
loc0 = tq0a.loc()
//
in
//
case-
tq0a.node() of
| TQ0ARGsome
  (_, q0as, _) => let
    val q1as = trans01_qarglst(q0as)
  in
    tq1arg_make_node(loc0, TQ1ARGsome(q1as))
  end // end of [TQ0ARGsome]
//
end // end of [trans01_tqarg]

implement
trans01_tqarglst
  (tq0as) =
list_vt2t(tq1as) where
{
  val
  tq1as =
  list_map<tq0arg><tq1arg>
    (tq0as) where
  {
    implement
    list_map$fopr<tq0arg><tq1arg> = trans01_tqarg
  }
} (* end of [trans01_tqarglst] *)

(* ****** ****** *)

implement
trans01_tiarg
  (ti0a) = let
//
val
loc0 = ti0a.loc()
//
in
//
case-
ti0a.node() of
| TI0ARGsome
  (_, s0es, _) => let
    val s1es = trans01_sexplst(s0es)
  in
    ti1arg_make_node(loc0, TI1ARGsome(s1es))
  end // end of [TI0ARGsome]
//
end // end of [trans01_tiarg]

implement
trans01_tiarglst
  (ti0as) =
list_vt2t(ti1as) where
{
  val
  ti1as =
  list_map<ti0arg><ti1arg>
    (ti0as) where
  {
    implement
    list_map$fopr<ti0arg><ti1arg> = trans01_tiarg
  }
} (* end of [trans01_tiarglst] *)

(* ****** ****** *)

implement
trans01_atyp
  (a0t0) = let
//
val
loc0 = a0t0.loc()
//
in
//
case+
a0t0.node() of
| A0TYPsome(s0e, opt) =>
  a1typ_make_node
  ( loc0
  , A1TYPsome(trans01_sexp(s0e), opt))
//
end // end of [trans01_atyp]

implement
trans01_atyplst
  (a0ts) =
list_vt2t(d1as) where
{
  val
  d1as =
  list_map<a0typ><a1typ>
    (a0ts) where
  {
    implement
    list_map$fopr<a0typ><a1typ> = trans01_atyp
  }
} (* end of [trans01_atyplst] *)

(* ****** ****** *)

implement
trans01_darg
  (d0a0) = let
//
val
loc0 = d0a0.loc()
//
in
//
case-
d0a0.node() of
//
| D0ARGsome_sta
  (_, s0qs, _) => let
    val
    s1qs =
    trans01_squalst(s0qs)
  in
    d1arg_make_node(loc0, D1ARGsome_sta(s1qs))
  end // end of [D0ARGsome_sta]
//
| D0ARGsome_dyn1
  (sid) => let
    val-
    I0DNTsome(tok) = sid.node()
  in
    d1arg_make_node(loc0, D1ARGsome_dyn1(tok))
  end // end of [D0ARGsome_dyn1]
| D0ARGsome_dyn2
  (_, arg0, opt1, _) => let
//
    val arg0 =
    trans01_atyplst(arg0)
//
    val opt1 =
    (
    case+ opt1 of
    | None() => None()
    | Some(a0ts) => Some(trans01_atyplst(a0ts))
    ) : a1typlstopt // end of [val]
//
  in
    d1arg_make_node(loc0, D1ARGsome_dyn2(arg0, opt1))
  end // end of [D0ARGsome_dyn2]
//
end // end of [trans01_darg]

implement
trans01_darglst
  (d0as) =
list_vt2t(d1as) where
{
  val
  d1as =
  list_map<d0arg><d1arg>
    (d0as) where
  {
    implement
    list_map$fopr<d0arg><d1arg> = trans01_darg
  }
} (* end of [trans01_darglst] *)

(* ****** ****** *)

implement
trans01_farg
  (f0a0) = let
//
val
loc0 = f0a0.loc()
//
in
//
case-
f0a0.node() of
//
| F0ARGsome_dyn(d0p) => let
//
    val d1p = trans01_dpat(d0p)
//
  in
    f1arg_make_node(loc0, F1ARGsome_dyn(d1p))
  end // end of [F0ARGsome_dyn]
//
| F0ARGsome_sta
  (_, s0qs, _) => let
    val
    s1qs =
    trans01_squalst(s0qs)
  in
    f1arg_make_node(loc0, F1ARGsome_sta(s1qs))
  end // end of [F0ARGsome_sta]
//
| F0ARGsome_met
  (_, s0es, _) => let
    val
    s1es =
    trans01_sexplst(s0es)
  in
    f1arg_make_node(loc0, F1ARGsome_met(s1es))
  end // end of [F0ARGsome_met]
//
end // end of [trans01_farg]

implement
trans01_farglst
  (f0as) =
list_vt2t(f1as) where
{
  val
  f1as =
  list_map<f0arg><f1arg>
    (f0as) where
  {
    implement
    list_map$fopr<f0arg><f1arg> = trans01_farg
  }
} (* end of [trans01_farglst] *)

(* ****** ****** *)

local

fun
auxid0
( id0
: d0pid)
: d1pitm = let
//
val loc = id0.loc()
val-
I0DNTsome
  (tok) = id0.node()
//
val tnd = tok.node()
//
in
  case- tnd of
//
  | T_IDENT_alp(nam) =>
    auxid0_IDENT(tok, nam)
  | T_IDENT_sym(nam) =>
    auxid0_IDENT(tok, nam)
//
(*
  | T_IDENT_dlr(nam) =>
    auxid0_IDENT(tok, nam)
  | T_IDENT_srp(nam) =>
    auxid0_IDENT(tok, nam)
*)
//
  | T_BSLASH((*void*)) => auxid0_BSLASH(tok)
//
end // end of [auxid0]

and
auxid0_IDENT
( tok: token
, nam: string): d1pitm = let
//
val loc = tok.loc()
//
val sym =
$SYM.symbol_make(nam)
val opt =
the_fxtyenv_search(sym)
val d1p0 =
d1pat_make_node(loc, D1Pid0(tok))
//
in
case+ opt of
| ~None_vt() =>
   FXITMatm(d1p0)
| ~Some_vt(fxty) =>
  (case+ fxty of
   | $FIX.FIXTYnon() => FXITMatm(d1p0)
   | _(*non-FIXTYnon*) => FXITMopr(d1p0, fxty)
  ) (* end of [Some_vt] *)
end // end of [auxid0_IDENT]

and
auxid0_BSLASH
  (tok:token): d1pitm = let
//
val loc = tok.loc()
//
val d1p0 =
  d1pat_make_node(loc, D1Pbs0())
//
in
  FXITMopr(d1p0, $FIX.backslash_fixty)
end // end of [auxid0_BSLASH]

(* ****** ****** *)

fun
auxitm
( d0p0
: d0pat)
: d1pitm = let
//
val
loc0 = d0p0.loc()
//
(*
val () =
println!("trans01_dpat:")
val () =
println!("auxitm: loc0 = ", loc0)
val () =
println!("auxitm: d0p0 = ", d0p0)
*)
//
in
//
case-
d0p0.node() of
//
| D0Pid0(id0) =>
  (
    auxid0(id0)
  )
//
(*
| D0Pstr(str) => auxstr(str)
*)
//
| D0Papps(d0ps) =>
  FXITMatm(d1p0) where
  {
    val d1ps =
    auxitmlst(d0ps)
    val d1p0 =
    fxitmlst_resolve_d1pat(loc0, d1ps)
  }
//
| D0Psqarg _ => auxsqarg(d0p0)
//
| D0Pparen _ => auxparen(d0p0)
//
| D0Ptuple _ => auxtuple(d0p0)
//
| D0Panno(d0p, s0e) =>
  FXITMatm(d1p0) where
  {
    val d1p = trans01_dpat(d0p)
    val s1e = trans01_sexp(s0e)
    val d1p0 =
    d1pat_make_node(loc0, D1Panno(d1p, s1e))
  }
//
| D0Pnone(_(*tok*)) =>
  FXITMatm(d1p0) where
  {
    val d1p0 = d1pat_make_node(loc0, D1Pnone())
  } (* end of [D0Pnone] *)
//
end // end of [auxitm]

and
auxitmlst
( xs
: d0patlst)
: d1pitmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<d0pat><d1pitm>
    (xs) where
  {
    implement
    list_map$fopr<d0pat><d1pitm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

(* ****** ****** *)

and
auxsqarg
( d0p0
: d0pat): d1pitm = let
//
val
loc0 = d0p0.loc()
//
val-
D0Psqarg
(_, s0as, _) = d0p0.node()
//
val
s1as = trans01_sarglst(s0as)
//
in
//
FXITMatm
(d1pat_make_node(loc0, D1Psarg(s1as)))
//
end // end of [auxsqarg]

(* ****** ****** *)

and
auxparen
( d0p0
: d0pat): d1pitm = let
//
val-
D0Pparen
( _
, d0ps1, rparen) = d0p0.node()
//
val
d1p0_node =
(
case+ rparen of
| d0pat_RPAREN_cons0(_) =>
  D1Plist(d1ps1) where
  {
    val d1ps1 = trans01_dpatlst(d0ps1)
  }
| d0pat_RPAREN_cons1(_, d0ps2, _) =>
  D1Plist(d1ps1, d1ps2) where
  {
    val d1ps1 = trans01_dpatlst(d0ps1)
    val d1ps2 = trans01_dpatlst(d0ps2)
  }
) : d1pat_node // end of [val]
//
in
  FXITMatm
  (d1pat_make_node(d0p0.loc(), d1p0_node))
end // end of [auxparen]

(* ****** ****** *)

and
auxtuple
( d0p0
: d0pat): d1pitm = let
//
val-
D0Ptuple
( knd, _
, d0ps1, rparen) = d0p0.node()
//
val
d1p0_node =
(
case+ rparen of
//
| d0pat_RPAREN_cons0
    (_) =>
  D1Ptuple(knd, d1ps1) where
  {
    val d1ps1 = trans01_dpatlst(d0ps1)
  }
| d0pat_RPAREN_cons1
    (_, d0ps2, _) =>
  D1Ptuple(knd, d1ps1, d1ps2) where
  {
    val d1ps1 = trans01_dpatlst(d0ps1)
    val d1ps2 = trans01_dpatlst(d0ps2)
  }
//
) : d1pat_node // end of [val]
//
in
  FXITMatm
  (d1pat_make_node(d0p0.loc(), d1p0_node))
end // end of [auxtuple]

(* ****** ****** *)

in (* in-of-local *)

implement
trans01_dpat
  (d0p0) = let
//
(*
val () =
println!
("trans01_dpat: d0p0 = ", d0p0)
*)
//
in
//
case+
auxitm(d0p0) of
| $FIX.FXITMatm(d1p0) => d1p0
| $FIX.FXITMopr(d1p0, fxty) => d1p0
//
end (* end of [trans01_dpat] *)

end // end of [local]

implement
trans01_dpatlst
  (d0ps) =
list_vt2t(d1ps) where
{
  val
  d1ps =
  list_map<d0pat><d1pat>
    (d0ps) where
  {
    implement
    list_map$fopr<d0pat><d1pat> = trans01_dpat
  }
} (* end of [trans01_dpatlst] *)

(* ****** ****** *)

fun
trans01_funarrow
( farrw
: f0unarrow): f1unarrow =
(
case- farrw of
| F0UNARROWdflt(_) =>
  F1UNARROWdflt(*void*)
| F0UNARROWlist(_, s0es, _) =>
  F1UNARROWlist(trans01_sexplst(s0es))
)

(* ****** ****** *)

local

fun
auxid0
( id0
: d0eid)
: d1eitm = let
//
val loc = id0.loc()
val-
I0DNTsome
  (tok) = id0.node()
//
val tnd = tok.node()
//
in
  case- tnd of
//
  | T_IDENT_alp(nam) =>
    auxid0_IDENT(tok, nam)
  | T_IDENT_sym(nam) =>
    auxid0_IDENT(tok, nam)
//
  | T_IDENT_dlr(nam) =>
    auxid0_IDENT(tok, nam)
//
(*
  | T_IDENT_srp(nam) =>
    auxid0_IDENT(tok, nam)
*)
//
  | T_BSLASH((*void*)) => auxid0_BSLASH(tok)
//
end // end of [auxid0]

and
auxid0_IDENT
( tok: token
, nam: string): d1eitm = let
//
val loc = tok.loc()
//
val sym =
$SYM.symbol_make(nam)
val opt =
the_fxtyenv_search(sym)
val d1e0 =
d1exp_make_node(loc, D1Eid0(tok))
//
in
case+ opt of
| ~None_vt() =>
   FXITMatm(d1e0)
| ~Some_vt(fxty) =>
  (case+ fxty of
   | $FIX.FIXTYnon() => FXITMatm(d1e0)
   | _(*non-FIXTYnon*) => FXITMopr(d1e0, fxty)
  ) (* end of [Some_vt] *)
end // end of [auxid0_IDENT]

and
auxid0_BSLASH
  (tok:token): d1eitm = let
//
val loc = tok.loc()
//
val d1e0 =
  d1exp_make_node(loc, D1Ebs0())
//
in
  FXITMopr(d1e0, $FIX.backslash_fixty)
end // end of [auxid0_BSLASH]

fun
auxint
( int
: t0int)
: d1eitm = let
//
val loc = int.loc()
//
val-
T0INTsome(tok) = int.node()
//
in
  FXITMatm
  (d1exp_make_node(loc, D1Eint(tok)))
end // end of [auxint]
and
auxchr
( chr
: t0chr)
: d1eitm = let
//
val loc = chr.loc()
//
val-
T0CHRsome(tok) = chr.node()
//
in
  FXITMatm
  (d1exp_make_node(loc, D1Echr(tok)))
end // end of [auxchr]
and
auxflt
( flt
: t0flt)
: d1eitm = let
//
val loc = flt.loc()
//
val-
T0FLTsome(tok) = flt.node()
//
in
  FXITMatm
  (d1exp_make_node(loc, D1Eflt(tok)))
end // end of [auxflt]
and
auxstr
( str
: t0str)
: d1eitm = let
//
val loc = str.loc()
//
val-
T0STRsome(tok) = str.node()
//
in
  FXITMatm
  (d1exp_make_node(loc, D1Estr(tok)))
end // end of [auxstr]

fun
auxitm
( d0e0
: d0exp)
: d1eitm = let
//
val
loc0 = d0e0.loc()
//
(*
val () =
println!("trans01_dexp:")
val () =
println!("auxitm: loc0 = ", loc0)
val () =
println!("auxitm: d0e0 = ", d0e0)
*)
//
in
//
case-
d0e0.node() of
//
| D0Eid0(id0) =>
  (
    auxid0(id0)
  )
//
| D0Eint(int) => auxint(int)
| D0Echr(chr) => auxchr(chr)
| D0Eflt(flt) => auxflt(flt)
| D0Estr(str) => auxstr(str)
//
| D0Eapps(d0es) =>
  FXITMatm(d1e0) where
  {
    val d1es =
    auxitmlst(d0es)
    val d1e0 =
    fxitmlst_resolve_d1exp(loc0, d1es)
  }
//
| D0Esqarg
  (tbeg, s0es, tend) =>
  FXITMatm(d1e0) where
  {
    val s1es =
    trans01_sexplst(s0es)
    val d1e0 =
    d1exp_make_node(loc0, D1Esqarg(s1es))
  }
| D0Etqarg
  (tbeg, s0es, tend) =>
  FXITMatm(d1e0) where
  {
    val s1es =
    trans01_sexplst(s0es)
    val d1e0 =
    d1exp_make_node(loc0, D1Etqarg(s1es))
  }
//
| D0Eparen _ => auxparen(d0e0)
//
| D0Etuple _ => auxtuple(d0e0)
//
| D0Eif0
  ( tif0, d0e1
  , d0e2, opt3, topt) => let
    val d1e1 = trans01_dexp(d0e1)
    val d1e2 =
    (
      case+ d0e2 of
      | d0exp_THEN
          (_, d0e2) => trans01_dexp(d0e2)
        // d0exp_THEN
    ) : d1exp // end of [val]
    val opt3 =
    (
      case+ opt3 of
      | d0exp_ELSEnone
          () => None((*void*))
      | d0exp_ELSEsome
          (_, d0e) => Some(trans01_dexp(d0e))
    ) : d1expopt // end of [val]
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
        d1exp_make_node
        (loc0, D1Eif0(d1e1, d1e2, opt3))
    }
  end (* end of [D0Eif0] *)
//
| D0Ecase
  ( knd, d0e1, tof2
  , tbar, d0cs, tend) => let
    val d1e1 = trans01_dexp(d0e1)
    val d1cs = trans01_dclaulst(d0cs)
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
      d1exp_make_node
        (loc0, D1Ecase(knd, d1e1, d1cs))
      // end of [val]
    }
  end // end of [D0Ecase]
//
| D0Elet
  ( tok(*let*)
  , d0cs
  , topt, d0es, tend) => let
    val d1cs = trans01_declist(d0cs)
    val d1es =
    (
    case+ d0es of
    | list_nil() =>
      (
        list_sing(d1e0)
      ) where
      {
        val d1e0 = d1exp_none(tend.loc())
      }
    | list_cons _ => trans01_dexplst(d0es)
    ) : d1explst // end of [val]
  in
    FXITMatm
    (
      d1exp_make_node(loc0, D1Elet(d1cs, d1es))
    )
  end // end of [D0Elet] *)
//
| D0Ewhere(d0e1, d0cs) => let
//
    val d1e1 = trans01_dexp(d0e1)
//
  in
    case+ d0cs of
    | d0eclseq_WHERE
      (_, _, d0cs, _) => let
        val d1cs = trans01_declist(d0cs)
      in
        FXITMatm
        (
          d1exp_make_node(loc0, D1Ewhere(d1e1, d1cs))
        )
      end // end of [d0eclseq_WHERE]
  end // end of [D0Ewhere]
//
| D0Ebrack
  (tbeg, d0es, tend) => let
    val d1es =
    trans01_dexplst(d0es)
    val d1e0 =
    (
      d1exp_make_node
        (loc0, D1Ebrack(d1es))
      // d1exp_make_node
    ) (* end of [val] *)
  in
(*
    HX: postfix
    $FIX.brack_fixty =
    FIXTYpos(brack_prcdv)
*)
    $FIX.FXITMopr(d1e0, $FIX.brack_fixty)
  end
//
| D0Edtsel
  (tdot, lab1, arg2) => let
    val arg2 =
    trans01_dexpopt(arg2)
    val-
    L0ABLsome(lab1) = lab1.node()
    val d1e0 =
    (
      d1exp_make_node
        (loc0, D1Edtsel(lab1, arg2))
      // d1exp_make_node
    ) (* end of [val] *)
  in
(*
    HX: postfix
    $FIX.dtsel_fixty =
    FIXTYpos(dtsel_prcdv)
*)
    $FIX.FXITMopr(d1e0, $FIX.dtsel_fixty)
  end
//
| D0Elam
  ( knd//lam|lam@
  , arg, res
  , arrw, body, tend) => let
//
    val arg =
      trans01_farglst(arg)
    val res =
      trans01_effsexpopt(res)
    val arrw =
      trans01_funarrow(arrw)
//
    val body = trans01_dexp(body)
//
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
      d1exp_make_node
      ( loc0
      , D1Elam
        (knd, arg, res, arrw, body))
    }
  end // end of [D1Elam]
//
| D0Efix
  ( knd//fix|fix@
  , fid, arg, res
  , arrw, body, tend) => let
//
    val fid =
    (
    case-
    fid.node() of
    | I0DNTsome(tok) => tok
    ) : token
//
    val arg =
      trans01_farglst(arg)
    val res =
      trans01_effsexpopt(res)
    val arrw =
      trans01_funarrow(arrw)
//
    val body = trans01_dexp(body)
//
  in
    FXITMatm(d1e0) where
    {
    val d1e0 =
    d1exp_make_node
    ( loc0
    , D1Efix
      (knd, fid, arg, res, arrw, body))
    }
  end // end of [D1Efix]
//
| D0Etry0
  ( tbeg, d0e1, twth
  , tbar, d0cs, tend) => let
    val d1e1 = trans01_dexp(d0e1)
    val d1cs = trans01_dclaulst(d0cs)
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
        d1exp_make_node
        (loc0, D1Etry0(tbeg, d1e1, d1cs))
    }
  end // end of [D0Etry0]
//
| D0Eanno(d0e1, s0e2) =>
  let
    val d1e1 = trans01_dexp(d0e1)
    val s1e2 = trans01_sexp(s0e2)
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
      d1exp_make_node(loc0, D1Eanno(d1e1, s1e2))
    }
  end // end of [D0Eanno]
//
| D0Equal(tok1, d0e2) =>
  let
    val d1e2 = trans01_dexp(d0e2)
  in
    FXITMatm(d1e0) where
    {
      val d1e0 =
      d1exp_make_node(loc0, D1Equal(tok1, d1e2))
    }
  end // end of [D0Equal]
//
| D0Enone(_(*tokerr*)) =>
  let
    val d1e0 = d1exp_none(loc0) in FXITMatm(d1e0)
  end // end of [D0Enone]
//
end (* end of [auxitm] *)

and
auxitmlst
( xs
: d0explst)
: d1eitmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<d0exp><d1eitm>
    (xs) where
  {
    implement
    list_map$fopr<d0exp><d1eitm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

(* ****** ****** *)

and
auxparen
( d0e0
: d0exp): d1eitm = let
//
val-
D0Eparen
( _
, d0es1, rparen) = d0e0.node()
//
val
d1e0_node =
(
case+ rparen of
| d0exp_RPAREN_cons0(_) =>
  D1Elist(d1es1) where
  {
    val
    d1es1 = trans01_dexplst(d0es1)
  }
| d0exp_RPAREN_cons1(_, d0es2, _) =>
  D1Elist(d1es1, d1es2) where
  {
    val d1es1 = trans01_dexplst(d0es1)
    val d1es2 = trans01_dexplst(d0es2)
  }
| d0exp_RPAREN_cons2(_, d0es2, _) =>
  D1Eseqn(d1es1, d1es2) where
  {
    val d1es1 = trans01_dexplst(d0es1)
    val d1es2 = trans01_dexplst(d0es2)
  }
) : d1exp_node // end of [val]
//
in
  FXITMatm
  (d1exp_make_node(d0e0.loc(), d1e0_node))
end // end of [auxparen]

(* ****** ****** *)

and
auxtuple
( d0e0
: d0exp): d1eitm = let
//
val-
D0Etuple
( knd, _
, d0es1, rparen) = d0e0.node()
//
val
d1e0_node =
(
case+ rparen of
//
| d0exp_RPAREN_cons0
    (_) =>
  D1Etuple(knd, d1es1) where
  {
    val d1es1 = trans01_dexplst(d0es1)
  }
| d0exp_RPAREN_cons1
    (_, d0es2, _) =>
  D1Etuple(knd, d1es1, d1es2) where
  {
    val d1es1 = trans01_dexplst(d0es1)
    val d1es2 = trans01_dexplst(d0es2)
  }
//
// HX: redundant!!!
//
| d0exp_RPAREN_cons2
    (_, d0es2, _) =>
  D1Etuple(knd, d1es1, d1es2) where
  {
    val d1es1 = trans01_dexplst(d0es1)
    val d1es2 = trans01_dexplst(d0es2)
  }
//
) : d1exp_node // end of [val]
//
in
  FXITMatm
  (d1exp_make_node(d0e0.loc(), d1e0_node))
end // end of [auxtuple]

(* ****** ****** *)

in (* in-of-local *)

implement
trans01_dexp
  (d0e0) = let
//
(*
val () =
println!
("trans01_dexp: d0e0 = ", d0e0)
*)
//
in
//
case+
auxitm(d0e0) of
| $FIX.FXITMatm(d1e0) => d1e0
| $FIX.FXITMopr(d1e0, fxty) => d1e0
//
end (* end of [trans01_dexp] *)

end // end of [local]

implement
trans01_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d0e) => Some(trans01_dexp(d0e))
) (* end of [trans01_dexpopt] *)

implement
trans01_dexplst
  (d0es) =
list_vt2t(d1es) where
{
  val
  d1es =
  list_map<d0exp><d1exp>
    (d0es) where
  {
    implement
    list_map$fopr<d0exp><d1exp> = trans01_dexp
  }
} (* end of [trans01_dexplst] *)

(* ****** ****** *)
//
extern
fun
trans01_dgua: d0gua -> d1gua
extern
fun
trans01_dgpat: d0gpat -> d1gpat
extern
fun
trans01_dgualst: d0gualst -> d1gualst
//
(* ****** ****** *)

implement
trans01_dgua
  (d0g0) = let
//
val loc0 = d0g0.loc()
//
in
//
case+
d0g0.node() of
| D0GUAexp(d0e) => let
    val d1e = trans01_dexp(d0e)
  in
    d1gua_make_node(loc0, D1GUAexp(d1e))
  end
| D0GUAmat
  (d0e, tok, d0p) => let
    val d1e = trans01_dexp(d0e)
    val d1p = trans01_dpat(d0p)
  in
    d1gua_make_node(loc0, D1GUAmat(d1e, d1p))
  end
//
end // end of [trans01_dgua]

implement
trans01_dgualst
  (d0gs) =
list_vt2t(d1gs) where
{
  val
  d1gs =
  list_map<d0gua><d1gua>
    (d0gs) where
  {
    implement
    list_map$fopr<d0gua><d1gua> = trans01_dgua
  }
} (* end of [trans01_dgualst] *)

(* ****** ****** *)

implement
trans01_dgpat
  (d0gp) = let
//
val loc0 = d0gp.loc()
//
in
//
case+
d0gp.node() of
| D0GPATpat(d0p) =>
  d1gpat_make_node
  ( loc0
  , D1GPATpat(trans01_dpat(d0p)))
| D0GPATgua(d0p, _, d0gs) =>
  (
  d1gpat_make_node
  (loc0, D1GPATgua(d1p, d1gs))
  ) where
  {
    val d1p = trans01_dpat(d0p)
    val d1gs = trans01_dgualst(d0gs)
  }
//
end // end of [trans01_dgpat]

(* ****** ****** *)

implement
trans01_dclau
  (d0cl) = let
//
val loc0 = d0cl.loc()
//
in
case+
d0cl.node() of
| D0CLAUgpat(dgp) =>
  d1clau_make_node
  (loc0, D1CLAUgpat(trans01_dgpat(dgp)))
| D0CLAUclau(dgp, tok, d0e) =>
  d1clau_make_node
  ( loc0
  , D1CLAUclau
    (trans01_dgpat(dgp), trans01_dexp(d0e))
  ) (* d1clau_make_node *)
end // end of [trans01_dclau]

implement
trans01_dclaulst
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<d0clau><d1clau>
    (d0cs) where
  {
    implement
    list_map$fopr<d0clau><d1clau> = trans01_dclau
  }
} (* end of [trans01_dclaulst] *)

(* ****** ****** *)

extern
fun
trans01_valdecl: v0aldecl -> v1aldecl
and
trans01_valdeclist: v0aldeclist -> v1aldeclist

extern
fun
trans01_vardecl: v0ardecl -> v1ardecl
and
trans01_vardeclist: v0ardeclist -> v1ardeclist

extern
fun
trans01_fundecl: f0undecl -> f1undecl
and
trans01_fundeclist: f0undeclist -> f1undeclist

extern
fun
trans01_dcstdecl: d0cstdecl -> d1cstdecl
and
trans01_dcstdeclist: d0cstdeclist -> d1cstdeclist

(* ****** ****** *)

fun
trans01_gmarglst
( gmas
: g0marglst
) : g1marglst =
(
list_vt2t(gmas) where
{
  val
  gmas =
  list_map<g0marg><g1marg>
    (gmas) where
  {
    implement
    list_map$fopr<g0marg><g1marg> = trans01_gmarg
  }
}
) (* end of [trans01_gmarglst] *)

(* ****** ****** *)

fun
trans01_g0expdef
( gdef
: g0expdef): g1expopt =
(
case+ gdef of
| G0EDEFnone
  ((*void*)) => None()
| G0EDEFsome
  (opt, g0e) => Some(trans01_gexp(g0e))
)
fun
trans01_d0macdef
( mdef
: d0macdef): d1expopt =
(
case+ mdef of
| D0MDEFnone
  ((*void*)) => None()
| D0MDEFsome
  (opt, d0e) => Some(trans01_dexp(d0e))
)

(* ****** ****** *)

fun
trans01_teqdexpopt
( opt
: teqd0expopt): teqd1expopt =
(
case+ opt of
| TEQD0EXPnone() =>
  TEQD1EXPnone()
| TEQD0EXPsome(tok, d0e) =>
  TEQD1EXPsome(tok, trans01_dexp(d0e))
)

fun
trans01_wthsexpopt
( opt
: wths0expopt): wths1expopt =
(
case+ opt of
| WTHS0EXPnone() =>
  WTHS1EXPnone()
| WTHS0EXPsome(tok, s0e) =>
  WTHS1EXPsome(tok, trans01_sexp(s0e))
)

(* ****** ****** *)

implement
trans01_valdecl
  (d0cl) = let
//
val+
V0ALDECL(rcd) = d0cl
//
val
loc = rcd.loc
val
teq = rcd.teq
val
pat = trans01_dpat(rcd.pat)
val
def = trans01_dexpopt(rcd.def)
val
wtp = trans01_wthsexpopt(rcd.wtp)
//
(*
val () =
println!("trans01_valdecl: loc = ", loc)
val () =
println!("trans01_valdecl: pat = ", pat)
val () =
println!("trans01_valdecl: def = ", def)
val () =
println!("trans01_valdecl: wtp = ", wtp)
*)
//
in
  V1ALDECL
  (@{loc=loc,pat=pat,teq=teq,def=def,wtp=wtp})
end // end of [trans01_valdecl]

implement
trans01_valdeclist
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<v0aldecl><v1aldecl>
    (d0cs) where
  {
    implement
    list_map$fopr<v0aldecl><v1aldecl> = trans01_valdecl
  }
} (* end of [trans01_valdeclist] *)

(* ****** ****** *)

implement
trans01_vardecl
  (d0cl) = let
//
val+
V0ARDECL(rcd) = d0cl
//
val
loc = rcd.loc
//
val
nam = rcd.nam
val-
I0DNTsome(tok) = nam.node()
//
val
wth = 
(
case+
rcd.wth of
| None() => None()
| Some(nam) =>
  Some(tok) where
  {
    val-
    I0DNTsome(tok) = nam.node()
  }
) : tokenopt // end of [val]
val
res = trans01_sexpopt(rcd.res)
val
ini = trans01_teqdexpopt(rcd.ini)
//
(*
val () =
println!("trans01_vardecl: loc = ", loc)
val () =
println!("trans01_vardecl: nam = ", nam)
val () =
println!("trans01_vardecl: wth = ", wth)
val () =
println!("trans01_vardecl: ini = ", ini)
*)
//
in
  V1ARDECL
  (@{loc=loc,nam=tok,wth=wth,res=res,ini=ini})
end // end of [trans01_vardecl]

implement
trans01_vardeclist
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<v0ardecl><v1ardecl>
    (d0cs) where
  {
    implement
    list_map$fopr<v0ardecl><v1ardecl> = trans01_vardecl
  }
} (* end of [trans01_vardeclist] *)

(* ****** ****** *)

implement
trans01_fundecl
  (d0cl) = let
//
val+
F0UNDECL(rcd) = d0cl
//
val
loc = rcd.loc
val
teq = rcd.teq
//
val
nam = rcd.nam
val-
I0DNTsome(tok) = nam.node()
//
val
arg = trans01_farglst(rcd.arg)
val
res = trans01_effsexpopt(rcd.res)
//
val
def = trans01_dexpopt(rcd.def)
val
wtp = trans01_wthsexpopt(rcd.wtp)
//
(*
val () =
println!("trans01_fundecl: loc = ", loc)
val () =
println!("trans01_fundecl: nam = ", nam)
val () =
println!("trans01_fundecl: arg = ", arg)
val () =
println!("trans01_fundecl: res = ", res)
val () =
println!("trans01_fundecl: def = ", def)
val () =
println!("trans01_fundecl: wtp = ", wtp)
*)
//
in
  F1UNDECL
  (@{loc=loc,nam=tok
    ,arg=arg,res=res,teq=teq,def=def,wtp=wtp})
end // end of [trans01_fundecl]

implement
trans01_fundeclist
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<f0undecl><f1undecl>
    (d0cs) where
  {
    implement
    list_map$fopr<f0undecl><f1undecl> = trans01_fundecl
  }
} (* end of [trans01_fundeclist] *)

(* ****** ****** *)

implement
trans01_dcstdecl
  (d0cl) = let
//
(*
val
loc0 = d0cl.loc()
val () =
println!
("trans01_dcstdecl: loc0 = ", loc0)
val () =
println!
("trans01_dcstdecl: d0cl = ", d0cl)
*)
//
val+
D0CSTDECL(rcd) = d0cl
//
val
loc = rcd.loc
val
nam = rcd.nam
val-
I0DNTsome(tok) = nam.node()
val
arg = trans01_darglst(rcd.arg)
val
res = trans01_effsexpopt(rcd.res)
val
def = trans01_teqdexpopt(rcd.def)
//
(*
val () =
println!("trans01_dcstdecl: loc = ", loc)
val () =
println!("trans01_dcstdecl: nam = ", nam)
val () =
println!("trans01_dcstdecl: arg = ", arg)
val () =
println!("trans01_dcstdecl: res = ", res)
val () =
println!("trans01_dcstdecl: def = ", def)
*)
//
in
  D1CSTDECL
  (@{loc=loc,nam=tok,arg=arg,res=res,def=def})
end // end of [trans01_dcstdecl]

implement
trans01_dcstdeclist
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<d0cstdecl><d1cstdecl>
    (d0cs) where
  {
    implement
    list_map$fopr<d0cstdecl><d1cstdecl> = trans01_dcstdecl
  }
} (* end of [trans01_dcstdeclist] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_signint
(sint: signint): int =
(
case+ sint of
| SIGNINTint(tint) =>
  g0string2int(rep) where
  {
    val-T_INT1(rep) = tint.node()
  }
| SIGNINTopr(topr, tint) =>
  let
    val-T_INT1(rep) = tint.node()
  in
    case-
    topr.node() of
    | T_IDENT_sym("+") => 0+g0string2int(rep)
    | T_IDENT_sym("-") => 0-g0string2int(rep)
  end
) (* end of [signint] *)

(* ****** ****** *)

fun
aux_precopt
(opt: precopt): int =
(
case+ opt of
| PRECOPTnil() => 0
| PRECOPTint(tint) =>
  g0string2int(rep) where
  {
    val-
    T_INT1(rep) = tint.node()
  } (* end of [PRECOPTint] *)
//
| PRECOPTopr(topr, pmod) =>
  (
  case+ pmod of
  | PRECMODnone
    ((*void*)) => pval
  | PRECMODsome
    (_, sint, _) => pval + aux_signint(sint)
  ) where
  {
(*
    val () =
    println!
    ("aux_precopt:topr=", topr)
    val () =
    println!
    ("aux_precopt:topr.loc=", topr.loc())
*)
    val-
    I0DNTsome(tok) = topr.node()
    val nam =
    (
    case- tok.node() of
    | T_IDENT_alp(nam) => nam
    | T_IDENT_sym(nam) => nam
    ) : string // end of [val]
    val sym = $SYM.symbol_make(nam)
    val opt = the_fxtyenv_search(sym)
    val pval =
    (
    case+ opt of
    | ~Some_vt(fxty) =>
      ( prcdv2int
        ($FIX.fixty_prcdv(fxty)) )
    | ~None_vt((*void*)) => 0 where
      {
        val
        loc = topr.loc()
        val
        ((*warn*)) =
        prerrln!(loc, ": warning(1): [", nam, "] is a non-operator!")
      }
    ) : int (* end of [val] *)
  }
) (* end of [aux_precopt] *)

(* ****** ****** *)

fun
aux_fixity
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cfixity
( tok0
, ids1
, opt2
) = d0cl.node()
//
val-
T_SRP_FIXITY
  (knd) = tok0.node()
//
val pval =
int2prcdv(aux_precopt(opt2))
//
val fxty =
(
ifcase
//
| knd=INFIX =>
  $FIX.FIXTYinf(pval, ASSOCnon)
| knd=INFIXL =>
  $FIX.FIXTYinf(pval, ASSOClft)
| knd=INFIXR =>
  $FIX.FIXTYinf(pval, ASSOCrgt)
//
| knd=PREFIX => $FIX.FIXTYpre(pval)
| knd=POSTFIX => $FIX.FIXTYpos(pval)
//
| _(*deadcode*) => $FIX.FIXTYnon((*void*))
//
) : fixty // end of [val]
//
fun
loop
(xs: i0dntlst): void =
(
case+ xs of
| list_nil() => ()
| list_cons (x0, xs) => let
    val-
    I0DNTsome(tok) = x0.node()
    val nam =
    (
    case- tok.node() of
    | T_IDENT_alp(nam) => nam
    | T_IDENT_sym(nam) => nam
    | T_IDENT_dlr(nam) => nam
    ) : string // end of [val]
    val sym = $SYM.symbol_make(nam)
  in
    loop(xs) where
    {
      val () =
      the_fxtyenv_insert(sym, fxty)
    }
  end
) (* end of [loop] *)
//
in
  let
    val () = loop(ids1)
  in
    d1ecl_make_node(loc0, D1Cnone1(d0cl))
  end
end // end of [aux_fixity]

fun
aux_nonfix
(d0cl: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cnonfix
(tok0, ids1) = d0cl.node()
//
fun
loop
(xs: i0dntlst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons (x0, xs) => let
  val-
  I0DNTsome(tok) = x0.node()
  val nam =
  (
  case- tok.node() of
  | T_IDENT_alp(nam) => nam
  | T_IDENT_sym(nam) => nam
  ) : string // end of [val]
  val sym = $SYM.symbol_make(nam)
in
  loop(xs) where
  {
  val () =
  the_fxtyenv_insert(sym, $FIX.FIXTYnon)
  }
  end
) (* end of [loop] *)
//
in
  let
    val () = loop(ids1)
  in
    d1ecl_make_node(loc0, D1Cnone1(d0cl))
  end
end // end of [aux_nonfix]

(* ****** ****** *)

fun
aux_static
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cstatic
(tok, d0c) = d0cl.node()
//
val d1c = trans01_decl(d0c)
//
in
d1ecl_make_node
(loc0, D1Cstatic(tok, d1c))
end (* let *) // end of [aux_static]
fun
aux_extern
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cextern
(tok, d0c) = d0cl.node()
//
val d1c = trans01_decl(d0c)
//
in
d1ecl_make_node
(loc0, D1Cextern(tok, d1c))
end (* let *) // end of [aux_extern]

(* ****** ****** *)

fun
aux_define
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cdefine
( tok0
, gid0
, gmas
, gdef) = d0cl.node()
//
val-
I0DNTsome(gid0) = gid0.node()
//
val gmas = trans01_gmarglst(gmas)
val gdef = trans01_g0expdef(gdef)
//
in
d1ecl_make_node
( loc0
, D1Cdefine(tok0, gid0, gmas, gdef))
end (* let *) // end of [aux_define]

(* ****** ****** *)

fun
aux_macdef
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cmacdef
( tok0
, gid0
, gmas
, mdef) = d0cl.node()
//
val-
I0DNTsome(gid0) = gid0.node()
//
val gmas = trans01_gmarglst(gmas)
val mdef = trans01_d0macdef(mdef)
//
in
d1ecl_make_node
( loc0
, D1Cmacdef(tok0, gid0, gmas, mdef))
end (* let *) // end of [aux_macdef]

(* ****** ****** *)

local
//
vtypedef
fopt = fnameopt_vt
//
fun
auxd1e
(d1e: d1exp): fopt =
let
(*
val () =
println!
("auxd1e: d1e = ", d1e)
*)
in
case+
d1e.node() of
| D1Estr _ => auxstr(d1e)
| _(*non-D1Estr*) => None_vt()
end // end of [auxd1e]
and
auxstr
(d1e: d1exp): fopt =
  auxtok(tok) where
{
  val-D1Estr(tok) = d1e.node()
}
and
auxtok
(tok: token): fopt =
(
case+
tok.node() of
| T_STRING_closed
  (fnm) =>
  (
    Some_vt(FNM0(fnm))
  ) where
  { val
    fnm = xatsopt_strunq(fnm)
    val fnm = strnormize(fnm)
  } // T_STRING_closed
| _(* else *) => None_vt(*void*)
)
//
in (* in-of-local *)

fun
aux_include
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
(*
val (_) =
println!("trans01: ")
val () =
println!
("aux_include: d0cl = ", d0cl")
*)
//
val-
D0Cinclude
(tok, d0e) = d0cl.node()
//
// (*
//
val out = stdout_ref
//
(*
val (_) =
fprintln!(out, "trans01: ")
val (_) =
fprintln!(out, "aux_include: ")
val (_) =
fprintln!(out, "the_filepath: ")
*)
val (_) = $FP0.the_filpath_fprint(out)
//
(*
val (_) =
fprintln!(out, "the_filepathlst: ")
*)
val (_) = $FP0.the_filpathlst_fprint(out)
//
// *)
//
val
src =
trans01_dexp(d0e)
val
opt = auxd1e(src)
val
opt1 =
(
case+ opt of
|
~None_vt() => None_vt()
|
~Some_vt(fnm) => filsrch_combined(fnm)
) : Option_vt(filpath)
//
var
knd:
int = ~1
//
val opt2 =
(
case+ opt1 of
|
None_vt() =>
None_vt()
|
Some_vt(fp0) =>
let
//
val
dp0 =
dirpath_make
(filpath_get_dirname(fp0))
//
val () =
(
ifcase
| is_sats(fp0) => knd := 0(*sta*)
| _(*non-sats*) => knd := 1(*dyn*)
)
//
in
d1csopt where
{
val
( pf1
| ()) = the_filpathlst_push(fp0)
val
( pf2
| ()) = the_dirpathlst_push(dp0)
//
val
d0csopt =
parse_from_filpath_toplevel(knd, fp0)
val
d1csopt =
(
case+ d0csopt of
|
~None_vt() => None_vt()
|
~Some_vt(d0cs) => Some_vt(trans01_declist(d0cs))
) : Option_vt(d1eclist)
//
val () = the_filpathlst_pout(pf1|(*void*))
val () = the_dirpathlst_pout(pf2|(*void*))
//
}  
end // end of [Some_vt]
) : Option_vt(d1eclist)
//
val opt1 = option_vt2t(opt1)
val opt2 = option_vt2t(opt2)
//
in
  d1ecl_make_node
  (loc0, D1Cinclude(tok, src, knd, opt1, opt2))
end // end of [aux_include]

end // end of [local]

(* ****** ****** *)

local

vtypedef
fopt = fnameopt_vt

(* ****** ****** *)

fun
iseq
(x0: d1exp): bool =
(
case+
x0.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym
("=") => true | _ => false
)
| _ (* non-D1Eid0 *) => false
)

(* ****** ****** *)

fun
auxd1e
(d1e: d1exp): fopt =
let
(*
val () =
println!
("auxd1e: d1e = ", d1e)
*)
in
case+
d1e.node() of
| D1Estr _ => auxstr(d1e)
| D1Eapp2 _ => auxapp2(d1e)
| _(*non-D1Estr*) => None_vt()
end // end of [auxd1e]
//
and
auxstr
(d1e: d1exp): fopt =
  auxtok(tok) where
{
  val-D1Estr(tok) = d1e.node()
}
//
and
auxtok
(tok: token): fopt =
(
case+
tok.node() of
| T_STRING_closed
  (fnm) =>
  (
    Some_vt(FNM0(fnm))
  ) where
  { val
    fnm = xatsopt_strunq(fnm)
    val fnm = strnormize(fnm)
  } // T_STRING_closed
| _(* else *) => None_vt(*void*)
)
//
and
auxapp2
(d1e: d1exp): fopt =
let
//
val-
D1Eapp2
(x0, x1, x2) = d1e.node()
//
in
//
ifcase
|
iseq(x0) =>
(
case+ x2.node() of
| D1Estr _ => auxstr(x2)
| _ (*else*) => None_vt(*void*)
)
| _ (* else *) => None_vt(*void*)
//
end // end of [auxapp2]

in (* in-of-local *)

fun
aux_staload
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
(*
val () =
println!("aux_staload")
*)
//
val-
D0Cstaload
(tok, d0e) = d0cl.node()
//
val
src =
trans01_dexp(d0e)
val
opt = auxd1e(src)
//
val
opt1 =
(
case+ opt of
| ~
None_vt() =>
None_vt()
| ~
Some_vt(fnm) =>
filsrch_combined(fnm)
) : Option_vt(filpath)
//
var
knd:
int = ~1
//
var
flag:int = 0
//
val
opt2 =
(
case+ opt1 of
|
None_vt() =>
None_vt()
|
Some_vt(fp0) =>
let
  val () =
  (
  ifcase
  | is_sats(fp0) => knd := 0(*sta*)
  | _(*non-sats*) => knd := 1(*dyn*)
  )
in
  let
  val res =
  trans01_staload_from_filpath(knd, fp0)
  in
    flag := res.0; res.1
  end
end // end of [Some_vt]
) : Option_vt(d1eclist)
//
val opt1 = option_vt2t(opt1)
val opt2 = option_vt2t(opt2)
//
in
//
d1ecl_make_node
( loc0
, D1Cstaload(tok, src, knd, opt1, flag, opt2))
//
end // end of [aux_staload]

end // end of [local]

(* ****** ****** *)

fun
aux_abssort
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cabssort
(tok, tid) = d0cl.node()
//
val-
I0DNTsome(tid) = tid.node()
//
in
d1ecl_make_node(loc0, D1Cabssort(tok, tid))
end // end of [aux_abssort]

(* ****** ****** *)

fun
aux_stacst0
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cstacst0
( tok, sid
, tmas, tcln, s0t2) = d0cl.node()
//
val-
I0DNTsome(sid) = sid.node()
//
val
tmas = trans01_tmarglst(tmas)
//
val s1t2 = trans01_sort(s0t2)
//
in
//
d1ecl_make_node(loc0, D1Cstacst0(tok, sid, tmas, s1t2))
//
end // end of [aux_stacst0]

(* ****** ****** *)

fun
aux_sortdef
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Csortdef
(knd, tid, _, def0) = d0cl.node()
//
val def1 =
(
case+
def0.node() of
| S0RTDEFsort(s0t) =>
  s1rtdef_make_node
  ( def0.loc()
  , S1RTDEFsort(trans01_sort(s0t)))
| S0RTDEFsbst
  (_, s0a, _, s0es, _) => let
    val s1a = trans01_sarg(s0a)
    val s1es = trans01_sexplst(s0es)
  in
    s1rtdef_make_node
    (def0.loc(), S1RTDEFsbst(s1a, s1es))
  end // end of [S0RTDEFsbst]
) : s1rtdef // end of [val]
//
val-I0DNTsome(tok) = tid.node((*void*))
//
(*
val () =
println!("trans01_decl: ")
val () =
println!("aux_sortdef: tok = ", tok)
val () =
println!("aux_sortdef: def1 = ", def1)
*)
//
in
  d1ecl_make_node(loc0, D1Csortdef(knd, tok, def1))
end // end of [aux_sortdef]

(* ****** ****** *)

fun
aux_sexpdef
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Csexpdef
( knd
, seid
, arg0
, opt0, _, def0) = d0cl.node()
//
val def1 = trans01_sexp(def0)
val opt1 = trans01_sortopt(opt0)
val arg1 = trans01_smarglst(arg0)
val-I0DNTsome(tok) = seid.node((*void*))
//
(*
val () =
println!("trans01_decl:")
val () =
println!("aux_sexpdef: tok = ", tok)
val () =
println!("aux_sexpdef: arg1 = ", arg1)
val () =
println!("aux_sexpdef: opt1 = ", opt1)
val () =
println!("aux_sexpdef: def1 = ", def1)
*)
//
in
d1ecl_make_node
  (loc0, D1Csexpdef(knd, tok, arg1, opt1, def1))
// d1ecl_make_node
end // end of [aux_sexpdef]

(* ****** ****** *)

fun
aux_abstdef
( def0
: abstdf0): abstdf1 =
(
  case+ def0 of
  | ABSTDF0some() =>
    ABSTDF1some()
  | ABSTDF0lteq(tok, s0e) =>
    ABSTDF1lteq(trans01_sexp(s0e))
  | ABSTDF0eqeq(tok, s0e) =>
    ABSTDF1eqeq(trans01_sexp(s0e))
) (* end of [aux_abstdef] *)

and
aux_abstype
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cabstype
( knd
, seid
, arg0, res0, def0) = d0cl.node()
//
val def1 =
  aux_abstdef(def0)
val arg1 =
  trans01_tmarglst(arg0)
val res1 = trans01_sortopt(res0)
//
val-I0DNTsome(tok) = seid.node((*void*))
//
(*
val () =
println!("trans01_d0ecl: ")
val () =
println!("aux_abstype: tok = ", tok)
val () =
println!("aux_abstype: arg1 = ", arg1)
val () =
println!("aux_abstype: def1 = ", def1)
*)
//
in
//
d1ecl_make_node
( loc0
, D1Cabstype(knd, tok, arg1, res1, def1))
//
end // end of [aux_abstype]

(* ****** ****** *)

fun
aux_absopen
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cabsopen
(tok, sqid) = d0cl.node()
//
in
//
d1ecl_make_node
(loc0, D1Cabsopen(tok, sqid)
) (* d1ecl_make_node *)
//
end // end of [aux_absopen]

(* ****** ****** *)

fun
aux_absimpl
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cabsimpl
( tok
, sqid
, smas
, res0, teq1, def2) = d0cl.node()
//
val smas =
trans01_smarglst(smas)
//
val res0 =
  trans01_sortopt(res0)
//
val def2 = trans01_sexp(def2)
//
in
//
d1ecl_make_node
( loc0
, D1Cabsimpl(tok, sqid, smas, res0, def2)
) (* d1ecl_make_node *)
//
end // end of [aux_absimpl]

(* ****** ****** *)

fun
aux_fundecl
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cfundecl
( knd
, mopt, tqas, d0cs) = d0cl.node()
//
val tqas = trans01_tqarglst(tqas)
val d1cs = trans01_fundeclist(d0cs)
//
in
  d1ecl_make_node
    (loc0, D1Cfundecl(knd, mopt, tqas, d1cs))
  // d1ecl_make_node
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_valdecl
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cvaldecl
(knd, mopt, d0cs) = d0cl.node()
//
val d1cs = trans01_valdeclist(d0cs)
//
in
  d1ecl_make_node
    (loc0, D1Cvaldecl(knd, mopt, d1cs))
  // d1ecl_make_node
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cvardecl
(knd, mopt, d0cs) = d0cl.node()
//
val d1cs = trans01_vardeclist(d0cs)
//
in
  d1ecl_make_node
  (loc0, D1Cvardecl(knd, mopt, d1cs))
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_impdecl
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cimpdecl
( knd
, mopt, sqas, tqas
, dqid, tias, f0as, res0, teq1, d0e2) = d0cl.node()
//
val sqas =
  trans01_sqarglst(sqas)
val tqas =
  trans01_tqarglst(tqas)
//
val tias =
  trans01_tiarglst(tias)
//
val f1as =
  trans01_farglst(f0as)
val res0 =
  trans01_effsexpopt(res0)
//
val d1e2 = trans01_dexp(d0e2)
//
in
  d1ecl_make_node
  ( loc0
  , D1Cimpdecl
    (knd, mopt, sqas, tqas, dqid, tias, f1as, res0, teq1, d1e2)
  )
  // d1ecl_make_node
end // end of [aux_impdecl]

(* ****** ****** *)

fun
aux_symload
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Csymload
(tok, sym, _, dqid, tint) = d0cl.node()
//
in
//
d1ecl_make_node
  (loc0, D1Csymload(tok, sym, dqid, tint))
//
end // end of [aux_symload]

(* ****** ****** *)

fun
aux_datasort
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cdatasort
(knd, d0ts) = d0cl.node()
//
val
d1ts =
list_map<d0tsort><d1tsort>
  (d0ts) where
{
  implement
  list_map$fopr<d0tsort><d1tsort>(x) = aux_d0tsort(x)
} (* end of [val] *)
//
val d1ts = list_vt2t{d1tsort}(d1ts)
//
in
  d1ecl_make_node(loc0, D1Cdatasort(knd, d1ts))
end // end of [aux_datasort]

and
aux_d0tsort
( d0t0
: d0tsort): d1tsort =
(
case+
d0t0.node() of
| D0TSORT
  (tid, _, s0cs) => let
    val-
    I0DNTsome(tok) = tid.node()
    val s1cs = trans01_srtconlst(s0cs)
  in
    d1tsort_make_node(d0t0.loc(), D1TSORT(tok, s1cs))
  end
)

(* ****** ****** *)

fun
aux_excptcon
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cexcptcon
  (knd, d0cs) = d0cl.node()
//
val
d1cs = trans01_datconlst(d0cs)
//
in
  d1ecl_make_node(loc0, D1Cexcptcon(knd, d1cs))
end // end of [aux_excptcon]

(* ****** ****** *)

fun
aux_datatype
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cdatatype
  (knd, d0ts, wd0cs) = d0cl.node()
//
val
d1ts =
list_map<d0atype><d1atype>
  (d0ts) where
{
  implement
  list_map$fopr<d0atype><d1atype>(x) = aux_d0atype(x)
}
val d1ts = list_vt2t(d1ts)
//
val
wd1cs =
(
case+ wd0cs of
| WD0CSnone() => WD1CSnone()
| WD0CSsome(_, _, d0cs, _) =>
  WD1CSsome(trans01_declist(d0cs))
) : wd1eclseq // end of [val]
//
(*
val () =
println!("trans01_decl:")
val () =
println!("aux_datatype: d1ts = ", d1ts)
val () =
println!("aux_datatype: wd1cs = ", wd1cs)
*)
//
in
  d1ecl_make_node(loc0, D1Cdatatype(knd, d1ts, wd1cs))
end // end of [aux_datatype]

and
aux_d0atype
( d0t0
: d0atype): d1atype = let
//
val loc0 = d0t0.loc()
//
in
//
case+
d0t0.node() of
| D0ATYPE
  (deid, arg, res, teq, d0cs) => let
//
    val-
    I0DNTsome(tok) = deid.node()
//
    val res = trans01_sortopt(res)
    val arg = trans01_tmarglst(arg)
//
    val d1cs = trans01_datconlst(d0cs)
//
  in
    d1atype_make_node(loc0, D1ATYPE(tok, arg, res, d1cs))
  end // end of [D0ATYPE]
//
end // end of [aux_d0atype]

(* ****** ****** *)

fun
aux_dynconst
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.loc()
//
val-
D0Cdynconst
(knd, tqas, d0cs) = d0cl.node()
//
val tqas = trans01_tqarglst(tqas)
val d1cs = trans01_dcstdeclist(d0cs)
//
in
  d1ecl_make_node
    (loc0, D1Cdynconst(knd, tqas, d1cs))
  // d1ecl_make_node
end // end of [aux_dynconst]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
trans01_decl
  (d0cl) = let
//
val
loc0 = d0cl.loc()
//
(*
val () =
println!
("trans01_decl: d0cl = ", d0cl)
*)
//
in
//
case+
d0cl.node() of
//
| D0Cfixity _ => aux_fixity(d0cl)
| D0Cnonfix _ => aux_nonfix(d0cl)
//
| D0Cstatic _ => aux_static(d0cl)
| D0Cextern _ => aux_extern(d0cl)
//
| D0Cdefine _ => aux_define(d0cl)
| D0Cmacdef _ => aux_macdef(d0cl)
//
| D0Clocal
  ( tbeg, head
  , topt, body, tend) =>
  let
    val
    head = trans01_declist(head)
    val
    body = trans01_declist(body)
  in
    d1ecl_make_node
    ( loc0, D1Clocal(head, body) )
  end // end of [D0Clocal]
//
| D0Cinclude _ => aux_include(d0cl)
//
| D0Cstaload _ => aux_staload(d0cl)
//
| D0Cabssort _ => aux_abssort(d0cl)
//
| D0Cstacst0 _ => aux_stacst0(d0cl)
//
| D0Csortdef _ => aux_sortdef(d0cl)
//
| D0Csexpdef _ => aux_sexpdef(d0cl)
//
| D0Cabstype _ => aux_abstype(d0cl)
| D0Cabsopen _ => aux_absopen(d0cl)
| D0Cabsimpl _ => aux_absimpl(d0cl)
//
| D0Cfundecl _ => aux_fundecl(d0cl)
//
| D0Cvaldecl _ => aux_valdecl(d0cl)
| D0Cvardecl _ => aux_vardecl(d0cl)
//
| D0Cimpdecl _ => aux_impdecl(d0cl)
//
| D0Csymload _ => aux_symload(d0cl)
//
| D0Cdatasort _ => aux_datasort(d0cl)
//
| D0Cexcptcon _ => aux_excptcon(d0cl)
| D0Cdatatype _ => aux_datatype(d0cl)
//
| D0Cdynconst _ => aux_dynconst(d0cl)
//
| D0Celse(tok1) =>
  (
  d1ecl_make_node(loc0, D1Celse(tok1))
  )
| D0Cendif(tok1) =>
  (
  d1ecl_make_node(loc0, D1Cendif(tok1))
  )
| D0Cifdec
  (tok1, test, topt) =>
  let
  val test = trans01_gexp(test)
  in
    d1ecl_make_node
    (loc0, D1Cifdec(tok1, test, topt))
  end
| D0Celsif
  (tok1, test, topt) =>
  let
  val test = trans01_gexp(test)
  in
    d1ecl_make_node
    (loc0, D1Celsif(tok1, test, topt))
  end
//
| D0Cnone _ => d1ecl_none1(d0cl)
//
| D0Ctokerr _ =>
  (
    d1ecl_make_node(loc0, D1Ctokerr(d0cl))
  )
//
(*
| _ (*rest-of-d0ecl*) =>
  (
    println!
    (loc0, ": trans01_decl: d0cl = ", d0cl); exit(1)
  ) (* end of [D0C...] *)
*)    
//
end // end of [trans01_decl]

(* ****** ****** *)

implement
trans01_declist
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<d0ecl><d1ecl>
    (d0cs) where
  {
    implement
    list_map$fopr<d0ecl><d1ecl> = trans01_decl
  }
} (* end of [trans01_declist] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_dynexp.dats] *)
