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

#define BOXFLG (0x1 << 0)
#define LINFLG (0x1 << 1)
#define PRFFLG (0x1 << 2)

(* ****** ****** *)

(*
overload head with list_head
overload tail with list_tail
*)

(* ****** ****** *)

fun sortbox(x: int): int // 0,1
fun sortlin(x: int): int // 0,1
fun sortprf(x: int): int // 0,1
fun sortpol(x: int): int // -1,0,1

(* ****** ****** *)
//
#define PROPSORT 4 // 00100
//
#define VIEWSORT 6 // 00110
//
#define TBOXSORT 1 // 00001
#define TFLTSORT 0 // 00000
#define TYPESORT 0 // 00000
(*
#define TFLATSORT 0 // 00000
*)
//
#define VTBXSORT 3 // 00011
#define VWTPSORT 2 // 00010
(*
#define VTYPESORT 2 // 00010
#define VTFLTSORT 2 // 00010
#define VTFLATSORT 2 // 00010
*)
//
(* ****** ****** *)

#define POLPOS(x) (x + 0010)
#define POLNEG(x) (x + 0100)

(* ****** ****** *)

#define PROPSORT00 PROPSORT
#define PROPSORT01 %(POLPOS(PROPSORT))
#define PROPSORT10 %(POLNEG(PROPSORT))

#define VIEWSORT00 VIEWSORT
#define VIEWSORT01 %(POLPOS(VIEWSORT))
#define VIEWSORT10 %(POLNEG(VIEWSORT))

#define TBOXSORT00 TBOXSORT
#define TBOXSORT01 %(POLPOS(TBOXSORT))
#define TBOXSORT10 %(POLNEG(TBOXSORT))

(*
#define TFLTSORT00 TFLTSORT
#define TFLTSORT01 %(POLPOS(TFLTSORT))
#define TFLTSORT10 %(POLNEG(TFLTSORT))
*)

#define TYPESORT00 TYPESORT
#define TYPESORT01 %(POLPOS(TYPESORT))
#define TYPESORT10 %(POLNEG(TYPESORT))

(* ****** ****** *)
//
(*
#define TFLATSORT00 TFLATSORT
#define TFLATSORT01 %(POLPOS(TFLATSORT))
#define TFLATSORT10 %(POLNEG(TFLATSORT))
*)
//
(* ****** ****** *)

#define VWTPSORT00 VWTPSORT
#define VWTPSORT01 %(POLPOS(VWTPSORT))
#define VWTPSORT10 %(POLNEG(VWTPSORT))
(*
#define VTYPESORT00 VTYPESORT
#define VTYPESORT01 %(POLPOS(VTYPESORT))
#define VTYPESORT10 %(POLNEG(VTYPESORT))
*)

#define VTBXSORT00 VTBXSORT
#define VTBXSORT01 %(POLPOS(VTBXSORT))
#define VTBXSORT10 %(POLNEG(VTBXSORT))
(*
#define VTBOXSORT00 VTBOXSORT
#define VTBOXSORT01 %(POLPOS(VTBOXSORT))
#define VTBOXSORT10 %(POLNEG(VTBOXSORT))
*)

(*
//
#define VTFLTSORT00 VTFLTSORT
#define VTFLTSORT01 %(POLPOS(VTFLTSORT))
#define VTFLTSORT10 %(POLNEG(VTFLTSORT))
//
#define VTFLATSORT00 VTFLATSORT
#define VTFLATSORT01 %(POLPOS(VTFLATSORT))
#define VTFLATSORT10 %(POLNEG(VTFLATSORT))
//
*)

(* ****** ****** *)
//
fun sortpolpos(x: int): int
fun sortpolneg(x: int): int
//
(* ****** ****** *)
//
fun
subsort_int_int(int, int): bool
//
overload subsort with subsort_int_int
//
(* ****** ****** *)

datatype
dctkind =
//
| DCKfun of ()
| DCKval of ()
| DCKpraxi of ()
| DCKprfun of ()
| DCKprval of ()
| DCKfcast of ()
//
| DCKunknown of ()
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
| FNKfcast // casting fun
//
// end of [funkind]
//
fun
funkind_isprf(funkind): bool
fun
funkind_isrec(funkind): bool
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
| IMPgen // for non-proof case
| IMPprf // proof implementation
| IMPval // value implementation
| IMPfun // function implementation
| IMPtmp // template implementation
//
fun
fprint_impkind:fprint_type(impkind)
overload fprint with fprint_impkind
//
(* ****** ****** *)
//
(*
HX: level-2 syntax
*)
//
#define CLOFLT (0) // flat
#define CLOPTR (1) // linear-boxed
#define CLOREF %(~1) // non-linear-boxed
#define LINCLOFLT (2) // linear-boxed
#define LINCLOPTR (3) // linear-boxed
//
datatype
funclo2 =
//
// function/closure
//
| FC2fun of ((*fun*))
| FC2clo of int(*knd*) // closure: knd=1/0/~1: ptr/clo/ref
//
val FC2cloflt: funclo2 // flat
val FC2cloptr: funclo2 // linear
val FC2cloref: funclo2 // nonlin
//
val FC2lincloflt: funclo2 // linenv
val FC2lincloptr: funclo2 // linenv
//
fun
funclo2_isclo: funclo2 -> bool
fun
funclo2_equal
(fc1: funclo2, fc2: funclo2): bool
//
fun
funclo2_islin: funclo2 -> bool
fun
funclo2_linize: funclo2 -> funclo2
//
fun
print_funclo2: print_type(funclo2)
fun
prerr_funclo2: prerr_type(funclo2)
fun
fprint_funclo2: fprint_type(funclo2)
//
overload print with print_funclo2
overload prerr with prerr_funclo2
overload fprint with fprint_funclo2
//
(* ****** ****** *)
//
fun
intsign(rep: string): int(*0/1*)
fun
intsize(rep: string): int(*0/1/2*)
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
