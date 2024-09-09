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
