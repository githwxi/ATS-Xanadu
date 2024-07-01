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
| // !
list_vt_nil() =>
(
case+
!( buf0 ) of
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
val buf0 = (buf.0: strx_vt(sint))
}
| // !
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
| ~
list_vt_nil
( (*void*) ) =>
(
case+
!( buf0 ) of
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
  val buf0 = (buf.0: strx_vt(sint))
}
| ~
list_vt_cons
( cc1, ccs ) =>
(
let
val ci1 = char_code(cc1)
in//let
  buf.1 := ccs
; buf.2 := cons_vt(cc1, buf.2); ci1
end
)
//
end (*let*) // end of [lxbf1_getc1]

(* ****** ****** *)

#implfun
lxbf1_unget
(buf, ci0) =
if
(ci0 < 0)
then ci0 else
let
//
val+
@LXBF1 _ = buf
//
in//let
//
case+
buf.2 of
| ~
list_vt_nil
((*void*)) => (-1) // HX: exception
| ~
list_vt_cons
(cc1, ccs) =>
(
buf.2 := ccs;
buf.1 :=
cons_vt(cc1, buf.1); char_code(cc1)
) (* end of [list_vt_cons] *)
//
end (* let *) // end-of(lxbf1_unget)

(* ****** ****** *)

#implfun
lxbf1_take_clst
(   buf   ) =
let
//
val+
@LXBF1 _ = buf
//
val clst =
list_vt_reverse0(buf.2)
//
in//let
  buf.2 := nil_vt()
; (   $fold(buf); clst   )
end // end of [lxbf1_take_clst]

(* ****** ****** *)
//
#implfun
lxbf1_make0_cstrx
(   cs0   ) =
(
  LXBF1(cs0, cs1, cs2)
) where
{
  val cs1 = list_vt_nil(*void*)
  val cs2 = list_vt_nil(*void*)
} (*where*)//end of(lxbf1_make0_cstrx)
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

#implfun
lxbf1_make_strn
(   src   ) =
lxbf1_make0_cstrx
(
strx_vt_map0(strn_strxize(src))
) where
{
#impltmp
map0$fopr
<char><sint>(cc) =
let
val ci =
char_code(cc) in if ci > 0 then ci else (-1)
endlet // end of [map0$fopr]
} (*where*) // end-of-[lxbf1_make_strn(src)]

(* ****** ****** *)
//
#implfun
lxbf1_make_fpath
(   fpx   ) =
lxbf1_make0_cstrm(cs0) where
{
  val cs0 = fpath_strmize_char<>(fpx)
} (*where*) // end-of(lxbf1_make_fpath(fpx))
//
(* ****** ****** *)

#implfun
lxbf1_make0_cstrm
(   cs0   ) =
(
lxbf1_make0_cstrx(fmain(cs0))
) where
{
fun
fzero(): strx_vt(sint) =
$llazy
(strxcon_vt_cons(-1, fzero()))
fun
fmain
( cs0
: strm_vt(char)): strx_vt(sint) =
$llazy
(
case+ !cs0 of
| ~
strmcon_vt_nil
((*void*)) => strxcon_vt_cons(-1, fzero())
| ~
strmcon_vt_cons
(ch1, cs1) => strxcon_vt_cons(char_code(ch1), fmain(cs1))
)
} (*where*) // end-of(lxbf1_make0_cstrm(cs0))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_lexbuf0_cstrx1.dats] *)
