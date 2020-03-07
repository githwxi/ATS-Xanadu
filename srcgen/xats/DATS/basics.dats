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
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
(* ****** ****** *)

implement
sortbox(knd) =
let
  val
  knd = g0i2u(knd)
in
  g0u2i(knd land 0x1u)
end // end of [sortbox]

(* ****** ****** *)

implement
sortlin(knd) =
let
  val
  knd = g0i2u(knd)
in
  g0u2i((knd >> 1) land 0x1u)
end // end of [sortlin]

(* ****** ****** *)

implement
sortprf(knd) =
let
  val
  knd = g0i2u(knd)
in
  g0u2i((knd >> 2) land 0x1u)
end // end of [sortprf]

(* ****** ****** *)

implement
sortpol(knd) =
let
  val
  knd = (knd >> 3)
in
  if knd <= 1 then knd else ~1
end // end of [sortpol]

(* ****** ****** *)
(*
//
val () =
assertloc(sortbox(TYPESORT00) = 0)
val () =
assertloc(sortbox(TBOXSORT01) = 1)
val () =
assertloc(sortbox(TFLTSORT10) = 0)
//
val () =
assertloc(sortlin(TYPESORT00) = 0)
val () =
assertloc(sortlin(VTBOXSORT01) = 1)
val () =
assertloc(sortlin(VTFLTSORT10) = 1)
//
val () =
assertloc(sortprf(TYPESORT00) = 0)
val () =
assertloc(sortprf(PROPSORT01) = 1)
val () =
assertloc(sortprf(VIEWSORT10) = 1)
//
val () =
assertloc(sortpol(TYPESORT00) = 0)
val () =
assertloc(sortpol(VTYPESORT01) > 0)
val () =
assertloc(sortpol(VTYPESORT10) < 0)
//
*)
(* ****** ****** *)

implement
sortpolpos
  (knd) = let
//
val knd = g0i2u(knd)
val knd = knd land 07u
//
in
  POLPOS(g0uint2int(knd))
end // end of [sortpolpos]

implement
sortpolneg
  (knd) = let
//
val knd = g0i2u(knd)
val knd = knd land 07u
//
in
  POLNEG(g0uint2int(knd))
end // end of [sortpolneg]

(* ****** ****** *)

implement
subsort_int_int
  (x1, x2) =
(
if
(sortbox(x1) < sortbox(x2))
then false
else
(
if
(sortlin(x1) > sortlin(x2))
then false
else
(
if
(sortprf(x1) <= sortprf(x2)) then true else false
)
)
) (* end of [subsort_int_int] *)

(* ****** ****** *)

implement
fprint_dctkind
  (out, knd) =
(
//
case+ knd of
| DCKfun() =>
  fprint(out, "DCKfun")
| DCKval() =>
  fprint(out, "DCKval")
| DCKpraxi() =>
  fprint(out, "DCKpraxi")
| DCKprfun() =>
  fprint(out, "DCKprfun")
| DCKprval() =>
  fprint(out, "DCKprval")
| DCKfcast() =>
  fprint(out, "DCKfcast")
//
| DCKunknown() =>
  fprint(out, "DCKunknown")
//
) (* end of [fprint_dctkind] *)

(* ****** ****** *)

implement
fprint_valkind
  (out, vlk) =
(
//
case+ vlk of
| VLKval() => fprint(out, "VLKval")
| VLKvalp() => fprint(out, "VLKvalp")
| VLKvaln() => fprint(out, "VLKvaln")
(*
| VLKmcval() => fprint(out, "VLKprval")
*)
| VLKprval() => fprint(out, "VLKprval")
//
) (* end of [fprint_valkind] *)

(* ****** ****** *)
//
implement
funkind_isprf
  (fnk) =
(
case+ fnk of
//
| FNKprfn0() => true
| FNKprfn1() => true
| FNKprfun() => true
//
| FNKpraxi() => true
//
| _(*rest-of-fnk*) => false
)
//
implement
funkind_isrec
  (fnk) =
(
case+ fnk of
| FNKfnx() => true
| FNKfn1() => true
| FNKfun() => true
//
| FNKprfn1() => true
| FNKprfun() => true
//
| _(*rest-of-fnk*) => false
)
//
(* ****** ****** *)

implement
fprint_funkind
  (out, fnk) =
(
//
case+ fnk of
| FNKfn0() => fprint(out, "FNKfn0")
| FNKfnx() => fprint(out, "FNKfnx")
| FNKfn1() => fprint(out, "FNKfn1")
| FNKfun() => fprint(out, "FNKfun")
//
| FNKprfn0() => fprint(out, "FNKprfn0")
| FNKprfn1() => fprint(out, "FNKprfn1")
| FNKprfun() => fprint(out, "FNKprfun")
| FNKpraxi() => fprint(out, "FNKpraxi")
//
| FNKfcast() => fprint(out, "FNKfcast")
//
) (* end of [fprint_funkind] *)

(* ****** ****** *)

implement
fprint_impkind
  (out, knd) =
(
case+ knd of
| IMPprf() => fprint!(out, "IMPprf")
| IMPval() => fprint!(out, "IMPval")
| IMPfun() => fprint!(out, "IMPfun")
| IMPtmp() => fprint!(out, "IMPtmp")
| IMPgen() => fprint!(out, "IMPgen")
) (* end of [fprint_impkind] *)

(* ****** ****** *)

implement
FC2cloflt = FC2clo(0)
implement
FC2cloptr = FC2clo(1)
implement
FC2cloref = FC2clo(~1)
implement
FC2lincloflt = FC2clo(2)
implement
FC2lincloptr = FC2clo(3)

(* ****** ****** *)

implement
funclo2_isclo(fc2) =
(
case+ fc2 of
| FC2fun() => false | FC2clo(k2) => true
)

(* ****** ****** *)

implement
funclo2_equal
(fc1, fc2) =
(
case+ fc1 of
| FC2fun() =>
  (
  case+ fc2 of
  | FC2fun() => true | FC2clo(k2) => false
  )
| FC2clo(k1) =>
  (
  case+ fc2 of
  | FC2fun() => false | FC2clo(k2) => (k1 = k2)
  )
) (* end of [funclo2_equal] *)

(* ****** ****** *)
//
implement
funclo2_islin(fc2) =
(
case+ fc2 of
//
| FC2fun() => false
//
| FC2clo(knd) =>
  (
  ifcase
  | knd=LINCLOFLT => true
  | knd=LINCLOPTR => true
  | _ (* non-FC2lin... *) => false
  )
//
) (* end of [funclo2_islin] *)
//
implement
funclo2_linize(fc2) =
(
case+ fc2 of
//
| FC2fun() => fc2
//
| FC2clo(knd) =>
  (
  ifcase
  | knd=CLOFLT => FC2lincloflt
  | knd=CLOPTR => FC2lincloptr
  | _ (* else *) => fc2(*nonlin*)
  )
) (* end of [funclo2_linize] *)
//
(* ****** ****** *)
//
implement
print_funclo2(fc2) =
fprint_funclo2(stdout_ref, fc2)
implement
prerr_funclo2(fc2) =
fprint_funclo2(stderr_ref, fc2)
//
implement
fprint_funclo2(out, fc2) =
(
case+ fc2 of
| FC2fun() =>
  fprint!(out, "FC2fun()")
| FC2clo(knd) =>
  fprint!(out, "FC2clo(", knd, ")")
)
//
(* ****** ****** *)

implement
intsign(rep) =
(
loop(string2ptr(rep))
) where
{
fun
loop(p0: ptr): int =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
if iseqz(c0) then 0 else
(
if
toupper(c0) = 'U'
then 1 else loop(ptr0_succ<char>(p0))
)
end
} (* end of [intsign] *)

(* ****** ****** *)

implement
intsize(rep) =
(
loop(string2ptr(rep), 0)
) where
{
fun
loop(p0: ptr, r0: int): int =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
if iseqz(c0) then r0 else
(
  if
  toupper(c0) != 'L'
  then loop(ptr0_succ<char>(p0), r0)
  else loop(ptr0_succ<char>(p0), r0+1)
)
end
} (* end of [intsign] *)

(* ****** ****** *)

local
//
#staload
"prelude/SATS/string.sats"
#staload
"prelude/DATS/string.dats"
//
in (* in-of-local *)

implement
xats_string_append
  (xs, ys) = let
  val xs = g1ofg0(xs)
  and ys = g1ofg0(ys)
in
  $effmask_all
  (strptr2string(string_append<>(xs, ys)))
end // end of [xats_string_append]

end // end of [local]

(* ****** ****** *)

(* end of [xats_basics.dats] *)
