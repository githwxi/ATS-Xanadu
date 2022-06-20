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
Start Time: June 13th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)

local

datavwtp
tkbf0 =
|
{n:pos}
{i:nat}
TKBF0 of
( a1ptr(token, n)
, sint(n) (*asz*)
, sint(i) (*idx*) )

#absimpl tmark_type = sint
#absimpl tkbf0_vtbx = tkbf0

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
, n0
, i0) => a1ptr_free(A0, n0)
) (*case*)//end-of(tokbuf_free)
//
(* ****** ****** *)

#implfun
tokbuf_getk0(buf) =
let
val+
@TKBF0
(A0, n0, i0) = buf
in
($fold(buf); tok) where
{
val tok =
(if
i0 < n0
then A0[i0] else A0[n0-1]) }
end (*let*) // end of [tokbuf_getk0]

(* ****** ****** *)
//
#implfun
tokbuf_getk1(buf) =
let
//
val i1 = i0
//
in
( i0 := i1+1
; $fold(buf); tok) where
{
val tok =
(
if
(i1 < n0)
then A0[i1] else A0[n0-1]
) : token // end-of-[val]
}
end where
{
  val+
  @TKBF0(A0, n0, !i0) = buf
} (*where*) // end of [tokbuf_getk1]
//
(* ****** ****** *)
//
#implfun
tokbuf_skip1(buf) =
let
//
val i1 = i0
//
in
  i0 := i1+1; $fold(buf)
end where
{
  val+
  @TKBF0(A0, n0, !i0) = buf
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
@TKBF0
(A0, n0, !i0) = buf in i0 := mrk
//
end (*let*)//end-of-[tokbuf_mark_set]
//
#implfun
tokbuf_mark_clr(buf, mrk) = ((*void*))
//
(* ****** ****** *)
//
#implfun
tokbuf_make_list_vt
  (tks) =
(
  TKBF0(A0, n0, i0)
) where
{
  val i0 = 0
  val n0 = list_vt_length1(tks)
  val A0 = a1ptr_make_list_vt(tks)
}(*where*)//end-of-[tokbuf_make_list_vt]
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_tokbuf.dats] *)
