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
Start Time: June 08th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
//
#impltmp
g_print
<dctkind>(dck) =
dctkind_fprint
(g_print$out<>(), dck) // xbasics
//
#impltmp
g_print
<valkind>(vlk) =
valkind_fprint
(g_print$out<>(), vlk) // xbasics
//
#impltmp
g_print
<funkind>(fnk) =
funkind_fprint
(g_print$out<>(), fnk) // xbasics
//
(* ****** ****** *)
#impltmp
g_0<stamp>
((*void*)) =
the_stamp_nil
#impltmp
g_cmp<stamp> = stamp_cmp
#impltmp
g_print<stamp>(sym) =
stamp_fprint(g_print$out<>(), sym)
(* ****** ****** *)
#impltmp
g_0<symbl>
((*void*)) =
the_symbl_nil
#impltmp
g_cmp<symbl> = symbl_cmp
#impltmp
g_print<symbl>(sym) =
symbl_fprint(g_print$out<>(), sym)
(* ****** ****** *)
#impltmp
g_print<label>(lab) =
label_fprint(g_print$out<>(), lab)
(* ****** ****** *)
#impltmp
g_print<tnode>(tnd) =
tnode_fprint(g_print$out<>(), tnd)
#impltmp
g_print<token>(tok) =
token_fprint(g_print$out<>(), tok)
(* ****** ****** *)
#impltmp
g_print<t0int>(tok) =
t0int_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0chr>(tok) =
t0chr_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0flt>(tok) =
t0flt_fprint(g_print$out<>(), tok)
#impltmp
g_print<t0str>(tok) =
t0str_fprint(g_print$out<>(), tok)
(* ****** ****** *)
#impltmp
g_print<i0dnt>(id0) =
i0dnt_fprint(g_print$out<>(), id0)
#impltmp
g_print<l0abl>(id0) =
l0abl_fprint(g_print$out<>(), id0)
(* ****** ****** *)
//
#impltmp
g_print<s0qid>(qid) =
s0qid_fprint(g_print$out<>(), qid)
#impltmp
g_print
<d0qid>(qid) =
d0qid_fprint(g_print$out<>(), qid)
//
(* ****** ****** *)
//
#impltmp
g_print<g0nam>(nam) =
g0nam_fprint(g_print$out<>(), nam)
#impltmp
g_print<g0exp>(exp) =
g0exp_fprint(g_print$out<>(), exp)
#impltmp
g_print<g0mag>(mag) =
g0mag_fprint(g_print$out<>(), mag)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xatsopt_libtmp.dats] *)
