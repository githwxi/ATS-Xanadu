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
#typedef ut = unit
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gseq_forall
<nint><ut>(ni) =
(
nint_forall(ni)) where
{
#impltmp
forall$test<ni>(i0) = 
(
forall$test<ut>(unit()))}//where
//
#impltmp
gasz_forall
<nint><ut>(ni) =
(
nint_forall(ni)) where
{
#impltmp
forall$test<ni>(i0) = 
(
forall$test1<ut>(unit()))}//where
//
(* ****** ****** *)
//
#impltmp
gseq_rforall
<nint><ut>(ni) =
(
nint_rforall(ni)) where
{
#impltmp
rforall$test<ni>(i0) = 
(
rforall$test<ut>(unit()))}//where
//
#impltmp
gasz_rforall
<nint><ut>(ni) =
(
nint_rforall(ni)) where
{
#impltmp
rforall$test<ni>(i0) = 
(
rforall$test1<ut>(unit()))}//where
//
(* ****** ****** *)
//
#impltmp
gseq_iforall
<nint><ut>(ni) =
(
nint_forall(ni)) where
{
#impltmp
forall$test<ni>(i0) =
(
iforall$test<ut>(i0,unit()))}//whr
//
#impltmp
gasz_iforall
<nint><ut>(ni) =
(
nint_forall(ni)) where
{
#impltmp
forall$test<ni>(i0) =
(
iforall$test1<ut>(i0,unit()))}//whr
//
(* ****** ****** *)
//
#impltmp
gseq_irforall
<nint><ut>(ni) =
(
nint_rforall(ni)) where
{
#impltmp
rforall$test<ni>(i0) =
(
irforall$test<ut>(i0,unit()))}//whr
//
#impltmp
gasz_irforall
<nint><ut>(ni) =
(
nint_rforall(ni)) where
{
#impltmp
rforall$test<ni>(i0) =
(
irforall$test1<ut>(i0,unit()))}//whr
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
<nint><ni>(ni) =
(
  nint_forall<>(ni)) where
{
#impltmp
forall$test<ni> = forall$test1<ni>
}
//
#impltmp
gseq_forall<nint><ni> = nint_forall<>
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
nint_forall$f1un
  (ni, test) =
(
  nint_forall<>(ni)) where
{
#impltmp
forall$test<ni>(i0) = test(   i0   )
}(*where*)//end-of-[nint_forall$f1un]
//
(* ****** ****** *)
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
<nint><ni>(ni) =
(
  nint_rforall<>(ni)) where
{
#impltmp
rforall$test<ni> = rforall$test1<ni>
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
nint_rforall$f1un
  (ni, test) =
(
  nint_rforall<>(ni)) where
{
#impltmp
rforall$test<ni>(i0) = test(   i0   )
}(*where*)//end-of-[nint_rforall$f1un]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
nint_foritm =
gseq_foritm<nint><ni>(*void*)
#impltmp
<>(*tmp*)
nint_foritm$f1un
  (cs, work) =
(
  nint_foritm<>(cs)) where
{
#impltmp
foritm$work<ni>(i0) = work(   i0   )
}(*where*)//end-of-[nint_foritm$f1un]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
nint_rforitm =
gseq_rforitm<nint><ni>(*void*)
#impltmp
<>(*tmp*)
nint_rforitm$f1un
  (cs, work) =
(
  nint_rforitm<>(cs)) where
{
#impltmp
rforitm$work<ni>(i0) = work(   i0   )
}(*where*)//end-of-[nint_rforitm$f1un]
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
(* ****** ****** *)
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
nint_map$f1un_lstrm
  (ni, fopr) =
(
nint_map_lstrm<y0>(ni))
where
{ #impltmp
  map$fopr<ni><y0>(i0) = fopr( i0 )
}(*where*)//end-[nint_map$f1un_lstrm]
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
(
 strmcon_vt_cons(y0, auxmain(i0-1)))
end(*let*)//else//end-of-[if]
)
}(*where*)//end-[nint_rmap_lstrm(ni)]
//
#impltmp
< y0:vt >
nint_rmap$f1un_lstrm
  (ni, fopr) =
(
nint_rmap_lstrm<y0>(ni))
where
{ #impltmp
  rmap$fopr<ni><y0>(i0) = fopr( i0 )
}(*where*)//end-[nint_rmap$f1un_lstrm]
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
#impltmp
< y0:vt >
nint_map$f1un_llist
  (ni, fopr) =
(
nint_map_llist
<  y0  >(  ni  )) where
{
#impltmp
map$fopr<ni><y0>( i0 ) = fopr( i0 )
}
//
(* ****** ****** *)
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
#impltmp
< y0:vt >
nint_rmap$f1un_llist
  (ni, fopr) =
(
nint_rmap_llist
<  y0  >(  ni  )) where
{
#impltmp
rmap$fopr<ni><y0>( i0 ) = fopr( i0 )
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_strmize<nint><ni> = nint_strmize<>
#impltmp
gasz_strqize<nint><ni> = nint_strqize<>
//
#impltmp
gseq_strmize<nint><ni> = gasz_strmize<nint><ni>
#impltmp
gseq_strqize<nint><ni> = gasz_strqize<nint><ni>
//
(* ****** ****** *)
//
#impltmp
gasz_rstrmize<nint><ni> = nint_rstrmize<>
#impltmp
gasz_rstrqize<nint><ni> = nint_rstrqize<>
//
#impltmp
gseq_rstrmize<nint><ni> = gasz_rstrmize<nint><ni>
#impltmp
gseq_rstrqize<nint><ni> = gasz_rstrqize<nint><ni>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-01-12:
Sun Jan 12 10:08:30 AM EST 2025
*)
//
#impltmp
< r0:vt >
nint_folditm =
gseq_folditm<nint><ni><r0>(*void*)
#impltmp
< r0:vt >
nint_rfolditm =
gseq_rfolditm<nint><ni><r0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< r0:vt >
nint_folditm$f2un =
gseq_folditm$f2un<nint><ni><r0>(*void*)
#impltmp
< r0:vt >
nint_rfolditm$f2un =
gseq_rfolditm$f2un<nint><ni><r0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint001.dats] *)
