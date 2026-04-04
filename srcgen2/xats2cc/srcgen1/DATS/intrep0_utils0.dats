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
//
Sat Mar 28 01:06:27 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
(*
HX-2026-04-03:
This one uses srcgen2!
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
*)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload // HX: [d2var]
"./../../../SATS/xstamp0.sats"
//
#staload // HX: [d2var]
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#staload
"xatslib\
/githwxi/ATS2/SATS/funset.sats"
//
#absimpl
i0varfst_tbox(*0*) = fset(i0var)
//
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
//
#include
"xatslib\
/libcats/HATS/libcats_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_JS_dats.hats"
#include
"xatslib\
/libcats/HATS/libcats_NODE_dats.hats"
//
(* ****** ****** *)
//
#staload
"xatslib\
/githwxi/ATS2/DATS/funset.dats"
#staload
"xatslib\
/githwxi/ATS2/DATS/funmap.dats"
#staload
"xatslib\
/githwxi/ATS2/DATS/funset_fmap000.dats"
#staload
"xatslib\
/githwxi/ATS2/DATS/funmap_avltree.dats"
//
(* ****** ****** *)
//
in//let
//
(* ****** ****** *)
//
(*
HX-2026-04-03:
Note that [castxy]
is needed for bridging
[srcgen1] and [srcgen2]!
*)
#extern
fcast
castxy
{ax:t0}{ay:t0}(ax:ax):(ay)
//
#impltmp
g_print
<d2var>(obj) =
d2var_fprint
(obj, castxy(g_print$out<>()))
//
#impltmp
g_print
<i0var>(obj) =
i0var_fprint
(obj, castxy(g_print$out<>()))
//
(* ****** ****** *)
//
#impltmp
g_cmp<d2var>
(d2v1, d2v2) =
(
stamp_cmp
(d2v1.stmp(), d2v2.stmp()))
//
#impltmp
g_cmp<i0var>
(i0v1, i0v2) =
(
i0v1.dvar()\cmp(i0v2.dvar()))
//
(* ****** ****** *)
//
#implfun
i0varfst_mknil
( (*void*) ) = funset_nil<>((*0*))
//
#implfun
i0varfst_mklst
(   i0vs   ) =
let
//
#typedef x0 = i0var
(*
HX:
Fixing this?
No match is found!!!
#typedef r0 = i0varfst
*)
#typedef r0 = fset(i0var)
//
in//let
(
list_folditm
< x0 >< r0 >(xs, r0)
) where
{
//
val xs = i0vs
val r0 = i0varfst_mknil()
//
#impltmp
folditm$fopr
< x0 >< r0 >
(  r0, x0  ) = i0varfst_addvar(r0, x0)
}
end//let//endof(i0varfst_mklst(i0vs):fset)
//
(* ****** ****** *)
//
#implfun
i0varfst_strmize
(    ivst    ) =
(
  funset_strmize<i0var>(ivst))
//
(* ****** ****** *)
//
#implfun
i0varfst_addvar
( ivst, ivar ) =
(
funset_insert$any<i0var>(ivst, ivar))
//
#implfun
i0varfst_addset
( ivst, fst2 ) = funset_union(ivst, fst2)
//
(* ****** ****** *)
//
end//local//end-of-[local(absimpl(i0varfst))]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_intrep0_utils0.dats] *)
(***********************************************************************)
