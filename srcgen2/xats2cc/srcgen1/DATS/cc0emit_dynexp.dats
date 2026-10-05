(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri Sep 25 12:45:24 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload // BAS =
"./../../../SATS/xbasics.sats"
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2cc.sats"
#staload "./../SATS/cc0emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
strn_fprint("\n", filr))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0exp$typcc0
( filr: FILR
, iexp: i0exp): void =
let
//
val lctn = iexp.lctn()
val ityp = iexp.ityp()
//
in//let
(
strnfpr(filr, "#define ");
strnfpr(filr, "_i0exp$typ_");
fprint_loctn_as_stamp(filr, lctn);
strnfpr(filr, " ");
i0typcc0(filr, ityp);fprintln(filr))
end(*let*)//end-of-[i0exp$typcc0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_cc0emit
(iexp, env0) =
let
//
(*
//
val () =
prerrsln
("i0exp_cc0emit: iexp = ", iexp)
//
*)
//
in//let
//
case+
iexp.node() of
//
(* ****** ****** *)
//
|I0Eint _ =>
(
  i0exp$typcc0(filr, iexp))
|I0Ebtf _ =>
(
  i0exp$typcc0(filr, iexp))
|I0Echr _ =>
(
  i0exp$typcc0(filr, iexp))
|I0Eflt _ =>
(
  i0exp$typcc0(filr, iexp))
|I0Estr _ =>
(
  i0exp$typcc0(filr, iexp))
//
(* ****** ****** *)
//
|I0Evar _ =>
(
  i0exp$typcc0(filr, iexp))
//
(* ****** ****** *)
//
|I0Edapp _ => f0_dapp(iexp, env0)
//
(* ****** ****** *)
(* ****** ****** *)
| _
(*otherwise*) => f0_otherwise(iexp, env0)
(* ****** ****** *)
(* ****** ****** *)
//
end where//endof(i0dcl_cc0emit(iexp,env0))
{
//
(* ****** ****** *)
//
val
filr =
envxcc0_filr$get(env0)
//
(* ****** ****** *)
//
fun
f0_dapp
(
iexp: i0exp,
env0: !envxcc0): void =
let
val-
I0Edapp
(i0f0
,npf1, i0es) = iexp.node()
val () =
(
  i0exp_cc0emit(i0f0, env0))
val () =
f1_npf1_i0es(npf1, i0es, env0)
end where
{
//
fun
f1_npf1_i0es
( npf1: sint
, i0es: i0explst
, env0: !envxcc0): void =
(
case+ i0es of
|
list_nil() => ()
|
list_cons(i0e1, i0es) =>
if // if
(npf1 >= 1)
then
(
let
val npf1 = npf1-1
in//let
f1_npf1_i0es(npf1, i0es, env0)
end//let//then
)
else
(
let
val (  ) =
(
  i0exp_cc0emit(i0e1, env0))
in//let
f1_npf1_i0es(npf1, i0es, env0)
end//let//else
)
)(*case+*)//end-of-[f1_npf1_i0es(...)]
//
}(*where*)//end-of-[f0_dapp(iexp,env0)]
//
(* ****** ****** *)
//
fun
f0_otherwise
(
iexp: i0exp,
env0: !envxcc0): void =
(
strnfpr(
filr, "// I0EXP(");
lctnfpr(filr, lctn);
strnfpr(filr, "): ");
i0typcc0
(filr, ityp); fprintln(filr)
) where
{
//
val lctn = i0exp_lctn$get(iexp)
val ityp = i0exp_ityp$get(iexp)
//
}(*where*)//end-of-[f0_otherwise(iexp,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i0exp_cc0emit(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc0emit_dynexp.dats] *)
(***********************************************************************)
