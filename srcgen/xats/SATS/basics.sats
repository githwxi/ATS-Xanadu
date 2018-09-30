(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#define INFIX 0
#define INFIXL 1
#define INFIXR 2
//
#define PREFIX 3
#define POSTFIX 4
//
(* ****** ****** *)
//
#define PROPSORT 0
#define VIEWSORT 0
//
#define TYPESORT 0
#define TBOXSORT 0
#define TFLATSORT 0
#define VTYPESORT 0
#define VTBOXSORT 0
#define VTFLATSORT 0
//
(* ****** ****** *)

datatype
dctkind =
| DCKfun of ()
| DCKval of ()
| DCKpraxi of ()
| DCKprfun of ()
| DCKprval of ()
| DCKcastfn of ()
// end of [dcstkind]

(* ****** ****** *)
//
fun
fprint_dctkind:fprint_type(dctkind)
overload fprint with fprint_dctkind
//
(* ****** ****** *)
//
datatype
valkind =
| VLKval // val
//
| VLKvalp // val+
| VLKvaln // val-
(*
| VLKmcval // mcval: for model-checking
*)
| VLKprval // prval: for theorem-proving
// end of [valkind]
//
fun
fprint_valkind:fprint_type(valkind)
overload fprint with fprint_valkind
//
(* ****** ****** *)

datatype
funkind =
//
| FNKfn0 // nonrec fun
| FNKfnx // tailrec fun
| FNKfn1 // recursive fun
| FNKfun // recursive fun
//
| FNKprfn0 // nonrec proof fun
| FNKprfn1 // recursive proof fun
| FNKprfun // recursive proof fun
//
| FNKpraxi // proof axiom
//
| FNKcastfn // casting fun
// end of [funkind]
//
fun
fprint_funkind:fprint_type(funkind)
overload fprint with fprint_funkind
//
(* ****** ****** *)
//
datatype
impkind =
//
| IMPprf // proof implementation
| IMPval // value implementation
//
fun
fprint_impkind:fprint_type(impkind)
overload fprint with fprint_impkind
//
(* ****** ****** *)
//
typedef
eq_type(a:t0ype) = (a, a) -> bool
typedef
neq_type(a:t0ype) = (a, a) -> bool
//
typedef
compare_type(a:t0ype) = (a, a) -> int
//
(* ****** ****** *)
//
fun
xats_string_append
  : (string, string) -<fun> string
//
overload + with xats_string_append of 100
//
(* ****** ****** *)

(* end of [xats_basics.sats] *)
