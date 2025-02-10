(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jan  9 08:01:33 EST 2024
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
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/fperr40.sats"
(* ****** ****** *)
(* ****** ****** *)
#define FPERR40_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload node with d4exp_get_node
(* ****** ****** *)
#symload lctn with d4ecl_get_lctn
#symload node with d4ecl_get_node
(* ****** ****** *)
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl0: d4ecl): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
dcl0.node() of
//
|
_(*otherwise*) =>
let
//
(*
val loc = dcl0.lctn()
val ( ) = prerrsln
("fperr40_d4ecl: auxmain: loc0 = ", loc0)
val ( ) = prerrsln
("fperr40_d4ecl: auxmain: dcl0 = ", dcl0)
*)
//
endlet
//
end (*let*) // end-of-[ auxmain(out, dcl0) ]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fperr40_d4ecl
(out, dcl0) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = dcl0.lctn()
in//let
(*
prerrsln
("fperr40_d4pat: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr40_d4ecl: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D4Cerrck(lvl, d4cl)  =>
(
auxmain( out, d4cl );
if
(lvl
>FPERR40_ERRVL) then () else
let
val loc0 = dcl0.lctn() in
printsln
("FPERR40-ERROR:",loc0,":",dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
//
end (*let*)//end-of(fperr40_d4ecl(out,dcl0))
//
endloc(*local*)//end-of(local(fperr40_d4ecl))

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fperr40_d4eclist
  (out, dcls) =
(
  list_fperr40_fnp(out, dcls, fperr40_d4ecl))
//
(* ****** ****** *)
//
#implfun
fperr40_d4valdclist
  (out, d4vs) =
(
list_fperr40_fnp(out, d4vs, fperr40_d4valdcl))
//
#implfun
fperr40_d4vardclist
  (out, d4vs) =
(
list_fperr40_fnp(out, d4vs, fperr40_d4vardcl))
//
(* ****** ****** *)
//
#implfun
fperr40_d4fundclist
  (out, d4fs) =
(
list_fperr40_fnp(out, d4fs, fperr40_d4fundcl))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr40_decl00.dats] *)
