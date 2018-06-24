(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)

implement
p_i0nt(buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_INT1 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_INT2 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_INT3 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | _ (* non-INT *) =>
    (err := err + 1; i0nt_none(tok))
end // end of [p_i0nt]

(* ****** ****** *)

(* end of [xats_parsing_staexp.dats] *)
