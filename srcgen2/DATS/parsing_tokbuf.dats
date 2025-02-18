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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 13th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
(* ****** ****** *)

local
//
datavwtp
tkbf0_ =
|
{n:pos}
{i:nat}
TKBF0 of
( a1ptr(token, n)
, sint(n) (*asz*)
, sint(i) (*idx*) )
//
#absimpl tmark_type = sint
#absimpl tkbf0_vtbx = tkbf0_
//
(* ****** ****** *)

in//local

(* ****** ****** *)
//
#implfun
tokbuf_free(buf) =
(
case+ buf of
| ~
TKBF0
( A0
, n0, i0) =>
(
  a1ptr_free<token>(A0, n0))
) (*case*)//end-of(tokbuf_free)
//
(* ****** ****** *)
//
#implfun
tokbuf_getk0(buf) =
let
val+
@TKBF0
(A0, n0, i0) = buf
in
(
  $fold(buf); tok) where
{
val tok =
(
if
i0 < n0
then
(
 a1ptr_get$at1(A0, i0))
else
(
 a1ptr_get$at1(A0, n0-1))) }
end (*let*) // end of [tokbuf_getk0]
//
(* ****** ****** *)
//
#implfun
tokbuf_getk1(buf) =
let
//
(*
val () =
prerrsln("\
tokbuf_getk1: n0 = ", n0)
val () =
prerrsln("\
tokbuf_getk1: i0 = ", i0)
*)
//
val tok =
(
if
(i0 < n0)
then
(
  a1ptr_get$at1(A0, i0))
else
(
  a1ptr_get$at1(A0, n0-1))
) : token // end-[val(tok)]
//
in
//
let
val () =
buf.2 := i0+1
val () = $fold(buf) in tok end
//
end where // end-of-[let]
{
  val+ @TKBF0(A0, n0, i0) = buf
} (*where*) // end of [tokbuf_getk1]
//
(* ****** ****** *)
//
#implfun
tokbuf_skip1(buf) =
let
//
val () =
buf.2 := i0+1 in $fold(buf)
end where // end-of-[let]
{
//
val+ @TKBF0(A0, n0, i0) = buf
//
(*
val () =
prerrsln("tokbuf_skip1: i0 = ", i0)
*)
//
} (*where*) // end of [tokbuf_skip1]
//
(* ****** ****** *)
//
#implfun
tokbuf_mark_get
  (buf) = let
//
val+
TKBF0(A0, n0, i0) = buf in i0
//
end (*let*)//end-of-[tokbuf_mark_get]
//
#implfun
tokbuf_mark_set
  (buf, mrk) = let
//
val+
@TKBF0 _ = buf in (buf.2 := mrk)
//
end (*let*)//end-of-[tokbuf_mark_set]
//
#implfun
tokbuf_mark_clr(buf, mrk) = ((*void*))
//
(* ****** ****** *)
//
#implfun
tokbuf_make0_llist
  (tks) =
(
  TKBF0(A0, n0, i0)
) where
{
val i0 = 0
val n0 = list_vt_length1(tks)
//
(*
val () =
prerrsln("\
tokbuf_make0_llist: n0 = ", n0)
*)
//
val A0 = a1ptr_make0_llist(tks)
} where
{
(*
val () =
prerr1sln
("tokbuf_make0_llist: tks = ", tks)
*)
}(*where*)//end-of-[tokbuf_make0_llist]
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_parsing_tokbuf.dats] *)
