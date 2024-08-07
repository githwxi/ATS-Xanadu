(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 12 Jul 2024 11:29:01 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef ut = unit
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_forall
<ni><ut>(ni) =
(
nint_forall(ni)) where
{
#impltmp
forall$test<ni>(i0) = 
forall$test<ut>(unit())}
//
#impltmp
gseq_forall
<ni><ut>(ni) =
(
gasz_forall<ni><ut>(ni))
//
(* ****** ****** *)
//
#impltmp
gasz_rforall
<ni><ut>(ni) =
(
nint_rforall(ni)) where
{
#impltmp
rforall$test<ni>(i0) = 
rforall$test<ut>(unit())
}
//
#impltmp
gseq_rforall
<ni><ut>(ni) =
(
gasz_rforall<ni><ut>(ni))
//
(* ****** ****** *)
//
#impltmp
gasz_iforall
<ni><ut>(ni) =
(
nint_forall(ni)) where
{
val ut = unit()
#impltmp
forall$test<ni>(i0) =
iforall$test<ut>(i0, ut)
}
//
#impltmp
gseq_iforall
<ni><ut>(ni) =
(
gasz_iforall<ni><ut>(ni))
//
(* ****** ****** *)
//
#impltmp
gasz_irforall
<ni><ut>(ni) =
(
nint_rforall(ni)) where
{
val ut = unit()
#impltmp
rforall$test<ni>(i0) =
irforall$test<ut>(i0, ut)
}
//
#impltmp
gseq_irforall
<ni><ut>(ni) =
(
gasz_irforall<ni><ut>(ni))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
nint_forall(xs) =
loop(xs, 0(*i0*)) where
{
fun
loop
(xs: ni, i0: ni): bool =
if
(i0 >= xs)
then (true) else
(
if
forall$test<ni>(i0)
then loop(xs, i0+1) else false)}
//
#impltmp
gasz_forall
<ni><ni>(ni) =
(
  nint_forall<>(ni)) where
{
#impltmp
forall$test<ni> = forall$test1<ni>
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
nint_rforall(xs) =
loop(xs, 0(*i0*)) where
{
fun
loop
(xs: ni, i0: ni): bool =
if
(i0 >= xs)
then (true) else
(
if
rforall$test<ni>(xs-1-i0)
then loop(xs, i0+1) else false)}
//
#impltmp
gasz_rforall
<ni><ni>(ni) =
(
  nint_rforall<>(ni)) where
{
#impltmp
rforall$test<ni> = rforall$test1<ni>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 09:02:06 AM EDT
*)
//
(*
#impltmp
<(*tmp*)>
nint_strmize(ni) =
(
  auxmain(0)) where
{
fun
auxmain
(i0: nint):
strm_vt(ni) = $llazy
(
if
(i0 >= ni)
then strmcon_vt_nil() else
strmcon_vt_cons(i0, auxmain(i0+1))
)
}(*where*)//end-[nint_strmize(ni)]
*)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 11:48:37 AM EDT
*)
#impltmp
<(*tmp*)>
nint_strmize(ni) =
(
nint_map_lstrm<ni>(ni))
where
{
#impltmp
map$fopr<ni><ni>(i0) = (i0)
}(*where*)//end-[nint_strmize(ni)]
//
#impltmp
<(*tmp*)>
nint_strqize(ni) =
(
 $UN.strm2q_vt(nint_strmize<>(ni)))
//
(* ****** ****** *)
//
#impltmp
gasz_strmize
<ni><ni> = nint_strmize<>
#impltmp
gasz_strqize
<ni><ni> = nint_strqize<>
//
#impltmp
gseq_strmize
<ni><ni> = gasz_strmize<ni><ni>
#impltmp
gseq_strqize
<ni><ni> = gasz_strqize<ni><ni>
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-07:
Wed 07 Aug 2024 08:46:10 AM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
nint_rstrmize(ni) =
(
nint_rmap_lstrm<ni>(ni))
where
{
#impltmp
rmap$fopr<ni><ni>(i0) = (i0)
}(*where*)//end-[nint_rstrmize(ni)]
//
#impltmp
<(*tmp*)>
nint_rstrqize(ni) =
(
 $UN.strm2q_vt(nint_rstrmize<>(ni)))
//
(* ****** ****** *)
//
#impltmp
gasz_rstrmize
<ni><ni> = nint_rstrmize<>
#impltmp
gasz_rstrqize
<ni><ni> = nint_rstrqize<>
//
#impltmp
gseq_rstrmize
<ni><ni> = gasz_rstrmize<ni><ni>
#impltmp
gseq_rstrqize
<ni><ni> = gasz_rstrqize<ni><ni>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 11:48:37 AM EDT
*)
//
#impltmp
< y0:vt >
nint_map_lstrm
  ( ni ) =
(
  auxmain(0)) where
{
fun
auxmain
(i0: nint):
strm_vt(y0) = $llazy
(
if
(i0 >= ni)
then strmcon_vt_nil() else
let
val y0 =
map$fopr<ni><y0>(i0) in//let
strmcon_vt_cons(y0, auxmain(i0+1))
end(*let*)//else//end-of-[if]
)
}(*where*)//end-[nint_map_lstrm(ni)]
//
#impltmp
< y0:vt >
nint_map_lstrm_f1un
  (ni, fopr) =
(
nint_map_lstrm<y0>(ni))
where
{ #impltmp
  map$fopr<ni><y0>(i0) = (fopr(i0))
}(*where*)//end-[nint_map_lstrm_f1un]
//
(* ****** ****** *)
//
#impltmp
< y0:vt >
nint_rmap_lstrm
  ( ni ) =
(
  auxmain(ni)) where
{
fun
auxmain
(i0: nint):
strm_vt(y0) = $llazy
(
if
(i0 <= 0)
then strmcon_vt_nil() else
let
val y0 =
rmap$fopr<ni><y0>(i0-1) in//let
strmcon_vt_cons(y0, auxmain(i0-1))
end(*let*)//else//end-of-[if]
)
}(*where*)//end-[nint_rmap_lstrm(ni)]
//
#impltmp
< y0:vt >
nint_rmap_lstrm_f1un
  (ni, fopr) =
(
nint_rmap_lstrm<y0>(ni))
where
{ #impltmp
  rmap$fopr<ni><y0>(i0) = (fopr(i0))
}(*where*)//end-[nint_rmap_lstrm_f1un]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 02:03:24 PM EDT
*)
//
#impltmp
< y0:vt >
nint_map_llist
  ( ni ) =
(
list_vt_reverse0
<y0>(loop(0, r0)))
where
{
//
#vwtpdef
ys = list_vt(y0)
//
val
r0 = list_vt_nil()
//
fun
loop
(i0: ni, r0: ys): ys =
(
if
(i0 >= ni)
then r0 else
let
val y0 = map$fopr<ni><y0>(i0)
in//let
  loop(i0+1, list_vt_cons(y0,r0))
end(*let*)//else//end-of-[if(...)]
)
//
}(*where*)//end-[nint_map_llist(ni)]
//
(* ****** ****** *)
//
#impltmp
< y0:vt >
nint_rmap_llist
  ( ni ) =
(
list_vt_reverse0
<y0>(loop(ni, r0)))
where
{
//
#vwtpdef
ys = list_vt(y0)
//
val
r0 = list_vt_nil()
//
fun
loop
(i0: ni, r0: ys): ys =
(
if
(i0 <= 0)
then r0 else
let
val y0 = rmap$fopr<ni><y0>(i0-1)
in//let
  loop(i0-1, list_vt_cons(y0,r0))
end(*let*)//else//end-of-[if(...)]
)
//
}(*where*)//end-[nint_map_llist(ni)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint001.dats] *)
