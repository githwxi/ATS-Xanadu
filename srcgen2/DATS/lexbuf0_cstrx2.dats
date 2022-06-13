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
pstn1 =
PSTN1 of
( sint(*ntot*)
, sint(*nrow*)
, sint(*ncol*))

datavwtp
lxbf2 =
LXBF2 of
( pstn1 // start
, pstn1 // current
, strx_vt(sint) // char source
, list_vt(char) // unget-stack
, list_vt(char) // getc1-stack
) (* end of [lxbf2] *)

#absimpl lxbf2_vtbx = lxbf2

(* ****** ****** *)
//
fun
pstn1_free
(pos: ~pstn1): void =
let
val+
~PSTN1
(ntot, nrow, ncol) = pos
endlet
fun
pstn1_copy
(pos: !pstn1): pstn1 =
PSTN1
(ntot, nrow, ncol) where
{
val+
!PSTN1
(ntot, nrow, ncol) = pos
}
#symload free with pstn1_free
#symload copy with pstn1_copy
//
fun
pstn1_get_ncol
(pos: !pstn1): sint =
(
case+ pos of
| !PSTN1(_, _, ncol) => ncol
)
#symload ncol with pstn1_get_ncol
//
fun
postn_make_pstn1
(pos: !pstn1): postn =
let
val+
!PSTN1(ntot, nrow, ncol) = pos
in
postn_make_int3(ntot, nrow, ncol)
end(*let*)//end-of(postn_make_pstn1)
#symload postn with postn_make_pstn1
//
(* ****** ****** *)

fun
pstn1_incby_char
( pos:
! pstn1 >> _
, chr: char): void = let
//
val+
@PSTN1
( !ntot
, !nrow, !ncol) = pos
//
in//let
//
ntot := ntot+1;
//
if
( chr != '\n' )
then
(ncol := ncol+1)
else
( ncol := 0
; nrow := nrow+1 ); $fold(  pos  )
//
endlet // end of [pstn1_incby_char]

(* ****** ****** *)

in//local

(* ****** ****** *)

#implfun
lxbf2_getc0
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
in//let
//
case+
buf.3 of
| !
list_vt_nil() =>
(
case+
!( buf2 ) of
| ~
strxcon_vt_cons
( ci1, cis ) =>
(
buf.2 := cis
;
if
(ci1 >= 0)
then
let
val cc1 = char(ci1)
in
buf.3 := cons_vt(cc1, buf.3); ci1
end else ci1 // end-of(if)
)
) where
{
val buf2 = (buf.2: strx_vt(sint))
}
| !
list_vt_cons
( cc1, ccs ) => char_code(  cc1  )
//
end (*let*) // end of [lxbf2_getc0]

#implfun
lxbf2_getc1
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
in//let
//
case+
buf.3 of
| !
list_vt_nil() =>
(
case+
!( buf2 ) of
| ~
strxcon_vt_cons
( ci1, cis ) =>
(
buf.2 := cis
;
if
(ci1 >= 0)
then
let
val cc1 = char(ci1)
in//let
  buf.4 := cons_vt(cc1, buf.4)
; pstn1_incby_char(buf.1, cc1); ci1
end else ci1 // end-of(if)
)
) where
{
  val buf2 = (buf.2: strx_vt(sint))
}
| ~
list_vt_cons
( cc1, ccs ) =>
(
let
val ci1 = char_code(cc1)
in//let
  buf.3 := ccs
; buf.4 := cons_vt(cc1, buf.4)
; pstn1_incby_char(buf.1, cc1); ci1
end
)
//
end (*let*) // end of [lxbf2_getc1]

(* ****** ****** *)

#implfun
lxbf2_unget
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
fun
buf_decby
( pbeg:
! pstn1
, pcur: 
! pstn1 >> _
, buf4:
! list_vt(char)): void =
let
//
fun
f0_nofs
( ofs: sint
, res: sint
, ccs
: !list_vt(char)): sint =
(
case+ ccs of
| !
list_vt_nil() => ofs+res
| !
list_vt_cons(cc1, ccs) =>
if
(cc1 = '\n')
then res//no need for [ofs]
else f0_nofs(ofs, res+1, ccs)
)
//
in
case+ pcur of
|
PSTN1
(!ntot, !nrow, !ncol) =>
if
(ncol > 0)
then
( ntot := ntot-1
; ncol := ncol-1)
else
( ntot := ntot-1
; nrow := nrow-1; ncol := nofs) where
{
  val res = 0
  val ofs =
  pstn1_get_ncol(pbeg)
  val
  nofs =
  f0_nofs(ofs, res, buf.4)
}
end (*let*) // end of [buf_decby]
//
in//let
//
case+
buf.4 of
| !
list_vt_nil
((*void*)) => (-1) // HX: exception
| ~
list_vt_cons
(cc1, ccs) =>
(
buf.4 := ccs;
buf.3 :=
cons_vt(cc1, buf.3);
buf_decby
(buf.0,buf.1,buf.4); char_code(cc1)
) (* end of [list_vt_cons] *)
//
end (* let *) // end-of(lxbf2_unget)

(* ****** ****** *)

#implfun
lxbf2_copy_pbeg
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
val pbeg = postn(buf.0)
//
in//let
  (   $fold(buf); pbeg   )
end // end of [lxbf2_copy_pbeg]
#implfun
lxbf2_copy_pcur
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
val pcur = postn(buf.1)
//
in//let
  (   $fold(buf); pcur   )
end // end of [lxbf2_copy_pcur]

(* ****** ****** *)

#implfun
lxbf2_take_cseg
(   buf   ) =
let
//
val+
@LXBF2 _ = buf
//
val cseg =
list_vt_reverse0(buf.4)
//
in//let
  pstn1_free(buf.0)
; buf.4 := nil_vt()
; buf.0 := copy(buf.1)
; (   $fold(buf); cseg   )
end // end of [lxbf2_take_cseg]

(* ****** ****** *)
//
#implfun
lxbf2_make_cstrx
(   cs0   ) =
let
val ps0 = PSTN1(0, 0, 0)
val ps1 = PSTN1(0, 0, 0)
val cs1 = list_vt_nil(*void*)
val cs2 = list_vt_nil(*void*)
in
LXBF2(ps0, ps1, cs0, cs1, cs2)
end // end of [lxbf2_make_cstrx]
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexbuf0_cstrx2.dats] *)
