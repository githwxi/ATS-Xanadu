(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 11th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)

val
T0CASE = T_CASE(CSKcas0)
val
T0CASP = T_CASE(CSKcasp)
val
T0CASN = T_CASE(CSKcasn)

(* ****** ****** *)
//
val T0FN0 = T_FUN(FNKfn0)
val T0FN1 = T_FUN(FNKfn1)
val T0FNX = T_FUN(FNKfnx)
val T0FUN = T_FUN(FNKfn1)
//
val T0PRFN0 = T_FUN(FNKprfn0)
val T0PRFN1 = T_FUN(FNKprfn1)
val T0PRFUN = T_FUN(FNKprfn1)
val T0PRAXI = T_FUN(FNKpraxi)
val T0FCAST = T_FUN(FNKfcast)
//
(* ****** ****** *)
//
val T0VAL = T_VAL(VLKval)
val T0VLP = T_VAL(VLKvlp)
val T0VLN = T_VAL(VLKvln)
val T0VAR = T_VAR(VLKvar)
//
val T0PRVAL = T_VAL(VLKprval)
val T0PRVAR = T_VAL(VLKprval)
//
(* ****** ****** *)

local

fun
lexing_kword_init
  ((*void*)): void =
let
//
val () = kwdins("@", T_AT0)
val () = kwdins("=", T_EQ0)
val () = kwdins("<", T_LT0)
val () = kwdins(">", T_GT0)
//
val () = kwdins("|", T_BAR)
val () = kwdins(":", T_CLN)
val () = kwdins(".", T_DOT)
val () = kwdins("$", T_DLR)
val () = kwdins("#", T_SRP)
//
val () = kwdins("=<", T_EQLT)
val () = kwdins("=>", T_EQGT)
val () = kwdins("<>", T_LTGT)
val () = kwdins("><", T_GTLT)
val () = kwdins("-<", T_MSLT)
(*
val () = kwdins("->", T_MSGT)
val () = kwdins("-<>", T_MSLTGT)
*)
//
(*
val () = kwdins(".<", T_DOTLT)
*)
val () = kwdins(">.", T_GTDOT)
//
(*
val () = kwdins(":<", T_COLONLT)
*)
//
val () = kwdins("as", T_AS0)
val () = kwdins("of", T_OF0)
val () = kwdins("op", T_OP1)
val () = kwdins("in", T_IN0)
//
val () = kwdins("and", T_AND)
val () = kwdins("end", T_END)
//
val () = kwdins("if0", T_IF0)
val () = kwdins("sif", T_SIF)
val () = kwdins("then", T_THEN)
val () = kwdins("else", T_ELSE)
//
val () = kwdins("when", T_WHEN)
val () = kwdins("with", T_WITH)
//
val () = kwdins("case", T0CASE)
val () = kwdins("scas", T_SCAS)
//
val () = kwdins("endst", T_ENDST)
//
val () = kwdins("lam", T_LAM(0))
val () = kwdins("fix", T_FIX(0))
//
val () = kwdins("let", T_LET)
val () = kwdins("try", T_TRY)
val () = kwdins("where", T_WHERE)
val () = kwdins("local", T_LOCAL)
//
val () = kwdins("endlam", T_ENDLAM)
val () = kwdins("endlet", T_ENDLET)
val () = kwdins("endtry", T_ENDTRY)
val () = kwdins("endwhr", T_ENDWHR)
val () = kwdins("endloc", T_ENDLOC)
val () = kwdins("endwhere", T_ENDWHR)
val () = kwdins("endlocal", T_ENDLOC)
//
(*
val () = kwdins("fn", T0FN)
*)
//
val () = kwdins("val", T0VAL)
val () = kwdins("var", T0VAR)
//
val () = kwdins("fn0", T0FN0)
val () = kwdins("fn1", T0FN1)
val () = kwdins("fnx", T0FNX)
val () = kwdins("fun", T0FUN)
//
val () = kwdins("prfn0", T0PRFN0)
val () = kwdins("prfn1", T0PRFN1)
val () = kwdins("prfun", T0PRFUN)
val () = kwdins("praxi", T0PRAXI)
//
val () = kwdins("prval", T0PRVAL)
val () = kwdins("prvar", T0PRVAR)
//
val () = kwdins("fcast", T0FCAST)
//
end where
{
  #symload
  kwdins with lexing_tnode_insert
} (*where*) // end-of-(xatsopt_kword_init)

in//local

val () = lexing_kword_init((*void*))

end (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_kword0.dats] *)
