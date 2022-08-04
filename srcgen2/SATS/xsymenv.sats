(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Mon Jul 25 11:55:55 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
//
#typedef sym_t = $SYM.sym_t
//
#typedef
topmap(itm:t0) = $MAP.topmap(itm)
#vwtpdef
stkmap(itm:t0) = $MAP.stkmap(itm)
//
(* ****** ****** *)

#absvwtp
symenv_vtbx(itm:t0)
#vwtpdef
symenv(itm:t0) = symenv_vtbx(itm)

(* ****** ****** *)
//
fun
symenv_make_nil
  {itm:tbox}( (*void*) ) : symenv(itm)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xats_xsymenv.sats] *)
