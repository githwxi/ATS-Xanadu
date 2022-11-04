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
Sat 27 Aug 2022 02:13:22 AM EDT
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_t2abs_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_t2abs_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_t2dat_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_t2dat_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2cst_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2cst_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2var_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2var_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2xtv_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2xtv_stamp_new]
//
(* ****** ****** *)

local
//
datatype t2abs =
T2ABS of
( sym_t
, stamp // unicity
) (* datatype(t2abs) *)
//
#absimpl t2abs_tbox = t2abs
//
in (* in-of-local *)
//
#implfun
t2abs_make_name
  (sym) =
(
T2ABS(sym, tmp)) where
{
val tmp = the_t2abs_stamp_new()
} (*where*)//end-of-[t2abs_make_name]
//
(* ****** ****** *)
//
#implfun
t2abs_get_name
  (t2a) = let
//
val
T2ABS
( sym
, tmp (*unicity*) ) = t2a in sym
//
end (*let*) // end of [t2abs_get_name]
//
(* ****** ****** *)
//
#implfun
t2abs_get_stmp
  (t2a) = let
//
val
T2ABS
( sym
, tmp (*unicity*) ) = t2a in tmp
//
end (*let*) // end of [t2abs_get_stmp]
//
(* ****** ****** *)

end (*local*) // end of [local(t2abs)]

(* ****** ****** *)

local

datatype t2dat =
T2DAT of
(sym_t, stamp, s2cstlst)
#absimpl t2dat_tbox = t2dat

in//local

(* ****** ****** *)
//
#implfun
t2dat_make_name
  (name) =
T2DAT
(name, stmp, s2cs) where
{
val stmp =
the_t2dat_stamp_new()
val s2cs = list_nil((*void*)) }
//
(* ****** ****** *)
//
#implfun
t2dat_get_name(t2d) =
let
val
T2DAT
(sym, tmp, scs) = t2d in sym
end (*let*) // end of [t2dat_get_name]
#implfun
t2dat_get_stmp(t2d) =
let
val
T2DAT
(sym, tmp, scs) = t2d in tmp
end (*let*) // end of [t2dat_get_stmp]
#implfun
t2dat_get_s2cs(t2d) =
let
val
T2DAT
(sym, tmp, scs) = t2d in scs
end (*let*) // end of [t2dat_get_s2cs]
//
(* ****** ****** *)

end (*local*) // end of [local(t2dat)]

(* ****** ****** *)
//
#implfun
sort2_none0() = S2Tnone0()
#implfun
sort2_none1(s1t0) = S2Tnone1(s1t0)
//
(* ****** ****** *)

local
//
datatype s2cst =
S2CST of
( loc_t
, sym_t
, sort2
, stamp // unicity
) (* datatype(s2cst) *)
//
#absimpl s2cst_tbox = s2cst
//
in//local

(* ****** ****** *)

#implfun
s2cst_make_idst
(loc, sym, s2t) =
(
S2CST
(loc, sym, s2t, tmp)) where
{ val
  tmp = the_s2cst_stamp_new((*void*))
} (*where*) // end of [s2cst_make_idst(...)]

(* ****** ****** *)

#implfun
s2cst_get_lctn(s2c) =
let
val
S2CST
( loc
, sym
, s2t
, tmp (*unicity*) ) = s2c in loc
end (*let*) // end of [s2cst_get_lctn]

(* ****** ****** *)

#implfun
s2cst_get_name(s2c) =
let
val
S2CST
( loc
, sym
, s2t
, tmp (*unicity*) ) = s2c in sym
end (*let*) // end of [s2cst_get_name]

(* ****** ****** *)

#implfun
s2cst_get_sort(s2c) =
let
val
S2CST
( loc
, sym
, s2t
, tmp (*unicity*) ) = s2c in s2t
end (*let*) // end of [s2cst_get_sort]

(* ****** ****** *)

#implfun
s2cst_get_stmp(s2c) =
let
val
S2CST
( loc
, sym
, s2t
, tmp (*unicity*) ) = s2c in tmp
end (*let*) // end of [s2cst_get_stmp]

(* ****** ****** *)

endloc (*local*) // end of [local(s2cst)]

(* ****** ****** *)

local
//
datatype s2var =
S2VAR of
(sym_t, sort2, stamp)
(*
datavwtp s2var_vt =
S2VAR_vt of
(sym_t, sort2, stamp)
*)
//
#absimpl s2var_tbox = s2var
//
in//local

#implfun
s2var_get_name(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in sym
end (*let*) // end of [s2var_get_name]

#implfun
s2var_get_sort(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in s2t
end (*let*) // end of [s2var_get_sort]

#implfun
s2var_get_stmp(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in tmp
end (*let*) // end of [s2var_get_stmp]

(* ****** ****** *)
//
#implfun
s2var_make_name
  (  sid  ) =
(
S2VAR(sid, s2t, tmp)) where
{ val s2t = S2Tnone0(*void*)
  val
  tmp = the_s2var_stamp_new((*void*))
} (*where*) // end of [s2var_make_name]
//
(* ****** ****** *)
//
#implfun
s2var_make_idst
  (sid, s2t) =
(
S2VAR(sid, s2t, tmp)) where
{ val
  tmp = the_s2var_stamp_new((*void*))
} (*where*) // end of [s2var_make_idst]
//
(* ****** ****** *)

endloc (*local*) // end of [local(s2var)]

(* ****** ****** *)
#implfun
s2var_make_sort
  (   s2t   ) = let
//
val id0 =
SRP_symbl in s2var_make_idst(id0, s2t)
//
end (*let*) // end-[s2var_make_sort(s2t)]
(* ****** ****** *)
#implfun
s2exp_int(int) =
let
val s2t0 = the_sort2_int in
s2exp_make_node(s2t0, S2Eint(int))
end (*let*) // end of [ s2exp_int(int) ]
(* ****** ****** *)
#implfun
s2exp_btf(btf) =
let
val s2t0 = the_sort2_bool in
s2exp_make_node(s2t0, S2Ebtf(btf))
end (*let*) // end of [ s2exp_btf(btf) ]
(* ****** ****** *)
#implfun
s2exp_chr(chr) =
let
val s2t0 = the_sort2_char in
s2exp_make_node(s2t0, S2Echr(chr))
end (*let*) // end of [ s2exp_chr(chr) ]
(* ****** ****** *)
//
#implfun
s2exp_cst(s2c0) =
let
val s2t0 = s2c0.sort() in
s2exp_make_node(s2t0, S2Ecst(s2c0))
end (*let*) // end of [ s2exp_cst(s2c0) ]
//
#implfun
s2exp_var(s2v0) =
let
val s2t0 = s2v0.sort() in
s2exp_make_node(s2t0, S2Evar(s2v0))
end (*let*) // end of [ s2exp_var(s2v0) ]
//
(* ****** ****** *)
//
#implfun
s2exp_apps
(loc0, s2f0, s2es) = let
//
(*
val () =
println!
("\
s2exp_apps: s2f0 = ", s2f0)
val () =
println!
("\
s2exp_apps:\
s2f0.sort = ", s2f0.sort())
*)
//
val s2f0 =
(
case+
s2f0.sort() of
|
S2Tf0un _ => s2f0
|
S2Tf1un _ => s2f0
|
_(*non-S2Tf?un*) =>
s2exp_cast
(loc0, s2f0, S2Tf0un())
) : s2exp // end of [val s2f0]
//
val
tres =
(
case+
s2f0.sort() of
|
S2Tf1un(_, s2t1) => s2t1
|
_(*non-S2Tf1un*) => S2Tnone0()
) : sort2 // end of [val tres]
//
in
  s2exp(tres, S2Eapps(s2f0, s2es))
end (*let*) // end of [s2exp_apps(...)]
//
(* ****** ****** *)
//
#implfun
s2exp_a2pp
( loc0
, s2f0, s2e1, s2e2) =
(
s2exp_apps
(loc0, s2f0, s2es)) where
{
val s2es = list_pair(s2e1, s2e2)
} (*where*) // end of [s2exp_a2pp(...)]
//
(* ****** ****** *)

#implfun
s2exp_lam0
(s2vs, body) = let
//
val s2ts =
list_map(s2vs) where
{
#impltmp
map$fopr
< s2var >
< sort2 > = s2var_get_sort }
//
val s2t0 =
  S2Tf1un(s2ts, body.sort())
//
in
  s2exp(s2t0, S2Elam0(s2vs, body))
end (*let*) // end of [s2exp_lam0(s2vs,body)]

(* ****** ****** *)
//
#implfun
s2exp_fun0_all
(npf1, farg, fres) =
(
s2exp_fun0_full
(f2cl, npf1, farg, fres)
) where
{
  val f2cl = F2CLfun((*void*))
} (*where*) // end of [s2exp_fun0_all(...)]
//
#implfun
s2exp_fun0_full
( f2cl
, npf1, farg, fres) =
(
s2exp_make_node
(
s2t0,
S2Efun0
( f2cl
, npf1, farg, fres))) where
{
val s2t0 =
(
if
f2clknd_linq(f2cl)
then (the_sort2_vtbx)
else (the_sort2_tbox) ) : sort2
} (*where*) // end of [s2exp_fun0_full(...)]
//
(* ****** ****** *)

#implfun
s2exp_uni0
(s2vs, s2ps, body) = let
//
val
nilq =
list_nilq(s2vs)
val
nilq =
if nilq then
list_nilq(s2ps) else false
//
in//let
//
if
nilq
then body else let
  val s2t0 = body.sort()
in
  s2exp(s2t0, S2Euni0(s2vs, s2ps, body))
end (*let*) // end of [else]
//
end (*let*) // end of [s2exp_uni0(s2vs,s2ps,s2e0)]

(* ****** ****** *)

#implfun
s2exp_exi0
(s2vs, s2ps, body) = let
//
val
nilq =
list_nilq(s2vs)
val
nilq =
if nilq then
list_nilq(s2ps) else false
//
in//let
//
if
nilq
then body else let
  val s2t0 = body.sort()
in
  s2exp(s2t0, S2Eexi0(s2vs, s2ps, body))
end (*let*) // end of [else]
//
end (*let*) // end of [s2exp_exi0(s2vs,s2ps,s2e0)]

(* ****** ****** *)

#implfun
s2exp_l1st
(loc0, s2es) =
let
//
val
impr =
s2explst_imprq(s2es)
//
in//let
//
if
impr
then let
//
val
knd0 = TRCDflt0(*void*)
val
linq = s2explst_linq(s2es)
val
prfq = s2explst_prfq(s2es)
//
val s2t0 =
(
if
linq
then
(
if
prfq
then the_sort2_view(* lin*)
else the_sort2_vwtp(*~lin*))
else
(
if
prfq
then the_sort2_prop(* lin*)
else the_sort2_type(*~lin*))
) : sort2 // end of [val s2t0]
//
(*
(*
HX-2022-10-28:
Checking is already done.
*)
val s2es =
s2explst_stck(loc0, s2es, s2t0)
*)
//
val
lses = l2s2elst_make_l1st(s2es)
//
in
s2exp_make_node
( s2t0
, S2Etrcd(knd0, -1(*npf*), lses))
end (*let*) // end-of-then
else // tuples // not yet supported
let
val s2ts =
list_map<x0><y0>(s2es) where
{
 #typedef x0 = s2exp
 #typedef y0 = sort2
 #impltmp
 map$fopr<x0><y0>(x0) = x0.sort() }
in
  s2exp(S2Ttup(s2ts), S2Elist(s2es))
end (*let*) // end-of-else // end-if
//
end (*let*) // end of [s2exp_l1st(s2es)]

(* ****** ****** *)

#implfun
s2exp_l2st
(loc0, ses1, ses2) = let
//
val
knd0 = TRCDflt0(*void*)
val
linq = s2explst_linq(ses1)
//
val
s2t1 =
(
if
linq
then
the_sort2_view else the_sort2_prop
) : sort2 // end of [val s2t1]
//
val
s2t2 =
(
if
linq
then
the_sort2_vwtp else
(
if
s2explst_linq(ses2)
then
the_sort2_vwtp else the_sort2_type
)
) : sort2 // end of [val s2t2]
//
(*
//
(*
HX-2022-10-28:
Checking is already done.
See f0_l2st in trans12_s2exp.
*)
// 
val ses1 =
s2explst_stck(loc0, ses1, s2t1)
val ses2 =
s2explst_stck(loc0, ses2, s2t2)
*)
//
val npf1 = list_length(ses1)
val lses =
l2s2elst_make_l2st( ses1, ses2 )
//
in
s2exp(s2t2, S2Etrcd(knd0, npf1, lses))
end (*let*) // end of [s2exp_l2st(ses1,ses2)]

(* ****** ****** *)
//
(*
HX-2020-07:
boxed tuples are linear
val T0TRCD11 = T_TRCD10(1) //HX: $()
and T0TRCD12 = T_TRCD10(2) //HX: $tup
and T0TRCD13 = T_TRCD10(3) //HX: $tup_t0
and T0TRCD14 = T_TRCD10(4) //HX: $tup_vt
*)
//
(* ****** ****** *)
//
#implfun
s2exp_t1up
(loc0, tok0, s2es) =
let
//
val
tnd0 = tok0.node()
val
linq =
s2explst_linq(s2es)
//
val
knd0 =
(
case- tnd0 of
|
T_TRCD10(0) => TRCDflt0
|
T_TRCD10(1) => TRCDbox1
|
T_TRCD10(2) =>
(
if linq then
TRCDbox1 else TRCDbox0)
|
T_TRCD10(3) => TRCDbox0
|
T_TRCD10(4) => TRCDbox1
) : trcdknd // end-of-val
//
val
s2t0 =
(
case- tnd0 of
|
T_TRCD10(0) =>
let
val
prfq =
s2explst_prfq(s2es)
in//let
if
linq
then
(
if prfq
then the_sort2_view
else the_sort2_vwtp)
else
(
if prfq
then the_sort2_prop
else the_sort2_type)
end (*let*) // T_TRCD10(0)
| // $(...)
T_TRCD10(1) => the_sort2_vwtp
| // $tup(...)
T_TRCD10(2) =>
if linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $tup_t0(...)
T_TRCD10(3) => the_sort2_type
| // $tup_t0(...)
T_TRCD10(4) => the_sort2_vwtp
) : sort2 // end of [val s2t0]
//
val
s2es = // HX: for T_TRCD10(3)
s2explst_stck(loc0, s2es, s2t0)
//
val
npf1 = -1
val
lses = l2s2elst_make_l1st(s2es)
//
in
s2exp_make_node
(s2t0, S2Etrcd(knd0, npf1, lses))
end (*let*) // end of [s2exp_t1up(loc0,...)]
//
(* ****** ****** *)
//
#implfun
s2exp_t2up
( loc0
, tok0, ses1, ses2) =
let
//
val
tnd0 = tok0.node()
val
linq =
s2explst_linq(ses1)
val
linq =
if linq
then true else
s2explst_linq(ses2)
//
val
knd0 =
(
case- tnd0 of
|
T_TRCD10(0) => TRCDflt0
|
T_TRCD10(1) => TRCDbox1
|
T_TRCD10(2) =>
(
if linq then
TRCDbox1 else TRCDbox0)
|
T_TRCD10(3) => TRCDbox0
|
T_TRCD10(4) => TRCDbox1
) : trcdknd // end-of-val
//
val
s2t1 =
(
if
linq
then (the_sort2_view)
else (the_sort2_prop)
) : sort2 // end of [val s2t1]
val
s2t2 =
(
case- tnd0 of
|
T_TRCD10(0) =>
if
linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $(...)
T_TRCD10(1) => the_sort2_vwtp
| // $tup(...)
T_TRCD10(2) =>
if linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $tup_t0(...)
T_TRCD10(3) => the_sort2_type
| // $tup_t0(...)
T_TRCD10(4) => the_sort2_vwtp
) : sort2 // end of [val s2t2]
//
(*
val
ses1 =
s2explst_stck(loc0, ses1, s2t1)
*)
val
ses2 = // HX: for T_TRCD10(3)
s2explst_stck(loc0, ses2, s2t2)
//
val
npf1 = list_length(ses1)
val
lses = l2s2elst_make_l2st(ses1, ses2)
//
in//let
s2exp_make_node
(s2t2, S2Etrcd(knd0, npf1, lses))
end (*let*) // end of [s2exp_t2up(loc0,...)]
//
(* ****** ****** *)
//
#implfun
s2exp_r1cd
(loc0, tok0, lses) =
let
//
val
tnd0 = tok0.node()
val
linq =
l2s2elst_linq(lses)
//
val
knd0 =
(
case- tnd0 of
|
T_TRCD20(0) => TRCDflt0
|
T_TRCD20(1) => TRCDbox1
|
T_TRCD20(2) =>
(
if linq then
TRCDbox1 else TRCDbox0)
|
T_TRCD20(3) => TRCDbox0
|
T_TRCD20(4) => TRCDbox1
) : trcdknd // end-of-val
//
val
s2t0 =
(
case- tnd0 of
|
T_TRCD20(0) =>
let
val
prfq =
l2s2elst_prfq(lses)
in//let
if
linq
then
(
if prfq
then the_sort2_view
else the_sort2_vwtp)
else
(
if prfq
then the_sort2_prop
else the_sort2_type)
end (*let*) // T_TRCD20(0)
| // $(...)
T_TRCD20(1) => the_sort2_vwtp
| // $tup(...)
T_TRCD20(2) =>
if linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $tup_t0(...)
T_TRCD20(3) => the_sort2_type
| // $tup_t0(...)
T_TRCD20(4) => the_sort2_vwtp
) : sort2 // end of [val s2t0]
//
val
npf1 = -1
val
lses = // HX: for T_TRCD20(3)
l2s2elst_stck(loc0, lses, s2t0)
//
in
s2exp_make_node
(s2t0, S2Etrcd(knd0, npf1, lses))
end (*let*) // end of [s2exp_r1cd(loc0,...)]
//
(* ****** ****** *)
//
#implfun
s2exp_r2cd
( loc0
, tok0, lss1, lss2) =
let
//
val
tnd0 = tok0.node()
val
linq =
l2s2elst_linq(lss1)
val
linq =
if linq
then true else
l2s2elst_linq(lss2)
//
val
knd0 =
(
case- tnd0 of
|
T_TRCD20(0) => TRCDflt0
|
T_TRCD20(1) => TRCDbox1
|
T_TRCD20(2) =>
(
if linq then
TRCDbox1 else TRCDbox0)
|
T_TRCD20(3) => TRCDbox0
|
T_TRCD20(4) => TRCDbox1
) : trcdknd // end-of-val
//
val
s2t1 =
(
if
linq
then (the_sort2_view)
else (the_sort2_prop)
) : sort2 // end of [val s2t1]
val
s2t2 =
(
case- tnd0 of
|
T_TRCD20(0) =>
if
linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $(...)
T_TRCD20(1) => the_sort2_vwtp
| // $tup(...)
T_TRCD20(2) =>
if linq
then (the_sort2_vwtp)
else (the_sort2_type)
| // $tup_t0(...)
T_TRCD20(3) => the_sort2_type
| // $tup_t0(...)
T_TRCD20(4) => the_sort2_vwtp
) : sort2 // end of [val s2t2]
//
(*
val
lss1 =
l2s2elst_stck(loc0, lss1, s2t1)
*)
val
lss2 = // HX: for T_TRCD20(3)
l2s2elst_stck(loc0, lss2, s2t2)
//
val npf1 = list_length(lss1)
val lses = list_append(lss1, lss2)
//
in//let
s2exp(s2t2, S2Etrcd(knd0, npf1, lses))
end (*let*) // end of [s2exp_r2cd(loc0,...)]
//
(* ****** ****** *)
//
#implfun
s2exp_none0() =
s2exp
(s2t0, S2Enone0()) where
{
  val s2t0 = sort2_none0()
} (*where*) // end of [s2exp_none0(...)]
//
#implfun
s2exp_none1(s1e0) =
let
//
  val loc0 = s1e0.lctn()
  val s2t0 = sort2_none0() 
//
(*
val (  ) = prerrln
("s2exp_none1: s1e0 = ", s1e0)
*)
in//let
  s2exp(s2t0, S2Enone1(s1e0))
end (*let*) // end of [s2exp_none1(s1e0)]
//
(* ****** ****** *)
//
#implfun
s2exp_impr
(loc0, s2e0) =
let
val
s2t0 = the_sort2_type
in
s2exp
(s2t0, S2Eimpr(loc0, s2e0))
end (*let*)//end-of-[s2exp_impr]
//
#implfun
s2exp_prgm
(loc0, s2e0) =
let
val
s2t0 = the_sort2_type
in
s2exp
(s2t0, S2Eprgm(loc0, s2e0))
end (*let*)//end-of-[s2exp_prgm]
//
(* ****** ****** *)
//
#implfun
s2exp_cast
(loc0, s2e1, s2t2) =
s2exp
(s2t2, S2Ecast(loc0, s2e1, s2t2))
//
(* ****** ****** *)

local
//
datatype s2exp =
S2EXP of (sort2,s2exp_node)
//
#absimpl s2exp_tbox = s2exp
//
in//local
//
#implfun
s2exp_get_sort
   ( s2e0 ) = let
//
val
S2EXP(s2t0, node) = s2e0 in s2t0
//
end (*let*) // end of [s2exp_get_sort]
#implfun
s2exp_get_node
   ( s2e0 ) = let
//
val
S2EXP(s2t0, node) = s2e0 in node
//
end (*let*) // end of [s2exp_get_node]
//
#implfun
s2exp_make_node
( s2t0 , node ) = S2EXP(s2t0, node)
//
endloc (*local*) // end of [local(s2exp)]
//
(* ****** ****** *)
//
#implfun
l2s2e_get_sort
(   lx   ) = s2exp_get_sort(lx.itm())
#implfun
l2s2e_get_node
(   lx   ) = s2exp_get_node(lx.itm())
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2.dats] *)
