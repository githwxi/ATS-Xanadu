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
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
(* ****** ****** *)
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
(* ****** ****** *)
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
(* ****** ****** *)
//
#symload lctn with s0arg_get_lctn
#symload node with s0arg_get_node
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
#symload lctn with s0qua_get_lctn
#symload node with s0qua_get_node
//
(* ****** ****** *)
#symload lctn with s0uni_get_lctn
#symload node with s0uni_get_node
(* ****** ****** *)
#symload lctn with d0tcn_get_lctn
#symload node with d0tcn_get_node
(* ****** ****** *)
#symload lctn with d0typ_get_lctn
#symload node with d0typ_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with f0arg_get_lctn
#symload node with f0arg_get_node
(* ****** ****** *)
#symload lctn with d0gua_get_lctn
#symload node with d0gua_get_node
(* ****** ****** *)
#symload lctn with d0gpt_get_lctn
#symload node with d0gpt_get_node
(* ****** ****** *)
#symload lctn with d0cls_get_lctn
#symload node with d0cls_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with q0arg_get_lctn
#symload node with q0arg_get_node
(* ****** ****** *)
#symload lctn with s0qag_get_lctn
#symload node with s0qag_get_node
(* ****** ****** *)
#symload lctn with t0qag_get_lctn
#symload node with t0qag_get_node
(* ****** ****** *)
#symload node with a0typ_get_node
#symload node with d0arg_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)

#define
FPEMSG_ERRVL 2

(* ****** ****** *)
#symload fpemsg with i0dnt_fpemsg
(* ****** ****** *)
#symload fpemsg with l0abl_fpemsg
(* ****** ****** *)
#symload fpemsg with s0ymb_fpemsg
(* ****** ****** *)
#symload fpemsg with t0int_fpemsg
#symload fpemsg with t0chr_fpemsg
#symload fpemsg with t0flt_fpemsg
#symload fpemsg with t0str_fpemsg
(* ****** ****** *)
#symload fpemsg with s0qid_fpemsg
#symload fpemsg with d0qid_fpemsg
(* ****** ****** *)
#symload fpemsg with sort0_fpemsg
#symload fpemsg with s0exp_fpemsg
#symload fpemsg with l0s0e_fpemsg
(* ****** ****** *)
#symload fpemsg with sort0opt_fpemsg
#symload fpemsg with s0expopt_fpemsg
#symload fpemsg with sort0lst_fpemsg
#symload fpemsg with s0explst_fpemsg
(* ****** ****** *)
#symload fpemsg with s0exp_RPAREN_fpemsg
#symload fpemsg with l0s0e_RBRACE_fpemsg
(* ****** ****** *)
#symload fpemsg with d0pat_fpemsg
#symload fpemsg with d0exp_fpemsg
#symload fpemsg with d0ecl_fpemsg
(* ****** ****** *)
#symload fpemsg with d0patopt_fpemsg
#symload fpemsg with d0expopt_fpemsg
(* ****** ****** *)
#symload fpemsg with d0patlst_fpemsg
#symload fpemsg with d0explst_fpemsg
#symload fpemsg with l0d0plst_fpemsg
#symload fpemsg with l0d0elst_fpemsg
(* ****** ****** *)
#symload fpemsg with d0eclist_fpemsg
(* ****** ****** *)
#symload fpemsg with f0unarrw_fpemsg
(* ****** ****** *)
#symload fpemsg with d0exp_THEN_fpemsg
#symload fpemsg with d0exp_ELSE_fpemsg
(* ****** ****** *)
#symload fpemsg with d0pat_RPAREN_fpemsg
#symload fpemsg with l0d0p_RBRACE_fpemsg
#symload fpemsg with d0exp_RPAREN_fpemsg
#symload fpemsg with l0d0e_RBRACE_fpemsg
(* ****** ****** *)
//
#extern
fun
token_AS0_fpemsg:(FILR,token)->void
#extern
fun
token_BAR_fpemsg:(FILR,token)->void
#extern
fun
token_EQ0_fpemsg:(FILR,token)->void
#extern
fun
token_GT0_fpemsg:(FILR,token)->void
#extern
fun
token_OF0_fpemsg:(FILR,token)->void
#extern
fun
token_EQGT_fpemsg:(FILR,token)->void
//
#extern
fun
token_WHEN_fpemsg:(FILR,token)->void
#extern
fun
token_WITH_fpemsg:(FILR,token)->void
//
#extern
fun
token_GTDOT_fpemsg:(FILR,token)->void
//
#extern
fun
token_RPAREN_fpemsg:(FILR,token)->void
#extern
fun
token_RBRACE_fpemsg:(FILR,token)->void
#extern
fun
token_RBRCKT_fpemsg:(FILR,token)->void
//
#extern
fun
token_ENDLET_fpemsg:(FILR,token)->void
#extern
fun
token_ENDWHR_fpemsg:(FILR,token)->void
#extern
fun
token_ENDTRY_fpemsg:(FILR,token)->void
//
#extern
fun
tkend_WHERE_fpemsg
(out:FILR,topt:tokenopt,tend:tkend_WHERE):void
//
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
("PREADX0-ERROR:",tok.lctn(),":",id0)
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
("PREADX0-ERROR:",tok.lctn(),":",int)
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
("PREADX0-ERROR:",tok.lctn(),":",chr)
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
("PREADX0-ERROR:",tok.lctn(),":",flt)
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
("PREADX0-ERROR:",tok.lctn(),":",str)
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
("PREADX0-ERROR:",s0t.lctn(),":",s0t)
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
("PREADX0-ERROR:",s0e.lctn(),":",s0e)
)
| _(* otherwise *) => ( (*void*) )
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
|
S0LAB
(lab,teq,s0e) => s0exp_fpemsg(out,s0e)
) (*case*)//end-of(l0s0e_fpemsg(out,lse))
//
(* ****** ****** *)
//
#implfun
s0arg_fpemsg
(out, s0a) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s0a.node() of
|
S0ARGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",s0a)
|
S0ARGsome(sid1,topt) =>
(
  fpemsg(out, sid1); fpemsg(out, topt)
)
end(*let*)//end-of-[s0arg_fpemsg(out,s0a)]
//
(* ****** ****** *)
//
#implfun
t0arg_fpemsg
(out, t0a) =
let
#impltmp
g_print$out<>() = out
in//let
case+
t0a.node() of
|
T0ARGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",t0a)
|
T0ARGsome(s0t1,topt) => fpemsg(out,s0t1)
end(*let*)//end-of-[t0arg_fpemsg(out,t0a)]
//
(* ****** ****** *)
#implfun
t0mag_fpemsg
(out, tma) =
let
#impltmp
g_print$out<>() = out
in//let
case+
tma.node() of
|
T0MAGnone(tok) =>
println
("PREADX0-ERROR:",tok.lctn(),":",tma)
|
T0MAGlist
(tbeg,t0as,tend) =>
let
//
val () = t0arglst_fpemsg(out, t0as)
val () = token_RPAREN_fpemsg(out, tend)
//
end(*let*)//end-of-[T0MAGlist(_,_,_)]
end(*let*)//end-of-[t0mag_fpemsg(out,tma)]
(* ****** ****** *)
//
#implfun
s0qua_fpemsg
(out, s0q) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s0q.node() of
|
S0QUAprop(s0e) =>
s0exp_fpemsg(out, s0e)
|
S0QUAvars(sids, tres) =>
let
//
val () = i0dntlst_fpemsg(out, sids)
val () = sort0opt_fpemsg(out, tres)
//
end(*let*)//end-of-[S0QUAvars(_,_)]
end(*let*)//end-of-[s0qua_fpemsg(out,lse)]
//
(* ****** ****** *)
//
#implfun
s0tdf_fpemsg
(out, tdf) =
let
#impltmp
g_print$out<>() = out
in//let
case+
tdf.node() of
|
S0TDFsort(s0t) =>
sort0_fpemsg(out, s0t)
|
S0TDFtsub
(tbeg,s0a1,tbar,s0es,tend) =>
let
val () =
  s0arg_fpemsg(out, s0a1)
val () =
  token_BAR_fpemsg(out, tbar)
val () = s0explst_fpemsg(out, s0es)
val () = token_RBRACE_fpemsg(out, tend)
end(*let*)//end of [S0TDFtsub(out,tdf)]
end(*let*)//end-of-[s0tdf_fpemsg(out,tdf)]
//
(* ****** ****** *)
//
#implfun
g0expopt_fpemsg
(out, opt) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(g0e) => g0exp_fpemsg(out, g0e)
)
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
s0arglst_fpemsg
(out, sas) =
list_foreach<s0arg>(sas) where
{
#impltmp
foreach$work<s0arg>(s0a) = s0arg_fpemsg(out,s0a)
}
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
s0qualst_fpemsg
(out, sqs) =
list_foreach<s0qua>(sqs) where
{
#impltmp
foreach$work<s0qua>(sq1) = s0qua_fpemsg(out,sq1)
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
(      tend      ) =>
token_RPAREN_fpemsg(out, tend)
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
(      tend      ) =>
token_RBRACE_fpemsg(out, tend)
|
l0s0e_RBRACE_cons1
(tbar, lses, tend) => l0s0elst_fpemsg(out,lses)
)
//
(* ****** ****** *)
//
#extern
fun
s0eff_fpemsg:(FILR,s0eff)->void
//
#extern
fun
s0res_fpemsg:(FILR,s0res)->void
#extern
fun
d0res_fpemsg:(FILR,d0res)->void
//
#symload fpemsg with s0res_fpemsg
#symload fpemsg with d0res_fpemsg
//
(* ****** ****** *)
#extern
fun
f0arg_fpemsg:(FILR,f0arg)->void
#extern
fun
f0arglst_fpemsg:(FILR,f0arglst)->void
(* ****** ****** *)
#extern
fun
d0cls_fpemsg:(FILR,d0cls)->void
#extern
fun
d0clslst_fpemsg:(FILR,d0clslst)->void
(* ****** ****** *)
#extern
fun
t0qua_fpemsg:(FILR,t0qua)->void
#extern
fun
t0inv_fpemsg:(FILR,t0inv)->void
#extern
fun
t0qualst_fpemsg:(FILR,t0qualst)->void
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
D0Papps(dps) =>
d0patlst_fpemsg(out, dps)
//
|
D0Psarg
(tkb,sas,tke) =>
(
s0arglst_fpemsg(out, sas);
token_RBRACE_fpemsg(out, tke)
)
//
|
D0Plpar
(tkb,dps,drp) =>
(
fpemsg(out, dps); fpemsg(out, drp)
)
//
|
D0Ptup1
(tbeg
,topt,d0ps,tend) =>
(
fpemsg(out, d0ps); fpemsg(out, tend)
)
|
D0Prcd2
(tbeg
,topt,ldps,tend) =>
(
fpemsg(out, ldps); fpemsg(out, tend)
)
//
|
D0Panno(d0p1,s0e2) =>
(
fpemsg(out, d0p1); fpemsg(out, s0e2)
)
//
|
D0Ptkerr _ => ( (*void*) )
|
D0Perrck(lvl,d0p1) => d0pat_fpemsg(out, d0p)
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
D0Perrck(lvl, dp1) =>
(
auxmain( out, dp1 );
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:",d0p.lctn(),":",d0p)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0pat_fpemsg(out,d0p))
//
endloc(*local*)//end-of-local(d0pat_fpemsg)

(* ****** ****** *)
//
#implfun
l0d0p_fpemsg
(out, ldp) =
(
case+ ldp of
|
D0LAB
(lab,teq,d0p) => d0pat_fpemsg(out,d0p)
) (*case*) // end-of(l0d0p_fpemsg(out,ldp))
//
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
D0Eapps(des) =>
d0explst_fpemsg(out, des)
//
|
D0Esarg
(tkb,ses,tke) =>
(
s0explst_fpemsg(out, ses);
token_RBRACE_fpemsg(out, tke))
//
|
D0Etarg
(tkb,ses,tke) =>
(
s0explst_fpemsg(out, ses);
token_RBRACE_fpemsg(out, tke))
//
|
D0Elpar
(tkb,des,drp) =>
(
fpemsg(out, des); fpemsg(out, drp))
//
|
D0Eif0
(tif0
,d0e1,dthn,dels) =>
(
fpemsg(out, d0e1);
fpemsg(out, dthn); fpemsg(out, dels))
|
D0Eif1
(tif0
,d0e1
,dthn,dels,tinv) =>
(
t0inv_fpemsg(out,tinv)) where
{
val () =
(
fpemsg(out, d0e1);
fpemsg(out, dthn); fpemsg(out, dels))
}
//
|
D0Ecas0
(tcas
,d0e1
,tkof,tbar,dcls) =>
let
val () =
  d0exp_fpemsg(out, d0e1)
val () =
  token_OF0_fpemsg(out, tkof)
val () = d0clslst_fpemsg(out, dcls)
endlet // end of [D0Ecas0(_,_,_,_,_)]
//
|
D0Etup1
(tbeg
,topt,d0es,tend) =>
(
fpemsg(out, d0es); fpemsg(out, tend))
|
D0Ercd2
(tbeg
,topt,ldes,tend) =>
(
fpemsg(out, ldes); fpemsg(out, tend))
//
|
D0Elet0
(tknd,dcls
,topt,d0es,tend) =>
let
val () = d0eclist_fpemsg(out, dcls)
val () = d0explst_fpemsg(out, d0es)
val () = token_ENDLET_fpemsg(out, tend)
endlet // end of [D0Elet0(_,_,_,_,_)]
//
|
D0Ewhere(d0e1,dcls) =>
let
val () =
(
case+ dcls of
|
d0eclseq_WHERE
(tbeg,topt,d0cs,tend) =>
let
//
val () = d0exp_fpemsg(out, d0e1)
val () = d0eclist_fpemsg(out, d0cs)
val () = tkend_WHERE_fpemsg(out,topt,tend)
//
endlet // end-(d0eclseq_WHERE(...))
)
endlet // end of [  D0Ewhere(_, _)  ]
//
|
D0Ebrckt
(tbeg,d0es,tend) =>
let
val () = d0explst_fpemsg(out, d0es)
val () = token_RBRCKT_fpemsg(out, tend)
endlet // end of [  D0Ebrckt(_,_,_)  ]
//
|
D0Edtsel
(tdot,lab1,opt2) =>
(
  fpemsg(out, lab1); fpemsg(out, opt2))
//
|
D0Etry0
(tknd,d0e1,twth
,tbar,dcls,tend) =>
let
val () =
  d0exp_fpemsg(out, d0e1)
val () =
  token_WITH_fpemsg(out, twth)
val () =
  d0clslst_fpemsg(out, dcls)
val () =
  token_ENDTRY_fpemsg(out, tend)
endlet // end of [D0Etry0(_,_,_,_,_,_)]
//
|
D0Elam0
(tknd,fags,sres
,arrw,body,tend) =>
let
val () = f0arglst_fpemsg(out, fags)
in//let
( fpemsg(out, sres);
  fpemsg(out, arrw); fpemsg(out, body))
endlet // end of [D0Elam0(_,_,_,_,_,_)]
//
|
D0Efix0
(tknd
,dpid,fags,arrw
,sres,body,tend) =>
let
val () = i0dnt_fpemsg(out, dpid)
val () = f0arglst_fpemsg(out, fags)
in//let
( fpemsg(out, sres);
  fpemsg(out, arrw); fpemsg(out, body))
endlet // end of [D0Efix0(_,_,_,_,_,_,_)]
//
|
D0Eanno
(d0e1, s0e2) =>
(
  fpemsg(out, d0e1); fpemsg(out, s0e2))
//
|
D0Equal
(tok1, d0e2) => fpemsg(out, d0e2)
//
|
D0Eextnam
(tok1, gnm2) => ()//fpemsg(out, gnm2)
//
|
D0Eexists
(tknd, d0es, d0e1) =>
(
  fpemsg(out, d0es); fpemsg(out, d0e1))
//
|
D0Etkerr(tok1) => ()//fpemsg(out,tok1)
//
|
D0Eerrck(lvl0,d0e1) => d0exp_fpemsg(out, d0e)
//
end (*let*) // end-of-[ auxmain(out,d0e) ]
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
D0Eerrck(lvl, de1) =>
(
auxmain( out, de1 );
if
(lvl
>FPEMSG_ERRVL) then () else
println
("PREADX0-ERROR:",d0e.lctn(),":",d0e)
)
//
| _(* otherwise *) => ((*void*))
end(*let*)//end-of(d0exp_fpemsg(out,d0e))
//
endloc(*local*)//end-of-local(d0exp_fpemsg)

(* ****** ****** *)
//
#implfun
l0d0e_fpemsg
(out, lde) =
(
case+ lde of
|
D0LAB
(lab,teq,d0e) => d0exp_fpemsg(out,d0e)
) (*case*) // end-of(l0d0e_fpemsg(out,lde))
//
(* ****** ****** *)
//
#implfun
d0gua_fpemsg
(out, dgua) =
(
case+
dgua.node() of
|
D0GUAexp
( d0e1 ) =>
d0exp_fpemsg(out, d0e1)
|
D0GUAmat
(d0e1,tkas,d0p2) =>
let
val () =
  d0exp_fpemsg(out, d0e1)
val () =
  token_AS0_fpemsg(out, tkas)
val () = d0pat_fpemsg(out, d0p2)
endlet // end of [D0GUAmat(_,_,_)]
) (*case*) // end-of(d0gua_fpemsg(out,dgua))
//
(* ****** ****** *)
//
#implfun
d0gpt_fpemsg
(out, dgpt) =
(
case+
dgpt.node() of
|
D0GPTpat
( d0p1 ) =>
d0pat_fpemsg(out, d0p1)
|
D0GPTgua
(d0p1,twhn,d0gs) =>
let
val () =
  d0pat_fpemsg(out, d0p1)
val () =
  token_WHEN_fpemsg(out, twhn)
val () = d0gualst_fpemsg(out, d0gs)
endlet // end of [ D0GPTgua(_,_,_) ]
) (*case*) // end-of(d0gpt_fpemsg(out,dgpt))
//
(* ****** ****** *)
//
#implfun
d0cls_fpemsg
(out, dcls) =
(
case+
dcls.node() of
|
D0CLSgpt(dgpt) =>
d0gpt_fpemsg(out, dgpt)
|
D0CLScls
(dgpt,tkeg,d0e2) =>
let
val () =
d0gpt_fpemsg(out, dgpt)
val () =
token_EQGT_fpemsg(out, tkeg)
val () = d0exp_fpemsg(out, d0e2)
endlet // end of [ D0CLScls(_,_,_) ]
) (*case*) // end-of(d0cls_fpemsg(out,dcls))
//
(* ****** ****** *)
//
#implfun
s0eff_fpemsg
  (out, seff) =
(
case+ seff of
|
S0EFFnone(tok) => ()
|
S0EFFsome
(tbeg,s0es,tend) =>
let
//
val () =
  s0explst_fpemsg(out, s0es)
val () =
  token_GT0_fpemsg(out, tend)
//
endlet // end of [S0EFFsome(_,_,_)]
) (*case+*)//end-of(s0eff_fpemsg(out,seff))
//
(* ****** ****** *)
//
#implfun
f0arg_fpemsg
  (out, farg) =
(
case+
farg.node() of
|
F0ARGnone(tok) => ()
|
F0ARGdyn0(dpat) =>
d0pat_fpemsg(out, dpat)
|
F0ARGsta0(tbeg,s0qs,tend) =>
let
val () =
s0qualst_fpemsg(out, s0qs)
val () =
token_RBRACE_fpemsg(out, tend)
endlet // end of [F0ARGsta0(_,_,_)]
|
F0ARGmet0(tbeg,s0es,tend) =>
let
val () =
s0explst_fpemsg(out, s0es)
val () =
token_GTDOT_fpemsg( out, tend )
endlet // end of [F0ARGmet0(_,_,_)]
)
//
(* ****** ****** *)
//
#implfun
s0res_fpemsg
  (out, sres) =
(
case+ sres of
|
S0RESnone() => ()
|
S0RESsome(seff, s0e1) =>
let
val () = s0eff_fpemsg(out, seff)
val () = s0exp_fpemsg(out, s0e1)
end (*let*) // end of [S0RESsome(seff,s0e1)]
)
//
(* ****** ****** *)
//
#implfun
d0res_fpemsg
  (out, dres) =
(
case+ dres of
|
D0RESnone() => ()
|
D0RESsome(teq1, d0e2) =>
let
//
val () =
token_EQ0_fpemsg(out, teq1)
//
val () = d0exp_fpemsg(out, d0e2)
//
end (*let*) // end of [D0RESsome(teq1,d0e2)]
)
//
(* ****** ****** *)
//
#implfun
t0qua_fpemsg
(out, t0q0) =
(
case+ t0q0 of
|
T0QUAnone(tok) => ()
|
T0QUAsome
(tbeg,s0qs,tend) =>
let
val () =
s0qualst_fpemsg(out, s0qs)
val () =
token_RBRACE_fpemsg(out, tend)
endlet // end of [T0QUAsome(_,_,_)]
) (*case+*)//end(t0qua_fpemsg(out,t0q0))
//
(* ****** ****** *)
//
#implfun
t0inv_fpemsg
(out, tinv) =
(
case+ tinv of
|
T0INVnone
(t0qs, tok1) =>
let
val () =
t0qualst_fpemsg(out, t0qs)
endlet // end-of(T0INVnone(_,_))
|
T0INVsome
(t0qs
,tbeg,d0ps,tend) =>
let
val () =
t0qualst_fpemsg(out, t0qs)
val () =
d0patlst_fpemsg(out, d0ps)
val () =
token_RPAREN_fpemsg(out, tend)
endlet // end-of(T0INVsome(_,_,_,_))
) (*case+*)//end(t0inv_fpemsg(out,tinv))
//
(* ****** ****** *)
//
#extern
fun
s0tcn_fpemsg:(FILR,s0tcn)->void
#extern
fun
d0tst_fpemsg:(FILR,d0tst)->void
//
#extern
fun
s0tcnlst_fpemsg:(FILR,s0tcnlst)->void
#extern
fun
d0tstlst_fpemsg:(FILR,d0tstlst)->void
//
(* ****** ****** *)
//
#extern
fun
s0uni_fpemsg:(FILR,s0uni)->void
#extern
fun
d0tcn_fpemsg:(FILR,d0tcn)->void
#extern
fun
d0typ_fpemsg:(FILR,d0typ)->void
#extern
fun
s0unilst_fpemsg:(FILR,s0unilst)->void
#extern
fun
d0tcnlst_fpemsg:(FILR,d0tcnlst)->void
#extern
fun
d0typlst_fpemsg:(FILR,d0typlst)->void
#extern
fun
wd0eclseq_fpemsg:(FILR,wd0eclseq)->void
//
(* ****** ****** *)
#extern
fun
q0arg_fpemsg:(FILR,q0arg)->void
#extern
fun
t0qag_fpemsg:(FILR,t0qag)->void
#extern
fun
q0arglst_fpemsg:(FILR,q0arglst)->void
#extern
fun
t0qaglst_fpemsg:(FILR,t0qaglst)->void
(* ****** ****** *)
#extern
fun
a0typ_fpemsg:(FILR,a0typ)->void
#extern
fun
d0arg_fpemsg:(FILR,d0arg)->void
#extern
fun
a0typlst_fpemsg:(FILR,a0typlst)->void
#extern
fun
d0arglst_fpemsg:(FILR,d0arglst)->void
(* ****** ****** *)
#extern
fun
d0valdcl_fpemsg:(FILR,d0valdcl)->void
#extern
fun
d0vardcl_fpemsg:(FILR,d0vardcl)->void
#extern
fun
d0fundcl_fpemsg:(FILR,d0fundcl)->void
#extern
fun
d0cstdcl_fpemsg:(FILR,d0cstdcl)->void
(* ****** ****** *)
#extern
fun
teqd0exp_fpemsg:(FILR,teqd0exp)->void
#extern
fun
wths0exp_fpemsg:(FILR,wths0exp)->void
(* ****** ****** *)
#extern
fun
d0valdclist_fpemsg:(FILR,d0valdclist)->void
#extern
fun
d0vardclist_fpemsg:(FILR,d0vardclist)->void
#extern
fun
d0fundclist_fpemsg:(FILR,d0fundclist)->void
#extern
fun
d0cstdclist_fpemsg:(FILR,d0cstdclist)->void
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
endlet //end-of(D0Cstatic(_,_))
|
D0Cextern
(knd, dc1) =>
let
val () = fpemsg(out, dc1)
endlet //end-of(D0Cextern(_,_))
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
endlet // end of [D0Clocal(...)]
//
|
D0Cabssort
(knd, tid) => let
  val () = fpemsg(out, tid)
endlet // end-of(D0Cabssort(...))
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
endlet // end-of-(D0Cstacst0(...))
//
|
D0Csortdef
( knd
, tid, teq1, tdf2) =>
let
val () = fpemsg(out, tid)
val () =
token_EQ0_fpemsg(out, teq1)
val () = s0tdf_fpemsg(out, tdf2)
endlet // end-of-(D0Csortdef(...))
//
|
D0Csymload
( knd, symb
, twth, dqid, gopt) =>
let
val () = fpemsg(out, symb)
val () = fpemsg(out, dqid)
val () = g0expopt_fpemsg(out, gopt)
endlet // end-of-(D0Csymload(...))
//
|
D0Cdatasort
(knd, d0ts) => let
  val () =
  d0tstlst_fpemsg(out, d0ts)
endlet // end-of-(D0Cdatasort(_,_))
//
|
D0Cvaldclst
( knd, d0cs) => let
val () =
  d0valdclist_fpemsg(out, d0cs)
endlet // end-of-(D0Cvaldclst(_,_,_))
|
D0Cvardclst
( knd, d0cs) => let
val () =
  d0vardclist_fpemsg(out, d0cs)
endlet // end-of-(D0Cvardclst(_,_,_))
//
|
D0Cfundclst
( knd
, tqas, d0cs) => let
val () =
  t0qaglst_fpemsg(out, tqas)
val () =
  d0fundclist_fpemsg(out, d0cs)
endlet // end-of-(D0Cfundclst(_,_,_))
//
|
D0Cdatatype
( knd
, d0ts, wdcs) => let
val () =
  d0typlst_fpemsg(out, d0ts)
val () =
  wd0eclseq_fpemsg( out, wdcs )
endlet // end-of-(D0Cdatatype(_,_,_))
//
|
D0Cdynconst
( knd
, tqas, d0cs) => let
val () =
  t0qaglst_fpemsg(out, tqas)
val () =
  d0cstdclist_fpemsg(out, d0cs)
endlet // end-of-(D0Cdynconst(_,_,_))
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
("PREADX0-ERROR:",dcl.lctn(),":",dcl))
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
l0d0plst_fpemsg
(out, dps) =
list_foreach<l0d0p>(dps) where
{
#impltmp
foreach$work<l0d0p>(ldp) = l0d0p_fpemsg(out,ldp)
}
//
(* ****** ****** *)
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
#implfun
l0d0elst_fpemsg
(out, des) =
list_foreach<l0d0e>(des) where
{
#impltmp
foreach$work<l0d0e>(lde) = l0d0e_fpemsg(out,lde)
}
//
(* ****** ****** *)
//
#implfun
f0arglst_fpemsg
(out, f0as) =
list_foreach<f0arg>(f0as) where
{
#impltmp
foreach$work<f0arg>(f0a1) = f0arg_fpemsg(out,f0a1)
}
//
(* ****** ****** *)
//
#implfun
t0qualst_fpemsg
(out, t0qs) =
list_foreach<t0qua>(t0qs) where
{
#impltmp
foreach$work<t0qua>(t0q1) = t0qua_fpemsg(out,t0q1)
}
//
(* ****** ****** *)
//
#implfun
d0gualst_fpemsg
(out, d0gs) =
list_foreach<d0gua>(d0gs) where
{
#impltmp
foreach$work<d0gua>(dgua) = d0gua_fpemsg(out,dgua)
}
//
(* ****** ****** *)
//
#implfun
d0clslst_fpemsg
(out, d0cs) =
list_foreach<d0cls>(d0cs) where
{
#impltmp
foreach$work<d0cls>(dcls) = d0cls_fpemsg(out,dcls)
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
//
#implfun
token_AS0_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tok0.node() of
|
T_AS0() => ((*void*))
|
_(*non-T_AS0*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_AS0_fpemsg]
//
#implfun
token_BAR_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tok0.node() of
|
T_BAR() => ((*void*))
|
_(*non-T_BAR*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_BAR_fpemsg]
//
#implfun
token_EQ0_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_EQ0() => ((*void*))
|
_(*non-T_EQ0*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_EQ0_fpemsg]
//
#implfun
token_GT0_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_GT0() => ((*void*))
|
_(*non-T_GT0*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_GT0_fpemsg]
//
#implfun
token_OF0_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tok0.node() of
|
T_OF0() => ((*void*))
|
_(*non-T_OF0*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_OF0_fpemsg]
//
#implfun
token_EQGT_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_EQGT() => ((*void*))
|
_(*non-T_EQGT*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_EQGT_fpemsg]
//
(* ****** ****** *)
//
#implfun
token_WHEN_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_WHEN() => ((*void*))
|
_(*non-T_WHEN*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_WHEN_fpemsg]
//
//
#implfun
token_WITH_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_WITH() => ((*void*))
|
_(*non-T_WITH*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_WITH_fpemsg]
//
(* ****** ****** *)
//
#implfun
token_GTDOT_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ tok0.node() of
|
T_GTDOT() => ((*void*))
|
_(*non-T_GTDOT*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
//
end (*let*) // end of [t0ken_GTDOT_fpemsg]
//
(* ****** ****** *)
//
#implfun
token_RPAREN_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_RPAREN() => ((*void*))
|
_(*non-T_RPAREN*) =>
println
("PREADX0-ERROR:",tok0.lctn(), ":",tok0)
end (*let*) // end of [token_RPAREN_fpemsg]
//
#implfun
token_RBRACE_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_RBRACE() => ((*void*))
|
_(*non-T_RBRACE*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_RBRACE_fpemsg]
//
#implfun
token_RBRCKT_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_RBRCKT() => ((*void*))
|
_(*non-T_RBRCKT*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_RBRCKT_fpemsg]
//
(* ****** ****** *)
//
#implfun
token_ENDWHR_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_ENDWHR() => ((*void*))
|
_(*non-T_ENDWHR*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_ENDWHR_fpemsg]
//
(* ****** ****** *)
//
#implfun
token_ENDLET_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_END() => ((*void*))
|
T_ENDLET() => ((*void*))
|
_(*non-T_END/ENDLET*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_ENDLET_fpemsg]
//
(* ****** ****** *)
//
#implfun
tkend_WHERE_fpemsg
(
out, topt, tend) =
(
case+ topt of
|
optn_nil() =>
(
case+ tend of
tkend_WHERE_cons1
(     tok1     ) =>
token_ENDWHR_fpemsg(out, tok1))
|
optn_cons _ =>
(
case+ tend of
tkend_WHERE_cons1
(     tok1     ) =>
token_RBRACE_fpemsg(out, tok1))
)(*case+*)//end-of(tkend_WHERE_fpemsg(...))
//
(* ****** ****** *)
//
#implfun
token_ENDTRY_fpemsg
  (out, tok0) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tok0.node() of
|
T_END() => ((*void*))
|
T_ENDTRY() => ((*void*))
|
_(*non-T_END/ENDTRY*) =>
println
("PREADX0-ERROR:",tok0.lctn(),":",tok0)
end (*let*) // end of [token_ENDTRY_fpemsg]
//
(* ****** ****** *)
//
#implfun
s0tcn_fpemsg
(out, tcn0) =
(
case+
tcn0.node() of
|
S0TCNnode(seid,tres) =>
let
val () = i0dnt_fpemsg(out, seid)
val () = sort0opt_fpemsg(out, tres)
endlet //end-of-[S0TCNnode(_,_)]
) (*case+*) // end-of-[ s0tcn_fpemsg(_,_) ]
//
(* ****** ****** *)
//
#implfun
d0tst_fpemsg
(out, d0t0) =
(
case+
d0t0.node() of
|
D0TSTnode
(stid
,teq1,tbar,tcns) =>
let
val () =
i0dnt_fpemsg(out, stid)
val () =
token_EQ0_fpemsg(out, teq1)
val () = s0tcnlst_fpemsg(out, tcns)
endlet // end of [D0TSTnode(_,_,_,_)]
) (*case+*)//end-of-[d0tst_fpemsg(out,d0t0)]
//
(* ****** ****** *)
//
#implfun
s0tcnlst_fpemsg
(out, tcns) =
list_foreach<s0tcn>(tcns) where
{
#impltmp
foreach$work<s0tcn>(tcn1) = s0tcn_fpemsg(out,tcn1)
}
//
(* ****** ****** *)
//
#implfun
d0tstlst_fpemsg
(out, d0ts) =
list_foreach<d0tst>(d0ts) where
{
#impltmp
foreach$work<d0tst>(d0t1) = d0tst_fpemsg(out,d0t1)
}
//
(* ****** ****** *)
//
#implfun
s0uni_fpemsg
(out, s0u0) =
let
#impltmp
g_print$out<>() = out
in
case+
s0u0.node() of
|
S0UNInone(tok) => ()
|
S0UNIsome
(tbeg,s0qs,tend) =>
let
val () = s0qualst_fpemsg(out,s0qs)
val () = token_RBRACE_fpemsg(out,tend)
end (*let*)//end-of-[S0UNIsome(_,_,_)]
end (*let*)//end-of-[s0uni_fpemsg(out,s0u0)]

(* ****** ****** *)
//
#implfun
d0tcn_fpemsg
(out, tcn0) =
(
case+
tcn0.node() of
|
D0TCNnode
( s0us
, deid
, s0es, sres) =>
let
val () =
i0dnt_fpemsg(out, deid)
val () =
s0unilst_fpemsg(out, s0us)
val () = s0explst_fpemsg(out, s0es)
val () = s0expopt_fpemsg(out, sres)
endlet // end of [D0TCNnode(_,_,_,_)]
) (*case+*)//end-of-[d0tcn_fpemsg(out,tcn0)]
//
(* ****** ****** *)
//
#implfun
d0typ_fpemsg
(out, d0t0) =
(
case+
d0t0.node() of
|
D0TYPnode
( deid
, tmas, tres
, teq1, tcns) =>
let
val () =
i0dnt_fpemsg(out, deid)
val () =
t0maglst_fpemsg(out, tmas)
val () =
sort0opt_fpemsg(out, tres)
val () =
token_EQ0_fpemsg(out, teq1)
val () = d0tcnlst_fpemsg(out, tcns)
endlet // end of [D0TYPnode(_,_,_,_,_)]
) (*case+*)//end-of-[d0typ_fpemsg(out,d0t0)]
//
(* ****** ****** *)
//
#implfun
s0unilst_fpemsg
(out, s0us) =
list_foreach<s0uni>(s0us) where
{
#impltmp
foreach$work<s0uni>(s0u1) = s0uni_fpemsg(out,s0u1)
}
//
(* ****** ****** *)
//
#implfun
d0tcnlst_fpemsg
(out, tcns) =
list_foreach<d0tcn>(tcns) where
{
#impltmp
foreach$work<d0tcn>(tcn1) = d0tcn_fpemsg(out,tcn1)
}
//
(* ****** ****** *)
//
#implfun
d0typlst_fpemsg
(out, d0ts) =
list_foreach<d0typ>(d0ts) where
{
#impltmp
foreach$work<d0typ>(d0t1) = d0typ_fpemsg(out,d0t1)
}
//
(* ****** ****** *)
//
#implfun
wd0eclseq_fpemsg
(out, wdcs) =
(
case+ wdcs of
|
WD0CSnone() => ((*void*))
|
WD0CSsome
(twhr, topt, d0es, tend) =>
let
//
val () =
d0eclist_fpemsg(out, d0es)
//
val () =
(
case+ topt of
|
optn_nil() => token_ENDWHR_fpemsg(out, tend)
|
optn_cons _ => token_RBRACE_fpemsg(out, tend))
//
endlet // end of [WD0CSsome(_,_,_,_)]
) (*case+*) // end-of-[wd0eclseq_fpemsg(out,wdcs)]
//
(* ****** ****** *)
//
#implfun
q0arg_fpemsg
  (out, q0a) = let
//
#impltmp
g_print$out<>() = out
in//let
//
case+
q0a.node() of
|
Q0ARGsome(sid0, tres) =>
let
val () = i0dnt_fpemsg(out, sid0)
val () = sort0opt_fpemsg(out, tres)
endlet // end of [ Q0ARGsome(_,_) ]
end (*let*)//end-of-[q0arg_fpemsg(out,q0a)]
//
(* ****** ****** *)
//
#implfun
t0qag_fpemsg
  (out, tqa) = let
//
#impltmp
g_print$out<>() = out
in//let
//
case+
tqa.node() of
|
T0QAGnone(tok) =>
print
("PREADX0-ERROR:",tqa.lctn(),":",tqa)
|
T0QAGsome
(tbeg,q0as,tend) =>
let
val () = q0arglst_fpemsg(out, q0as)
val () = token_GT0_fpemsg(out, tend)
endlet // end of [ T0QAGsome(_,_,_) ]
end (*let*)//end-of-[q0arg_fpemsg(out,q0a)]
//
(* ****** ****** *)
//
#implfun
a0typ_fpemsg
(out, atp) =
(
case+
atp.node() of
|
A0TYPsome(s0e1,topt) =>
let
val () = s0exp_fpemsg(out, s0e1)
endlet // end of [ATYPsome(_,_)]
) (*case+*)//end-of-[a0typ_fpemsg(out,atp)]
//
(* ****** ****** *)
//
#implfun
d0arg_fpemsg
(out, d0a) =
(
case+
d0a.node() of
|
D0ARGnone(tok) => ()
|
D0ARGsta0
(tbeg,s0qs,tend) =>
let
val () =
s0qualst_fpemsg(out, s0qs)
val () =
token_RBRACE_fpemsg(out, tend)
endlet // end of [D0ARGsta0(_,_,_)]
|
D0ARGdyn1(dpid) =>
let
val () = i0dnt_fpemsg(out, dpid)
endlet // end of [D0ARGdyn1(  _  )]
|
D0ARGdyn2
(tbeg,atps,opt1,tend) =>
let
//
val () =
a0typlst_fpemsg(out, atps)
//
val () =
(
case+ opt1 of
| optn_nil() => ()
| optn_cons(atps) =>
  a0typlst_fpemsg(out, atps))
//
val () = token_RPAREN_fpemsg(out, tend)
endlet // end of [ D0ARGdyn2(_,_,_,_) ]
) (*case+*)//end-of-[d0arg_fpemsg(out,d0a)]
//
(* ****** ****** *)
//
#implfun
q0arglst_fpemsg
(out, q0as) =
list_foreach<q0arg>(q0as) where
{
#impltmp
foreach$work<q0arg>(q0a1) = q0arg_fpemsg(out,q0a1)
}
//
(* ****** ****** *)
//
#implfun
t0qaglst_fpemsg
(out, tqas) =
list_foreach<t0qag>(tqas) where
{
#impltmp
foreach$work<t0qag>(tqa1) = t0qag_fpemsg(out,tqa1)
}
//
(* ****** ****** *)
//
#implfun
a0typlst_fpemsg
(out, atps) =
list_foreach<a0typ>(atps) where
{
#impltmp
foreach$work<a0typ>(atp1) = a0typ_fpemsg(out,atp1)
}
//
(* ****** ****** *)
//
#implfun
d0arglst_fpemsg
(out, d0as) =
list_foreach<d0arg>(d0as) where
{
#impltmp
foreach$work<d0arg>(d0a1) = d0arg_fpemsg(out,d0a1)
}
//
(* ****** ****** *)
//
#implfun
d0valdcl_fpemsg
(out, dval) =
let
//
val (  ) =
  d0pat_fpemsg(out, dpat)
//
val (  ) =
  teqd0exp_fpemsg(out, tdxp)
//
val (  ) =
  wths0exp_fpemsg(out, wsxp)
//
end where
{
  val dpat = d0valdcl_get_dpat(dval)
  val tdxp = d0valdcl_get_tdxp(dval)
  val wsxp = d0valdcl_get_wsxp(dval)
//
} (*where*)//end-of-[d0valdcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d0vardcl_fpemsg
(out, dvar) =
let
//
val (  ) =
  i0dnt_fpemsg(out, dpid)
//
val (  ) =
(
case+ vpid of
| optn_nil() => ()
| optn_cons(vpid) =>
  i0dnt_fpemsg(out, vpid))
//
val (  ) =
  s0expopt_fpemsg(out, sres)
//
val (  ) =
  teqd0exp_fpemsg(out, dini)
//
end where
{
  val dpid = d0vardcl_get_dpid(dvar)
  val vpid = d0vardcl_get_vpid(dvar)
  val sres = d0vardcl_get_sres(dvar)
  val dini = d0vardcl_get_dini(dvar)
//
} (*where*)//end-of-[d0vardcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d0fundcl_fpemsg
(out, dfun) =
let
//
val (  ) =
  i0dnt_fpemsg(out, dpid)
//
val (  ) =
  f0arglst_fpemsg(out, fags)
//
val (  ) =
  s0res_fpemsg(out, sres)
//
val (  ) =
  teqd0exp_fpemsg(out, tdxp)
//
val (  ) =
  wths0exp_fpemsg(out, wsxp)
//
end where
{
  val dpid = d0fundcl_get_dpid(dfun)
  val fags = d0fundcl_get_farg(dfun)
  val sres = d0fundcl_get_sres(dfun)
  val tdxp = d0fundcl_get_tdxp(dfun)
  val wsxp = d0fundcl_get_wsxp(dfun)
} (*where*)//end-of-[d0fundcl_fpemsg(out,dfun)]
//
(* ****** ****** *)
//
#implfun
d0cstdcl_fpemsg
(out, dcst) =
let
//
val (  ) =
  i0dnt_fpemsg(out, dpid)
//
val (  ) =
  d0arglst_fpemsg(out, dags)
//
val (  ) = s0res_fpemsg(out, sres)
val (  ) = d0res_fpemsg(out, dres)
//
end where
{
  val dpid = d0cstdcl_get_dpid(dcst)
  val dags = d0cstdcl_get_darg(dcst)
  val sres = d0cstdcl_get_sres(dcst)
  val dres = d0cstdcl_get_dres(dcst)
} (*where*)//end-of-[d0cstdcl_fpemsg(out,dcst)]
//
(* ****** ****** *)
//
#implfun
teqd0exp_fpemsg
  (out, tdxp) =
(
case+ tdxp of
|
TEQD0EXPnone
( (*void*) ) => ()
|
TEQD0EXPsome
(teq1, d0e2) => d0exp_fpemsg(out, d0e2)
)
//
(* ****** ****** *)
//
#implfun
wths0exp_fpemsg
  (out, wsxp) =
(
case+ wsxp of
|
WTHS0EXPnone
( (*void*) ) => ()
|
WTHS0EXPsome
(twth, s0e1) => s0exp_fpemsg(out, s0e1)
)
//
(* ****** ****** *)
//
#implfun
f0unarrw_fpemsg
  (out, arrw) =
(
case+ arrw of
|
F0UNARRWnone
(   tok   ) => ()
|
F0UNARRWdflt
(   tok   ) => ()
|
F0UNARRWlist
(tbeg,s0es,tend) =>
let
val () = s0explst_fpemsg(out, s0es)
val () = token_GT0_fpemsg(out, tend)
endlet // end of [F0UNARRWlist(_,_,_)]
)
//
(* ****** ****** *)
//
#implfun
d0exp_THEN_fpemsg
(out, dthn) =
(
case+ dthn of
|
d0exp_THEN_none
(     tok     ) => ()
|
d0exp_THEN_some
(   tok,d0e   ) => d0exp_fpemsg(out,d0e)
)
//
(* ****** ****** *)
//
#implfun
d0exp_ELSE_fpemsg
(out, dels) =
(
case+ dels of
|
d0exp_ELSE_none
(     tok     ) => ()
|
d0exp_ELSE_some
(   tok,d0e   ) => d0exp_fpemsg(out,d0e)
)
//
(* ****** ****** *)
//
#implfun
d0pat_RPAREN_fpemsg
(out, drp0) =
(
case+ drp0 of
|
d0pat_RPAREN_cons0
(      tend      ) =>
token_RPAREN_fpemsg(out, tend)
|
d0pat_RPAREN_cons1
(tbar, d0ps, tend) => d0patlst_fpemsg(out,d0ps)
)
//
#implfun
l0d0p_RBRACE_fpemsg
(out, ldrb) =
(
case+ ldrb of
|
l0d0p_RBRACE_cons0
(      tend      ) =>
token_RBRACE_fpemsg(out, tend)
|
l0d0p_RBRACE_cons1
(tbar, ldps, tend) => l0d0plst_fpemsg(out,ldps)
)
//
(* ****** ****** *)
//
#implfun
d0exp_RPAREN_fpemsg
(out, drp0) =
(
case+ drp0 of
|
d0exp_RPAREN_cons0
(      tend      ) =>
token_RPAREN_fpemsg(out, tend)
|
d0exp_RPAREN_cons1
(tbar, d0es, tend) => d0explst_fpemsg(out,d0es)
)
//
#implfun
l0d0e_RBRACE_fpemsg
(out, ldrb) =
(
case+ ldrb of
|
l0d0e_RBRACE_cons0
(      tend      ) =>
token_RBRACE_fpemsg(out, tend)
|
l0d0e_RBRACE_cons1
(tbar, ldes, tend) => l0d0elst_fpemsg(out,ldes)
)
//
(* ****** ****** *)
//
#implfun
d0valdclist_fpemsg
(out, d0cs) =
list_foreach<d0valdcl>(d0cs) where
{
#impltmp
foreach$work<d0valdcl>(d0c1) = d0valdcl_fpemsg(out,d0c1)
}
//
(* ****** ****** *)
//
#implfun
d0vardclist_fpemsg
(out, d0cs) =
list_foreach<d0vardcl>(d0cs) where
{
#impltmp
foreach$work<d0vardcl>(d0c1) = d0vardcl_fpemsg(out,d0c1)
}
//
(* ****** ****** *)
//
#implfun
d0fundclist_fpemsg
(out, d0cs) =
list_foreach<d0fundcl>(d0cs) where
{
#impltmp
foreach$work<d0fundcl>(d0c1) = d0fundcl_fpemsg(out,d0c1)
}
//
(* ****** ****** *)
//
#implfun
d0cstdclist_fpemsg
(out, d0cs) =
list_foreach<d0cstdcl>(d0cs) where
{
#impltmp
foreach$work<d0cstdcl>(d0c1) = d0cstdcl_fpemsg(out,d0c1)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_errmsg.dats] *)
