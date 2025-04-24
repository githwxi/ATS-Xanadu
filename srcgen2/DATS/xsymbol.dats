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
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
(* ****** ****** *)

local

(* ****** ****** *)

datatype
symbl =
SYMBL of (strn, stamp)
#absimpl symbl_tbox = symbl

(* ****** ****** *)

val mytmper = stamper_new()

(* ****** ****** *)

in//local

(* ****** ****** *)

#implval
the_symbl_nil =
SYMBL("", the_stamp_nil)

(* ****** ****** *)

#implfun
symbl_get_name
  (  sym  ) =
let
val+
SYMBL(nam, tmp) = sym in nam
end(*let*)//end-of(symbl_get_name)
#implfun
symbl_get_stmp(sym) =
let
val+
SYMBL(nam, tmp) = sym in tmp
end(*let*)//end-of(symbl_get_stmp)

(* ****** ****** *)

#implfun
symbl_make_name
  (  nam  ) =
let
val opt =
symbl_search$opt(nam)
in//let
//
case+ opt of
| ~
optn_vt_nil() =>
let
val
tmp = mytmper.getinc()
val
sym = SYMBL( nam, tmp )
//
in//let
sym where
{
//
val () =
symbl_insert$any(sym)
//
val () =
the_xsymbls_insert(sym)
//
}(*where*)//end-of(sym)
end(*let*)//end-of(optn_vt_nil)
| ~
optn_vt_cons(sym) => sym//found!
//
end(*let*)//end-of(symbl_make_name)

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
symbl_cmp
( x1, x2 ) =
stamp_cmp
(x1.stmp(), x2.stmp())
//
(* ****** ****** *)
//
#implfun
symbl_nilq(sym) =
symbl_cmp
(sym, the_symbl_nil) = 0
#implfun
symbl_neqz(sym) =
symbl_cmp
(sym, the_symbl_nil) != 0
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
symbl_wcard_kind
  (sym) =
(
  loop(cs, 0)) where
{
//
val cs =
strn_strmize(sym.name())
//
fun
loop
( cs
: strm_vt(cgtz), r0: sint): sint =
(
case+ !cs of
| ~
strmcon_vt_nil() => r0
| ~
strmcon_vt_cons(c0, cs) =>
if
(c0 = '_') then
loop(cs, r0+1) else (g_free(cs); -1)
)
//
} (*where*) // end of [symbl_wcard_kind(sym)]

(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
strn_append_uint
( name: strn
, stmp: uint): strn
//
#implfun
symbl_extend_stamp
  (sym0, stmp) =
let
val name =
  symbl_get_name(sym0)
val uint =
  stamp_get_uint(stmp)
in//let
symbl_make_name
(strn_append_uint(name, uint))
end//let//end-of-[symbl_extend_stamp]
//
#implfun
strn_append_uint
  (name, stmp) =
(
XATSOPT_strn_append_uint
  (name, stmp)) where
{
#extern
fun
XATSOPT_strn_append_uint
(name: strn, stmp: uint): strn = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef key = sint
#typedef itm = sym_t
(* ****** ****** *)
#symload
stmp with symbl_get_stmp
(* ****** ****** *)
//
(*
#staload
"srcgen1\
/prelude\
/DATS/CATS/JS/basics3.dats"
*)
//
(* ****** ****** *)
//
val
the_xsymbls =
XATS2JS_jsobjmap_make_nil<key>{itm}()
//
in//local
//
(* ****** ****** *)
//
#implfun
the_xsymbls_search
  (  key  ) =
let
val map = the_xsymbls
in//let
XATS2JS_jsobjmap_search$opt<key>(map,key)
end (*let*) // end of [the_xsymbls_search(key)]
//
(* ****** ****** *)
//
#implfun
the_xsymbls_insert
  (    sym    ) =
let
//
val k0 =
sym.stmp()
val k0 =
g0u2s(uint(k0))
//
val x0 = sym
//
val map = the_xsymbls
//
in//let
XATS2JS_jsobjmap_insert$any<key>(map,k0,x0)
end (*let*)//end of [the_xsymbls_insert(sym)]
//
(* ****** ****** *)
//
end (*local*) // end of [local(the_xsymbls_...)]

(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xsymbol.dats] *)
