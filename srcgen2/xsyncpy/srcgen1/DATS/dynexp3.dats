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
Sat May 17 10:53:55 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#staload
"./../DATS/dynexp3_print0.dats"
//
in//local
//
#implfun
d3pat1_fprint = g_fprint<d3pat1>
#implfun
d3exp1_fprint = g_fprint<d3exp1>
//
end//local
//
(* ****** ****** *)
//
#impltmp
g_print<d3pat1>(d3e0) =
d3pat1_fprint(d3e0, g_print$out<>())
#impltmp
g_print<d3exp1>(d3e0) =
d3exp1_fprint(d3e0, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3.dats] *)
(***********************************************************************)
