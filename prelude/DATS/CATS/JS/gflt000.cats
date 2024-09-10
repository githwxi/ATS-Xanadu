////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

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

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Mon 09 Sep 2024 06:14:11 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_neg
  ( i1 )
{
  return ( -i1 ) // HX: neg
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_lt_dflt
  (i1, i2)
{
  return (i1 < i2) // HX: lt
}
function
XATS2JS_dflt_gt_dflt
  (i1, i2)
{
  return (i1 > i2) // HX: gt
}
//
function
XATS2JS_dflt_lte_dflt
  (i1, i2)
{
  return (i1 <= i2) // HX: lte
}
function
XATS2JS_dflt_gte_dflt
  (i1, i2)
{
  return (i1 >= i2) // HX: gte
}
//
function
XATS2JS_dflt_eq_dflt
  (i1, i2)
{
  return (i1 === i2) // HX: equal
}
function
XATS2JS_dflt_neq_dflt
  (i1, i2)
{
  return (i1 !== i2) // HX: noteq
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_add_dflt
  (i1, i2)
{
  return (i1 + i2) // HX: add
}
//
function
XATS2JS_dflt_sub_dflt
  (i1, i2)
{
  return (i1 - i2) // HX: sub
}
//
//
function
XATS2JS_dflt_mul_dflt
  (i1, i2)
{
  return (i1 * i2) // HX: mul
}
//
function
XATS2JS_dflt_div_dflt
  (i1, i2)
{
  return Math.trunc(i1 / i2)
}
//
function
XATS2JS_dflt_mod_dflt
  (i1, i2)
{
  return (i1 % i2) // HX: mod
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_print
  ( f0 )
{
  let cs = f0.toString()
  XATS2JS_the_print_store.push(cs); return
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_gint000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
