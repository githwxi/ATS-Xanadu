/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

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

/* ****** ****** */
//
/*
Author: Hongwei Xi
(*
Sun 21 Jul 2024 01:21:25 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*/
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_jsarray_forall_c1fr
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
/* ****** ****** */
//
function
XATS2JS_jsarray_rforall_c1fr
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
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_jsarray_sortref_c2fr
  (A, cmpr)
{
    A.sort(cmpr); return // HX: [A] is mutated!
}
//
/* ****** ****** */
/* ****** ****** */
//
/* ****** ****** *//* ****** ****** */
/* ****** ****** *//* ****** ****** */

/* end of [ATS3/XANADU_xatslib_JS_DATS_CATS_Array.cats] */
