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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)

#symload name with s2cst_get_name
#symload sort with s2cst_get_sort

(* ****** ****** *)

local

(* ****** ****** *)
//
val
void_name =
symbl("the_s2exp_void")
//
val
sint_name =
symbl("the_s2exp_sint0")
val
uint_name =
symbl("the_s2exp_uint0")
//
val
bool_name =
symbl("the_s2exp_bool0")
val
char_name =
symbl("the_s2exp_char0")
val
dflt_name =
symbl("the_s2exp_dflt0")
val
strn_name =
symbl("the_s2exp_strn0")
//
(* ****** ****** *)
//
local
//
val
t2p0 =
s2typ_none0((*0*))
//
in//local
//
val
void_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
val
sint_t2pr =
a0ref_make_1val<s2typ>(t2p0)
val
uint_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
val
bool_t2pr =
a0ref_make_1val<s2typ>(t2p0)
val
char_t2pr =
a0ref_make_1val<s2typ>(t2p0)
val
dflt_t2pr =
a0ref_make_1val<s2typ>(t2p0)
val
strn_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
end (*local*) // end-of-(local)
//
(* ****** ****** *)
//
fun
s2typ_name_t2pr
( name
: sym_t
, t2pr
: a0ref(s2typ)): s2typ =
let
//
val
t2p0 = t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
|T2Pnone0() =>
let
val opt1 =
the_sexpenv_pvsfind
(       name       )
in//let
case+ opt1 of
| ~
optn_vt_nil() => t2p0
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|S2ITMcst(s2cs) =>
let
val
t2p1 =
s2typ_cst(s2c1) where
{
val-
list_cons(s2c1, _) = s2cs
}
in//let
  (t2pr[] := t2p1; t2p1) end
//
|_(*non-S2ITMcst*) => ( t2p0 )
)
end(*let*)//end-of-[T2Pnone0()]
|_(*non-T2Pnone0*) => (   t2p0   )
end(*let*)//end-of-[s2typ_name_t2pr]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
the_s2typ_void() =
s2typ_name_t2pr(void_name, void_t2pr)
//
#implfun
the_s2typ_sint() =
s2typ_name_t2pr(sint_name, sint_t2pr)
#implfun
the_s2typ_uint() =
s2typ_name_t2pr(uint_name, uint_t2pr)
//
#implfun
the_s2typ_bool() =
s2typ_name_t2pr(bool_name, bool_t2pr)
#implfun
the_s2typ_char() =
s2typ_name_t2pr(char_name, char_t2pr)
#implfun
the_s2typ_dflt() =
s2typ_name_t2pr(dflt_name, dflt_t2pr)
#implfun
the_s2typ_strn() =
s2typ_name_t2pr(strn_name, strn_t2pr)
//
(* ****** ****** *)
//
end (*local*) // end of [local(the_s2typs)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#symload
name with
s2cst_get_name
(* ****** ****** *)
//
val
mymap =
tmpmap_make_nil
{s2typ}( (*void*) )
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
s2cst_get_styp(s2c0) =
let
(*
val () =
prerrln
("s2cst_get_styp: s2c0 = ", s2c0)
*)
in//let
tmpmap_search_opt(mymap, s2c0.stmp())
end//let//end-of-[s2cst_get_styp(s2c0)]
//
(* ****** ****** *)
//
#implfun
s2cst_set_styp(s2c0, styp) =
let
(*
val () =
prerrln
("s2cst_set_styp: s2c0 = ", s2c0)
val () =
prerrln
("s2cst_set_styp: styp = ", styp)
*)
in//let
tmpmap_insert_any(mymap, s2c0.stmp(), styp)
end//let//end-of-[s2cst_set_styp(s2c0,styp)]
//
(* ****** ****** *)
//
end (*local*) // end of [local(the_s2cst_s2typ)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#symload
name with
s2cst_get_name
(* ****** ****** *)
//
val
mymap =
tmpmap_make_nil{s2typ}()
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
s2abs_get_styp(s2c0) =
tmpmap_search_opt(mymap, s2c0.stmp())
#implfun
s2abs_set_styp(s2c0, styp) =
tmpmap_insert_any(mymap, s2c0.stmp(), styp)
//
(* ****** ****** *)
//
end (*local*) // end of [local(the_s2abs_s2typ)]

(* ****** ****** *)
//
local
//
val
t2p0 =
s2typ_none0((*0*))
val
p1tr0_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
in//local
//
#implfun
the_s2typ_p1tr0() =
let
val t2p0 = p1tr0_t2pr[]
in//let
case+
t2p0.node() of
//
|T2Pnone0() =>
let
val t2p1 =
s2typ_cst(s2c1) where
{
val
s2c1 = the_s2cst_p1tr0() }
in//let
(p1tr0_t2pr[] := t2p1; t2p1) end
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_p1tr0()]
//
end (*local*) // end of [local(the_s2typ_p1tr0)]
//
(* ****** ****** *)
//
local
//
(*
HX-2023-12:
p2tr_tbox and p2at_view
*)
//
val
t2p0 =
s2typ_none0((*0*))
val
p2tr0_t2pr =
a0ref_make_1val<s2typ>(t2p0)
val
p2at0_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
in//local
//
#implfun
the_s2typ_p2tr0() =
let
//
val
t2p0 = p2tr0_t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
//
|T2Pnone0() =>
let
val t2p1 =
s2typ_cst(s2c1) where
{
val
s2c1 = the_s2cst_p2tr0() }
in//let
(p2tr0_t2pr[] := t2p1; t2p1) end
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_p2tr0()]
//
#implfun
the_s2typ_p2at0() =
let
//
val
t2p0 = p2at0_t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
//
|T2Pnone0() =>
let
val t2p1 =
s2typ_cst(s2c1) where
{
val
s2c1 = the_s2cst_p2at0() }
in//let
(p2at0_t2pr[] := t2p1; t2p1) end
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_p2at0()]
//
end (*local*) // end of [local(the_s2typ_p2at0)]
//
(* ****** ****** *)
//
local
//
(*
HX-2023-12:
p2tr_tbox and p2at_view
*)
//
in//local
//
#implfun
the_s2typ_p2tr1(telt) =
let
val s2t0 = the_sort2_tbox
val tfun = the_s2typ_p2tr0()
in//let
s2typ(s2t0, T2Papps(tfun, list_sing(telt)))
end (*let*) // end of [the_s2typ_p2tr1(telt)]
//
#implfun
the_s2typ_p2at1(telt) =
let
val s2t0 = the_sort2_tbox
val tfun = the_s2typ_p2at0()
in//let
s2typ(s2t0, T2Papps(tfun, list_sing(telt)))
end (*let*) // end of [the_s2typ_p2at1(telt)]
//
end (*local*) // end of [local(the_s2typ_p2tr1)]
//
(* ****** ****** *)
//
local
//
val
t2p0 =
s2typ_none0((*0*))
val
l0azy0_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
in//local
//
#implfun
the_s2typ_l0azy0() =
let
//
val
t2p0 = l0azy0_t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
//
|T2Pnone0() =>
let
val t2p1 =
s2typ_cst(s2c1) where
{
val
s2c1 = the_s2cst_l0azy0() }
in//let
(l0azy0_t2pr[] := t2p1; t2p1) end
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_l0azy0()]
//
end (*local*) // end of [local(the_s2typ_l0azy0)]
//
(* ****** ****** *)
//
local
in//local
#implfun
the_s2typ_l0azy1(telt) =
let
val s2t0 = the_sort2_tbox
val tfun = the_s2typ_l0azy0()
in//let
s2typ(s2t0, T2Papps(tfun, list_sing(telt)))
end (*let*) // end of [the_s2typ_l0azy1(telt)]
end (*local*) // end of [local(the_s2typ_l0azy1)]
//
(* ****** ****** *)
//
local
//
val
t2p0 =
s2typ_none0((*0*))
val
l1azy0_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
in//local
//
#implfun
the_s2typ_l1azy0() =
let
//
val
t2p0 = l1azy0_t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
//
|T2Pnone0() =>
let
val t2p1 =
s2typ_cst(s2c1) where
{
val
s2c1 = the_s2cst_l1azy0() }
in//let
(l1azy0_t2pr[] := t2p1; t2p1) end
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_l1azy0()]
//
end (*local*) // end of [local(the_s2typ_l1azy0)]
//
(* ****** ****** *)
//
local
in//local
#implfun
the_s2typ_l1azy1(telt) =
let
val s2t0 = the_sort2_tbox
val tfun = the_s2typ_l1azy0()
in//let
s2typ(s2t0, T2Papps(tfun, list_sing(telt)))
end (*let*) // end of [the_s2typ_l1azy1(telt)]
end (*local*) // end of [local(the_s2typ_l1azy1)]
//
(* ****** ****** *)
//
local
//
val
t2p0 =
s2typ_none0((*0*))
//
val
excptn_t2pr =
a0ref_make_1val<s2typ>(t2p0)
//
in//local
//
#implfun
the_s2typ_excptn() =
let
//
val
t2p0 = excptn_t2pr[(*0*)]
//
in//let
case+
t2p0.node() of
|T2Pnone0() =>
(
let
val s2c0 =
the_s2cst_excptn((*void*))
val t2p0 = s2typ_cst(s2c0)
in//let
(excptn_t2pr[] := t2p0; t2p0)
end (*let*) // end of [T2Pnone0()]
)
//
|_(*non-T2Pnone0*) => (   t2p0   )
//
end (*let*) // end of [the_s2typ_excptn()]
//
end (*local*) // end of [local(the_s2typ_excptn)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_inits0.dats] *)
