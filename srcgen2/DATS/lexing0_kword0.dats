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
val T0VLR = T_VAL(VLKvlr)
val T0VAR = T_VAR(VLKvar)
//
val T0PRVAL = T_VAL(VLKprval)
val T0PRVAR = T_VAL(VLKprval)
//
(* ****** ****** *)
val T0IMPLMNT = T_IMPLMNT(IMPLgen)
val T0IMPLPRF = T_IMPLMNT(IMPLprf)
val T0IMPLVAL = T_IMPLMNT(IMPLval)
val T0IMPLFUN = T_IMPLMNT(IMPLfun)
val T0IMPLTMP = T_IMPLMNT(IMPLtmp)
(* ****** ****** *)
//
val T0SEXPDEF = T_SEXPDEF(-1)
//
val T0PROPDEF = T_SEXPDEF(PROPSORT)
val T0VIEWDEF = T_SEXPDEF(VIEWSORT)
//
val T0TBOXDEF = T_SEXPDEF(TBOXSORT)
val T0TFLTDEF = T_SEXPDEF(TFLTSORT)
val T0TYPEDEF = T_SEXPDEF(TYPESORT)
val T0VWTPDEF = T_SEXPDEF(VWTPSORT)
//
(* ****** ****** *)
//
val T0ABSPROP = T_ABSTYPE(PROPSORT)
val T0ABSVIEW = T_ABSTYPE(VIEWSORT)
//
val T0ABSTBOX = T_ABSTYPE(TBOXSORT)
val T0ABSTFLT = T_ABSTYPE(TFLTSORT)
val T0ABSTYPE = T_ABSTYPE(TYPESORT)
//
val T0ABSVTBX = T_ABSTYPE(VTBXSORT)
val T0ABSVTFT = T_ABSTYPE(VTFTSORT)
val T0ABSVWTP = T_ABSTYPE(VWTPSORT)
//
(* ****** ****** *)
//
val T0DATAPROP = T_DATATYPE(PROPSORT)
val T0DATAVIEW = T_DATATYPE(VIEWSORT)
val T0DATATYPE = T_DATATYPE(TYPESORT)
val T0DATAVWTP = T_DATATYPE(VWTPSORT)
//
(* ****** ****** *)
//
val T0WITHPROP = T_WITHTYPE(PROPSORT)
val T0WITHVIEW = T_WITHTYPE(VIEWSORT)
val T0WITHTYPE = T_WITHTYPE(TYPESORT)
val T0WITHVWTP = T_WITHTYPE(VWTPSORT)
//
(* ****** ****** *)
//
val T0TRCD11 = T_TRCD10(1) //HX: $()
and T0TRCD12 = T_TRCD10(2) //HX: $tup
and T0TRCD13 = T_TRCD10(3) //HX: $tup_t0
and T0TRCD14 = T_TRCD10(4) //HX: $tup_vt
//
val T0TRCD21 = T_TRCD20(1) //HX: ${}
and T0TRCD22 = T_TRCD20(2) //HX: $rec
and T0TRCD23 = T_TRCD20(3) //HX: $rec_t0
and T0TRCD24 = T_TRCD20(4) //HX: $rec_vt
//
(* ****** ****** *)
//
(*
#define KINFIX0 0 // n-assoc
#define KINFIXL 1 // l-assoc
#define KINFIXR 2 // r-assoc
//
#define KPREFIX 3 // prefix0
#define KPSTFIX 4 // postfix
*)
//
val 
T0SRP_INFIX0 = T_SRP_FIXITY(KINFIX0)
and
T0SRP_INFIXL = T_SRP_FIXITY(KINFIXL)
and
T0SRP_INFIXR = T_SRP_FIXITY(KINFIXR)
and
T0SRP_PREFIX = T_SRP_FIXITY(KPREFIX)
and
T0SRP_PSTFIX = T_SRP_FIXITY(KPSTFIX)
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
val () = kwdins("vlr", T0VLR)
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
val () = kwdins("#implmnt", T0IMPLMNT)
val () = kwdins("#implprf", T0IMPLPRF)
val () = kwdins("#implval", T0IMPLVAL)
val () = kwdins("#implfun", T0IMPLFUN)
val () = kwdins("#impltmp", T0IMPLTMP)
//
//
val () = kwdins("#stacst0", T_STACST0)
//
val () = kwdins("#abssort", T_ABSSORT)
val () = kwdins("#sortdef", T_SORTDEF)
//
val () = kwdins("#sexpdef", T0SEXPDEF)
val () = kwdins("#propdef", T0PROPDEF)
val () = kwdins("#viewdef", T0VIEWDEF)
val () = kwdins("#tboxdef", T0TBOXDEF)
val () = kwdins("#typedef", T0TYPEDEF)
val () = kwdins("#vwtpdef", T0VWTPDEF)
//
val () = kwdins("#abstype", T0ABSTYPE)
val () = kwdins("#absprop", T0ABSPROP)
val () = kwdins("#absview", T0ABSVIEW)
val () = kwdins("#abstbox", T0ABSTBOX)
val () = kwdins("#abstflt", T0ABSTFLT)
val () = kwdins("#absvtbx", T0ABSVTBX)
val () = kwdins("#absvtft", T0ABSVTFT)
val () = kwdins("#absvwtp", T0ABSVWTP)
//
val () = kwdins("#absimpl", T_ABSIMPL)
val () = kwdins("#absopen", T_ABSOPEN)
//
val () = kwdins("excptcon", T_EXCPTCON)
val () = kwdins("datasort", T_DATASORT)
val () = kwdins("dataprop", T0DATAPROP)
val () = kwdins("dataview", T0DATAVIEW)
val () = kwdins("datatype", T0DATATYPE)
val () = kwdins("datavwtp", T0DATAVWTP)
(*
val () = kwdins("datavtype", T0DATAVTYPE)
*)
//
val () = kwdins("withtype", T0WITHTYPE)
val () = kwdins("withprop", T0WITHPROP)
val () = kwdins("withview", T0WITHVIEW)
val () = kwdins("withvwtp", T0WITHVWTP)
(*
val () = kwdins("withvtype", T0WITHVTYPE)
*)
//
val () = kwdins("$tup", T0TRCD12)//_t0/vt
val () = kwdins("$rec", T0TRCD22)//_t0/vt
val () = kwdins("$tup_t0", T0TRCD13)//tbox
val () = kwdins("$rec_t0", T0TRCD23)//tbox
val () = kwdins("$tup_vt", T0TRCD14)//vtbx
val () = kwdins("$rec_vt", T0TRCD24)//vtbx
//
(* HX: for IDSRP-keywords in ATS3 *)
//
val () = kwdins("#infix0", T0SRP_INFIX0)
val () = kwdins("#infixl", T0SRP_INFIXL)
val () = kwdins("#infixr", T0SRP_INFIXR)
val () = kwdins("#prefix", T0SRP_PREFIX)
val () = kwdins("#pstfix", T0SRP_PSTFIX)
val () = kwdins("#nonfix", T_SRP_NONFIX)
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
//
#implval T0IDENT_AT0 = T_IDSYM("@")
#implval T0IDENT_EQ0 = T_IDSYM("=")
//
#implval T0IDENT_LT0 = T_IDSYM("<")
#implval T0IDENT_GT0 = T_IDSYM(">")
//
#implval T0IDENT_EQGT = T_IDSYM("=>")
#implval T0IDENT_LTGT = T_IDSYM("<>")
#implval T0IDENT_MSGT = T_IDSYM("->")
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_kword0.dats] *)
