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
(*
Sun Jul 24 18:07:52 EDT 2022
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
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#symload lctn with g1arg_get_lctn
#symload node with g1arg_get_node
(* ****** ****** *)
#symload lctn with g1mag_get_lctn
#symload node with g1mag_get_node
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with s1tcn_get_lctn
#symload node with s1tcn_get_node
(* ****** ****** *)
#symload lctn with d1tst_get_lctn
#symload node with d1tst_get_node
(* ****** ****** *)
#symload lctn with s1tdf_get_lctn
#symload node with s1tdf_get_node
(* ****** ****** *)
#symload lctn with s1arg_get_lctn
#symload node with s1arg_get_node
#symload lctn with t1arg_get_lctn
#symload node with t1arg_get_node
(* ****** ****** *)
#symload lctn with s1mag_get_lctn
#symload node with s1mag_get_node
#symload lctn with t1mag_get_lctn
#symload node with t1mag_get_node
(* ****** ****** *)
#symload lctn with s1qua_get_lctn
#symload node with s1qua_get_node
(* ****** ****** *)
#symload lctn with s1uni_get_lctn
#symload node with s1uni_get_node
#symload lctn with d1tcn_get_lctn
#symload node with d1tcn_get_node
#symload lctn with d1typ_get_lctn
#symload node with d1typ_get_node
(* ****** ****** *)

#implfun
g1arg_fprint
(out, g1a) =
(
case+
g1a.node() of
G1ARGnode(tok) =>
prints("G1ARGnode(",tok,")")
) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [g1arg_fprint]

(* ****** ****** *)
//
#implfun
s1qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
S1QIDnone(id1) =>
prints("S1QIDnone(", id1, ")")
|
S1QIDsome(tok, id1) =>
prints
("S1QIDsome(", tok, ";", id1, ")")
end (*let*) // end of [s1qid_fprint]
//
#implfun
d1qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
D1QIDnone(id1) =>
prints("D1QIDnone(", id1, ")")
|
D1QIDsome(tok, id1) =>
prints
("D1QIDsome(", tok, ";", id1, ")")
end (*let*) // end of [d1qid_fprint]
//
(* ****** ****** *)
//
#implfun
g1mag_fprint
(out, gma) =
(
case+
gma.node() of
|
G1MAGsarg(g1as) =>
prints("G1MAGsarg(",g1as,")")
|
G1MAGdarg(g1as) =>
prints("G1MAGdarg(",g1as,")")
) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [g1mag_fprint]
//
(* ****** ****** *)

#implfun
g1nam_fprint
( out, g1n ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ g1n of
//
| G1Nnil() =>
  prints("G1Nnil(",")")
//
| G1Nid0(id0) =>
  prints("G1Nid0(",id0,")")
//
| G1Nint(int) =>
  prints("G1Nint(",int,")")
| G1Nchr(chr) =>
  prints("G1Nchr(",chr,")")
| G1Nflt(flt) =>
  prints("G1Nflt(",flt,")")
| G1Nstr(str) =>
  prints("G1Nstr(",str,")")
//
| G1Nlist(g1ns) =>
  prints("G1Nlist(",g1ns,")")
//
(*
| G1Nnone0() =>
  prints("G1Nnone0(",")")
*)
| G1Nnone1(g1n1) =>
  prints("G1Nnone1(",g1n1,")")
//
end (*let*) // end of [g1nam_fprint(out,g1n)]

(* ****** ****** *)

#implfun
g1exp_fprint
( out, g1e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
g1e.node() of
//
|G1Eint(tok) =>
prints("G1Eint(",tok,")")
(*
|G1Ebtf(tok) =>
prints("G1Ebtf(",tok,")")
*)
|G1Echr(tok) =>
prints("G1Echr(",tok,")")
|G1Eflt(tok) =>
prints("G1Eflt(",tok,")")
|G1Estr(tok) =>
prints("G1Estr(",tok,")")
//
|G1Eid0(id0) =>
prints("G1Eid0(",id0,")")
//
|
G1Eb0sh(   ) =>
prints( "G1Eb0sh(" , ")" )
|
G1Eb1sh(g1e) =>
prints("G1Eb1sh(",g1e,")")
//
|
G1Ea0pp(   ) =>
prints("G1Ea0pp(",")")
|
G1Ea1pp
(g1f0, g1e1) =>
prints("G1Ea1pp(",g1f0,";",g1e1,")")
|
G1Ea2pp
(g1f0, g1e1, g1e2) =>
prints
("G1Ea2pp(",g1f0,";",g1e1,";",g1e2,")")
//
|
G1Elist(g1es) =>
prints("G1Elist(",g1es,")")
//
|
G1Eift0
(g1e1, g1e2, g1e3) =>
prints
("G1Eift0(",g1e1,";",g1e2,";",g1e3,")")
//
|
G1Enone0() => prints("G1Enone0(",")")
|
G1Enone1(g0e1) => prints("G1Enone1(",g0e1,")")
//
|
G1Eerrck
(lvl(*err*),g1e1) => prints("G1Eerrck(",lvl,";",g1e1,")")
//
end (*let*) // end of [g1exp_fprint(out,g1e)]

(* ****** ****** *)

#implfun
sort1_fprint
( out, s1t ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1t.node() of
|
S1Tid0(id0) =>
prints("S1Tid0(",id0,")")
//
|
S1Tint(int) =>
prints("S1Tint(",int,")")
//
// HX-2018-08: operators
//
|
S1Ta0pp(   ) =>
(
  prints(  "S1Ta0pp(",")"  )
)
//
(*
| S1Ttype of int(*kind*)
  (*prop/view/type/tbox/vwtp/vtbx*)
*)
//
|
S1Ta1pp
(s1f0, s1t1) =>
prints
("S1Ta1pp(",s1f0,";",s1t1,")")
|
S1Ta2pp
( s1f0
, s1t1, s1t2) =>
prints
("S1Ta2pp(",s1f0,";",s1t1,";",s1t2,")")
|
S1Tlist(s1ts) =>
prints( "S1Tlist(", s1ts ,")" )
//
|
S1Tqual0(tok1,s1t2) =>
prints("S1Tqual0(",tok1,";",s1t2,")")
//
|
S1Tnone0() => prints("S1Tnone0(", ")")
|
S1Tnone1(s0t1) => prints("S1Tnone1(", s0t1 ,")")
//
|
S1Terrck
(lvl(*err*),s1t1) => prints("S1Terrck(",lvl,";",s1t1,")")
//
end (*let*) // end of [sort1_fprint(out,s1t)]

(* ****** ****** *)
#implfun
s1tcn_fprint
( out, tcn ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tcn.node() of
|
S1TCNnode(id0, stq) =>
prints("S1TCNnode(",id0,";",stq,")")
end (*let*) // end of [s1tcn_fprint]
(* ****** ****** *)
#implfun
d1tst_fprint
( out, dst ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dst.node() of
|
D1TSTnode(tid0,stcs) =>
(
prints("D1TSTnode(",tid0,";",stcs,")"))
end (*let*) // end of [d1tst_fprint]
(* ****** ****** *)

#implfun
s1arg_fprint
( out, s1a ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1a.node() of
|
S1ARGsome(sid0, tres) =>
prints("S1ARGsome(",sid0,";",tres,")")
//
end (*let*) // end of [s1arg_fprint]

(* ****** ****** *)
//
#implfun
s1mag_fprint
( out, s1m ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1m.node() of
|
S1MAGlist(s1as) =>
prints("S1MAGlist(",s1as,")")
//
end (*let*)//end of [s1mag_fprint(out,s1m)]
//
(* ****** ****** *)

#implfun
t1arg_fprint
( out, t1a ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
t1a.node() of
|
T1ARGsome(s1t1, topt) =>
prints("T1ARGsome(",s1t1,";",topt,")")
//
end (*let*) // end of [t1arg_fprint]

(* ****** ****** *)
//
#implfun
t1mag_fprint
( out, t1m ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
t1m.node() of
|
T1MAGlist(t1as) =>
prints("T1MAGlist(",t1as,")")
//
end (*let*)//end of [t1mag_fprint(out,t1m)]
//
(* ****** ****** *)
//
#implfun
s1qua_fprint
( out, s1q ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s1q.node() of
|
S1QUAprop
(  s1e  ) =>
prints("S1QUAprop(",s1e,")")
|
S1QUAvars
(toks, topt) =>
prints("S1QUAvars(",toks,";",topt,")")
end (*let*) // end-of-[s1qua_fprint(out,err)]
//
(* ****** ****** *)

#implfun
s1exp_fprint
( out, s1e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1e.node() of
//
|
S1Eid0(id0) =>
prints("S1Eid0(",id0,")")
//
|
S1Eint(int) =>
prints("S1Eint(",int,")")
|
S1Echr(chr) =>
prints("S1Echr(",chr,")")
|
S1Eflt(flt) =>
prints("S1Eflt(",flt,")")
|
S1Estr(str) =>
prints("S1Estr(",str,")")
//
|
S1Eb0sh(   ) =>
prints( "S1Eb0sh(" , ")" )
|
S1Eb1sh(s1e) =>
prints("S1Eb1sh(",s1e,")")
//
|
S1Earrw(ses) =>
prints("S1Earrw(",ses,")")
//
|
S1Ea0pp(   ) =>
prints
(    "S1Ea0pp(", ")"    )
|
S1Ea1pp
(s1f0, s1e1) =>
prints
("S1Ea1pp(",s1f0,";",s1e1,")")
|
S1Ea2pp
(s1f0, s1e1, s1e2) =>
prints
("S1Ea2pp(",s1f0,";",s1e1,";",s1e2,")")
|
S1El1st(s1es) =>
prints( "S1El1st(", s1es ,")" )
|
S1El2st(ses1, ses2) =>
prints("S1El2st(", ses1, ";", ses2 ,")")
//
|
S1Et1up(tknd, s1es) =>
prints("S1Et1up(",tknd,";",s1es,")")
|
S1Et2up(tknd,ses1,ses2) =>
prints
("S1Et2up(",tknd,";",ses1,";",ses2,")")
//
|
S1Er1cd(tknd, lses) =>
prints("S1Er1cd(",tknd,";",lses,")")
|
S1Er2cd(tknd,lss1,lss2) =>
prints
("S1Er2cd(",tknd,";",lss1,";",lss2,")")
//
|
S1Elams(smas,tres,s1e1) =>
prints
("S1Elams(",smas,";",tres,";",s1e1,")")
//
|
S1Euni0(s1qs) =>
prints("S1Euni0(",s1qs,")")
|
S1Eexi0(tknd, s1qs) =>
prints("S1Eexi0(",tknd,";",s1qs,")")
//
|
S1Eannot(s1e1,s1t2) =>
(
prints(  "S1Eannot(",s1e1,";",s1t2,")"  )
)
|
S1Equal0(tok1,s1e2) =>
(
prints(  "S1Equal0(",tok1,";",s1e2,")"  )
)
//
|
S1Enone0() => prints("S1Enone0(", ")")
|
S1Enone1(s0e1) => prints("S1Enone1(", s0e1 ,")")
//
|
S1Eerrck
(lvl(*err*),s1e1) => prints("S1Eerrck(",lvl,";",s1e1,")")
//
end (*let*) // end of [s1exp_fprint(out,s1e)]

(* ****** ****** *)
//
#implfun
s1uni_fprint
( out, s1u ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s1u.node() of
|
S1UNIsome(s1qs) =>
prints("S1UNIsome(",s1qs,")")
end (*let*) // end-of-[s1uni_fprint(out,err)]
//
(* ****** ****** *)

#implfun
s1tdf_fprint
( out, stdf ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
stdf.node() of
|
S1TDFsort(s1t1) =>
(
  prints("S1TDFsort(",s1t1,")")
)
|
S1TDFtsub(s1a1,s1es) =>
(
  prints("S1TDFtsub(",s1a1,";",s1es,")")
)
//
end (*let*) // end of [s1tdf_fprint(out,stdf)]

(* ****** ****** *)

#implfun
d1tcn_fprint
( out, dtcn ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dtcn.node() of
|
D1TCNnode
(s1us
,deid,s1es,sres) =>
(
print("D1TCNnode(");
prints(s1us,";",deid,";",s1es,";",sres,")"))
//
end (*let*) // end of [d1tcn_fprint(out,dtcn)]

(* ****** ****** *)

#implfun
d1typ_fprint
( out, dtyp ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dtyp.node() of
|
D1TYPnode
(deid
,tmas,tres,tcns) =>
(
print("D1TYPnode(");
prints(deid,";",tmas,";",tres,";",tcns,")"))
//
end (*let*) // end of [d1typ_fprintyyyyyyy(out,dtyp)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp1_print0.dats] *)
