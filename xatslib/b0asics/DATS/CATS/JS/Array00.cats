/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                         Applied Type System                         //
//                                                                     //
/////////////////////////////////////////////////////////////////////////
/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
*/
/////////////////////////////////////////////////////////////////////////
//
/*
Author: Hongwei Xi
(*
Sun 21 Jul 2024 01:21:25 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*/
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_length
  ( A )
{
  return A.length
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_get$at
  (A, i)
{
  return A[i]
}
function
XATS2JS_jsarray_set$at
  (A, i, x)
{
  return (A[i] = x)
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_make_ncpy
  (n, x) // HX: [x]: nonlin
{
  let i
  let A = new Array(n)
  for (i = 0; i < n; i += 1)
  {
    A[i] = x
  }
  return A // HX: A = [x, x, ..., x]
}
//
function
XATS2JS_jsarray_make_nfun
  (n, f)
{
  let i
  let A = new Array(n)
  for (i = 0; i < n; i += 1)
  {
    A[i] = f(i)
  }
  return A // HX: A = [f(0),...,f(n-1)]
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_make0_1val
  ( x1 )
{
  return [x1]; // len = 1
}
function
XATS2JS_jsarray_make0_2val
  ( x1, x2 )
{
  return [x1, x2]; // len = 2
}
function
XATS2JS_jsarray_make0_3val
  ( x1, x2, x3 )
{
  return [x1, x2, x3]; // len = 3
}
//
/////////////////////////////////////////////////////////////////////////
//
// HX-2024-07-25:
// Thu 25 Jul 2024 06:03:30 PM EDT
//
function
XATS2JS_jsarray_fmake_fwork
  (fwork)
{
  let A = []
  fwork((x) => A.push(x)); return A
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_forall_f1un
  (A, test)
{
  let i0
  let n0 = A.length
  for (i0 = 0; i0 < n0; i0 += 1)
  {
    if (!test(A[i0])) return false
  }
  return true // all xs in A pass the test
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_rforall_f1un
  (A, test)
{
  let i0
  let n0 = A.length
  for (i0 = 0; i0 < n0; i0 += 1)
  {
    if (!test(A[n0-1-i0])) return false
  }
  return true // all xs in A pass the test
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_mapref_f1un
  (A, fopr)
{
  let i0
  let n0 = A.length
  for (i0 = 0; i0 < n0; i0 += 1)
  {
    A[i0] = fopr(A[i0])
  }
  return // HX: Applying (x)=>fopr(x) to [A]
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_sortref_f2un
  (A, cmpr)
{
  A.sort(cmpr); return // HX: [A] is mutated!
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsarray_iforall_f2un
  (A, test)
{
  let i0
  let n0 = A.length
  for (i0 = 0; i0 < n0; i0 += 1)
  {
    if (!test(i0, A[i0])) return false
  }
  return true // HX: all xs in A have passed the test!
}
/*
// HX-2024-08-09:
// This is likely to be less efficient!
function
XATS2JS_jsarray_iforall_f2un
  (A, test)
{
  for (const ix of A.entries()) {
    if (!test(ix[0], ix[1])) return false
  }
  return true // HX: all xs in A have passed the test!
}
*/
//
/////////////////////////////////////////////////////////////////////////
//
/*
HX-2024-08-14:
Wed 14 Aug 2024 03:37:41 PM EDT
*/
function
XATS2JS_jsarray_iter_make
  ( A )
{
  return A.entries() // HX: Array iterator
}
//
function
XATS2JS_jsarray_iter_next$work
  (iter, work)
{
  var next = iter.next()
  if (next.done) return false // HX: it is done!
  var value = next.value
  // HX: value != undefined
  work(value[0], value[1]); return true // HX: more to do!
}
//
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//
// end of [ATS3/XANADU_xatslib_DATS_CATS_JS_Array00.cats]
//
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
