(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: July, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/label0.sats"
#staload "./../SATS/symbol.sats"

(* ****** ****** *)
//
implement
print_label(l0) =
  fprint_label(stdout_ref, l0)
//
implement
prerr_label(l0) =
  fprint_label(stderr_ref, l0)
//
(* ****** ****** *)

local
//
datatype
label =
| LABint of int // digits
| LABsym of symbol // alnums
//
absimpl
label_tbox = label
//
in (* in-of-local *)

implement
eq_label_label
  (l1, l2) =
(
case+ l1 of
| LABint(i1) =>
  (
  case+ l2 of
  | LABint(i2) => (i1 = i2) | _ => false
  )
| LABsym(s1) =>
  (
  case+ l2 of
  | LABsym(s2) => (s1 = s2) | _ => false
  )
) (* end of [eq_label_label] *)

(* ****** ****** *)

implement
fprint_label
  (out, l0) =
(
case+ l0 of
| LABint(i0) =>
  fprint!(out, "LABint(", i0, ")")
| LABsym(s0) =>
  fprint!(out, "LABsym(", s0, ")")
)

(* ****** ****** *)

implement
label_nil = LABsym(symbol_nil)

implement
label_make_int(i0) = LABint(i0)
implement
label_make_sym(s0) = LABsym(s0)
implement
label_make_name(s0) = LABsym(symbol_make(s0))

(* ****** ****** *)
//
implement
label_is_int(l0) = 
  case+ l0 of
  | LABint _ => true | LABsym _ => false
// end of [label_is_int]
implement
label_is_sym(l0) = 
  case+ l0 of
  | LABint _ => false | LABsym _ => true
// end of [label_is_sym]
//
implement
label_get_int(l0) =
  case+ l0 of
  | LABint (x) => Some_vt(x) | _ => None_vt()
// end of [label_get_int]
implement
label_get_sym(l0) =
  case+ l0 of
  | LABsym (x) => Some_vt(x) | _ => None_vt()
// end of [label_get_sym]
//
(* ****** ****** *)

implement
label_dotize(l0) =
(
//
case+ l0 of
| LABint(int) => let
//
    val
    name0 =
    g0int2string(int)
    val
    name1 =
    $UN.strptr2string(name0)
    val
    dotnm =
    string0_append(".", name1)
//
    val () = strptr_free(name0)
//
  in
    symbol_make(strptr2string(dotnm))
  end (* end of [LABint] *)
//
| LABsym(sym) => let
    val
    name0 =
    symbol_get_name(sym)
    val
    dotnm =
    string0_append(".", name0)
  in
    symbol_make(strptr2string(dotnm))
  end (* end of [LABsym] *)
//
) // end of [label_dotize]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_label0.dats] *)
