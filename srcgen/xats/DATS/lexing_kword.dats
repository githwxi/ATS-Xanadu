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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload"./../SATS/basics.sats"
#staload"./../SATS/symbol.sats"
#staload"./../SATS/lexing.sats"
//
(* ****** ****** *)
//
macdef
T_ABSPROP_ = T_ABSTYPE(PROPSORT)
macdef
T_ABSVIEW_ = T_ABSTYPE(VIEWSORT)
//
macdef
T_ABSTYPE_ = T_ABSTYPE(TYPESORT)
macdef
T_ABSTBOX_ = T_ABSTYPE(TBOXSORT)
macdef
T_ABSTFLAT_ = T_ABSTYPE(TFLATSORT)
//
macdef
T_ABSVTYPE_ = T_ABSTYPE(VTYPESORT)
macdef
T_ABSVTBOX_ = T_ABSTYPE(VTBOXSORT)
macdef
T_ABSVTFLAT_ = T_ABSTYPE(VTFLATSORT)
//
(* ****** ****** *)
//
macdef
T_DATAPROP_ = T_DATATYPE(PROPSORT)
macdef
T_DATAVIEW_ = T_DATATYPE(VIEWSORT)
//
macdef
T_DATATYPE_ = T_DATATYPE(TYPESORT)
macdef
T_DATAVTYPE_ = T_DATATYPE(VTYPESORT)
//
(* ****** ****** *)
//
macdef
T_INFIX_ = T_SRP_FIXITY(INFIX)
macdef
T_INFIXL_ = T_SRP_FIXITY(INFIXL)
macdef
T_INFIXR_ = T_SRP_FIXITY(INFIXR)
//
macdef
T_PREFIX_ = T_SRP_FIXITY(PREFIX)
macdef
T_POSTFIX_ = T_SRP_FIXITY(POSTFIX)
//
(* ****** ****** *)

val () =
kword_initize
  ((*void*)) where
{
//
macdef
myins = tnode_insert
//
fun
kword_initize(): void =
{
//
(*
val () = myins("@", T_AT)
*)
//
val () = myins("=", T_EQ)
val () = myins(":", T_COLON)
//
val () = myins("|", T_BAR)
val () = myins(".", T_DOT)
//
val () = myins("=>", T_EQGT)
//
val () = myins("as", T_AS)
//
val () = myins("of", T_OF)
//
val () = myins("in", T_IN)
//
val () = myins("end", T_END)
//
val () = myins("let", T_LET)
val () = myins("where", T_WHERE)
//
val () = myins("lam", T_LAM(0))
val () = myins("fix", T_FIX(0))
//
val () = myins("if", T_IF)
val () = myins("sif", T_IF)
val () = myins("then", T_THEN)
val () = myins("else", T_ELSE)
//
val () = myins("local", T_LOCAL)
//
val () = myins("absprop", T_ABSPROP_)
val () = myins("absview", T_ABSVIEW_)
//
val () = myins("abstype", T_ABSTYPE_)
val () = myins("abstbox", T_ABSTBOX_)
val () = myins("abstflat", T_ABSTFLAT_)
//
val () = myins("absvtype", T_ABSVTYPE_)
val () = myins("absvtbox", T_ABSVTBOX_)
val () = myins("absvtFLAT", T_ABSVTFLAT_)
//
val () = myins("datasort", T_DATASORT)
//
val () = myins("dataprop", T_DATAPROP_)
val () = myins("dataview", T_DATAVIEW_)
val () = myins("datatype", T_DATATYPE_)
val () = myins("datavtype", T_DATAVTYPE_)
//
(*
//
val () = myins("fn")
val () = myins("fn0")
val () = myins("fn1")
val () = myins("fun")
val () = myins("fnx")
//
val () = myins("prfn")
val () = myins("prfn0")
val () = myins("prfn1")
val () = myins("prfun")
//
val () = myins("lam")
val () = myins("fix")
//
val () = myins("if")
val () = myins("sif")
val () = myins("then")
val () = myins("else")
val () = myins("case")
val () = myins("scase")
val () = myins("ifcase")
//
val () = myins("macdef")
val () = myins("macrodef")
//
val () = myins("sexpdef")
val () = myins("typedef")
val () = myins("vtypedef")
//
val () = myins("with")
//
val () = myins("withtype")
val () = myins("withprop")
val () = myins("withview")
val () = myins("withvtype")
//
val () = myins("$tup")
val () = myins("$tup_t")
val () = myins("$tup_vt")
val () = myins("$rec")
val () = myins("$rec_t")
val () = myins("$rec_vt")
//
val () = myins("$list")
val () = myins("$list_t")
val () = myins("$list_vt")
//
val () = myins("$raise")
//
val () = myins("$delay")
val () = myins("$delay_t")
val () = myins("$delay_vt")
//
*)
(*
//
val () = myins("#if")
val () = myins("#ifdef")
val () = myins("#ifundef")
//
val () = myins("#define")
//
*)
//
val () = myins("#infix", T_INFIX_)
val () = myins("#infixl", T_INFIXL_)
val () = myins("#infixr", T_INFIXR_)
val () = myins("#prefix", T_PREFIX_)
val () = myins("#postfix", T_POSTFIX_)
//
val () = myins("#nonfix", T_SRP_NONFIX)
//
val () = myins("#include", T_SRP_INCLUDE)
//
val () = myins("#staload", T_SRP_STALOAD)
val () = myins("#dynload", T_SRP_DYNLOAD)
//
} (* end of [kword_initize] *)
//
} (* end of [kword_initize()] *)

(* ****** ****** *)

(* end of [xats_lexing_kword.dats] *)
