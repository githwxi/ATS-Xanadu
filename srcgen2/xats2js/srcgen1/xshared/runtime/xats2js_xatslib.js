// Mon Apr 28 12:13:50 AM EDT 2025
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/*
the beg of
[ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_xatslib.js]
*/
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
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
Fri 09 Aug 2024 07:40:11 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*/
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_size
  (map)
{
  return map.size // HX: field!
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_make_nil
  (   )
{
  var map = new Map(); return map
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_keyq
  (map, key)
{
  return map.has(key) // HX: bool
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_search$tst
  (map, key)
{
  return map.has(key) // HX: bool
}
//
/////////////////////////////////////////////////////////////////////////
//
/*
fun<>
UN_jshsmap_get$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k): ( x )
fun<>
UN_jshsmap_set$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k, itm: x): void
*/
//
function
XATS2JS_jshsmap_get$at$raw
  (map, key)
{
  return map.get(key)
}
function
XATS2JS_jshsmap_set$at$raw
  (map, key, itm)
{
  map.set(key, itm); return // HX: void
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_insert$raw
  (map, key, itm)
{
  map.set(key, itm); return // HX: void
}
//
/////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_jshsmap_forall_f2un
  (map, test)
{
  for (const kx of map.entries()) {
    if (!test(kx[0], kx[1])) return false
  }
  return true // HX: all the key-value pairs have passed!
}
//
/////////////////////////////////////////////////////////////////////////
//
/*
HX-2024-08-14:
Wed 14 Aug 2024 03:38:56 PM EDT
*/
function
XATS2JS_jshsmap_iter_make
  ( A )
{
  return A.entries() // HX: Hsmap iterator
}
//
function
XATS2JS_jshsmap_iter_next$work
  (iter, work)
{
  var next = iter.next()
  if (next.done) return false // HX: done!
  var value = next.value
  // HX: value != undefined
  work(value[0], value[1]); return true // HX: more to do!
}
//
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//
// end of [ATS3/XANADU_xatslib_DATS_CATS_JS_Hsmap00.cats]
//
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
