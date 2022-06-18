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
Start Time: June 17th, 2022
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
//
fun
sort0_errck_a1
(st0: sort0): sort0 =
(
sort0
(st0.lctn(), S0Terrck(1, st0))
)//end-of-[sort0_errck_a1(_)]
fun
sort0_errck_a2
(lvl: sint
,st0: sort0): sort0 =
(
sort0
(st0.lctn(), S0Terrck(lvl, st0))
)//end-of-[sort0_errck_a2(_,_)]
#symload
sort0_errck with sort0_errck_a1
#symload
sort0_errck with sort0_errck_a2
//
(* ****** ****** *)
fun
sort0_errvl
(st0: sort0): sint =
(
case+ st0.node() of
|
S0Terrck
(lvl, _) => lvl | _ => 0
)
#symload errvl with sort0_errvl
(* ****** ****** *)
fun
sort0_errvl_a2
(st1: sort0
,st2: sort0): sint =
max
(errvl(st1),errvl(st2))
#symload errvl with sort0_errvl_a2
(* ****** ****** *)
fun
sort0_errvl_a3
(st1: sort0
,st2: sort0
,st3: sort0): sint =
max
(errvl(st1)
,errvl(st2),errvl(st3))
#symload errvl with sort0_errvl_a3
(* ****** ****** *)
#extern
fun
sort0_errvl_xs
(sts: sort0lst): sint
#symload errvl with sort0_errvl_xs
#implfun
sort0_errvl_xs(sts) =
(
case+ sts of
| list_nil
  ((*nil*)) => 0
| list_cons
  (st1,sts) => max(errvl(st1),errvl(sts))
)
(* ****** ****** *)
//
fun
sort0_apps_errck
( loc
: loc_t
, sts
: sort0lst): sort0 =
let
val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc, S0Tapps(sts)))
end (*let*) // end of [sort0_apps_errck]
//
fun
sort0_lpar_errck
( loc
: loc_t
, tkb
: token
, sts
: sort0lst
, tke
: token   ): sort0 =
let
  val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc, S0Tlpar(tkb,sts,tke)))
end (*let*) // end of [sort0_lpar_errck]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0(st0, err) =
(
case+
st0.node() of
|
S0Tid0 _ => st0
|
S0Tint _ => st0
|
S0Tqid _ => f0_qid(st0, err)
|
S0Tapps _ => f0_apps(st0, err)
//
|
S0Tlpar _ => f0_lpar(st0, err)
//
|
S0Ttkerr _ =>
(err := err+1; sort0_errck(st0))
//
|
S0Terrck _ =>
(err := err+1; sort0_errck(st0))
) where
{
//
fun
f0_qid
( st0
: sort0
, err
: &sint >> _): sort0 =
( err := err+1; sort0_errck(st0) )
//
fun
f0_apps
( st0
: sort0
, err
: &sint >> _): sort0 =
let
val e00 = err
val-
S0Tapps(sts) = st0.node()
val sts = preadx0_sort0lst(sts, err)
in//let
if
(err = e00)
then st0 else sort0_apps_errck(st0.lctn(), sts)
end (*let*) // end of [f0_apps]
//
fun
f0_lpar
( st0
: sort0
, err
: &sint >> _): sort0 =
let
val e00 = err
val-
S0Tlpar(tkb,sts,tke) = st0.node()
val ( ) = // tke: T_RPAREN
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := e00+1)
)
val sts = preadx0_sort0lst(sts, err)
in//let
if
(err = e00)
then st0 else sort0_lpar_errck(st0.lctn(),tkb,sts,tke)
end (*let*) // end of [f0_lpar]
//
} (*where*) // end of [preadx0_sort0]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0opt
  (opt, err) =
(
case+ opt of
|
optn_nil() =>
optn_nil()
|
optn_cons(st1) =>
let
val e00 = err
val st1 = preadx0_sort0(st1, err)
in//let
if err = e00 then opt else optn_cons(st1)
endlet // end of [optn_cons(st1)]
) (*case*)//end-of-[preadx0_sort0opt(opt,err)]
//
#implfun
preadx0_s0expopt
  (opt, err) =
(
case+ opt of
|
optn_nil() =>
optn_nil()
|
optn_cons(se1) =>
let
val e00 = err
val se1 = preadx0_s0exp(se1, err)
in//let
if err = e00 then opt else optn_cons(se1)
endlet // end of [optn_cons(se1)]
) (*case*)//end-of-[preadx0_s0expopt(opt,err)]
//
(* ****** ****** *)
//
#implfun
preadx0_sort0lst
  (s0ts, err) =
(
case+ s0ts of
|
list_nil() =>
list_nil()
|
list_cons(s0t1, sts1) =>
let
val e00 = err
val s0t1 = preadx0_sort0(s0t1, err)
val sts1 = preadx0_sort0lst(sts1, err)
in//let
if err = e00 then s0ts else list_cons(s0t1, sts1)
endlet // end of [list_cons(st0)]
) (*case*)//end-of-[preadx0_sort0lst(s0ts,err)]
//
#implfun
preadx0_s0explst
  (s0es, err) =
(
case+ s0es of
|
list_nil() =>
list_nil()
|
list_cons(s0e1, ses1) =>
let
val e00 = err
val s0e1 = preadx0_s0exp(s0e1, err)
val ses1 = preadx0_s0explst(ses1, err)
in//let
if err = e00 then s0es else list_cons(s0e1, ses1)
endlet // end of [list_cons(st0)]
) (*case*)//end-of-[preadx0_s0explst(s0es,err)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_staexp.dats] *)
