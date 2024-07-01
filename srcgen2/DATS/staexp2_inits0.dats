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
Tue 25 Oct 2022 05:29:15 PM EDT
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
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#symload atdf with s2cst_get_atdf
#symload d2cs with s2cst_get_d2cs
(* ****** ****** *)

local
//
val
s2tb_int =
T2Bpred($SYM.INT_symbl)
val
s2tb_bool =
T2Bpred($SYM.BOOL_symbl)
val
s2tb_addr =
T2Bpred($SYM.ADDR_symbl)
val
s2tb_char =
T2Bpred($SYM.CHAR_symbl)
val
s2tb_strn =
T2Bpred($SYM.STRN_symbl)
//
val
s2tb_prop =
T2Bimpr
(PROPSORT, $SYM.PROP_symbl)
val
s2tb_view =
T2Bimpr
(VIEWSORT, $SYM.VIEW_symbl)
//
val
s2tb_type =
T2Bimpr
(TYPESORT, $SYM.TYPE_symbl)
val
s2tb_tbox =
T2Bimpr
(TBOXSORT, $SYM.TBOX_symbl)
val
s2tb_tflt =
T2Bimpr
(TFLTSORT, $SYM.TFLT_symbl)
//
val
s2tb_vwtp =
T2Bimpr
(VWTPSORT, $SYM.VWTP_symbl)
val
s2tb_vtbx =
T2Bimpr
(VTBXSORT, $SYM.VTBX_symbl)
val
s2tb_vtft =
T2Bimpr
(VTFTSORT, $SYM.VTFT_symbl)
//
in(*local*)
//
#implval
the_sort2_int = S2Tbas(s2tb_int)
#implval
the_sort2_addr = S2Tbas(s2tb_addr)
#implval
the_sort2_bool = S2Tbas(s2tb_bool)
#implval
the_sort2_char = S2Tbas(s2tb_char)
#implval
the_sort2_strn = S2Tbas(s2tb_strn)
//
#implval
the_sort2_prop = S2Tbas(s2tb_prop)
#implval
the_sort2_view = S2Tbas(s2tb_view)
//
#implval
the_sort2_type = S2Tbas(s2tb_type)
#implval
the_sort2_tbox = S2Tbas(s2tb_tbox)
#implval
the_sort2_tflt = S2Tbas(s2tb_tflt)
//
#implval
the_sort2_vwtp = S2Tbas(s2tb_vwtp)
#implval
the_sort2_vtbx = S2Tbas(s2tb_vtbx)
#implval
the_sort2_vtft = S2Tbas(s2tb_vtft)
//
endloc(*local*)//end-of-[local(predefined)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_p1tr0
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_nil() =>
let
val s2c1 =
(
case- opt1 of
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
(
  s2c1 ) where
{
val-
list_cons(s2c1, _) = s2cs } )
) where // end of [val(s2c1)]
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_p1tr0")
//
val opt1 =
the_sexpenv_pvsfind(name) }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
//
| optn_cons(  s2c1  ) => (  s2c1  )
//
) (*case+*) // end of [the_s2cst_p1tr0]
//
end(*local*)//end-of-[local(the_s2cst_p1tr0)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_p2tr0
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_nil() =>
let
val s2c1 =
(
case- opt1 of
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
(
  s2c1 ) where
{
val-
list_cons(s2c1, _) = s2cs } )
) where // end of [val(s2c1)]
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_p2tr0")
//
val opt1 =
the_sexpenv_pvsfind(name) }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
//
| optn_cons(  s2c1  ) => (  s2c1  )
//
) (*case+*) // end of [the_s2cst_p2tr0]
//
end(*local*)//end-of-[local(the_s2cst_p2tr0)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_p2at0
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_nil() =>
let
val s2c1 =
(
case- opt1 of
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
(
  s2c1 ) where
{
val-
list_cons(s2c1, _) = s2cs } )
) where // end of [val(s2c1)]
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_p2at0")
//
val opt1 =
the_sexpenv_pvsfind(name) }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
//
| optn_cons(  s2c1  ) => (  s2c1  )
//
) (*case+*) // end of [the_s2cst_p2at0]
//
end(*local*)//end-of-[local(the_s2cst_p2at0)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_l0azy0
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_nil() =>
let
val s2c1 =
(
case- opt1 of
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
(
  s2c1 ) where
{
val-
list_cons(s2c1, _) = s2cs } )
) where // end of [val(s2c1)]
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_lazy0")
//
val opt1 =
the_sexpenv_pvsfind(name) }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
//
| optn_cons(  s2c1  ) => (  s2c1  )
//
) (*case+*) // end of [the_s2cst_l0azy0]
//
end(*local*)//end-of-[local(the_s2cst_l0azy0)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_l1azy0
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_nil() =>
let
val s2c1 =
(
case- opt1 of
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst(s2cs) =>
(
  s2c1 ) where
{
val-
list_cons(s2c1, _) = s2cs } )
) where // end of [val(s2c1)]
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_llazy0")
//
val opt1 =
the_sexpenv_pvsfind(name) }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
//
| optn_cons(  s2c1  ) => (  s2c1  )
//
) (*case+*) // end of [the_s2cst_l1azy0]
//
end(*local*)//end-of-[local(the_s2cst_l1azy0)]

(* ****** ****** *)

local
//
val
s2cr =
a0ref_make_1val
<s2cstopt>
(optn_nil(*void*))
//
in//local
//
#implfun
the_s2cst_excptn
  ( (*void*) ) =
(
case+ s2cr[] of
//
|
optn_cons
(  s2c1  ) => s2c1
//
|optn_nil() =>
let
val s2c1 =
s2cst_make_idst
(loc0, name, s2t1) where
{
//
val
loc0 =
loctn_dummy((*void*))
val
name =
symbl("the_s2exp_excptn")
//
val s2t1 = the_sort2_vtbx }
//
in//let
(s2cr[] := optn_cons(s2c1); s2c1)
end (*let*) // end of [optn_nil()]
) (*case+*) // end of [the_s2cst_excptn]
//
endloc (*local*) // end of [local(predefined)]

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
topmap_make_nil{s2exp}()
//
in//local
//
#implfun
s2cst_get_sexp(s2c0) =
topmap_search_opt(mymap, s2c0.name())
#implfun
s2cst_set_sexp(s2c0, sexp) =
topmap_insert_any(mymap, s2c0.name(), sexp)
//
end (*local*) // end of [local(the_s2cst_s2exp)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#staload
"./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload
name with s2cst_get_name
(* ****** ****** *)
//
val
mymap =
topmap_make_nil{a2tdf}()
//
in//local
//
#implfun
s2cst_abstq(s2c0) =
(
case+
s2c0.atdf() of
| ~optn_vt_nil _ => false
| ~optn_vt_cons _ => (true))
//
#implfun
s2cst_get_atdf(s2c0) =
topmap_search_opt(mymap, s2c0.name())
#implfun
s2cst_set_atdf(s2c0, atdf) =
topmap_insert_any(mymap, s2c0.name(), atdf)
//
end (*local*) // end of [local(the_s2cst_a2tdf)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#staload
"./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload
name with s2cst_get_name
(* ****** ****** *)
//
val
mymap =
topmap_make_nil{d2conlst}()
//
in//local
//
#implfun
s2cst_dataq(s2c0) =
(
case+
s2c0.d2cs() of
| ~optn_vt_nil _ => false
| ~optn_vt_cons _ => (true))
//
#implfun
s2cst_get_d2cs(s2c0) =
topmap_search_opt(mymap, s2c0.name())
#implfun
s2cst_set_d2cs(s2c0, d2cs) =
topmap_insert_any(mymap, s2c0.name(), d2cs)
//
end (*local*) // end of [local(the_s2cst_d2conlst)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp2_inits0.dats] *)
