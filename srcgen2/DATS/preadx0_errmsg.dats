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
Start Time: June 18th, 2022
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
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)

#define
FPEMSG_ERRVL 2

(* ****** ****** *)

#symload fpemsg with sort0_fpemsg
#symload fpemsg with s0exp_fpemsg
#symload fpemsg with sort0opt_fpemsg
#symload fpemsg with s0expopt_fpemsg
#symload fpemsg with sort0lst_fpemsg
#symload fpemsg with s0explst_fpemsg

(* ****** ****** *)

#implfun
sort0_fpemsg
(out, s0t) =
let
#impltmp g_print$out() = out
in//let
case
s0t.node() of
| S0Tid0 _ => ()
| S0Tint _ => ()
|
S0Tapps(sts) => fpemsg(out, sts)
|
S0Tlpar(tkb,sts,tke) => fpemsg(out, sts)
|
S0Terrck(lvl, st1) =>
(
sort0_fpemsg(out, st1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println("PREADX0-ERROR:", s0t.lctn(), ":", s0t)
)
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(sort0_fpemsg(out,s0t))

(* ****** ****** *)

#implfun
s0exp_fpemsg
(out, s0e) =
let
#impltmp g_print$out() = out
in//let
case
s0e.node() of
//
| S0Eid0 _ => ()
//
| S0Eint _ => ()
| S0Echr _ => ()
| S0Eflt _ => ()
| S0Estr _ => ()
//
| S0Eop1 _ => ()
| S0Eop2 _ => ()
| S0Eop3 _ => ()
//
|
S0Eapps(ses) => fpemsg(out, ses)
|
S0Efimp(tkb,ses,tke) => fpemsg(out, ses)
|
S0Elpar(tkb,ses,srp) => fpemsg(out, ses)
|
S0Eerrck(lvl, se1) =>
(
s0exp_fpemsg(out, se1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println("PREADX0-ERROR:", s0e.lctn(), ":", s0e)
)
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(s0exp_fpemsg(out,s0e))

(* ****** ****** *)
//
#implfun
sort0opt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(s0t) => sort0_fpemsg(out, s0t)
)
#implfun
s0expopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(s0e) => s0exp_fpemsg(out, s0e)
)
//
(* ****** ****** *)
//
#implfun
sort0lst_fpemsg
(out, sts) =
list_foreach<sort0>(sts) where
{
#impltmp
foreach$work<sort0>(st1) = sort0_fpemsg(out, st1)
}
#implfun
s0explst_fpemsg
(out, ses) =
list_foreach<s0exp>(ses) where
{
#impltmp
foreach$work<s0exp>(se1) = s0exp_fpemsg(out, se1)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_errmsg.dats] *)
