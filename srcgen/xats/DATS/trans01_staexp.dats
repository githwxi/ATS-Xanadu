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
SYM = "./../SATS/symbol.sats"
#staload
FIX = "./../SATS/fixity.sats"
#staload
ENV = "./../SATS/symenv.sats"
//
#staload
LOC = "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
overload = with $SYM.eq_symbol_symbol
overload + with $LOC.location_combine
overload print with $LOC.print_location

(* ****** ****** *)

#staload "./../SATS/basics.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"

(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/fixity.dats"
//
(* ****** ****** *)

stadef fxitm = $FIX.fxitm

(* ****** ****** *)

typedef g1eitm = fxitm(g1exp)
typedef g1eitmlst = List0(g1eitm)

typedef s1titm = fxitm(sort1)
typedef s1titmlst = List0(s1titm)

typedef s1eitm = fxitm(s1exp)
typedef s1eitmlst = List0(s1eitm)

(* ****** ****** *)

macdef
FXITMatm
(i0) = $FIX.FXITMatm(,(i0))
macdef
FXITMopr
(i0, f0) = $FIX.FXITMopr(,(i0), ,(f0))

(* ****** ****** *)

fun
fxitmlst_resolve_g1exp
( loc0: loc_t
, itms: g1eitmlst): g1exp =
(
$FIX.fxitmlst_resolve<g1exp>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<g1exp>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
  val g1e_node =
  (
    case+
    f1.node() of
    | G1Eapp() =>
      G1Eapp1(x0, x2)
    | _(*non-G1Eapp*) =>
      G1Eapp2(f1, x0, x2)
  ) : g1exp_node // end of [val]
in
  FXITMatm(g1exp_make_node(loc, g1e_node))
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<g1exp>
  (f0, x1) = let
  val loc =
  f0.loc() + x1.loc()
in
  FXITMatm
  (
  g1exp_make_node(loc, g1e_node)
  ) where
  {
    val g1e_node = G1Eapp1(f0, x1)
  }
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<g1exp>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
  FXITMatm
  (
  g1exp_make_node(loc, g1e_node)
  ) where
  {
    val g1e_node = G1Eapp1(f1, x0)
  }
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxatm_none<g1exp>
  (loc) =
  g1exp_none(loc)
implement
$FIX.fxopr_get_loc<g1exp>
  (opr) = opr.loc()
//
implement
$FIX.fxitm_get_loc<g1exp>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<g1exp>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<g1exp>(itm)
//
val g1e =
g1exp_make_node(loc, G1Eapp(*void*))
//
in
  $FIX.FXITMopr(g1e, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_g1exp]

(* ****** ****** *)

fun
fxitmlst_resolve_sort1
( loc0: loc_t
, itms: s1titmlst): sort1 =
(
$FIX.fxitmlst_resolve<sort1>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<sort1>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
  val s1t_node =
  (
    case+
    f1.node() of
    | S1Tapp() =>
      S1Tapp1(x0, x2)
    | _(*non-S1Tapp*) =>
      S1Tapp2(f1, x0, x2)
  ) : sort1_node // end of [val]
in
  FXITMatm(sort1_make_node(loc, s1t_node))
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<sort1>
  (f0, x1) = let
  val loc =
  f0.loc() + x1.loc()
in
  FXITMatm
  (
  sort1_make_node(loc, s1t_node)
  ) where
  {
    val s1t_node = S1Tapp1(f0, x1)
  }
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<sort1>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
  FXITMatm
  (
  sort1_make_node(loc, s1t_node)
  ) where
  {
    val s1t_node = S1Tapp1(f1, x0)
  }
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxatm_none<sort1>
  (loc) =
  sort1_none(loc)
implement
$FIX.fxopr_get_loc<sort1>
  (opr) = opr.loc()
//
implement
$FIX.fxitm_get_loc<sort1>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<sort1>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<sort1>(itm)
//
val s1t =
sort1_make_node(loc, S1Tapp(*void*))
//
in
  $FIX.FXITMopr(s1t, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_sort1]

(* ****** ****** *)

fun
fxitmlst_resolve_s1exp
( loc0: loc_t
, itms: s1eitmlst): s1exp =
(
$FIX.fxitmlst_resolve<s1exp>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<s1exp>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
  val s1e_node =
  (
    case+
    f1.node() of
    | S1Eapp() =>
      S1Eapp1(x0, x2)
    | _(*non-S1Eapp*) =>
      S1Eapp2(f1, x0, x2)
  ) : s1exp_node // end of [val]
in
  FXITMatm(s1exp_make_node(loc, s1e_node))
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<s1exp>
  (f0, x1) = let
in
//
case+
f0.node() of
//
| S1Ebs0() => let
    val s1e =
    s1exp_make_node
    (x1.loc(), S1Ebs1(x1))
  in
    FXITMopr(s1e, $FIX.infixtemp_fixty)
  end // end of [S1Ebs0]
//
| _(*non-S1Ebs0*) => let
   val loc =
   f0.loc() + x1.loc()
  in
    FXITMatm
    (
    s1exp_make_node(loc, s1e_node)
    ) where
    {
      val s1e_node = S1Eapp1(f0, x1)
    }
  end // end of [non-S1Ebs0]
//
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<s1exp>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
  FXITMatm
  (
  s1exp_make_node(loc, S1Eapp1(f1, x0))
  )
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxatm_none<s1exp>
  (loc) =
  s1exp_none(loc)
implement
$FIX.fxopr_get_loc<s1exp>
  (opr) = opr.loc()
//
implement
$FIX.fxitm_get_loc<s1exp>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<s1exp>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<s1exp>(itm)
//
val s1e =
s1exp_make_node(loc, S1Eapp(*void*))
//
in
  $FIX.FXITMopr(s1e, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_s1exp]

(* ****** ****** *)

local

fun
auxgid
( gid
: g0eid)
: g1eitm = let
//
val loc = gid.loc()
val-
I0DNTsome
  (tok) = gid.node()
//
val sym =
(
case-
tok.node() of
| T_IDENT_alp(nam) =>
  $SYM.symbol_make(nam)
| T_IDENT_sym(nam) =>
  $SYM.symbol_make(nam)
) : sym_t // end of [val]
//
val opt =
the_fxtyenv_search(sym)
//
val g1e0 =
g1exp_make_node(loc, G1Eid0(sym))
//
in
//
case+ opt of
| ~None_vt() =>
   FXITMatm(g1e0)
| ~Some_vt(fxty) =>
  (case+ fxty of
   | $FIX.FIXTYnon() => FXITMatm(g1e0)
   | _(*non-FIXTYnon*) => FXITMopr(g1e0, fxty)
  ) (* end of [Some_vt] *)
//
end // end of [auxgid]

fun
auxint
( int
: t0int)
: g1eitm = let
//
val loc = int.loc()
//
val-
T0INTsome(tok) = int.node()
//
in
  FXITMatm
  (g1exp_make_node(loc, G1Eint(tok)))
end // end of [auxint]
fun
auxstr
( str
: t0str)
: g1eitm = let
//
val loc = str.loc()
//
val-
T0STRsome(tok) = str.node()
//
in
  FXITMatm
  (g1exp_make_node(loc, G1Estr(tok)))
end // end of [auxstr]

fun
auxitm
( g0e0
: g0exp)
: g1eitm = let
//
val
loc0 = g0e0.loc()
//
(*
val () =
println!("trans01_gexp:")
val () =
println!("auxitm: loc0 = ", loc0)
val () =
println!("auxitm: g0e0 = ", g0e0)
*)
//
in
//
case+
g0e0.node() of
//
| G0Eid0(gid) => auxgid(gid)
//
| G0Eint(int) => auxint(int)
| G0Estr(str) => auxstr(str)
//
| G0Eapps(g0es) =>
  FXITMatm(g1e0) where
  {
    val g1es =
    auxitmlst(g0es)
    val g1e0 =
    fxitmlst_resolve_g1exp(loc0, g1es)
  }
//
| G0Elist
  (_, g0es, _) =>
  FXITMatm(g1e0) where
  {
    val g1es =
    trans01_gexplst(g0es)
    val g1e0 =
    g1exp_make_node(loc0, G1Elist(g1es))
  }
//
| G0Enone(tok) =>
  FXITMatm(g1e0) where
  {
    val g1e0 =
      g1exp_make_node(loc0, G1Enone1(g0e0))
    // end of [val]
  }
//
end // end of [auxitm]

and
auxitmlst
( xs
: g0explst)
: g1eitmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<g0exp><g1eitm>
    (xs) where
  {
    implement
    list_map$fopr<g0exp><g1eitm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

in (* in-of-local *)

implement
trans01_gexp
  (g0e0) = let
//
val
loc0 = g0e0.loc()
//
(*
val () =
println!
("trans01_gexp: g0e0 = ", g0e0)
*)
//
in(*in-of-let*)
//
case+
auxitm(g0e0) of
| $FIX.FXITMatm(g1e0) => g1e0
| $FIX.FXITMopr(g1e0, fxty) => g1e0
//
end (* end of [trans01_gexp] *)

end // end of [local]

(* ****** ****** *)

implement
trans01_gexplst
  (g0es) =
list_vt2t(g1es) where
{
val
g1es =
list_map<g0exp><g1exp>
  (g0es) where
{
  implement
  list_map$fopr<g0exp><g1exp> = trans01_gexp
}
} (* end of [trans01_gexplst] *)

(* ****** ****** *)

implement
trans01_gmarg
  (g0ma) =
(
case-
g0ma.node() of
|
G0MARGsarg
(tbeg, g0as, tend) =>
let
  val g1as =
  (
    list_map<g0arg><g1arg>(g0as)
  ) where
  {
    implement
    list_map$fopr<g0arg><g1arg>
      (g0a) =
      let
      val-I0DNTsome(tok) = g0a.node() in tok
      end
  } (* end of [where] *)
  val g1as = list_vt2t{g1arg}(g1as)
in
  g1marg_make_node(g0ma.loc(), G1MARGsarg(g1as))
end // end of [let]
|
G0MARGdarg
(tbeg, g0as, tend) =>
let
  val g1as =
  (
    list_map<g0arg><g1arg>(g0as)
  ) where
  {
    implement
    list_map$fopr<g0arg><g1arg>
      (g0a) =
      let
      val-I0DNTsome(tok) = g0a.node() in tok
      end
  } (* end of [where] *)
  val g1as = list_vt2t{g1arg}(g1as)
in
  g1marg_make_node(g0ma.loc(), G1MARGdarg(g1as))
end // end of [let]
) (* end of [trans01_gmarg] *)

(* ****** ****** *)

local

fun
auxtid
( tid
: s0tid)
: s1titm = let
//
val loc = tid.loc()
val-
I0DNTsome
  (tok) = tid.node()
//
val sym =
(
case-
tok.node() of
| T_IDENT_alp(nam) =>
  $SYM.symbol_make(nam)
| T_IDENT_sym(nam) =>
  $SYM.symbol_make(nam)
) : sym_t // end of [val]
//
val opt =
(
ifcase
| sym= // '+' is special
  $SYM.ADD_symbol =>
  Some_vt($FIX.postplus_fixty)
| sym= // '-' is special
  $SYM.SUB_symbol =>
  Some_vt($FIX.postmnus_fixty)
| _(*else*) => the_fxtyenv_search(sym)
) : fixtyopt_vt // end of [val]
//
val s1t0 =
sort1_make_node(loc, S1Tid0(sym))
//
in
//
case+ opt of
| ~None_vt() =>
   FXITMatm(s1t0)
| ~Some_vt(fxty) =>
  (case+ fxty of
   | $FIX.FIXTYnon() => FXITMatm(s1t0)
   | _(*non-FIXTYnon*) => FXITMopr(s1t0, fxty)
  ) (* end of [Some_vt] *)
//
end // end of [auxtid]

fun
auxint
( int
: t0int)
: s1titm = let
//
val loc = int.loc()
//
val-
T0INTsome(tok) = int.node()
//
in
  FXITMatm
  (sort1_make_node(loc, S1Tint(tok)))
end // end of [auxint]

fun
auxitm
( s0t0
: sort0)
: s1titm = let
//
val
loc0 = s0t0.loc()
//
(*
val () =
println!("trans01_sort:")
val () =
println!("auxitm: loc0 = ", loc0)
val () =
println!("auxitm: s0t0 = ", s0t0)
*)
//
in
//
case+
s0t0.node() of
//
| S0Tid0(tid) => auxtid(tid)
//
| S0Tint(int) => auxint(int)
//
| S0Tapps(s0ts) =>
  FXITMatm(s1t0) where
  {
    val s1ts =
    auxitmlst(s0ts)
    val s1t0 =
    fxitmlst_resolve_sort1(loc0, s1ts)
  }
//
| S0Tlist
  (_, s0ts, _) =>
  FXITMatm(s1t0) where
  {
    val s1ts =
    trans01_sortlst(s0ts)
    val s1t0 =
    sort1_make_node(loc0, S1Tlist(s1ts))
  }
//
| S0Tqual
  (tok, s0t) =>
  FXITMatm(s1t0) where
  {
    val s1t =
    trans01_sort(s0t)
    val s1t0 =
    sort1_make_node(loc0, S1Tqual(tok, s1t))
  }
//
| S0Tnone(tok) =>
  FXITMatm(s1t0) where
  {
    val s1t0 =
      sort1_make_node(loc0, S1Tnone((*void*)))
    // end of [val]
  }
//
end // end of [auxitm]

and
auxitmlst
( xs
: sort0lst)
: s1titmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<sort0><s1titm>
    (xs) where
  {
    implement
    list_map$fopr<sort0><s1titm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

in (* in-of-local *)

implement
trans01_sort
  (s0t0) = let
//
val
loc0 = s0t0.loc()
//
(*
val () =
println!
("trans01_sort: s0t0 = ", s0t0)
*)
//
in(*in-of-let*)
//
case+
auxitm(s0t0) of
| $FIX.FXITMatm(s1t0) => s1t0
| $FIX.FXITMopr(s1t0, fxty) => s1t0
//
end (* end of [trans01_sort] *)

end // end of [local]

(* ****** ****** *)

implement
trans01_sortopt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(s0t0) => Some(trans01_sort(s0t0))
)

implement
trans01_sortlst
  (s0ts) =
list_vt2t(s1ts) where
{
val
s1ts =
list_map<sort0><sort1>
  (s0ts) where
{
  implement
  list_map$fopr<sort0><sort1> = trans01_sort
}
} (* end of [trans01_sortlst] *)

(* ****** ****** *)

implement
trans01_sarg
  (s0a0) = let
//
val loc0 = s0a0.loc()
//
(*
val () =
println!
("trans01_sarg: s0a0 = ", s0a0)
*)
//
in
//
case-
s0a0.node() of
(*
| S0ARGnone(tok) => ...
*)
| S0ARGsome(sid, opt) => let
    val-
    I0DNTsome(tok) = sid.node()
  in
    s1arg_make_node
    (loc0, S1ARGsome(tok, trans01_sortopt(opt)))
  end // end of [S0ARGsome]
//
end // end of [trans01_sarg]

(* ****** ****** *)

implement
trans01_smarg
  (s0ma) = let
//
val loc0 = s0ma.loc()
//
(*
val () =
println!
("trans01_smarg: s0ma = ", s0ma)
*)
//
in
//
case-
s0ma.node() of
(*
| S0ARGnone(tok) => ...
*)
| S0MARGsing(sid) => let
    val-
    I0DNTsome(tok) = sid.node()
    val s1a =
    s1arg_make_node
    (tok.loc(), S1ARGsome(tok, None))
  in
    s1marg_make_node
    (loc0, S1MARGlist(list_sing(s1a)))
  end // end of [S0MARGsing]
| S0MARGlist(_, s0as, _) => let
    val s1as = trans01_sarglst(s0as)
  in
    s1marg_make_node(loc0, S1MARGlist(s1as))
  end // end of [S0MARGlist]
//
end // end of [trans01_smarg]

(* ****** ****** *)
//
implement
trans01_sarglst
  (s0as) =
list_vt2t
(
list_map<s0arg><s1arg>(s0as)
) where
{
  implement
  list_map$fopr<s0arg><s1arg> = trans01_sarg
}
implement
trans01_smarglst
  (s0mas) =
list_vt2t
(
list_map<s0marg><s1marg>(s0mas)
) where
{
  implement
  list_map$fopr<s0marg><s1marg> = trans01_smarg
}
//
(* ****** ****** *)

implement
trans01_targ
  (t0a0) = let
//
val
loc0 = t0a0.loc()
val
t1a0_node =
(
case-
t0a0.node() of
(*
| T0ARGnone(tok) => ...
*)
| T0ARGsome
  (s0t, opt) =>
  T1ARGsome(s1t, opt) where
  {
    val s1t = trans01_sort(s0t)
  }
) : t1arg_node // end-of-val
//
in
  t1arg_make_node(loc0, t1a0_node)
end // end of [trans01_targ]

implement
trans01_tmarg
  (t0ma) = let
//
val
loc0 = t0ma.loc()
//
in
//
case-
t0ma.node() of
(*
| T0MARGnone(tok) => ...
*)
| T0MARGlist(_, t0as, _) => let
    val t1as = trans01_targlst(t0as)
  in
    t1marg_make_node(loc0, T1MARGlist(t1as))
  end // end of [T0MARGlist]
//
end // end of [trans01_tmarg]

(* ****** ****** *)

implement
trans01_targlst
  (t0as) =
list_vt2t
(
list_map<t0arg><t1arg>(t0as)
) where
{
  implement
  list_map$fopr<t0arg><t1arg> = trans01_targ
}
implement
trans01_tmarglst
  (t0mas) =
list_vt2t
(
list_map<t0marg><t1marg>(t0mas)
) where
{
  implement
  list_map$fopr<t0marg><t1marg> = trans01_tmarg
}

(* ****** ****** *)

local

fun
auxids
( ids
: i0dntlst)
: tokenlst =
(
case+ ids of
| list_nil() =>
  list_nil()
| list_cons(id, ids) => let
    val-
    I0DNTsome(tok) = id.node()
  in
    list_cons(tok, auxids(ids))
  end
)

in (* in-of-local *)

implement
trans01_squa
  (s0q0) = let
//
val
loc0 = s0q0.loc()
//
val
s1q0_node =
(
case+
s0q0.node() of
| S0QUAprop(s0e) =>
  S1QUAprop(trans01_sexp(s0e))
| S0QUAvars(ids, opt) =>
  S1QUAvars(ids, opt) where
  {
    val ids = auxids(ids)
    val opt = trans01_sortopt(opt)
  }
) : s1qua_node // end of [val]
//
in
  s1qua_make_node(loc0, s1q0_node)
end // end of [trans01_squa]

end // end of [local]

implement
trans01_squalst
  (s0qs) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s0qua><s1qua>
  (s0qs) where
{
implement
list_map$fopr<s0qua><s1qua> = trans01_squa
}
} (* end of [trans01_squalst] *)

(* ****** ****** *)

implement
trans01_suni
  (s0u0) = let
//
val
loc0 = s0u0.loc()
val-
S0UNIsome
(_, s0qs, _) = s0u0.node()
val
s1qs = trans01_squalst(s0qs)
//
in
  s1uni_make_node(loc0, S1UNIsome(s1qs))
end // end of [trans01_suni]

implement
trans01_sunilst
  (s0qs) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s0uni><s1uni>
  (s0qs) where
{
implement
list_map$fopr<s0uni><s1uni> = trans01_suni
}
} (* end of [trans01_sunilst] *)

(* ****** ****** *)

local

fun
auxsid
( sid
: s0eid)
: s1eitm = let
//
val loc = sid.loc()
//
val-
I0DNTsome
( tok ) = sid.node()
//
val tnd = tok.node()
//
in
  case- tnd of
//
  | T_IDENT_alp(nam) =>
    auxsid_IDENT(tok, nam)
  | T_IDENT_sym(nam) =>
    auxsid_IDENT(tok, nam)
//
  | T_IDENT_dlr(nam) =>
    auxsid_IDENT(tok, nam)
//
  | T_BSLASH((*void*)) => auxsid_BSLASH(tok)
//
end // end of [auxsid]

and
auxsid_IDENT
( tok: token
, nam: string): s1eitm = let
//
val loc = tok.loc()
//
val sym =
$SYM.symbol_make(nam)
val opt =
the_fxtyenv_search(sym)
val s1e0 =
s1exp_make_node(loc, S1Eid0(sym))
//
in
case+ opt of
| ~None_vt() =>
   FXITMatm(s1e0)
| ~Some_vt(fxty) =>
  (case+ fxty of
   | $FIX.FIXTYnon() => FXITMatm(s1e0)
   | _(*non-FIXTYnon*) => FXITMopr(s1e0, fxty)
  ) (* end of [Some_vt] *)
end // end of [auxsid_IDENT]

and
auxsid_BSLASH
  (tok:token): s1eitm = let
//
val loc = tok.loc()
//
val s1e0 =
  s1exp_make_node(loc, S1Ebs0())
//
in
  FXITMopr(s1e0, $FIX.backslash_fixty)
end // end of [auxsid_BSLASH]

fun
auxint
( int
: t0int)
: s1eitm = let
//
val loc = int.loc()
//
val-
T0INTsome(tok) = int.node()
//
in
  FXITMatm
  (s1exp_make_node(loc, S1Eint(tok)))
end // end of [auxint]
and
auxchr
( chr
: t0chr)
: s1eitm = let
//
val loc = chr.loc()
//
val-
T0CHRsome(tok) = chr.node()
//
in
  FXITMatm
  (s1exp_make_node(loc, S1Echr(tok)))
end // end of [auxchr]
and
auxflt
( flt
: t0flt)
: s1eitm = let
//
val loc = flt.loc()
//
val-
T0FLTsome(tok) = flt.node()
//
in
  FXITMatm
  (s1exp_make_node(loc, S1Eflt(tok)))
end // end of [auxflt]
and
auxstr
( str
: t0str)
: s1eitm = let
//
val loc = str.loc()
//
val-
T0STRsome(tok) = str.node()
//
in
  FXITMatm
  (s1exp_make_node(loc, S1Estr(tok)))
end // end of [auxstr]

fun
auxitm
( s0e0
: s0exp)
: s1eitm = let
//
val
loc0 = s0e0.loc()
//
(*
val () =
println!("trans01_sexp:")
val () =
println!("auxitm: loc0 = ", loc0)
val () =
println!("auxitm: s0e0 = ", s0e0)
*)
//
in
//
case-
s0e0.node() of
//
| S0Eid0(sid) => auxsid(sid)
//
| S0Eint(int) => auxint(int)
| S0Echr(chr) => auxchr(chr)
| S0Eflt(flt) => auxflt(flt)
| S0Estr(str) => auxstr(str)
//
| S0Eop1(tok) =>
  FXITMatm(s1e0) where
  {
    val sym = sexpid_sym(tok)
    val s1e =
    s1exp_make_node
      (tok.loc(), S1Eid0(sym))
    // end of [val]
    val s1e0 =
    s1exp_make_node(loc0, S1Ebs1(s1e))
  }
| S0Eop2(_, sid, _) =>
  FXITMatm(s1e0) where
  {
    val-
    I0DNTsome
      (tok) = sid.node()
    val sym = sexpid_sym(tok)
    val s1e =
    s1exp_make_node
      (tok.loc(), S1Eid0(sym))
    // end of [val]
    val s1e0 =
    s1exp_make_node(loc0, S1Ebs1(s1e))
  }
//
| S0Eimp
  (_, s0es, _) => let
    val s1es =
    trans01_sexplst(s0es)
  in
    FXITMopr
    (s1e0, $FIX.imp_fixty) where
    {
      val s1e0 =
      s1exp_make_node(loc0, S1Eimp(s1es))
    }
  end // end of [S0Eimp]
//
| S0Eapps(s0es) =>
  FXITMatm(s1e0) where
  {
    val s1es =
    auxitmlst(s0es)
    val s1e0 =
    fxitmlst_resolve_s1exp(loc0, s1es)
  }
//
| S0Eparen _ => auxparen(s0e0)
//
| S0Etuple _ => auxtuple(s0e0)
//
| S0Erecord _ => auxrecord(s0e0)
//
| S0Eforall
    (_, s0qs, _) => let
    val s1qs =
    trans01_squalst(s0qs)
    val s1e0 =
    s1exp_make_node(loc0, S1Eforall(s1qs))
  in
    FXITMopr(s1e0, $FIX.forall_fixty)
  end
| S0Eexists
    (tok, s0qs, _) => let
    val-
    T_EXISTS(k0) = tok.node()
    val s1qs =
    trans01_squalst(s0qs)
    val s1e0 =
    s1exp_make_node(loc0, S1Eexists(k0, s1qs))
  in
    FXITMopr(s1e0, $FIX.exists_fixty)
  end
//
| S0Elam
  (_, arg, res, _, s0e, _) => let
    val s1e = trans01_sexp(s0e)
    val res = trans01_sortopt(res)
    val arg = trans01_smarglst(arg)
  in
    FXITMatm
    (
    s1exp_make_node(loc0, s1e0)
    ) where
    {
      val s1e0 = S1Elam(arg, res, s1e)
    }
  end // end of [S0Elam]
//
| S0Eanno(s0e, s0t) => let
    val s1e = trans01_sexp(s0e)
    val s1t = trans01_sort(s0t)
  in
    FXITMatm
    (s1exp_make_node(loc0, S1Eanno(s1e, s1t)))
  end // end of [S0Eanno]
//
| S0Equal(tok, s0e) =>
  FXITMatm(s1e0) where
  {
    val s1e = trans01_sexp(s0e)
    val s1e0 =
    s1exp_make_node(loc0, S1Equal(tok, s1e))
  } (* end of [S0Equal] *)
//
| S0Enone(_(*tok*)) =>
  FXITMatm(s1e0) where
  {
    val s1e0 = s1exp_make_node(loc0, S1Enone(loc0))
  } (* end of [S0Enone] *)
//
end // end of [auxitm]

and
auxitmlst
( xs
: s0explst)
: s1eitmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<s0exp><s1eitm>
    (xs) where
  {
    implement
    list_map$fopr<s0exp><s1eitm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

and
auxparen
( s0e0
: s0exp): s1eitm = let
//
val-
S0Eparen
( _
, s0es1, rparen) = s0e0.node()
//
val
s1e0_node =
(
case+ rparen of
| s0exp_RPAREN_cons0(_) =>
  S1Elist(s1es1) where
  {
    val s1es1 = trans01_sexplst(s0es1)
  }
| s0exp_RPAREN_cons1(_, s0es2, _) =>
  S1Elist(s1es1, s1es2) where
  {
    val s1es1 = trans01_sexplst(s0es1)
    val s1es2 = trans01_sexplst(s0es2)
  }
) : s1exp_node // end of [val]
//
in
  FXITMatm
  (s1exp_make_node(s0e0.loc(), s1e0_node))
end // end of [auxparen]

and
auxtuple
( s0e0
: s0exp): s1eitm = let
//
val-
S0Etuple
( tok, _
, s0es1, rparen) = s0e0.node()
//
val-
T_TUPLE(k0) = tok.node()
//
val
s1e0_node =
(
case+ rparen of
| s0exp_RPAREN_cons0
  (_) =>
  S1Etuple(k0, s1es1) where
  {
    val s1es1 = trans01_sexplst(s0es1)
  }
| s0exp_RPAREN_cons1
  (_, s0es2, _) =>
  S1Etuple(k0, s1es1, s1es2) where
  {
    val s1es1 = trans01_sexplst(s0es1)
    val s1es2 = trans01_sexplst(s0es2)
  }
) : s1exp_node // end of [val]
//
in
  FXITMatm
  (s1exp_make_node(s0e0.loc(), s1e0_node))
end // end of [auxtuple]

(* ****** ****** *)

and
auxrecord
( s0e0
: s0exp): s1eitm = let
//
val-
S0Erecord
( tok, _
, ls0es1, rparen) = s0e0.node()
//
val-
T_RECORD(k0) = tok.node()
//
val
s1e0_node =
(
case+ rparen of
| labs0exp_RBRACE_cons0
  (_) =>
  S1Erecord(k0, ls1es1) where
  {
    val
    ls1es1 = trans01_labsexplst(ls0es1)
  }
| labs0exp_RBRACE_cons1
  (_, ls0es2, _) =>
  S1Erecord(k0, ls1es1, ls1es2) where
  {
    val
    ls1es1 = trans01_labsexplst(ls0es1)
    val
    ls1es2 = trans01_labsexplst(ls0es2)
  }
) : s1exp_node // end of [val]
//
in
  FXITMatm
  (s1exp_make_node(s0e0.loc(), s1e0_node))
end // end of [auxtuple]

in (* in-of-local *)

implement
trans01_sexp
  (s0e0) = let
//
(*
val () =
println!
("trans01_sexp: s0e0 = ", s0e0)
*)
//
in
//
case+
auxitm(s0e0) of
| $FIX.FXITMatm(s1e0) => s1e0
| $FIX.FXITMopr(s1e0, fxty) => s1e0
//
end (* end of [trans01_sexp] *)

end // end of [local]

implement
trans01_sexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(s0e) => Some(trans01_sexp(s0e))
) (* end of [trans01_sexpopt] *)

implement
trans01_sexplst
  (s0es) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s0exp><s1exp>
  (s0es) where
{
  implement
  list_map$fopr<s0exp><s1exp> = trans01_sexp
}
} (* end of [trans01_sexplst] *)

(* ****** ****** *)

implement
trans01_labsexp
  (ls0e) = let
//
  val
  SL0ABLED(l0, tok, s0e) = ls0e
//
in
  SL0ABLED(l0, tok, trans01_sexp(s0e))
end // end of [trans01_labsexp]

implement
trans01_labsexplst
  (ls0es) =
list_vt2t(ls1es) where
{
val
ls1es =
list_map<labs0exp><labs1exp>
  (ls0es) where
{
  implement
  list_map$fopr<labs0exp><labs1exp> = trans01_labsexp
}
} (* end of [trans01_labsexplst] *)

(* ****** ****** *)
//
(*
implement
trans01_seff
  (s0ef) =
(
case+ s0ef of
| S0EFFnone _ =>
  S1EFFnone(*void*)
| S0EFFsome(_, s0es, _) =>
  S1EFFsome(trans01_sexplst(s0es))
) (* end of [trans01_seff] *)
*)
//
(* ****** ****** *)

implement
trans01_effsexpopt
  (opt0) =
(
case+ opt0 of
| EFFS0EXPnone() =>
  EFFS1EXPnone()
| EFFS0EXPsome(s0e) =>
  EFFS1EXPsome(trans01_sexp(s0e))
(*
| EFFS0EXPsome(s0f, s0e) =>
  EFFS1EXPsome(s1f, s1e) where
  {
    val s1f = trans01_seff(s0f)
    val s1e = trans01_sexp(s0e)
  }
*)
) (* end of [trans01_effsexpopt] *)

(* ****** ****** *)

implement
trans01_srtcon
  (s0c0) = let
//
val loc0 = s0c0.loc()
//
in
//
case+
s0c0.node() of
| S0RTCON(sid, opt) => let
    val-
    I0DNTsome(tok) = sid.node()
  in
    s1rtcon_make_node
      (s0c0.loc(), S1RTCON(tok, trans01_sortopt(opt)))
    // s1rtcon_make_node
  end // end of [S0RTCON]
//
end (* end of [trans01_srtcon] *)

implement
trans01_srtconlst
  (s0cs) =
list_vt2t(ls1es) where
{
val
ls1es =
list_map<s0rtcon><s1rtcon>
  (s0cs) where
{
  implement
  list_map$fopr<s0rtcon><s1rtcon> = trans01_srtcon
}
} (* end of [trans01_srtconlst] *)

(* ****** ****** *)

implement
trans01_datcon
  (d0c0) = let
//
val
loc0 = d0c0.loc()
//
in
//
case+
d0c0.node() of
| D0ATCON
  ( s0us
  , deid, s0is, opt1) => let
    val
    s1us = trans01_sunilst(s0us)
    val
    s1is = trans01_sexplst(s0is)
    val
    opt1 = trans01_sexpopt(opt1)
    val-I0DNTsome(tok) = deid.node()
  in
    d1atcon_make_node
    (loc0, D1ATCON(s1us, tok, s1is, opt1))
  end // end of [D0ATCON]
//
end // end of [trans01_datcon]

implement
trans01_datconlst
  (d0cs) =
list_vt2t(ls1es) where
{
val
ls1es =
list_map<d0atcon><d1atcon>
  (d0cs) where
{
  implement
  list_map$fopr<d0atcon><d1atcon> = trans01_datcon
}
} (* end of [trans01_datconlst] *)

(* ****** ****** *)

(* end of [xats_trans01_staexp.dats] *)
