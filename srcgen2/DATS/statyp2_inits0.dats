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
Sun 25 Dec 2022 11:17:50 AM EST
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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)

local

(* ****** ****** *)
val
t2pr_sint =
a0ref_make_1val
<s2typ>(s2typ_none0())
val
the_bool =
a0ref_make_1val
<s2typ>(s2typ_none0())
(* ****** ****** *)

in//local

#implfun
s2typ_sint() =
let
val
t2p0 =
a0ref_get(t2pr_sint)
in//let
case+
t2p0.node() of
|
T2Pnone0() =>
let
val sym1 =
symbl("the_s2typ_sint")
val opt1 =
the_sexpenv_pvsfind(sym1)
in//let
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
let
val
t2p1 =
s2typ_cst(s2c1) where
{
val-
list_cons(s2c1, _) = s2cs
}
in//let
t2pr_sint[] := t2p1; t2p1
end
| _(*non-S2ITMcst*) => t2p0
)
end (*let*) // end of [T2Pnone0]
| _(*non-T2Pnone0*) => t2p0
end (*let*) // end of [s2typ_sint()]

end (*local*) // end of [local(the_s2typs)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#symload
name with s2cst_get_name
(* ****** ****** *)
//
val
mymap =
topmap_make_nil{s2typ}()
//
in//local
//
#implfun
s2cst_get_styp(s2c0) =
topmap_search_opt(mymap, s2c0.name())
#implfun
s2cst_set_styp(s2c0, styp) =
topmap_insert_any(mymap, s2c0.name(), styp)
//
end (*local*) // end of [local(the_s2cst_s2typ)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_inits0.dats] *)
