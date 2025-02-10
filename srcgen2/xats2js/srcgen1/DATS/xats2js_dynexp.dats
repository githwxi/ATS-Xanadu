(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Fri 29 Mar 2024 04:35:01 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/xats2js.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with fjarg_get_lctn
#symload node with fjarg_get_node
(* ****** ****** *)
#symload lctn with i1gpt_get_lctn
#symload lctn with i1cls_get_lctn
#symload node with i1gpt_get_node
#symload node with i1cls_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(out: FILR): void =
(
 strn_fprint(out,"\n"))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1bndfpr
( out: FILR
, ibnd: i1bnd): void =
(
 i1bnd_fprint(out, ibnd))//endfun
//
fun
i1gptfpr
(out: FILR
,igpt: i1gpt): void =
(
 i1gpt_fprint(out, igpt))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valfpr
( filr: FILR
, ival: i1val): void =
(
  i1val_fprint( filr, ival )
)(*where*)//end-of-[i1valfpr(env0,ival)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1let
( env0,ilet ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1letfpr(env0, ilet); fprintln(filr)
end where
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
envx2js_get_filr(env0)
//
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
prints
("I1LETnew0(", "...", ")\n");
envx2js_incnind(env0,2(*inc*));
xats2js_i1ins(  env0 , iins  );
envx2js_decnind(env0,2(*dec*)))
//
|I1LETnew1(itnm, iins) =>
(
envx2js_incnind(env0,2(*inc*));
xats2js_i1ins(  env0 , iins  );
envx2js_decnind(env0,2(*dec*))) where
{
val () =
prints
("I1LETnew1(", itnm, ";", "...", ")\n")
}
//
end//let//end-of-[ i1letfpr(env0,ilet) ]
//
}(*where*)//end-of-[xats2js_i1let(env0,ilet)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1bnd
( env0,ibnd ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1bndfpr(filr, ibnd); fprintln(filr))
end(*let*)//end-of-[xats2js_i1bnd(env0,ibnd)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1cmp
( env0,icmp ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
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
i1valfpr(  filr , ival  )) where
{
val () =
(
  xats2js_i1letlst(env0, ilts)) };
//
strnfpr(filr, " // I1CMP:return\n");
)
//
end(*let*)//end-of-[xats2js_i1cmp(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1ins
( env0,iins ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1insfpr(env0, iins);//fprintln(filr)
end where
{
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
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
//
|I1INSdapp _ =>
(
f0_dapp(env0, iins))
//
|I1INStimp _ =>
(
//
f0_timp(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INStimp-end");
)
//
(* ****** ****** *)
//
|I1INSlet0 _ =>
(
//
f0_let0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSlet0-end");
)
//
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
//
|I1INScas0 _ =>
(
//
f0_cas0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INScas0-end");
)
//
(* ****** ****** *)
(* ****** ****** *)
(*
|I1INStup0 _ => 
(
 i1ins_fprint(filr, iins))
|I1INStup1 _ => 
(
 i1ins_fprint(filr, iins))
|I1INSrcd2 _ => 
(
 i1ins_fprint(filr, iins))
*)
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSlam0 _ =>
(
//
f0_lam0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSlam0-end");
)
//
|I1INSfix0 _ =>
(
//
f0_fix0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSfix0-end");
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INStry0 _ =>
(
//
f0_try0(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INStry0-end");
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSl0azy _ =>
(
//
f0_l0azy(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSl0azy-end");
)
//
|I1INSl1azy _ =>
(
//
f0_l1azy(env0, iins);
//
nindfpr
(filr, nind); strnfpr
(filr, "// I1INSl1azy-end");
)
//
(* ****** ****** *)
//
|_(*rest-of-I1INS...*) =>
(
  i1ins_fprint(filr, iins)))
//
(* ****** ****** *)
//
where
{
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
end//let//end-of-[f0_dapp(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_timp
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INStimp
(i0f0, timp) = iins
in//let
//
print("I1INStimp(");
prints(i0f0,";","...",")\n");
xats2js_t1imp(env0,timp(*impltmp*))
end//let//end-of-[f0_timp(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! envx2js
, iins: i1ins): void =
let
//
#impltmp
g_print$out<>() = filr
//
val-
I1INSlet0
( dcls, icmp) = iins
//
val () =
(
print("I1INSlet0(");
prints("...",";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () =
(
  xats2js_i1cmp(env0, icmp)
) where
{ val () =
  xats2js_i1dclist(env0, dcls) }
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_let0(env0,iins)]
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
|optn_nil() => ()
|optn_cons(icmp) =>
 xats2js_i1cmp(env0, icmp))//case
val () = envx2js_decnind(env0, 2)
//
val () =
envx2js_incnind(env0, 2)
val () =
(
case+ iels of
|optn_nil() => ()
|optn_cons(icmp) =>
 xats2js_i1cmp(env0, icmp))//case
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_ift0(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INScas0
( cask
, i1v1, icls) = iins
//
#impltmp
g_print$out<>() = filr
//
val () =
(
prints
("I1INScas0(",cask,";");
prints(i1v1,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () =
xats2js_i1clslst(env0, icls)
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_cas0(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! envx2js
, iins: i1ins): void =
let
//
#impltmp
g_print$out<>() = filr
//
val-
I1INSlam0
( tknd
, fjas, icmp) = iins
//
val () =
(
prints
("I1INSlam0(",tknd,";");
prints(fjas,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () = // HX: body
(
  xats2js_i1cmp( env0, icmp ))
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_lam0(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! envx2js
, iins: i1ins): void =
let
//
#impltmp
g_print$out<>() = filr
//
val-
I1INSfix0
( tknd
, dvar
, fjas, icmp) = iins
//
val () =
(
prints
("I1INSfix0("
, tknd, ";", dvar, ";");
prints(fjas,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () = // HX: body
(
  xats2js_i1cmp( env0, icmp ))
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_fix0(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_try0
( env0:
! envx2js
, iins: i1ins): void =
let
//
val-
I1INStry0
( tknd
, icmp
, iexn, icls) = iins
//
#impltmp
g_print$out<>() = filr
//
val () =
(
prints
("I1INStry0(",tknd,";");
prints(icmp,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () =
xats2js_i1clslst(env0, icls)
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_try0(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_l0azy
( env0:
! envx2js
, iins: i1ins): void =
let
//
#impltmp
g_print$out<>() = filr
//
val-
I1INSl0azy
( dknd, icmp) = iins
//
val () =
(
print("I1INSl0azy(");
prints( dknd,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () = // HX: body
(
  xats2js_i1cmp( env0, icmp ))
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_l0azy(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_l1azy
( env0:
! envx2js
, iins: i1ins): void =
let
//
#impltmp
g_print$out<>() = filr
//
val-
I1INSl1azy
( dknd
, icmp, i1fs) = iins
//
val () =
(
print("I1INSl1azy(");
prints( dknd,";","...",")\n"))
//
val () =
envx2js_incnind(env0, 2)
//
val () = // HX: body
(
  xats2js_i1cmp( env0, icmp ))
val () = // HX: frees
(
  xats2js_i1cmplst(env0, i1fs))
//
val () = envx2js_decnind(env0, 2)
//
end//let//end-of-[f0_l1azy(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1insfpr(env0,iins)]
//
}(*where*)//end-of-[xats2js_i1ins(env0,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_fjarg
( env0,farg ) =
let
(*
//
val () =
prerrsln
("xats2js_fjarg: farg = ", farg))
//
*)
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
fjargfpr(env0, farg); fprintln(filr)
//
end where
{
fun
fjargfpr
( env0:
! envx2js
, farg: fjarg): void =
let
//
val filr =
envx2js_get_filr(env0)
#impltmp
g_print$out<>() = filr
//
#impltmp
g_print
<i1bnd>
( ibnd ) = i1bndfpr(filr, ibnd)
//
in//let
case+
farg.node() of
|
FJARGdarg(i1bs) =>
(
  prints("FJARGdarg(", i1bs, ")"))
end//let
}(*where*)//end-of-[xats2js_fjarg(env0,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1gpt
( env0,igpt ) =
let
(*
//
val () =
prerrsln
("xats2js_i1gpt: igpt = ", igpt))
//
*)
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1gptfpr(filr, igpt); fprintln(filr))
end(*let*)//end-of-[xats2js_i1gpt(env0,i1gpt)]

(* ****** ****** *)
//
#implfun
xats2js_i1cls
( env0,icls ) =
let
(*
//
val () =
prerrsln
("xats2js_i1cls: icls = ", icls))
//
*)
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
//
case+
icls.node() of
//
|
I1CLSgpt(igpt) =>
(
xats2js_i1gpt(env0, igpt)
)
//
|
I1CLScls(igpt, icmp) =>
(
xats2js_i1gpt(env0, igpt);
let
val () =
envx2js_incnind(env0, 2)
val () =
xats2js_i1cmp(env0, icmp)
val () = envx2js_decnind(env0,2) end)
//
end(*let*)//end-of-[xats2js_i1cls(env0,i1cls)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1letlst
  (env0, ilts) =
(
  list_xats2js_fnp(env0, ilts, xats2js_i1let))
//
(* ****** ****** *)
//
#implfun
xats2js_i1cmplst
  (env0, i1fs) =
(
  list_xats2js_fnp(env0, i1fs, xats2js_i1cmp))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_fjarglst
  (env0, fjas) =
(
  list_xats2js_fnp(env0, fjas, xats2js_fjarg))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1clslst
  (env0, icls) =
(
  list_xats2js_fnp(env0, icls, xats2js_i1cls))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_dynexp.dats] *)
(***********************************************************************)
