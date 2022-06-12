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
Start Time: June 11th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS\
/xatsopt_sats.hats"
#include
"./../HATS\
/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
"./../SATS/locinfo.sats"
(* ****** ****** *)
#staload
"./../SATS/lexbuf0.sats"
(* ****** ****** *)
#symload
char with char_make_sint
(* ****** ****** *)

local

datavwtp
lxbf1 =
LXBF1 of
( strx_vt(sint) // char source
, list_vt(char) // unget-stack
, list_vt(char) // getc1-stack
) (* end of [lxbf1] *)

#absimpl lxbf1_vtbx = lxbf1

(* ****** ****** *)

in//local

(* ****** ****** *)

#implfun
lxbf1_getc0
(   buf   ) =
let
//
val+
@LXBF1 _ = buf
//
in//let
//
case+
buf.1 of
| !
list_vt_nil() =>
(
case+
!( buf2 ) of
| ~
strxcon_vt_cons
( ci1, cis ) =>
(
buf.0 := cis
;
if
(ci1 >= 0)
then
let
val cc1 = char(ci1)
in
buf.1 := cons_vt(cc1, buf.1); ci1
end else ci1 // end-of(if)
)
) where
{
val buf2 = (buf.0: strx_vt(sint))
}
| ~
list_vt_cons
( cc1, ccs ) => char_code(  cc1  )
//
end (*let*) // end of [lxbf1_getc0]

#implfun
lxbf1_getc1
(   buf   ) =
let
//
val+
@LXBF1 _ = buf
//
in//let
//
case+
buf.1 of
| !
list_vt_nil() =>
(
case+
!( buf2 ) of
| ~
strxcon_vt_cons
( ci1, cis ) =>
(
buf.0 := cis
;
if
(ci1 >= 0)
then
let
val cc1 = char(ci1)
in//let
buf.2 := cons_vt(cc1, buf.2); ci1
end else ci1 // end-of(if)
)
) where
{
  val buf2 = (buf.0: strx_vt(sint))
}
| ~
list_vt_cons
( cc1, ccs ) =>
(
let
val ci1 = char_code(cc1)
in//let
  buf.1 := ccs
; buf.2 := cons_vt(cc1, buf.2)
; pstn1_incby_char(buf.1, cc1); ci1
end
)
//
end (*let*) // end of [lxbf1_getc1]

(* ****** ****** *)

#implfun
lxbf1_unget
(   buf   ) =
let
//
val+
@LXBF1 _ = buf
//
in//let
//
case+
buf.2 of
| !
list_vt_nil
((*void*)) => (-1) // HX: exception
| ~
list_vt_cons
(cc1, ccs) =>
(
buf.2 := ccs;
buf.1 :=
cons_vt(cc1, buf.1);
buf_decby
(buf.0,buf.1,buf.2); char_code(cc1)
) (* end of [list_vt_cons] *)
//
end (* let *) // end-of(lxbf1_unget)

(* ****** ****** *)

#implfun
lxbf1_take_cseg
(   buf   ) =
let
//
val+
@LXBF1 _ = buf
//
val cseg =
list_vt_reverse0(buf.2)
//
in//let
  buf.2 := nil_vt()
; buf.0 := copy(buf.1)
; (   $fold(buf); cseg   )
end // end of [lxbf1_take_cseg]

(* ****** ****** *)
//
#implfun
lxbf1_make_cstrx
(   cs0   ) =
(
  LXBF1(cs0, cs1, cs2)
) where
{
  val cs1 = list_vt_nil(*void*)
  val cs2 = list_vt_nil(*void*)
} (*where*)//end of(lxbf1_make_cstrx)
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexbuf0_cstrx1.dats] *)
