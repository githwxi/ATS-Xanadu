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
(*
Fri 23 Sep 2022 01:47:28 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
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
//
#staload "./../SATS/nmspace.sats"
//
(* ****** ****** *)
//
#vwtpdef
nmitmlst_vt =
list_vt(nmitm)
#vwtpdef
nmitmlst2_vt =
list_vt(nmitmlst_vt)
#vwtpdef
savednmlst_vt =
list_vt@(nmitmlst_vt, nmitmlst2_vt)
//
(* ****** ****** *)
//
fun
nmitmlst_vt_free
  .<>.
(xs: nmitmlst_vt): void =
(
  list_vt_free<nmitm>(xs))
//
fun
nmitmlst2_vt_free
  {n:nat} .<n>.
( xss
: list_vt(nmitmlst_vt, n)): void = 
(
case+ xss of
| ~
list_vt_nil((*void*)) => ()
| ~
list_vt_cons(xs1, xss) => let
val () =
nmitmlst_vt_free(xs1) in nmitmlst2_vt_free(xss)
// end of [val]
end // end of [list_vt_cons]
) (*case+*) // end of [nmitmlist2_vt_free(xss)]
//
(* ****** ****** *)

local
//
val
the_nmitmlst =
a0ref_make_1val
< nmitmlst_vt >(list_vt_nil())
//
val
the_nmitmlst2 =
a0ref_make_1val
< nmitmlst2_vt >(list_vt_nil())
//
val
the_savednmlst =
a0ref_make_1val
< savednmlst_vt >(list_vt_nil())
//
in (* in-of-local *)

(* ****** ****** *)

#implfun
the_nmspace_top0() =
let
val xs =
a0ref_get0
<nmitmlst_vt>
(the_nmitmlst)
val xs =
$UN.enlinear(xs)
val-list_vt_cons(x0, _) = xs
in//let
let
val xs = $UN.delinear(xs) in x0 end
end (*let*) // end of [the_nmspace_top0]

(* ****** ****** *)

#implfun
the_nmspace_pop0
  ((*void*)) = () where
{
//
val xs1 =
let
//
val xss =
a0ref_get0
<nmitmlst2_vt>(the_nmitmlst2)
val xss =
$UN.enlinear(xss)
//
val-
~list_vt_cons(xs1, xss) = xss
val xss =
a0ref_exch
<nmitmlst2_vt>(the_nmitmlst2, xss)
in//let
let
val xss = $UN.delinear(xss) in xs1 end
end // end of [let] // end of [val xs1]
//
val ( ) =
nmitmlst_vt_free(xs0) where
{
val xs0 =
a0ref_exch<nmitmlst_vt>(the_nmitmlst, xs1)
}
//
} (*where*) // end of [the_nmspace_pop0()] *)

(* ****** ****** *)

#implfun
the_nmspace_push
  ((*void*)) = () where
{
//
val xs =
list_vt_nil()
val xs =
a0ref_exch
<nmitmlst_vt>(the_nmitmlst, xs)
//
val xss =
a0ref_get0
<nmitmlst2_vt>(the_nmitmlst2)
val xss =
$UN.enlinear(xss)
val xss = list_vt_cons(xs, xss)
val ( ) =
$UN.a0ref_set0
<nmitmlst2_vt>(the_nmitmlst2, xss)
//
} (*where*) // end of [the_nmspace_push]

(* ****** ****** *)

end (*local*) // end of [loca(the_nmitmlst,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_nmspace.dats] *)
