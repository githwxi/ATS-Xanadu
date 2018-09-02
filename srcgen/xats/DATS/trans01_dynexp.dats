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
SYM="./../SATS/symbol.sats"
//
#staload
ENV = "./../SATS/symenv.sats"
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/fixity.sats"
//
#staload "./../SATS/lexing.sats"
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

implement
d0exp_trans
  (d0e0) = let
//
val () =
println!
("d0exp_trans: d0e0 = ", d0e0)
//
in
  exit_errmsg(1, "d0exp_trans"){d1exp}
end (* end of [d0exp_trans] *)

implement
d0explst_trans
  (d0es) =
list_vt2t(d1es) where
{
  val
  d1es =
  list_map<d0exp><d1exp>
    (d0es) where
  {
    implement
    list_map$fopr<d0exp><d1exp> = d0exp_trans
  }
} (* end of [d0explst_trans] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_precopt
(opt: precopt): prcdv =
(
case+ opt of
| PRECOPTnil() =>
  int2prcdv(0)
| PRECOPTsing(tok) => let
    val-
    T_INT1(rep) = tok.node()
  in
    int2prcdv(g0string2int(rep))
  end // end of [PRECOPTsing]
| PRECOPTlist(_, toks, _) => int2prcdv(0) // FIXME!!!
) (* end of [aux_precopt] *)

(* ****** ****** *)

fun
aux_fixity
(d0c0: d0ecl): d1ecl = let
//
val loc0 = d0c0.loc()
//
val-
D0Cfixity
( tok0
, opt1
, i0ds) = d0c0.node()
//
val-
T_SRP_FIXITY(knd) = tok0.node()
//
val pval = aux_precopt(opt1)
//
val fxty =
(
ifcase
| knd=INFIX =>
  FIXTYinf(pval, ASSOCnon())
| knd=INFIXL =>
  FIXTYinf(pval, ASSOClft())
| knd=INFIXR =>
  FIXTYinf(pval, ASSOCrgt())
| knd=PREFIX => FIXTYpre(pval)
| knd=POSTFIX => FIXTYpos(pval)
//
| _(*deadcode*) => FIXTYnon(*void*)
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
    ) : string // end of [val]
    val sym = $SYM.symbol_make(nam)
  in
    loop(xs) where
    {
      val () =
      the_fixtyenv_insert(sym, fxty)
    }
  end
) (* end of [loop] *)
//
in
  let
    val () = loop(i0ds)
  in
    d1ecl_make_node(loc0, D1Cfixity(d0c0))
  end
end // end of [aux_fixity]

fun
aux_nonfix
(d0c0: d0ecl): d1ecl = let
//
val loc0 = d0c0.loc()
//
val-
D0Cnonfix
(tok0, i0ds) = d0c0.node()
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
    ) : string // end of [val]
    val sym = $SYM.symbol_make(nam)
  in
    loop(xs) where
    {
      val () =
      the_fixtyenv_insert(sym, FIXTYnon)
    }
  end
) (* end of [loop] *)
//
in
  let
    val () = loop(i0ds)
  in
    d1ecl_make_node(loc0, D1Cnonfix(d0c0))
  end
end // end of [aux_nonfix]

(* ****** ****** *)

fun
aux_sortdef
(d0c0: d0ecl): d1ecl = let
//
val loc0 = d0c0.loc()
//
val-
D0Csortdef
(_, tid, _, def0) = d0c0.node()
//
val def1 =
(
case+
def0.node() of
| S0RTDEFsort(s0t) =>
  s1rtdef_make_node
  ( def0.loc()
  , S1RTDEFsort(sort0_trans(s0t)))
| S0RTDEFsubset
  (_, s0a, _, s0es, _) => let
    val s1a = s0arg_trans(s0a)
    val s1es = s0explst_trans(s0es)
  in
    s1rtdef_make_node
    (def0.loc(), S1RTDEFsubset(s1a, s1es))
  end // end of [S0RTDEFsubset]
) : s1rtdef // end of [val]
//
val-I0DNTsome(tok) = tid.node((*void*))
//
in
  d1ecl_make_node(loc0, D1Csortdef(tok, def1))
end // end of [aux_sortdef]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
d0ecl_trans(d0c0) = let
//
val
loc0 = d0c0.loc()
val () =
println!
("d0ecl_trans: d0c0 = ", d0c0)
//
in
//
case-
d0c0.node() of
//
| D0Cfixity _ => aux_fixity(d0c0)
| D0Cnonfix _ => aux_nonfix(d0c0)
//
| D0Csortdef _ => aux_sortdef(d0c0)
//
end // end of [d0ecl_trans]

(* ****** ****** *)

implement
d0eclist_trans
  (d0cs) =
list_vt2t(d1cs) where
{
  val
  d1cs =
  list_map<d0ecl><d1ecl>
    (d0cs) where
  {
    implement
    list_map$fopr<d0ecl><d1ecl> = d0ecl_trans
  }
} (* end of [d0eclist_trans] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_dynexp.dats] *)
