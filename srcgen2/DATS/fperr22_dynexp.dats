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
Sun 29 Jan 2023 11:33:55 PM EST
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
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d2p: d2pat): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d2p.node() of
//
|
D2Pannot
(d2p1,s1e2,s2e2) =>
let
val () = fperr22_d2pat(out, d2p1)
(*
val () = fperr22_s2exp(out, s2e2)
*)
endlet
//
|D2Pnone0(    ) => (   (*void*)   )
|D2Pnone1(d1p1) => (   (*void*)   )
|D2Pnone2(d2p1) => (   (*void*)   )
|
D2Perrck(_,_) => fperr22_d2pat(out, d2p)
//
end (*let*) // end-of-(auxmain(out, d2p))

in//local
//
#implfun
fperr22_d2pat
( out, d2p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d2p0.lctn()
in
prerrln
("fperr22_d2pat: loc0 = ", loc0)
end
val () =
prerrln
("fperr22_d2pat: d2p0 = ", d2p0)
//
in//let
//
case+
d2p0.node() of
|
D2Perrck(lvl, d2p1) =>
(
auxmain( out, d2p1 ); 
if
(lvl
>FPERR22_ERRVL) then () else
let
val loc0 = d2p0.lctn() in
println
("FPERR22-ERROR:",loc0,":",d2p0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr22_d2pat(out,d2p0))
//
endloc(*local*)//end-of(local(fperr22_d2pat))

(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d2e: d2exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d2e.node() of
//
|
D2Esym0
(drxp,d1e1,dpis) =>
let
val () =
fperr22_d2exp
(out, drxp.dexp((*void*))) end
//
|
D2Edapp
(d2f0,npf1,d2es) =>
let
val () =
fperr22_d2exp(out, d2f0)
val () =
fperr22_d2explst(out, d2es) end
//
|
D2Eif0
(d2e1,dthn,dels) =>
let
val () =
fperr22_d2exp(out, d2e1)
val () =
fperr22_d2expopt(out, dthn)
val () =
fperr22_d2expopt(out, dels) end
//
|
D2Eassgn
(d2el, d2er) =>
let
val () = fperr22_d2exp(out, d2el)
val () = fperr22_d2exp(out, d2er)
endlet
|
D2Et2pck
(d2e1, t2p2) =>
let
val () = fperr22_d2exp(out, d2e1)
endlet
//
|D2Enone0(    ) => (   (*void*)   )
|D2Enone1(d1e1) => (   (*void*)   )
|D2Enone2(d2e1) => (   (*void*)   )
|
D2Eerrck(_,_) => fperr22_d2exp(out, d2e)
//
end (*let*) // end-of-(auxmain(out, d2e))

in//local
//
#implfun
fperr22_d2exp
( out, d2e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d2e0.lctn()
in
prerrln
("fperr22_d2exp: loc0 = ", loc0)
end
val () =
prerrln
("fperr22_d2exp: d2e0 = ", d2e0)
//
in//let
//
case+
d2e0.node() of
|
D2Eerrck(lvl, d2e1) =>
(
auxmain( out, d2e1 ); 
if
(lvl
>FPERR22_ERRVL) then () else
let
val loc0 = d2e0.lctn() in
println
("FPERR22-ERROR:",loc0,":",d2e0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr22_d2exp(out,d2e0))
//
endloc(*local*)//end-of(local(fperr22_d2exp))

(* ****** ****** *)
//
#implfun
fperr22_f2arg
(out, farg) =
(
case+
farg.node() of
//
|F2ARGdyn0
(npf1, d2ps) =>
fperr22_d2patlst(out, d2ps)
//
|F2ARGsta0
(s2vs, s2es) => ( (*void*) )
|F2ARGmet0(s2es) => ( (*void*) )
//
) (*case+*)//end-of-(fperr22_f2arg(out,farg)]
//
(* ****** ****** *)
//
#implfun
fperr22_d2patlst
  (out, d2ps) =
(
  list_fperr22_fnp(out, d2ps, fperr22_d2pat))
#implfun
fperr22_d2patopt
  (out, dopt) =
(
  optn_fperr22_fnp(out, dopt, fperr22_d2pat))
//
#implfun
fperr22_l2d2plst
  (out, ldps) =
(
  list_fperr22_fnp(out, ldps, fperr22_l2d2p))
//
(* ****** ****** *)
//
#implfun
fperr22_d2explst
  (out, d2es) =
(
  list_fperr22_fnp(out, d2es, fperr22_d2exp))
#implfun
fperr22_d2expopt
  (out, dopt) =
(
  optn_fperr22_fnp(out, dopt, fperr22_d2exp))
//
#implfun
fperr22_l2d2elst
  (out, ldes) =
(
  list_fperr22_fnp(out, ldes, fperr22_l2d2e))
//
(* ****** ****** *)
//
#implfun
fperr22_f2arglst
  (out, f2as) =
(
  list_fperr22_fnp(out, f2as, fperr22_f2arg))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr22_dynexp.dats] *)