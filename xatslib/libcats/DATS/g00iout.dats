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
// For generic IO ops
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
"./../SATS/libcats.sats"
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
g_inp_char() =
(fgetc_ref(g_stdin<>()))
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
g_inp_cstrm() =
(
fmain(g_stdin<>())) where
{
//
fun
fmain
(
fr: FILEref
) : strm_vt(int) =
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
strmcon_vt_cons(c0, fmain(fr))
end // end of [let]
)
//
} (* end of [g_inp_cstrm] *)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
g_inp_line_list() =
list_vt2t{char}
(g_inp_lline_list<>((*void*)))
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
g_inp_lline_list() =
list_vt_reverse0<char>
(g_inp_lline_rlist<>((*void*)))
//
#impltmp
<>(*tmp*)
g_inp_lline_rlist() =
(
loop(list_vt_nil())
) where
{
//
val EOL = '\n'
//
fun
loop
( cs
: list_vt(char)
)
: list_vt(char) =
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
  then ( cs )
  else loop(list_vt_cons(c0, cs))
end
else cs // end of [else]
end
}(*where*)//end-of(g_inp_lline_rlist)
//
(* ****** ****** *)
//
#impltmp
gl_print$out<> = g_print$out<>
//
(* ****** ****** *)
//
#impltmp
{x0:t0}
prout_ref<x0>(x0) =
fprint_ref<x0>(g_stdout<>(), x0)
#impltmp
{x0:t0}
prerr_ref<x0>(x0) =
fprint_ref<x0>(g_stderr<>(), x0)
//
(* ****** ****** *)
//
#impltmp
{x0:vt}
prout1_ref<x0>(x0) =
fprint1_ref<x0>(g_stdout<>(), x0)
#impltmp
{x0:vt}
prerr1_ref<x0>(x0) =
fprint1_ref<x0>(g_stderr<>(), x0)
//
(* ****** ****** *)

#impltmp
{x0:t0}
fprint_ref<x0>
  (out, x0) =
(
  g_print<x0>(x0)) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end-of(fprint_ref)

(* ****** ****** *)
//
#impltmp
{x0:vt}
fprint0_ref<x0>(out, x0) =
  ( g_free<x0>(x0) ) where
{
  val () = fprint1_ref<x0>(out,x0)
}
#impltmp
{x0:vt}
fprint0_ptr<x0>(out, x0) =
  ( g_free<x0>(x0) ) where
{
  val () = fprint1_ptr<x0>(out,x0)
}
//
(* ****** ****** *)

#impltmp
{x0:vt}
fprint1_ref<x0>
  (out, x0) =
(
  gl_print1<x0>(x0)) where
{
  #impltmp gl_print$out<>() = out
} (*where*) // end-of(fprint_ref)

(* ****** ****** *)
(*
//
HX-2022-06-03:
For implementing the base cases:
//
*)
(* ****** ****** *)

#impltmp
fprint_ref<sint> =
XATS2CC_fprint_sint where
{
fun
XATS2CC_fprint_sint
(FILEref, sint): void = $extnam()
}
#impltmp
fprint_ref<char> =
XATS2CC_fprint_char where
{
fun
XATS2CC_fprint_char
(FILEref, char): void = $extnam()
}

(* ****** ****** *)
//
#impltmp
g_print<char>(x0) =
fprint_ref<char>(g_print$out<>(), x0)
#impltmp
g_print<sint>(x0) =
fprint_ref<sint>(g_print$out<>(), x0)
//
(* ****** ****** *)

(* end of [xatslib_libcats_g00iout.dats] *)
