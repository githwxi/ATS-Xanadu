(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed 26 Jul 2023 01:46:46 PM EDT
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/fperr33.sats"
(* ****** ****** *)
#define FPERR33_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl: d3ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl.node() of
//
| D3Cnone0() => ( (*void*) )
| D3Cnone1(d2cl) => ( (*void*) )
| D3Cnone2(d3cl) => ( (*void*) )
|
D3Cerrck(_,_) => fperr33_d3ecl(out, dcl)
//
|
_(*otherwise*) =>
let
//
  val
  loc = dcl.lctn()
  val () = prerrln
  ("fperr33_d3ecl: auxmain: loc = ", loc)
  val () = prerrln
  ("fperr33_d3ecl: auxmain: dcl = ", dcl)
//
end (*let*) // end-of-[ (* otherwise *) ]
//
end (*let*) // end-of-[ auxmain(out, dcl) ]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fperr33_d3ecl
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
prerrln
("fperr33_d3pat: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrln
("fperr33_d3ecl: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D3Cerrck(lvl, d3cl)  =>
(
auxmain( out, d3cl );
if
(lvl
>FPERR33_ERRVL) then () else
let
val loc0 = dcl0.lctn() in
println
("FPERR33-ERROR:",loc0,":",dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
//
end (*let*)//end-of(fperr33_d3ecl(out,dcl0))
//
endloc(*local*)//end-of(local(fperr33_d3ecl))

(* ****** ****** *)
//
#implfun
fperr33_d3eclist
  (out, dcls) =
(
  list_fperr33_fnp(out, dcls, fperr33_d3ecl))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr33_decl00.dats] *)
