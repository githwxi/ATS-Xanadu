/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/*
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
*/

/* ****** ****** */
//
// Author: Hongwei Xi
// Start Time: June, 2018
// Authoremail: gmhwxi@gmail.com
//
/* ****** ****** */
//
#ifndef \
ATS3_SRCGEN_CATS_XATS_PARSING
#define \
ATS3_SRCGEN_CATS_XATS_PARSING
//
/* ****** ****** */

/*
typedef
tokbuf_tflat =
$extype_struct
"xats_tokbuf_struct" of
{
  token *begp;
  token *endp;
  token *curp;
} (* end of [tokbuf] *)
*/

typedef struct {
//
  atstype_ptr begp ; // start
  atstype_ptr endp ; // finish
  atstype_ptr curp ; // current
//
} xats_tokbuf_struct ;

/* ****** ****** */
//
#endif // end if [ifndef]
// [ATS3_SRCGEN_CATS_XATS_PARSING]
//
/* ****** ****** */

/* end of [xats_parsing.cats] */
