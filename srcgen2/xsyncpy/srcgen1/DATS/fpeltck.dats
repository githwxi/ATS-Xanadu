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
//
(*
Author: Hongwei Xi
(*
Sat Nov  1 11:43:17 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/fpeltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
list_fpeltck_fnp
{  syn:tbox  }
(  out, lst, fpr  ) =
(
list_foritm<syn>(lst)) where
{
//
#impltmp
foritm$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(list_fpeltck_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_fpeltck_fnp
{  syn:tbox  }
(  out, opt, fpr  ) =
(
optn_foritm<syn>(opt)) where
{
//
#impltmp
foritm$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(optn_fpeltck_fnp(opt,err,fpr))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fpeltck_d3parsed1
  (out0, dpar) =
let
//
val
nerror =
d3parsed1_nerror$get
(       dpar       )
//
in//let
//
if
(nerror=0)
then ((*void*)) else
let
val parsed =
d3parsed1_parsed$get(dpar)
in//let
fpeltck_d3ecl1lstopt(out0, parsed) end//let
//
end(*let*)//end-of-[fpeltck_d3parsed1(out0,dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fpeltck_d3ecl1lstopt
  (out0, dopt) =
(
case+ dopt of
|optn_nil() => ((*void*))
|optn_cons(dcls) => fpeltck_d3ecl1lst(out0, dcls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_fpeltck.dats] *)
(***********************************************************************)
