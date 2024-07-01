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
(*
Sat Jul 30 21:17:58 EDT 2022
*)
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
#staload
SYM = "./../SATS/xsymbol.sats"
#staload
LAM = "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload
TRUE with $SYM.TRUE_symbl
#symload
FALSE with $SYM.FALSE_symbl
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
symbl2sbtf(sym) =
(
if
sym=TRUE
then true else false)//impl
#implfun
symbl2dbtf(sym) =
(
if
sym=TRUE
then true else false)//impl
//
(* ****** ****** *)

local
//
fun
fint
( rep
: strn
, bas
: sint): sint =
gseq_foldl
<strn>
<cgtz><sint>(rep, 0) where
{
#impltmp
foldl$fopr
<cgtz><sint>
(  r0, c0  ) = r0*bas+(c0-'0') }
//
in//local
//
(* ****** ****** *)
//
#implfun
token2sint
  (tok) =
(
case-
tok.node() of
|
T_INT01
( rep ) => fint(rep, 10)
|
T_INT02
(bas,rep) => fint(rep,bas)
) where//end-of-[case-of(tok)]
{
//
(*
val () =
prerrln("token2sint: tok = ", tok)
*)
//
} (*where*)//end-of-[token2sint(tok)]
//
(* ****** ****** *)
//
#implfun
token2dint
  (tok) =
(
case-
tok.node() of
|
T_INT01
( rep ) => fint(rep, 10)
|
T_INT02
(bas,rep) => fint(rep,bas)
) where//end-of-[case-of(tok)]
{
//
(*
val () =
prerrln("token2dint: tok = ", tok)
*)
//
}(*where*)//end-of-[token2dint(tok)]
//
(* ****** ****** *)
//
endloc // end of [local(token2sint/dint)]

(* ****** ****** *)

local
//
fun
fchr
( rep
: strn): char =
char_make_sint
(
gseq_foldl
<strn>
<cgtz><sint>(rep, 0)) where
{
#impltmp
foldl$fopr
<cgtz><sint>
(  r0, c0  ) = // HX:base=8!
if
isdigit(c0)
then r0*8+(c0-'0') else (r0) }
//
in//local
//
(* ****** ****** *)
//
#implfun
token2schr(tok) =
(
case-
tok.node() of
|
T_CHAR1_nil0(_) => '\0'
| // regular: '?'
T_CHAR2_char(rep) =>
let
val opt =
gseq_get_at_opt
< strn >< cgtz >(rep, 1)
in//let
case- opt of
| ~optn_vt_cons(chr) => chr
end (*let*) // [T_CHAR2_char]
| // backslash: '\...'
T_CHAR3_blsh(rep) => fchr(rep)
) where//end-of-[case-of(tok)]
{
//
(*
val () =
prerrln("token2schr: tok = ", tok)
*)
//
}(*where*)//end-of-[token2schr(tok)]
//
(* ****** ****** *)
//
#implfun
token2dchr(tok) = ( token2schr(tok) )
//
(* ****** ****** *)
//
endloc // end of [local(token2schr/dchr)]

(* ****** ****** *)

local
//
(*
//
// utf-8 // for text
//
|
T_STRN1_clsd of
//
// HX:
// It may contain null-chars
(strn, sint(*len*)) // closed: utf-8
*)
//
in (* in-of-local *)

#implfun
token2sstr(tok) =
(
case-
tok.node() of
|
T_STRN1_clsd(rep, len) =>
strn_tabulate(len-2) where
{
#impltmp
tabulate$fopr
  <cgtz>(i) = strn_get_at(rep, i+1)
}
|
T_STRN2_ncls(rep, len) =>
strn_tabulate(len-1) where
{
#impltmp
tabulate$fopr
  <cgtz>(i) = strn_get_at(rep, i+1)
}
)(*case-*)//end-of-[token2sstr(tok)]

#implfun
token2dstr(tok) = ( token2sstr(tok) )

endloc // end of [local(token2sstr/dstr)]

(* ****** ****** *)

#implfun
gnamid_sym(tok) =
(
case-
tok.node() of
//
(*
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
*)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [gnamid_sym(tok)]

(* ****** ****** *)

#implfun
gexpid_sym(tok) =
(
case-
tok.node() of
//
(*
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
*)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [gexpid_sym(tok)]

(* ****** ****** *)

#implfun
sortid_sym(tok) =
(
case-
tok.node() of
//
(*
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
*)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [sortid_sym(tok)]

(* ****** ****** *)

#implfun
sargid_sym(tok) =
(
case-
tok.node() of
//
(*
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
*)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [sargid_sym(tok)]

(* ****** ****** *)

#implfun
sexpid_sym(tok) =
(
case-
tok.node() of
//
| T_OP2(tok) =>
(
case-
tok.node() of
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
)
//
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [sexpid_sym(tok)]

(* ****** ****** *)

#implfun
dpatid_sym(tok) =
(
case-
tok.node() of
//
| T_OP2(tok) =>
(
case-
tok.node() of
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
)
//
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [dpatid_sym(tok)]

(* ****** ****** *)

#implfun
dexpid_sym(tok) =
(
case-
tok.node() of
//
| T_OP2(tok) =>
(
case-
tok.node() of
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
)
//
| T_IDENT(nam) =>
  $SYM.symbl_make_name(nam)
//
| T_IDALP(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSYM(nam) =>
  $SYM.symbl_make_name(nam)
//
| T_IDDLR(nam) =>
  $SYM.symbl_make_name(nam)
| T_IDSRP(nam) =>
  $SYM.symbl_make_name(nam)
//
) (*case-*) // end of [dexpid_sym(tok)]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans01_utils0.dats] *)
