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
Tue Jan  9 07:57:06 EST 2024
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
#symload lctn with d4pat_get_lctn
#symload styp with d4pat_get_styp
#symload node with d4pat_get_node
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload styp with d4exp_get_styp
#symload node with d4exp_get_node
(* ****** ****** *)
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d4p: d4pat): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d4p.node() of
//
|
_(*otherwise*) =>
let
//
(*
val loc = d4p.lctn((*void*))
val t2p = d4p.styp((*void*))
val ( ) = prerrsln("\
fperr40_d4pat: auxmain(40): loc = ", loc)
val ( ) = prerrsln("\
fperr40_d4pat: auxmain(40): t2p = ", t2p)
val ( ) = prerrsln("\
fperr40_d4pat: auxmain(40): d4p = ", d4p)
*)
//
endlet
//
end (*let*) // end-of-[ auxmain(out, d4p) ]

in//local
//
#implfun
fperr40_d4pat
( out, d4p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d4p0.lctn()
in//let
(*
prerrsln
("fperr40_d4pat: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr40_d4pat: d4p0 = ", d4p0)
*)
//
in//let
//
case+
d4p0.node() of
|
D4Perrck(lvl, d4p1) =>
(
auxmain( out, d4p1 ); 
if
(lvl
>FPERR40_ERRVL)
then ((*void*)) else
let
val loc0 = d4p0.lctn((*0*))
in//let
(*
prerrsln
("FPERR40-ERROR:",loc0,":",d4p0)
*)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr40_d4pat(out,d4p0))
//
(* ****** ****** *)
//
endloc(*local*)//end-of(local(fperr40_d4pat))

(* ****** ****** *)
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d4e: d4exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d4e.node() of
//
|
_(*otherwise*) =>
let
//
  val loc = d4e.lctn((*void*))
  val t2p = d4e.styp((*void*))
//
  val ( ) = prerrsln
  ("fperr40_d4exp: auxmain: loc = ", loc)
  val ( ) = prerrsln
  ("fperr40_d4exp: auxmain: t2p = ", t2p)
  val ( ) = prerrsln
  ("fperr40_d4exp: auxmain: d4e = ", d4e)
//
endlet
//
end (*let*) // end-of-[ auxmain(out, d4e) ]

in//local
//
#implfun
fperr40_d4exp
( out, d4e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d4e0.lctn()
in//let
(*
prerrsln
("fperr40_d4exp: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr40_d4exp: d4e0 = ", d4e0)
*)
//
in//let
//
case+
d4e0.node() of
|
D4Eerrck(lvl, d4e1) =>
(
auxmain( out, d4e1 ); 
if
(lvl
>FPERR40_ERRVL)
then ((*void*)) else
let
val loc0 = d4e0.lctn((*0*))
in//let
(*
prerrsln
("FPERR40-ERROR:",loc0,":",d4e0)
*)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr40_d4exp(out,d4e0))
//
(* ****** ****** *)
//
endloc(*local*)//end-of(local(fperr40_d4exp))

(* ****** ****** *)
//
#implfun
fperr40_l4d4e
(out, ld4e) =
(
case+ ld4e of
|
D4LAB(lab,d4e1) => fperr40_d4exp(out,d4e1)
) (*case+*)//end-of-(fperr40_d4exp(out,ld4e))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fperr40_d4explst
  (out, d4es) =
(
  list_fperr40_fnp(out, d4es, fperr40_d4exp))
//
#implfun
fperr40_d4expopt
  (out, dopt) =
(
  optn_fperr40_fnp(out, dopt, fperr40_d4exp))
//
(* ****** ****** *)
//
#implfun
fperr40_l4d4elst
  (out, ldes) =
(
  list_fperr40_fnp(out, ldes, fperr40_l4d4e))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr40_dynexp.dats] *)
