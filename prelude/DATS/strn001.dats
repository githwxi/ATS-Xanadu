(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 07 Aug 2024 02:18:49 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
strn_forall<> =
gasz_forall<strn><cgtz>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_forall(cs) =
(
  nint_iforall<>(n0))
where
{
//
val n0 = strn_length<>(cs)
//
#impltmp
iforall$test
<nint>(i0, _) =
(
  forall$test<cgtz>(c0)) where
{
val c0 =
  $UN.strn_get_at_raw<>(cs, i0)
}
}(*where*)//end-of-[strn_forall(cs)]
//
#impltmp
gasz_forall
<strn><cgtz> = strn_forall<>(*void*)
#impltmp
gseq_forall
<strn><cgtz> = strn_forall<>(*void*)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rforall(cs) =
(
  nint_rforall<>(n0))
where
{
//
val n0 = strn_length<>(cs)
//
#impltmp
rforall$test<ni>(i0) =
(
  forall$test<cgtz>(c0)) where
{
val c0 =
  $UN.strn_get_at_raw<>(cs, i0)
}
}(*where*)//end-of-[strn_rforall(cs)]
//
#impltmp
gasz_rforall
<strn><cgtz> = strn_rforall<>(*void*)
#impltmp
gseq_rforall
<strn><cgtz> = strn_rforall<>(*void*)
//
(* ****** ****** *)
//
(*
HX-2024-08-07:
The following code simply
indicate no need for these
special function interfaces!
Wed 07 Aug 2024 02:22:37 PM EDT
*)
#impltmp
<>(*tmp*)
strn_iforall = gasz_iforall<strn><cgtz>
#impltmp
<>(*tmp*)
strn_irforall = gasz_irforall<strn><cgtz>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_strn001.dats] *)
