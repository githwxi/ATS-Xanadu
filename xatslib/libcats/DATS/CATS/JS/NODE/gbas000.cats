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
Sun 15 Sep 2024 05:51:02 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_g_stdin()
{
  return process.stdin ; }
//
function
XATS2JS_NODE_g_stdout()
{
  return process.stdout ; }
function
XATS2JS_NODE_g_stderr()
{
  return process.stderr ; }
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_g_fprint
  (x0, out)
{
  out.write(x0.toString());
  return; // XATS2JS_NODE_g_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_sint_fprint
  (i0, out)
{
  XATS2JS_NODE_g_fprint(i0, out);
  return; // XATS2JS_NODE_sint_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_bool_fprint
  (b0, out)
{
  XATS2JS_NODE_g_fprint(b0, out);
  return; // XATS2JS_NODE_bool_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_char_fprint
  (c0, out)
{
  XATS2JS_NODE_g_fprint(c0, out);
  return; // XATS2JS_NODE_char_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_dflt_fprint
  (f0, out)
{
  XATS2JS_NODE_g_fprint(f0, out);
  return; // XATS2JS_NODE_dflt_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_strn_fprint
  (cs, out)
{
  XATS2JS_NODE_g_fprint(cs, out);
  return; // XATS2JS_NODE_strn_fprint
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_process_argv
  (/*void*/)
{
  return process.argv // HX: a1sz(strn)
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_JS_NODE_gbas000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
