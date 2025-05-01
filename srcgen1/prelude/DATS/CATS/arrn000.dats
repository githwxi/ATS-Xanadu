(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Wed Apr 30 09:09:19 AM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
// HX: 0-dimensional
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:vt }
a0ptr_free<a> =
XATS000_a0ptr_free
where
{
#extern
fun
XATS000_a0ptr_free
{a:vt}
( A0
: a0ptr(a)): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ a:t0 }
a0ref_get<a> =
XATS000_a0ref_get where
{
#extern
fun
XATS000_a0ref_get
{a:t0}
( A0
: a0ref(a)): ( a ) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ a:t0 }
a0ref_set<a> =
XATS000_a0ref_set where
{
#extern
fun
XATS000_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ a:vt }
a0ref_dtget<a> =
XATS000_a0ref_dtget where
{
#extern
fun
XATS000_a0ref_dtget
{a:vt}
( A0
: a0ref(a)): (?!a) = $extnam()
}
//
#impltmp
{ a:vt }
a0ref_dtset<a> =
XATS000_a0ref_dtset where
{
#extern
fun
XATS000_a0ref_dtset
{a:vt}
( A0
: a0ref(a), x0: ?!a): void = $extnam()
}
(* ****** ****** *)
//
#extern
fun
XATS000_a0ptr_alloc
{a:vt}
(
// argless
) : a0ptr(?a) = $extnam()
#impltmp
{a:vt}
a0ptr_alloc<a> = XATS000_a0ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XATS000_a0ptr_make0_1val
{a:vt}
(
x0: a
) : a0ptr(a) = $extnam()
#impltmp
{ a:vt }
a0ptr_make0_1val<a> = XATS000_a0ptr_make0_1val
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:vt }
a1ptr_free<a>(A0, n0) = () // GC
//
#impltmp
{ a:vt }
a1ptr_mfree0<a>(  A0  ) = () // GC
#impltmp
{ a:vt }
a1ptr_clear1<a>(A0, n0) = () // GC
//
(* ****** ****** *)
//
#extern
fun
XATS000_a1ptr_alloc
{a:vt}
{n:nat}
( asz
: int(n))
: a1ptr(?a, n) = $extnam((*self*))
#impltmp
{ a:vt }
a1ptr_alloc<a> = XATS000_a1ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XATS000_a1ref_get$at
{a:t0}
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n)): a = $extnam()
#impltmp
{ a:t0 }
a1ref_get$at<a> = XATS000_a1ref_get$at
//
#extern
fun
XATS000_a1ptr_get$at1
{a:t0}
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n)): a = $extnam()
#impltmp
{ a:t0 }
a1ptr_get$at1<a> = XATS000_a1ptr_get$at1
//
(* ****** ****** *)
//
#impltmp
{ a:t0 }
a1ref_set$at<a> =
XATS000_a1ref_set$at
where{
#extern
fun
XATS000_a1ref_set$at
{a:t0}
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n), x0: a): void = $extnam()
}(*where*)//end-of-[impltmp(a1ref_set$at<a>)]
//
#impltmp
{ a:t0 }
a1ptr_set$at1<a> =
XATS000_a1ptr_set$at1
where{
#extern
fun
XATS000_a1ptr_set$at1
{a:t0}
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n), x0: a): void = $extnam()
}(*where*)//end-of-[impltmp(a1ref_set$at1<a>)]
//
(* ****** ****** *)
//
#impltmp
{ a:vt }
a1ref_dtget$at<a> =
XATS000_a1ref_dtget$at
where{
#extern
fun
XATS000_a1ref_dtget$at
{a:vt}
{n:i0}
( A0
: a1ref(a, n), i0: nintlt n): (~a) = $extnam()
}(*where*)//end-of-[impltmp(a1ref_dtget$at<a>)]
//
#impltmp
{ a:vt }
a1ptr_dtget$at1<a> =
XATS2JS_a1ptr_dtget$at1 where
{
#extern
fun
XATS2JS_a1ptr_dtget$at1
{a:vt}
{n:i0}
(A0: a1ptr(a, n), i0: nintlt(n)): ~a = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_arrn000.dats] *)
(***********************************************************************)
