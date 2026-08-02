(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Aug  2 01:19:10 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
/prelude/DATS/CATS/CM/basics3.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(_XATS2CM_)
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
XATS2CM_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
in//let
  XATS2CM_a0ref_set{a}(A0, x0)
end//let
//
#endif//endof(#ifdefq(_XATSJCM_))
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
if // if
stropt_nilq(sopt)
then
strm_vt_nil((*void*))
else
strn_strmize(stropt_unsome(sopt))
end where
{
//
(*
HX-2026-08-02:
Sun Aug  2 01:19:10 PM EDT 2026
This one is implemented
inside the following file:
[
srcgen2/xats2cm/srcgen1/\
xshared/runtime/srcgen1_prelude.cm
]
*)
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
mya1sz_tbox(x0:t0) = cma1sz(x0)
#absimpl
mydict_tbox(k0:t0, x0:t0) = cmhmap(k0, x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
mya1sz_strmize =
XATS2CM_cma1sz_strmize<x0>(*argless*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_make_nil =
XATS2CM_cmhmap_make_nil<k0>{x0}(*argless*)
//
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_get_keys =
XATS2CM_cmhmap_get_keys<k0>{x0}(*argless*)
//
(* ****** ****** *)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_search$opt =
XATS2CM_cmhmap_search$opt<k0>{x0}(*argless*)
//
#impltmp
< k0:t0 >
< x0:t0 >
mydict_insert$any =
XATS2CM_cmhmap_insert$any<k0>{x0}(*argless*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_xlibext_cmemit.dats] *)
(***********************************************************************)
