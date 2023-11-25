(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Nov 25 11:38:56 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local
//
(*
#absimpl // s2cst->s2typ
ms2ct2p_tbox = topmap(s2typ)
*)
//
datavwtp
trdienv =
TRDIENV of ()
#absimpl trdienv_vtbx = trdienv
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
trdienv_make_nil
  ((*void*)) = TRDIENV( (*void*) )
//
(* ****** ****** *)
//
#implfun
trdienv_free_top
  (  env0  ) =
(
case+ env0 of ~TRDIENV( (*0*) ) => ()
) (*case+*)//end-of-(trdienv_free_top(env0))
//
(* ****** ****** *)
end(*local*) // end of [local(trdienv)]
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0_myenv0.dats] *)
