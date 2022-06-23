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
#symload fpemsg with i0dnt_fpemsg
#symload fpemsg with t0int_fpemsg
#symload fpemsg with t0chr_fpemsg
#symload fpemsg with t0flt_fpemsg
#symload fpemsg with t0str_fpemsg
(* ****** ****** *)
#symload fpemsg with sort0_fpemsg
#symload fpemsg with s0exp_fpemsg
#symload fpemsg with l0s0e_fpemsg
#symload fpemsg with sort0opt_fpemsg
#symload fpemsg with s0expopt_fpemsg
#symload fpemsg with sort0lst_fpemsg
#symload fpemsg with s0explst_fpemsg
#symload fpemsg with s0exp_RPAREN_fpemsg
(* ****** ****** *)
//
#implfun
i0dnt_fpemsg
(out, id0) =
(
case+ id0 of
|
I0DNTsome _ => ()
|
I0DNTnone(tok) =>
println("PREADX0-ERROR:", tok.lctn(), ":", id0)
)
//
(* ****** ****** *)
//
#implfun
t0int_fpemsg
(out, int) =
(
case+ int of
|
T0INTsome _ => ()
|
T0INTnone(tok) =>
println("PREADX0-ERROR:", tok.lctn(), ":", int)
)
//
#implfun
t0int_fpemsg
(out, chr) =
(
case+ chr of
|
T0CHRsome _ => ()
|
T0CHRnone(tok) =>
println("PREADX0-ERROR:", tok.lctn(), ":", chr)
)
//
#implfun
t0flt_fpemsg
(out, flt) =
(
case+ flt of
|
T0FLTsome _ => ()
|
T0FLTnone(tok) =>
println("PREADX0-ERROR:", tok.lctn(), ":", flt)
)
//
#implfun
t0str_fpemsg
(out, str) =
(
case+ str of
|
T0STRsome _ => ()
|
T0STRnone(tok) =>
println("PREADX0-ERROR:", tok.lctn(), ":", str)
)
//
(* ****** ****** *)

#implfun
sort0_fpemsg
(out, s0t) =
let
#impltmp g_print$out() = out
in//let
case
s0t.node() of
//
|
S0Tid0(id0) => fpemsg(out, id0)
|
S0Tint(int) => fpemsg(out, int)
//
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
|
S0Eid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
S0Eint(int) =>
t0int_fpemsg(out, int)
|
S0Echr(chr) =>
t0chr_fpemsg(out, chr)
|
S0Eflt(flt) =>
t0flt_fpemsg(out, flt)
|
S0Estr(str) =>
t0str_fpemsg(out, str)
//
|
S0Eop1 _ => ((*void*))
|
S0Eop2 _ => ((*void*))
|
S0Eop3 _ => ((*void*))
//
|
S0Eapps(ses) =>
s0explst_fpemsg(out, ses)
|
S0Efimp(tkb,ses,tke) =>
s0explst_fpemsg(out, ses)
|
S0Elpar(tkb,ses,srp) =>
(fpemsg(out, ses); fpemsg(out, srp))
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
l0s0e_fpemsg
(out, lse) =
(
case+ lse of
| S0LAB
  (lab,teq,s0e) => s0exp_fpemsg(out,s0e)
) (*case*)//end-of(l0s0e_fpemsg(out,lse))
//
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
foreach$work<sort0>(st1) = sort0_fpemsg(out,st1)
}
#implfun
s0explst_fpemsg
(out, ses) =
list_foreach<s0exp>(ses) where
{
#impltmp
foreach$work<s0exp>(se1) = s0exp_fpemsg(out,se1)
}
#implfun
l0s0elst_fpemsg
(out, lxs) =
list_foreach<l0s0e>(lxs) where
{
#impltmp
foreach$work<l0s0e>(lx1) = l0s0e_fpemsg(out,lx1)
}
//
(* ****** ****** *)
//
#implfun
s0exp_RPAREN_fpemsg
(out, srp) =
(
case+ srp of
| s0exp_RPAREN_cons0
  (      tend      ) => ()
| s0exp_RPAREN_cons1
  (tbar, s0es, tend) => s0explst_fpemsg(out,s0es)
)
//
#implfun
l0s0e_RBRACE_fpemsg
(out, lsrb) =
(
case+ lsrb of
| l0s0e_RBRACE_cons0
  (      tend      ) => ()
| l0s0e_RBRACE_cons1
  (tbar, lses, tend) => l0s0elst_fpemsg(out,lses)
)
//
(* ****** ****** *)
//
#implfun
d0patopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(d0p) => d0pat_fpemsg(out, d0p)
)
#implfun
d0expopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(d0e) => d0exp_fpemsg(out, d0e)
)
//
(* ****** ****** *)
//
#implfun
d0patlst_fpemsg
(out, dps) =
list_foreach<d0pat>(dps) where
{
#impltmp
foreach$work<d0pat>(dp1) = d0pat_fpemsg(out,dp1)
}
//
#implfun
d0explst_fpemsg
(out, des) =
list_foreach<d0exp>(des) where
{
#impltmp
foreach$work<d0exp>(de1) = d0exp_fpemsg(out,de1)
}
//
(* ****** ****** *)
//
#implfun
d0eclist_fpemsg
(out, dcls) =
list_foreach<d0ecl>(dcls) where
{
#impltmp
foreach$work<d0ecl>(dcl1) = d0ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_errmsg.dats] *)
