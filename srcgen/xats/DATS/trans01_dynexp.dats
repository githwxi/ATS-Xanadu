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
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)

local

static
fun
aux_precopt
(opt: precopt): prcdv

fun
aux_fixity
(d0c0: d0ecl): d1ecl = let
//
val-
D0Cfixity
( tok0
, opt1
, i0ds) = d0c0.node()
//
val-T_SRP_FIXITY(knd) = tok0.node()
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
    d1ecl_make_node(d0c0.loc(), D1Cfixity(d0c0))
  end
end // end of [d0ecl_fixity_tr]

in (* in-of-local *)

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
| D0Cfixity _ => aux_fixity(d0c0)
//
end // end of [d0ecl_trans]


end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_dynexp.dats] *)
