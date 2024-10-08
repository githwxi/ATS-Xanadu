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
Mon Oct  7 09:52:03 PM EDT 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/xatsmtp.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with d2con_get_name
#symload ctag with d2con_get_ctag
(* ****** ****** *)
#symload d2cs with s2cst_get_d2cs
(* ****** ****** *)
//
#impltmp
d2con_name$fun$emit
  (out, dcon) =
let
val () = f0_decl(dcon)
val () = f0_impl(dcon) end
where
{
//
#impltmp
g_print$out<>() = out
//
fun
f0_decl
(dcon: d2con): void =
let
val name = dcon.name()
in//let
printsln
("#extern\n","fun<>\n",name,"$name(): strn")
end//let
//
fun
f0_impl
(dcon: d2con): void =
let
val name = dcon.name()
in//let
printsln
("#impltmp\n",name,"$name<>() = ",'"',name,'"')
end//let
//
}(*where*)//end-of-[d2con_name$fun$emit(out,dcon)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
d2con_ctag$fun$emit
  (out, dcon) =
let
val () = f0_decl(dcon)
val () = f0_impl(dcon) end
where
{
//
#impltmp
g_print$out<>() = out
//
fun
f0_decl
(dcon: d2con): void =
let
val name = dcon.name()
in//let
printsln
("#extern\n","fun<>\n",name,"$ctag(): sint")
end//let
//
fun
f0_impl
(dcon: d2con): void =
let
val name = dcon.name()
val ctag = dcon.ctag()
in//let
printsln
("#impltmp\n",name,"$ctag<>() = ",'"',ctag,'"')
end//let
//
}(*where*)//end-of-[d2con_ctag$fun$emit(out,dcon)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
s2cstlst_d2cs$name$fun$emit
  (out, s2cs) =
let
//
fun
f0_scst
(out: FILR
,scst: s2cst): void =
(
case+
scst.d2cs() of
| ~
optn_vt_cons
(d2cs) =>
(
list_foritm<d2con>(d2cs)
) where
{
#impltmp
foritm$work
<d2con>(dcon) =
d2con_name$fun$emit(out, dcon)
}
)
//
in//let
(
list_foritm<s2cst>(s2cs)
) where
{
//
#impltmp
foritm$work
<s2cst>(scst) = f0_scst(out, scst)
//
}
end(*let*)//end-[s2cstlst_d2cs$name$fun$emit(...)]
//
(* ****** ****** *)
//
#impltmp
s2cstlst_d2cs$ctag$fun$emit
  (out, s2cs) =
let
//
fun
f0_scst
(out: FILR
,scst: s2cst): void =
(
case+
scst.d2cs() of
| ~
optn_vt_cons
(d2cs) =>
(
list_foritm<d2con>(d2cs)
) where
{
#impltmp
foritm$work
<d2con>(dcon) =
d2con_ctag$fun$emit(out, dcon)
}
)
//
in//let
(
list_foritm<s2cst>(s2cs)
) where
{
//
#impltmp
foritm$work
<s2cst>(scst) = f0_scst(out, scst)
//
}
end(*let*)//end-[s2cstlst_d2cs$ctag$fun$emit(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xatsmtp_dcon00.dats] *)
