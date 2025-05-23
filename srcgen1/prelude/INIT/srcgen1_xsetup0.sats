(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
HX-2019-09-09:
These types should
be able to be re-defined!
*)
//
(* ****** ****** *)
//
#typedef
the_void_ctype = void
//
(* ****** ****** *)
//
#typedef
the_sint_ctype = sint0
#typedef
the_uint_ctype = uint0
//
(* ****** ****** *)
//
#typedef
the_bool_ctype = bool0
#typedef
the_char_ctype = char0
//
(* ****** ****** *)
//
#typedef
the_slint_ctype = slint0
#typedef
the_ulint_ctype = ulint0
//
#typedef
the_sllint_ctype = sllint0
#typedef
the_ullint_ctype = ullint0
//
#typedef
the_string_ctype = string0
//
(* ****** ****** *)
//
#typedef
the_p1tr_ctype = p1tr0
#typedef
the_p2tr_ctype(a:vt) = p2tr(a)
//
(* ****** ****** *)
//
// single precision
#typedef the_sflt_ctype = sflt
// double precision
#typedef the_dflt_ctype = dflt
// ldouble precision
#typedef the_ldflt_ctype = ldflt
//
(* ****** ****** *)
//
#typedef
the_list_ctype(a:t0) = list(a)
#vwtpdef
the_llist_ctype(a:vt) = list_vt(a)
//
(* ****** ****** *)
//
#typedef
the_optn_ctype(a:t0) = optn(a)
#vwtpdef
the_loptn_ctype(a:vt) = optn_vt(a)
//
(* ****** ****** *)
//
#typedef
the_lazy_ctype(a:t0) = lazy(a)
#vwtpdef
the_llazy_ctype(a:vt) = lazy_vt(a)
//
(* ****** ****** *)
//
#vwtpdef
the_excptn_ctype(*void*) = excptn_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
the_s2exp_sint1(i:int) = sint1(i)
#typedef
the_s2exp_uint1(i:int) = uint1(i)
//
(* ****** ****** *)
//
#typedef
the_s2exp_bool1(b:bool) = bool1(b)
#typedef
the_s2exp_char1(c:char) = char1(c)
//
(* ****** ****** *)
//
#typedef
the_s2exp_string1(n:int) = string1(n)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_INIT_srcgen1_xsetup0.sats] *)
