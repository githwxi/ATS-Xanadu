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
Sun 01 Sep 2024 08:04:48 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
const
XATS2JS_NODE_fs =
require('node:fs')
// HX: the same as require('fs')
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_g_print
  (x0)
{
  let rep = x0.toString();
  process.stdout.write(rep);
  return; // XATS2JS_NODE_g_print
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_sint_print
  (i0)
{
  XATS2JS_NODE_g_print(i0);
  return; // XATS2JS_NODE_sint_print
}
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_bool_print
  (b0)
{
  XATS2JS_NODE_g_print(b0);
  return; // XATS2JS_NODE_bool_print
}
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_char_print
  (c0)
{
  let cs =
  String.fromCharCode(c0)
  XATS2JS_NODE_g_print(cs);
  return; // XATS2JS_NODE_char_print
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_dflt_print
  (f0)
{
  XATS2JS_NODE_g_print(f0);
  return; // XATS2JS_NODE_dflt_print
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_strn_print
  (cs)
{
  XATS2JS_NODE_g_print(cs);
  return; // XATS2JS_NODE_strn_print
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_NODE_node000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
