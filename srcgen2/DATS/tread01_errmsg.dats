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
Tue Aug 16 16:09:56 EDT 2022
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)

local

in(*in-of-local*)

#implfun
d1ecl_fpemsg
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl0.node() of
|
D1Cerrck(lvl, d1cl)  =>
(
(*
auxmain( out, d1cl );
*)
println
("TREAD01-ERROR:",dcl0.lctn(),":",dcl0))
//
| _(* otherwise *) => ((*void*))
end (*let*)//end-of(d1ecl_fpemsg(out,dcl0))
//
endloc(*local*)//end-of(local(d1ecl_fpemsg))

(* ****** ****** *)
//
#implfun
sort1lst_fpemsg
(out, s1ts) =
list_foreach<sort1>(s1ts) where
{
#impltmp
foreach$work<sort1>(s1t1) = sort1_fpemsg(out,s1t1)
}
//
(* ****** ****** *)
//
#implfun
s1explst_fpemsg
(out, s1es) =
list_foreach<s1exp>(s1es) where
{
#impltmp
foreach$work<s1exp>(s1e1) = s1exp_fpemsg(out,s1e1)
}
//
(* ****** ****** *)
//
#implfun
d1patlst_fpemsg
(out, d1ps) =
list_foreach<d1pat>(d1ps) where
{
#impltmp
foreach$work<d1pat>(d1p1) = d1pat_fpemsg(out,d1p1)
}
//
(* ****** ****** *)
//
#implfun
d1explst_fpemsg
(out, d1es) =
list_foreach<d1exp>(d1es) where
{
#impltmp
foreach$work<d1exp>(d1e1) = d1exp_fpemsg(out,d1e1)
}
//
(* ****** ****** *)
//
#implfun
d1eclist_fpemsg
(out, dcls) =
list_foreach<d1ecl>(dcls) where
{
#impltmp
foreach$work<d1ecl>(dcl1) = d1ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_errmsg.dats] *)
