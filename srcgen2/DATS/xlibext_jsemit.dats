(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed Apr 30 10:05:18 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xlibext.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"srcgen1\
/prelude/DATS/CATS/JS/basics3.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(_XATS2JS_)
#then
//
#extern
fun
XATSOPT_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
#implfun
XATSOPT_a0ref_set
{ a: t0 }(A0, x0) =
let
#extern
fun
XATS2JS_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
in//let
  XATS2JS_a0ref_set{a}(A0, x0)
end//let
//
#endif//endof(#ifdefq(_XATSJS_))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_char$strmize
  ( fpx0 ) =
let
val
sopt =
XATSOPT_fpath_full$read
  ( fpx0 ) // HX: fpx0: fpath
in//let
if
stropt_nilq(sopt)
then
strm_vt_nil((*void*))
else
strn_strmize(stropt_unsome(sopt))
end where
{
//
#extern
fun
XATSOPT_fpath_full$read
  (fpx0: fpath): stropt = $extnam()
//
}(*where*)//end-of-[fpath_char$strmize]
//
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
mya1sz_tbox(x0:t0) = jsa1sz(x0)
#absimpl
mydict_tbox(k0:t0, x0:t0) = jshmap(k0, x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
mya1sz_strmize =
XATS2JS_jsa1sz_strmize<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_make_nil =
XATS2JS_jshmap_make_nil<k0>{x0}(*void*)
//
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_get_keys =
XATS2JS_jshmap_get_keys<k0>{x0}(*void*)
//
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_search$opt =
XATS2JS_jshmap_search$opt<k0>{x0}(*void*)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_insert$any =
XATS2JS_jshmap_insert$any<k0>{x0}(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_xlibext_jsemit.dats] *)
(***********************************************************************)
