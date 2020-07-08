/* ******************************************************************* */
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/* ******************************************************************* */

/*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
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

/*
(* Author: Hongwei Xi *)
(* Start time: May 24, 2020 *)
(* Authoremail: gmhwxiATgmailDOTcom *)
*/

/* ****** ****** */

#ifndef XATSOPT_BASICS_H
#define XATSOPT_BASICS_H

/* ****** ****** */
//
// HX: boolean values
//
#define XATS_BOOL_TRUE 1
#define XATS_BOOL_FALSE 0
//
/* ****** ****** */

#define XATS_PTR0_NULL ((void*)0)

/* ****** ****** */

#define XATS_STRUCT struct

/* ****** ****** */

#define XATS_ABSIMPL(flag) void *flag = (void*)0

/* ****** ****** */

#endif /* XATSOPT_BASICS_H */

/* ****** ****** */

/* end of [xatsopt_basics.h] */
