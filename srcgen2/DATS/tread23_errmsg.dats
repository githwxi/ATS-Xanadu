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
Sun 26 Feb 2023 11:24:50 AM EST
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
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
#define FPEMSG_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload fpemsg with d3pat_fpemsg
#symload fpemsg with l3d3p_fpemsg
#symload fpemsg with d3exp_fpemsg
#symload fpemsg with l3d3e_fpemsg
(* ****** ****** *)
#symload fpemsg with d3ecl_fpemsg
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d3p: d3pat): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3p.node() of
//
|D3Pvar _ => ()
//
|D3Pint _ => ()
|D3Pbtf _ => ()
|D3Pchr _ => ()
|D3Pflt _ => ()
|D3Pstr _ => ()
//
|
D3Pdapp
(d3f0,npf1,d3ps) =>
let
  val () =
  d3pat_fpemsg(out, d3f0)
  val () =
  d3patlst_fpemsg(out, d3ps)
end (*let*) // end-of-(D3Pdapp)
//
|
D3Ptup0
(npf1, d3ps) =>
let
val () = d3patlst_fpemsg(out, d3ps)
endlet
//
|D3Pnone0(    ) => (   (*void*)   )
|D3Pnone1(d2p1) => (   (*void*)   )
//
|
D3Perrck(_,_) => d3pat_fpemsg(out, d3p)
//
end (*let*) // end-of-(auxmain(out,d3p))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d3pat_fpemsg
( out, d3p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
prerrln
("d3pat_fpemsg: d3p0 = ", d3p0)
//
in//let
//
case+
d3p0.node() of
|
D3Perrck(lvl, d3p1) =>
(
auxmain( out, d3p1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val loc0 = d3p0.lctn() in
println
("TREAD12-ERROR:",loc0,":",d3p0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d3pat_fpemsg(out,d3p0))
//
endloc(*local*)//end-of(local(d3pat_fpemsg))
//
(* ****** ****** *)
//
#implfun
l3d3p_fpemsg
(out, ld3p) =
(
case+ ld3p of
|
D3LAB(lab,d3p1) => d3pat_fpemsg(out,d3p1)
) (*case+*)//end-of-(l3d3p_fpemsg(out,ld3p))
//
(* ****** ****** *)
//
local

fun
auxmain
( out: FILR
, d3e: d3exp): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3e.node() of
//
|D3Eint _ => ()
|D3Ebtf _ => ()
|D3Echr _ => ()
|D3Eflt _ => ()
|D3Estr _ => ()
//
|D3Etop _ => ()
//
|D3Evar _ => ()
//
|D3Econ _ => ()
|D3Ecst _ => ()
//
|
D3Edapp
(d3f0,npf1,d3es) =>
let
  val () =
  d3exp_fpemsg(out, d3f0)
  val () =
  d3explst_fpemsg(out, d3es)
endlet
//
|
D3Eift0
(d3e1,dthn,dels) =>
let
val () = d3exp_fpemsg(out, d3e1)
val () = d3expopt_fpemsg(out, dthn)
val () = d3expopt_fpemsg(out, dels)
endlet
//
|
D3Etup0
(npf1, d3es) =>
let
val () = d3explst_fpemsg(out, d3es)
endlet
//
|D3Enone0(    ) => (   (*void*)   )
|D3Enone1(d1e1) => (   (*void*)   )
|
D3Eerrck(_,_) => d3exp_fpemsg(out, d3e)
//
end (*let*) // end-of-(auxmain(out,d3e))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d3exp_fpemsg
( out, d3e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
prerrln
("d3exp_fpemsg: d3e0 = ", d3e0)
//
in//let
//
case+
d3e0.node() of
|
D3Eerrck(lvl, d3e1) =>
(
auxmain( out, d3e1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val loc0 = d3e0.lctn() in
println
("TREAD12-ERROR:",loc0,":",d3e0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d3exp_fpemsg(out,d3e0))
//
endloc(*local*)//end-of(local(d3exp_fpemsg))
//
(* ****** ****** *)
//
#implfun
l3d3e_fpemsg
(out, ld3e) =
(
case+ ld3e of
|
D3LAB(lab,d3e1) => d3exp_fpemsg(out,d3e1)
) (*case+*)//end-of-(l3d3e_fpemsg(out,ld3e))
//
(* ****** ****** *)
//
#implfun
d3patlst_fpemsg
(out, d3ps) =
list_foreach<d3pat>(d3ps) where
{
#impltmp
foreach$work<d3pat>(d3p1) = d3pat_fpemsg(out,d3p1)
}
//
(* ****** ****** *)
//
#implfun
d3explst_fpemsg
(out, d3es) =
list_foreach<d3exp>(d3es) where
{
#impltmp
foreach$work<d3exp>(d3e1) = d3exp_fpemsg(out,d3e1)
}
//
(* ****** ****** *)
//
#implfun
d3eclist_fpemsg
(out, dcls) =
list_foreach<d3ecl>(dcls) where
{
#impltmp
foreach$work<d3ecl>(dcl1) = d3ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)
//
#implfun
d3valdclist_fpemsg
(out, d3vs) =
list_foreach<d3valdcl>(d3vs) where
{
#impltmp
foreach$work<d3valdcl>(dvar) = d3valdcl_fpemsg(out,dvar)
}
//
(* ****** ****** *)
//
#implfun
d3vardclist_fpemsg
(out, d3vs) =
list_foreach<d3vardcl>(d3vs) where
{
#impltmp
foreach$work<d3vardcl>(dvar) = d3vardcl_fpemsg(out,dvar)
}
//
(* ****** ****** *)
//
#implfun
d3fundclist_fpemsg
(out, d3fs) =
list_foreach<d3fundcl>(d3fs) where
{
#impltmp
foreach$work<d3fundcl>(dfun) = d3fundcl_fpemsg(out,dfun)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread23_errmsg.dats] *)
