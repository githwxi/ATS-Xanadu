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
// HX-2019-09-09:
// These can be re-defined
//
(* ****** ****** *)

#typedef
the_s2exp_void = void

(* ****** ****** *)
//
#typedef
the_s2exp_p1tr0 = p1tr0
//
#typedef
the_s2exp_p2tr0(x:vt) = p2tr0(x)
#viewdef
the_s2exp_p2at0(x:vt) = p2at0(x)
//
(* ****** ****** *)
//
// single precision
#typedef
the_s2exp_sflt0 = sflt
// double precision
#typedef
the_s2exp_dflt0 = dflt
//
// ldouble precision
#typedef
the_s2exp_ldflt = ldflt
//
(* ****** ****** *)
//
#typedef
the_s2exp_sint0 = sint0
#typedef
the_s2exp_uint0 = uint0
#typedef
the_s2exp_bool0 = bool0
#typedef
the_s2exp_char0 = char0
#typedef
the_s2exp_strn0 = strn0
//
(* ****** ****** *)
//
#typedef
the_s2exp_slint0 = slint0
#typedef
the_s2exp_ulint0 = ulint0
//
#typedef
the_s2exp_sllint0 = sllint0
#typedef
the_s2exp_ullint0 = ullint0
//
(* ****** ****** *)
//
#typedef
the_s2exp_lazy0(a:t0) = lazy(a)
#vwtpdef
the_s2exp_llazy0(a:vt) = lazy_vt(a)
//
(* ****** ****** *)
//
#typedef
the_s2exp_list0(a:t0) = list(a)
#vwtpdef
the_s2exp_llist0(a:vt) = list_vt(a)
//
(* ****** ****** *)
//
#typedef
the_s2exp_optn0(a:t0) = optn(a)
#vwtpdef
the_s2exp_loptn0(a:vt) = optn_vt(a)
//
(* ****** ****** *)
//
(*
#vwtpdef
the_s2exp_excptn(*void*) = excptn_vt
*)
//
(* ****** ****** *)
//
#viewdef // @
the_s2exp_a0ptr(*void*) = a0ptr_view
#viewdef // arrvw
the_s2exp_a1ptr(*void*) = a1ptr_view
//
(* ****** ****** *)
//
#typedef the_s2exp_sint1(i:i0) = sint1(i)
#typedef the_s2exp_uint1(i:i0) = uint1(i)
#typedef the_s2exp_bool1(b:b0) = bool1(b)
#typedef the_s2exp_char1(c:c0) = char1(c)
#typedef the_s2exp_strn1(n:i0) = strn1(n)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_INIT_srcgen2_xsetup0.sats] *)
