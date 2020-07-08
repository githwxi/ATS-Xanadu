(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic ordering
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
(*
#staload
"./../SATS/gios.sats"
*)
//
(* ****** ****** *)
//
#staload
"xatslib\
/libc/DATS/stdio.dats"
//
(* ****** ****** *)

impltmp
<>(*tmp*)
g_inp_char() =
fgetc_ref(g_stdin<>())

(* ****** ****** *)

impltmp
<>(*tmp*)
g_inp_cstream() =
(
  auxmain(g_stdin<>())
) where
{
//
fun
auxmain
(
fr: FILEref
) : stream_vt(int) =
$llazy
(
let
val c0 = fgetc_ref(fr)
in
  if
  (c0 < 0) // EOF
  then
  strmcon_vt_nil((*void*))
  else
  strmcon_vt_cons(c0, auxmain(fr))
end // end of [let]
)
//
} (* end of [g_inp_chars] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
g_inp_line_list() =
list_vt2t{char}(g_inp_lline_list<>())
//
(* ****** ****** *)

impltmp
<>(*tmp*)
g_inp_lline_list() =
let
//
val EOL = '\n'
//
fun
loop
( cs
: list_vt(char)): list_vt(char) =
let
val c0 = g_inp_char<>()
in
  if
  (c0 >= 0)
  then
  let
  val c0 = char(c0)
  in
  if
  (c0 = EOL)
  then cs else loop(list_vt_cons(c0, cs))
  end
  else cs // end of [else]
end
//
in
  list_vt_reverse<char>(loop(list_vt_nil()))
end // end of [g_inp_lline_list]

(* ****** ****** *)

(* end of [gios.dats] *)
