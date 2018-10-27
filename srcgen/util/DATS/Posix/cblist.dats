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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload
"libats/libc/SATS/stdio.sats"

(* ****** ****** *)
//
#staload "./../../SATS/cblist.sats"
#staload "./../../SATS/Posix/cblist.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
fpath_get_cblist
  (path, bsz) = let
//
val
opt =
fileref_open_opt
(path, file_mode_r)
//
in
  case+ opt of
  | ~None_vt() =>
     None_vt(*void*)
  | ~Some_vt(inp) =>
     fileref_get_cblist(inp, bsz)
//
end // end of [fpath_get_cblist]

(* ****** ****** *)

implement
{}(*tmp*)
fpath_get_cblist_vt
  (path, bsz) = let
//
val
opt =
fileref_open_opt(path, file_mode_r)
//
in
  case+ opt of
  | ~None_vt() =>
     None_vt(*void*)
  | ~Some_vt(inp) =>
     fileref_get_cblist_vt(inp, bsz)
//
end // end of [fpath_get_cblist_vt]

(* ****** ****** *)
//
implement
fileref_get_cblist(inp, bsz) =
(
  $UN.castvwtp0
    (fileref_get_cblist_vt(inp, bsz))
  // $UN.castvwtp0
)
//
(* ****** ****** *)

implement
cblist_vt_free(cbs) =
(
case+ cbs of
| ~cblist_vt_nil() => ()
| ~cblist_vt_cons(n, A, cbs) =>
   (arrayptr_free(A); cblist_vt_free(cbs))
)

(* ****** ****** *)

implement
fileref_get_cblist_vt
  (inp, bsz) = let
//
fun
loop
(res: &ptr? >> cblist_vt): void =
(
if
fileref_is_eof(inp)
then
(
  res := cblist_vt_nil()
)
else let
//
  val buf =
  arrayptr_make_uninitized<uchar>(bsz)
  val bufp = arrayptr2ptr(buf)
  val nread =
  $extfcall(Size, "fread", bufp, 1, bsz, inp)
//
in
  if
  (nread > 0)
  then let
    val ((*void*)) =
    res :=
    cblist_vt_cons
    (nread, $UN.castvwtp0(buf), _)
    val+cblist_vt_cons(_, _, res2) = res
    val ((*void*)) = loop(res2)
    prval ((*folded*)) = fold@(res)
  in
    // nothing
  end // end of [then]
  else let
    val () =
    arrayptr_free(buf) in res := cblist_vt_nil()
  end // end of [else]
end // else
) (* end of [if] *)
//
in
  let var res: ptr in loop(res); Some_vt(res) end
end // end of [fileref_get_cblist_vt]

(* ****** ****** *)

(* end of [Posix_cblist.dats] *)
