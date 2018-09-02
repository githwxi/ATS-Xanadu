(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
#staload
SYM = "./../SATS/symbol.sats"
#staload
FIX = "./../SATS/fixity.sats"
//
#staload
ENV = "./../SATS/symenv.sats"
//
(* ****** ****** *)

#staload
LOC = "./../SATS/location.sats"
overload + with $LOC.location_combine

(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/trans01.sats"

(* ****** ****** *)

stadef fxitm = $FIX.fxitm
macdef FXITMatm(x) = $FIX.FXITMatm(,(x))
macdef FXITMopr(x, a) = $FIX.FXITMopr(,(x), ,(a))

(* ****** ****** *)

typedef
s1titm = fxitm(sort1)
typedef
s1titmlst = List0(s1titm)

typedef
s1eitm = fxitm(s1exp)
typedef
s1eitmlst = List0(s1eitm)

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
in
FXITMatm
(
sort1_make_node
( loc
, S1Tapps(f1, list_pair(x0, x2))
)
)
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
  sort1_make_node
  (loc, S1Tapps(f0, list_sing(x1)))
)
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
  sort1_make_node
  (loc, S1Tapps(f1, list_sing(x0)))
)
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
in
FXITMatm
(
s1exp_make_node
( loc
, S1Eapps(f1, list_pair(x0, x2))
)
)
end // end of [fxitm_infix]
//
implement
$FIX.fxitm_prefix<s1exp>
  (f0, x1) = let
  val loc =
  f0.loc() + x1.loc()
in
FXITMatm
(
  s1exp_make_node
  (loc, S1Eapps(f0, list_sing(x1)))
)
end // end of [fxitm_prefix]
//
implement
$FIX.fxitm_postfix<s1exp>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
FXITMatm
(
  s1exp_make_node
  (loc, S1Eapps(f1, list_sing(x0)))
)
end // end of [fxitm_postfix]
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
the_fixtyenv_search(sym)
//
val s1t0 =
sort1_make_node(loc, S1Tid(tok))
//
in
//
case+ opt of
| ~None_vt() => FXITMatm(s1t0)
| ~Some_vt(fxty) => FXITMopr(s1t0, fxty)
//
end // end of [auxtid]

fun
auxitm
( s0t0
: sort0)
: s1titm = let
//
val
loc0 = s0t0.loc()
//
val () =
println!
("sort0_trans: auxitm: s0t0 = ", s0t0)
//
in
//
case+
s0t0.node() of
| S0Tid(tid) => auxtid(tid)
| S0Tapps(s0ts) =>
  FXITMatm(s1t0) where
  {
    val s1t0 =
    fxitmlst_resolve_sort1(loc0, auxitmlst(s0ts))
  }
//
| S0Tlist
  (_, s0ts, _) =>
  FXITMatm(s1t0) where
  {
    val s1ts = sort0lst_trans(s0ts)
    val s1t0 = sort1_make_node(loc0, S1Tlist(s1ts))
  }
//
| S0Tqual
  (tok, s0t) =>
  FXITMatm(s1t0) where
  {
    val s1t = sort0_trans(s0t)
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
sort0_trans
  (s0t0) = let
//
val
loc0 = s0t0.loc()
//
val () =
println!
("sort0_trans: s0t0 = ", s0t0)
//
in
//
case+
auxitm(s0t0) of
| $FIX.FXITMatm(s1t0) => s1t0
| $FIX.FXITMopr(s1t0, fxty) => s1t0
//
end (* end of [sort0_trans] *)

end // end of [local]

implement
sort0opt_trans
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(s0t0) => Some(sort0_trans(s0t0))
)

implement
sort0lst_trans
  (s0ts) =
list_vt2t(s1ts) where
{
val
s1ts =
list_map<sort0><sort1>
  (s0ts) where
{
  implement
  list_map$fopr<sort0><sort1> = sort0_trans
}
} (* end of [sort0lst_trans] *)

(* ****** ****** *)

implement
s0arg_trans
  (s0a0) = let
//
val loc0 = s0a0.loc()
//
val () =
println!
("s0arg_trans: s0a0 = ", s0a0)
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
    (loc0, S1ARGsome(tok, sort0opt_trans(opt)))
  end // end of [S0ARGsome]
//
end // end of [s0arg_trans]

(* ****** ****** *)

implement
s0marg_trans
  (s0ma) = let
//
val loc0 = s0ma.loc()
//
val () =
println!
("s0marg_trans: s0ma = ", s0ma)
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
    val s1as = s0arglst_trans(s0as)
  in
    s1marg_make_node(loc0, S1MARGlist(s1as))
  end // end of [S0MARGlist]
//
end // end of [s0marg_trans]

(* ****** ****** *)
//
implement
s0arglst_trans
  (s0as) =
list_vt2t
(
list_map<s0arg><s1arg>(s0as)
) where
{
  implement
  list_map$fopr<s0arg><s1arg> = s0arg_trans
}
implement
s0marglst_trans
  (s0mas) =
list_vt2t
(
list_map<s0marg><s1marg>(s0mas)
) where
{
  implement
  list_map$fopr<s0marg><s1marg> = s0marg_trans
}
//
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
s0qua_trans
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
  S1QUAprop(s0exp_trans(s0e))
| S0QUAvars
  (ids, _, s0t) =>
  S1QUAvars(ids, s1t) where
  {
    val ids = auxids(ids)
    val s1t = sort0_trans(s0t)
  }
) : s1qua_node // end of [val]
//
in
  s1qua_make_node(loc0, s1q0_node)
end // end of [s0qua_trans]

end // end of [local]

implement
s0qualst_trans
  (s0qs) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s0qua><s1qua>
  (s0qs) where
{
  implement
  list_map$fopr<s0qua><s1qua> = s0qua_trans
}
} (* end of [s0qualst_trans] *)

(* ****** ****** *)

local

fun
auxsid
( sid
: s0eid)
: s1eitm = let
//
val loc = sid.loc()
val-
I0DNTsome
  (tok) = sid.node()
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
the_fixtyenv_search(sym)
//
val s1e0 =
s1exp_make_node(loc, S1Eid(tok))
//
in
//
case+ opt of
| ~None_vt() => FXITMatm(s1e0)
| ~Some_vt(fxty) => FXITMopr(s1e0, fxty)
//
end // end of [auxsid]

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

fun
auxitm
( s0e0
: s0exp)
: s1eitm = let
//
val
loc0 = s0e0.loc()
//
val () =
println!
("s0exp_trans: auxitm: s0e0 = ", s0e0)
//
in
//
case-
s0e0.node() of
//
| S0Eid(sid) => auxsid(sid)
//
| S0Eint(int) => auxint(int)
//
| S0Eapps(s0es) =>
  FXITMatm(s1e0) where
  {
    val s1e0 =
    fxitmlst_resolve_s1exp(loc0, auxitmlst(s0es))
  }
//
| S0Eparen _ => auxparen(s0e0)
//
| S0Eforall
    (_, s0qs, _) => let
    val s1qs =
    s0qualst_trans(s0qs)
    val s1e0 =
    s1exp_make_node(loc0, S1Eforall(s1qs))
  in
    FXITMopr(s1e0, $FIX.forall_fixty)
  end
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
    val s1es1 = s0explst_trans(s0es1)
  }
| s0exp_RPAREN_cons1(_, s0es2, _) =>
  S1Elist(s1es1, s1es2) where
  {
    val s1es1 = s0explst_trans(s0es1)
    val s1es2 = s0explst_trans(s0es2)
  }
) : s1exp_node // end of [val]
//
in
  FXITMatm
  (s1exp_make_node(s0e0.loc(), s1e0_node))
end // end of [auxparen]

in (* in-of-local *)

implement
s0exp_trans
  (s0e0) = let
//
val () =
println!
("s0exp_trans: s0e0 = ", s0e0)
//
in
//
case+
auxitm(s0e0) of
| $FIX.FXITMatm(s1e0) => s1e0
| $FIX.FXITMopr(s1e0, fxty) => s1e0
//
end (* end of [s0exp_trans] *)

end // end of [local]

implement
s0explst_trans
  (s0es) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s0exp><s1exp>
  (s0es) where
{
  implement
  list_map$fopr<s0exp><s1exp> = s0exp_trans
}
} (* end of [s0explst_trans] *)

(* ****** ****** *)

(* end of [xats_trans01_staexp.dats] *)
