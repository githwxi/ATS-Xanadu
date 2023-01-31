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
Sun 29 Jan 2023 11:34:20 PM EST
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
(* ****** ****** *)
#staload "./../SATS/fperr22.sats"
(* ****** ****** *)
#define FPERR22_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl: d2ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
case+
//
dcl.node() of
|
D2Cstatic(tknd,dcl1) =>
let
val () =
fperr22_d2ecl(out, dcl1)
endlet//end-of(D2Cstatic(_,_))
|
D2Cextern(tknd,dcl1) =>
let
val () =
fperr22_d2ecl(out, dcl1)
endlet//end-of(D2Cextern(_,_))
//
| D2Cnone0() => ( (*void*) )
| D2Cnone1(d1cl) => ( (*void*) )
|
D2Cerrck(_,_) => fperr22_d2ecl(out, dcl)
//
end (*let*) // end-of-(auxmain(out, dcl))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fperr22_d2ecl
(out, dcl0) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
prerrln
("fperr22_d2ecl: dcl0 = ", dcl0)
//
in//let
//
case+
dcl0.node() of
//
|
D2Cerrck(lvl, d2cl)  =>
(
auxmain( out, d2cl );
if
(lvl
>FPERR22_ERRVL) then () else
let
val loc0 = dcl0.lctn() in
println
("FPERR22-ERROR:",loc0,":",dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
//
end (*let*)//end-of(fperr22_d2ecl(out,dcl0))
//
endloc(*local*)//end-of(local(fperr22_d2ecl))

(* ****** ****** *)
//
#implfun
fperr22_d2eclist
  (out, dcls) =
list_fperr22_fnp(out, dcls, fperr22_d2ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr22_decl00.dats] *)
