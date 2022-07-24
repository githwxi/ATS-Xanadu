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
#staload
"./../SATS/githwxi.sats"
(* ****** ****** *)
//
(*
HX:
For processing files abstractly
*)
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: November, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_strmize_cgtz
  (path) =
let
val cs = 
fpath_strmize_char<>(path)
in
  fmain(cs) where
{
fun
fmain
( cs
: strm_vt(char)
)
: strm_vt(cgtz) =
$llazy
(
case+ !cs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(c1, cs) =>
if
eqz(c1)
then !(fmain(cs))
else strmcon_vt_cons(c1, fmain(cs))
)
}
endlet//end-of-(fpath_strmize_cgtz)
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
fpath_strmize_line
  (path) =
strm_vt_map0
(
fpath_strmize_line_vt<>(path)
) where
{
//
#typedef y0 = strn
#vwtpdef x0 = strn_vt
//
#impltmp
map0$fopr<x0><y0>(x0) = strn_vt2t(x0)
} (*where*) // [fpath_strmize_line]

(* ****** ****** *)

#impltmp
<>(*tmp*)
fpath_strmize_line_vt
  (path) =
(
auxmain0
(
fpath_strmize_cgtz<>(path)
)
) where
{
//
#vwtpdef
cstrm =
strm_vt(cgtz)
//
fun
iseol
( c0
: cgtz )
: bool = (c0 = '\n')
fnx
auxmain0
( cs
: cstrm)
: strm_vt(strn_vt) =
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
  val l1 = strn_vt_nil()
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
: cstrm
, rs
: list_vt(cgtz))
: strmcon_vt(strn_vt) =
(
case+ !cs of
| ~
strmcon_vt_nil() =>
(
strmcon_vt_sing(l1)
) where
{
val rs =
list_vt_reverse0(rs)
val l1 =
strn_vt_make_llist(rs)
}
| ~
strmcon_vt_cons(c0, cs) =>
if
iseol(c0)
then
let
val rs =
list_vt_reverse0(rs)
val l1 =
strn_vt_make_llist(rs)
in
  strmcon_vt_cons(l1, auxmain0(cs))
end
else 
(
  auxmain1(cs, list_vt_cons(c0, rs))
)
) (* end of [auxmain1] *)
//
} (*where*) // [fpath_strmize_line]

(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_f00path.dats] *)
