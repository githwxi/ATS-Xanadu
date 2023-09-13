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
Start Time: June 16th, 2022
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)

(*
fun
<r0:t0>
p1_fun_test_strn
( inp: strn
, pfn: p1_fun(r0)): optn(r0)
*)
#impltmp
<r0>(*tmp*)
p1_fun_test_strn
(   inp, pfn   ) =
let
//
val tks =
strn_tokenize(inp)
val buf =
tokbuf_make0_llist(tks)
//
var err = 0(*init*)
val res = pfn(buf, err)
val ( ) = tokbuf_free(buf)
in//let
if
(err=0) then some(res) else none()
end (*let*) // end of [p1_fun_test_strn]

(* ****** ****** *)

(*
fun
<r0:t0>
pq_fun_test_strn
( inp: strn
, pfn: pq_fun(r0)): optn(r0)
*)
#impltmp
<r0>(*tmp*)
pq_fun_test_strn
(   inp, pfn   ) =
let
//
val tks =
strn_tokenize(inp)
val buf =
tokbuf_make0_llist(tks)
//
var err = 0(*init*)
val res = pfn(buf, err)
val ( ) = tokbuf_free(buf) in res
end (*let*) // end of [pq_fun_test_strn]

(* ****** ****** *)

#impltmp
<r0>(*tmp*)
p1_fun_test_fpath
(   fpx, pfn   ) =
let
//
val tks =
fpath_tokenize(fpx)
val buf =
tokbuf_make0_llist(tks)
//
var err = 0(*init*)
val res = pfn(buf, err)
val ( ) = tokbuf_free(buf)
in//let
if
(err=0) then some(res) else none()
end (*let*) // end of [p1_fun_test_fpath]

(* ****** ****** *)

#impltmp
<r0>(*tmp*)
pq_fun_test_fpath
(   fpx, pfn   ) =
let
//
val tks =
fpath_tokenize(fpx)
val buf =
tokbuf_make0_llist(tks)
//
var err = 0(*init*)
val res = pfn(buf, err)
val ( ) = tokbuf_free(buf) in res
end (*let*) // end of [pq_fun_test_fpath]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_parsing_utils0.dats] *)
