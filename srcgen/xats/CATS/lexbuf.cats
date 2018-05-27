/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/*
** ATS/Postiats - Unleashing the Potential of Types!
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
*/

/* ****** ****** */
//
// Author: Hongwei Xi
// Start Time: May, 2018
// Authoremail: gmhwxi@gmail.com
//
/* ****** ****** */

#ifndef XANADU_SRCGEN_CATS_LEXBUF
#define XANADU_SRCGEN_CATS_LEXBUF

/* ****** ****** */

typedef
lexbuf_int_int
  (m: int, n:int) =
$extype_struct
"xats_lexbuf_struct" of
{
  base_ntot= int
, base_nrow= int
, base_ncol= int
, nspc= int
, cbuf= string
, cptr0= ptr, cptr1= ptr
, cblist= cblist
} (* end of [lexbuf] *)

typedef struct {
//
  atstype_int ntot ; // char number
  atstype_int nrow ; // line number
  atstype_int ncol ; // line offset
//
  atstype_int nspc ; // leading space
//
  atstype_void cptr0 ; // start
  atstype_void cptr1 ; // finish
  atstype_void cbhead ; // 1st cblock
  atstype_void cbtail ; // rest of cblocks
//
} xats_lexbuf_struct ;

/* ****** ****** */

#endif // end of [XANADU_SRCGEN_CATS_LEXBUF]

/* ****** ****** */

/* end of [xats_lexbuf.cats] */
