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
// For processing files abstractly
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: November, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload
"xatslib\
/libc/SATS/libc.sats"
(* ****** ****** *)
//
#extern
fun<>
fpath_streamize_char
(path: string): stream_vt(char)
//
#extern
fun<>
fpath_streamize_cgtz
(path: string): stream_vt(cgtz)
#extern
fun<>
fpath_streamize_line
(path: string): stream_vt(string)
#extern
fun<>
fpath_streamize_line_vt
(path: string): stream_vt(string_vt)
//
(* ****** ****** *)

impltmp
<>(*tmp*)
fpath_streamize_line
  (path) =
stream_vt_map0
(
fpath_streamize_line_vt<>(path)
) where
{
typedef y0 = string
vwtpdef x0 = string_vt
impltmp
map0$fopr<x0><y0>(x0) = string_vt2t(x0)
}

(* ****** ****** *)

impltmp
<>(*tmp*)
fpath_streamize_line_vt
  (path) =
(
auxmain0
(
fpath_streamize_cgtz<>(path)
)
) where
{
//
vwtpdef
cstream =
stream_vt(cgtz)
//
fun
iseol
( c0
: cgtz )
: bool = (c0 = '\n')
fnx
auxmain0
( cs
: cstream)
: stream_vt(string_vt) =
$llazy
(
free(cs);
case+ !cs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(c0, cs) =>
if
iseol(c0)
then
strmcon_vt_cons
(l1, auxmain0(cs)) where
{
  val l1 = string_vt_nil()
}
else
let
val rs =
list_vt_sing(c0) in auxmain1(cs, rs)
end
)
and
auxmain1
( cs
: cstream
, rs
: list_vt(cgtz))
: strmcon_vt(string_vt) =
(
case+ !cs of
| ~
strmcon_vt_nil() =>
(
strmcon_vt_sing(l1)
) where
{
val rs =
list_vt_reverse(rs)
val l1 =
string_vt_make_list_vt(rs)
}
| ~
strmcon_vt_cons(c0, cs) =>
if
iseol(c0)
then
let
val rs =
list_vt_reverse(rs)
val l1 =
string_vt_make_list_vt(rs)
in
  strmcon_vt_cons(l1, auxmain0(cs))
end
else 
(
  auxmain1(cs, list_vt_cons(c0, rs))
)
) (* end of [auxmain1] *)
//
} (* end of [fpath_streamize_line] *)

(* ****** ****** *)

(* end of [xatslib_libc_fpath.dats] *)
