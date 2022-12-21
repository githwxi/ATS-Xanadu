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
Mon 19 Dec 2022 05:53:02 PM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)

local
//
(*
#absimpl // s2cst->s2typ
ms2ct2p_tbox = topmap(s2typ)
*)
//
datavwtp
tr2aenv =
TR2AENV of (stkmap(s2typ))
#absimpl tr2aenv_vtbx = tr2aenv
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
tr2aenv_make_nil
  ( (*void*) ) = let
//
val
stkmap =
stkmap_make_nil() in TR2AENV(stkmap)
//
end (*let*) // end of [tr2aenv_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr2aenv_free_top
  (  env0  ) =
(
case+ env0 of
~TR2AENV(stkmap) =>
let
//
var
stkmap = stkmap
//
val nerr =
stkmap_poptop0(stkmap)
//
val (  ) =
stkmap_free_nil(stkmap) in () end//let
) (*case+*)//end-of-(tr2aenv_free_top(env0))
//
(* ****** ****** *)
//
#implfun
tr2aenv_poplet0
(     env0     ) = let
//
val+
@TR2AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr2aenv_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr2aenv_pshlet0
(     env0     ) = let
//
val+
@TR2AENV(!stkmap) = env0
//
in//let
//
stkmap_pshlet0(stkmap); $fold(env0)
//
end (*let*)//end-of-(tr2aenv_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr2aenv_pshloc1
(     env0     ) = let
//
val+
@TR2AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr2aenv_pshloc1(env0))
//
#implfun
tr2aenv_pshloc2
(     env0     ) = let
//
val+
@TR2AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr2aenv_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
tr2aenv_locjoin
(     env0     ) = let
//
val+
@TR2AENV(!stkmap) = env0
//
in//let
//
$fold(env0) where
{
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
val
( (*nil*) ) =
stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(tr2aenv_locjoin(env0))
//
(* ****** ****** *)

#implfun
tr2aenv_search_opt
  (env0, k0) = let
//
val+
TR2AENV(stkmap) = env0 in
stkmap_search_opt(stkmap, k0) end
//
(*let*)//end-of-[tr2aenv_search_opt(env0,k0)]

(* ****** ****** *)
//
#implfun
tr2aenv_insert_any
  (tenv, k0, x0) = let
//
val+
@TR2AENV(!stkmap) = tenv in
stkmap_insert_any(stkmap, k0, x0) end
//
(*let*)//end-of(tr2aenv_insert_any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(tr2aenv) ]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_myenv0.dats] *)
