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
#staload "./../SATS/dynexp0.sats"
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
//
#symload lctn with s0mag_get_lctn
#symload node with s0mag_get_node
//
#symload lctn with t0arg_get_lctn
#symload node with t0arg_get_node
//
#symload lctn with t0mag_get_lctn
#symload node with t0mag_get_node
//
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
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
(* ****** ****** *)
#symload fpemsg with sort0opt_fpemsg
#symload fpemsg with s0expopt_fpemsg
#symload fpemsg with sort0lst_fpemsg
#symload fpemsg with s0explst_fpemsg
#symload fpemsg with s0exp_RPAREN_fpemsg
#symload fpemsg with l0s0e_RBRACE_fpemsg
(* ****** ****** *)
#symload fpemsg with d0pat_fpemsg
#symload fpemsg with d0exp_fpemsg
#symload fpemsg with d0ecl_fpemsg
(* ****** ****** *)
#symload fpemsg with d0patopt_fpemsg
#symload fpemsg with d0expopt_fpemsg
#symload fpemsg with d0patlst_fpemsg
#symload fpemsg with d0explst_fpemsg
#symload fpemsg with d0eclist_fpemsg
(* ****** ****** *)
#extern
fun
token_EQ0_fpemsg:(FILR,token)->void
#extern
fun
token_RPAREN_fpemsg:(FILR,token)->void
(* ****** ****** *)
//
#implfun
i0dnt_fpemsg
(out, id0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ id0 of
|
I0DNTsome _ => ()
|
I0DNTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", id0)
end (*let*)//end-of-[i0dnt_fpemsg(out,id0)]
//
(* ****** ****** *)
//
#implfun
t0int_fpemsg
(out, int) =
let
#impltmp
g_print$out<>() = out
in//let
case+ int of
|
T0INTsome _ => ()
|
T0INTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", int)
end (*let*)//end-of-[t0int_fpemsg(out,int)]
//
#implfun
t0int_fpemsg
(out, chr) =
let
#impltmp
g_print$out<>() = out
in//let
case+ chr of
|
T0CHRsome _ => ()
|
T0CHRnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", chr)
end (*let*)//end-of-[t0chr_fpemsg(out,chr)]
//
#implfun
t0flt_fpemsg
(out, flt) =
let
#impltmp
g_print$out<>() = out
in//let
case+ flt of
|
T0FLTsome _ => ()
|
T0FLTnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", flt)
end (*let*)//end-of-[t0chr_fpemsg(out,flt)]
//
#implfun
t0str_fpemsg
(out, str) =
let
#impltmp
g_print$out<>() = out
in//let
case+ str of
|
T0STRsome _ => ()
|
T0STRnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", str)
end (*let*)//end-of-[t0chr_fpemsg(out,str)]
//
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s0t: sort0): void =
let
#impltmp
g_print$out<>() = out
in//let
case
s0t.node() of
//
|
S0Tid0(id0) =>
i0dnt_fpemsg(out, id0)
|
S0Tint(int) =>
t0int_fpemsg(out, int)
//
|
S0Tapps(sts) =>
sort0lst_fpemsg(out, sts)
|
S0Tlpar(tkb,sts,tke) =>
sort0lst_fpemsg(out, sts)
|
S0Ttkerr _ => ( (*void*) )
|
S0Terrck _ => sort0_fpemsg(out, s0t)
end(*let*)//end-of-(auxmain(out,s0t))
//
in//local
//
#implfun
sort0_fpemsg
(out, s0t) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s0t.node() of
|
S0Terrck(lvl, st1) =>
(
auxmain( out, st1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", s0t.lctn(), ":", s0t)
)
| _(* otherwise *) => ((*void*))
//
end(*let*)//end-of(sort0_fpemsg(out,s0t))
//
endloc(*local*)//end-of(local(sort0_fpemsg))

(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, s0e: s0exp): void =
let
#impltmp
g_print$out<>() = out
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
(
fpemsg(out, ses); fpemsg(out, srp)
)
|
S0Etkerr _ => ( (*void*) )
|
S0Eerrck _ => s0exp_fpemsg(out, s0e)
end(*let*)//end-of-(auxmain(out,s0e))

in//local
//
#implfun
s0exp_fpemsg
(out, s0e) =
let
#impltmp
g_print$out<>() = out
in//let
case
s0e.node() of
|
S0Eerrck(lvl, se1) =>
(
auxmain( out, se1 );
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", s0e.lctn(), ":", s0e)
)
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(s0exp_fpemsg(out,s0e))
//
endloc(*local*)//end-of-local(s0exp_fpemsg)

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
#implfun
t0arg_fpemsg
(out, t0a) =
(
case+
t0a.node() of
|
T0ARGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", t0a)
|
T0ARGsome(s0t1,topt) => fpemsg(out,s0t1)
)
(* ****** ****** *)
#implfun
t0mag_fpemsg
(out, tma) =
(
case+
tma.node() of
|
T0MAGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":", tma)
|
T0MAGlist
(tbeg,t0as,tend) =>
let
//
val () = t0arglst_fpemsg(out, t0as)
val () = token_RPAREN_fpemsg(out, tend)
//
endlet
) (*case*)//end-of(t0mag_fpemsg(out,lse))
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
#implfun
i0dntlst_fpemsg
(out, ids) =
list_foreach<i0dnt>(ids) where
{
#impltmp
foreach$work<i0dnt>(id1) = i0dnt_fpemsg(out,id1)
}
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
s0maglst_fpemsg
(out, sms) =
list_foreach<s0mag>(sms) where
{
#impltmp
foreach$work<s0mag>(sma) = s0mag_fpemsg(out,sma)
}
(* ****** ****** *)
//
#implfun
t0arglst_fpemsg
(out, tas) =
list_foreach<t0arg>(tas) where
{
#impltmp
foreach$work<t0arg>(t0a) = t0arg_fpemsg(out,t0a)
}
(* ****** ****** *)
//
#implfun
t0maglst_fpemsg
(out, tms) =
list_foreach<t0mag>(tms) where
{
#impltmp
foreach$work<t0mag>(tma) = t0mag_fpemsg(out,tma)
}
(* ****** ****** *)
//
#implfun
s0exp_RPAREN_fpemsg
(out, srp) =
(
case+ srp of
|
s0exp_RPAREN_cons0
(      tend      ) => ()
|
s0exp_RPAREN_cons1
(tbar, s0es, tend) => s0explst_fpemsg(out,s0es)
)
//
#implfun
l0s0e_RBRACE_fpemsg
(out, lsrb) =
(
case+ lsrb of
|
l0s0e_RBRACE_cons0
(      tend      ) => ()
|
l0s0e_RBRACE_cons1
(tbar, lses, tend) => l0s0elst_fpemsg(out,lses)
)
//
(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, d0p: d0pat): void =
let
#impltmp
g_print$out<>() = out
in//let
case
d0p.node() of
//
|
D0Pid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Pint(int) =>
t0int_fpemsg(out, int)
|
D0Pchr(chr) =>
t0chr_fpemsg(out, chr)
|
D0Pflt(flt) =>
t0flt_fpemsg(out, flt)
|
D0Pstr(str) =>
t0str_fpemsg(out, str)
//
|
D0Papps(ses) =>
d0patlst_fpemsg(out, ses)
//
|
D0Ptkerr _ => ( (*void*) )
|
D0Perrck _ => d0pat_fpemsg(out,d0p)
//
end(*let*)//end-of-(auxmain(out,d0p))
//
in//local
//
#implfun
d0pat_fpemsg
(out, d0p) =
let
#impltmp
g_print$out<>() = out
in//let
case+
d0p.node() of
|
D0Perrck(lvl, se1) =>
(
d0pat_fpemsg(out, se1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", d0p.lctn(), ":", d0p)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0pat_fpemsg(out,d0p))
//
endloc(*local*)//end-of-local(d0pat_fpemsg)

(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, d0e: d0exp): void =
let
#impltmp
g_print$out<>() = out
in//let
case
d0e.node() of
//
|
D0Eid0(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Eint(int) =>
t0int_fpemsg(out, int)
|
D0Echr(chr) =>
t0chr_fpemsg(out, chr)
|
D0Eflt(flt) =>
t0flt_fpemsg(out, flt)
|
D0Estr(str) =>
t0str_fpemsg(out, str)
//
|
D0Eopid(id0) =>
i0dnt_fpemsg(out, id0)
//
|
D0Eapps(ses) =>
d0explst_fpemsg(out, ses)
//
|
D0Etkerr _ => ( (*void*) )
|
D0Eerrck _ => d0exp_fpemsg(out,d0e)
//
end(*let*)//end-of-(auxmain(out,d0e))
//
in//local
//
#implfun
d0exp_fpemsg
(out, d0e) =
let
#impltmp
g_print$out<>() = out
in//let
case+
d0e.node() of
|
D0Eerrck(lvl, se1) =>
(
d0exp_fpemsg(out, se1)
; 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:", d0e.lctn(), ":", d0e)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0exp_fpemsg(out,d0e))
//
endloc(*local*)//end-of-local(d0exp_fpemsg)

(* ****** ****** *)
//
local
//
fun
auxmain
( out: FILR
, dcl: d0ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|
D0Cnonfix
(knd, ids) =>
i0dntlst_fpemsg(out, ids)
|
D0Cfixity
(knd, ids, opt) =>
i0dntlst_fpemsg(out, ids)
//
|
D0Cstatic
(knd, dc1) =>
let
val () = fpemsg(out, dc1)
end
|
D0Cextern
(knd, dc1) =>
let
val () = fpemsg(out, dc1)
end
//
|
D0Clocal
( tkb, ds1
, tin, ds2, tke) =>
let
val () =
d0eclist_fpemsg(out, ds1)
val () =
d0eclist_fpemsg(out, ds2)
endlet // end of [D0Clocal]
//
|
D0Cabssort
(knd, tid) => let
  val () = fpemsg(out, tid)
endlet // end-of(D0Cabssort)
//
|
D0Cstacst0
( knd, sid
, tmas, tcln, s0t1) =>
let
  val () = fpemsg(out, sid)
  val () =
  t0maglst_fpemsg(out, tmas)
  val () = fpemsg(out, s0t1)
endlet
//
|
D0Csortdef
(knd,tid,teq1,tdf2) =>
let
  val () = fpemsg(out, tid)
  val () =
  token_EQ0_fpemsg(out, teq1)
  val () = s0tdf_fpemsg(out, tdf2)
endlet
//
|
D0Ctkerr _  => ( (*void*) )
|
D0Cerrck _  => d0ecl_fpemsg(out, dcl)
//
| _(* otherwise *) => ((*void*))
end (*let*) // end of [auxmain(out, dcl)]
//
in//local
//
#implfun
d0ecl_fpemsg
(out, dcl) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl.node() of
|
D0Cerrck(lvl, dc1)  =>
(
auxmain( out, dc1 );
println
("PREADX0-ERROR:", dcl.lctn(), ":", dcl))
//
| _(* otherwise *) => ((*void*))
end (*let*)//end-of(d0ecl_fpemsg(out,dcl))
//
endloc(*local*)//end-of(local(d0ecl_fpemsg))
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
