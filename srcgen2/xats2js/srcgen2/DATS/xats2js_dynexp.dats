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
Sat May  9 11:05:43 AM EDT 2026
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(out0: FILR): void =
(
 strn_fprint("\n",out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1bndfpr
( out0: FILR
, ibnd: i1bnd): void =
(
i1bnd_fprint(ibnd, out0))//endfun
//
fun
i1gptfpr
(out0: FILR
,igpt: i1gpt): void =
(
i1gpt_fprint(igpt, out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valfpr
( filr: FILR
, ival: i1val): void =
(
i1val_fprint(ival, filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_xats2js
(icmp, env0) =
let
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
//
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
nindfpr(filr, nind);
strnfpr
(filr,"// I1CMP:start\n");
//
(
nindfpr(filr, nind);
strnfpr
(filr, "// I1CMP(ival):");
i1valfpr(  filr , ival  ))
where
{
val () =
(
  i1letlst_xats2js(ilts, env0)) }
//
;
//
strnfpr(filr, " // I1CMP:return\n");
)
//
end(*let*)//end-of-[i1cmp_xats2js(icmp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1ins_xats2js
(iins, env0) =
let
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1insfpr(env0, iins);//fprintln(filr)
end where
{
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
fun
i1insfpr
( env0:
! envx2js
, iins: i1ins): void =
(
case+ iins of
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSdapp _ =>
(
f0_dapp(env0, iins))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSift0 _ =>
(
//
f0_ift0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSift0-end");
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSrturn _ =>
(
//
f0_rturn(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSrturn-end");
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|
_(* otherwise *) =>
(
  i1ins_fprint(iins(*rest*), filr))
//
(* ****** ****** *)
(* ****** ****** *)
//
)(*case+*)//end-of-[i1insfpr(env0,iins)]
//
(* ****** ****** *)
//
where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INSdapp
(i1f0, i1vs) = iins
in//let
//
prints
("I1INSdapp(",i1f0,";",i1vs,")")
//
end//let//end-of-[f0_dapp(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INSift0
( test
, ithn, iels) = iins
//
#impltmp
g_print$out<>() = filr
//
val () =
(
prints
("I1INSift0(",test,";");
prints("...",";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
val () =
(
case+ ithn of
|
optn_nil() => ()
|
optn_cons(icmp) =>
i1cmp_xats2js(icmp, env0))//case
val () = envx2js_decnind(env0, 2)
//
val () =
envx2js_incnind(env0, 2)
val () =
(
case+ iels of
|
optn_nil() => ()
|
optn_cons(icmp) =>
i1cmp_xats2js(icmp, env0))//case
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_ift0(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_rturn
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INSrturn
(ical, icmp) = iins
in//let
//
prints
("I1INSrturn(",ical,")\n");
(
  i1cmp_xats2js(icmp, env0))
//
end//let//end-of-[f0_rturn(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1insfpr(env0,iins)]
//
}(*where*)//end-of-[xats2js_i1ins(iins,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_xats2js
(ilet, env0) =
let
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1letfpr(env0, ilet); fprintln(filr)
end where//endof(let)
{
//
fun
i1letfpr
( env0:
! envx2js
, ilet: i1let): void =
let
//
#impltmp
g_print$out<>() =
envx2js_filr$get(env0)
//
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
prints
("I1LETnew0(", "...", ")\n");
envx2js_incnind(env0,2(*inc*));
i1ins_xats2js(  iins , env0  );
envx2js_decnind(env0,2(*dec*)))
//
|I1LETnew1(itnm, iins) =>
(
envx2js_incnind(env0,2(*inc*));
i1ins_xats2js(  iins , env0  );
envx2js_decnind(env0,2(*dec*)))
where
{
val () =
prints("\
I1LETnew1(", itnm, ";", "...", ")\n")
}(*where*)
//
end//let//end-of-[ i1letfpr(env0,ilet) ]
//
}(*where*)//end-of-[i1let_xats2js(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarg_xats2js
(farg, env0) =
let
(*
//
val () =
prerrsln("\
fjarg_xats2js: farg = ", farg))
//
*)
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
fjargfpr(env0, farg); fprintln(filr)
//
end where
{
//
fun
fjargfpr
( env0:
! envx2js
, farg: fjarg): void =
let
//
val filr =
envx2js_filr$get(env0)
#impltmp
g_print$out<>() = filr
//
#impltmp
g_print
<i1bnd>
( ibnd ) = i1bndfpr(filr, ibnd)
//
in//let
//
case+
farg.node() of
|
FJARGdarg(i1bs) =>
(
  prints("FJARGdarg(", i1bs, ")"))
end//let
//
}(*where*)//end-of-[fjarg_xats2js(farg,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_dynexp.dats] *)
(***********************************************************************)
