(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload
  FP0 = "./filpath.sats"
typedef
  filpath = $FP0.filpath
//
(* ****** ****** *)
abstbox
fpathenv_tbox = ptr
typedef
fpathenv = fpathenv_tbox
(* ****** ****** *)
//
fun
fpathenv_get_level
( fpenv: fpathenv ) : int
//
fun
fpathenv_inc_level
( fpenv: fpathenv ) : void
fun
fpathenv_dec_level
( fpenv: fpathenv ) : void
//
(* ****** ****** *)
//
fun
the_XATSHOME_get(): string
//
(* ****** ****** *)
//
fun
the_global_level
  ((*void*)): int//top:0/err:-1
//
(* ****** ****** *)
fun
the_global_fpiadd1
  (fpath: filpath): void
(* ****** ****** *)
//
fun
the_global_fpsrch0
  ((*current*)): Option_vt(fpathenv)
fun
the_global_fpsrch1
  (fpath: filpath): Option_vt(fpathenv)
//
(* ****** ****** *)

(* end of [xats_xglobal.sats] *)
