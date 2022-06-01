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
// Author: Hongwei Xi
// Start Time: Mar 27, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)

implement
d3pat_memq_dvar
  (d3p0, d2v0) =
(
  auxdpat(d3p0)
) where
{
//
(*
val () =
println!
("d3pat_memq_dvar: d3p0 = ", d3p0)
val () =
println!
("d3pat_memq_dvar: d3v0 = ", d2v0)
*)
//
val
d2v0 = d2v0.stamp()
//
fun
auxdpat
(d3p0: d3pat): bool =
(
case+
d3p0.node() of
| D3Pnil() => false
| D3Pany() => false
| D3Pvar(d2v1) =>
  (d2v0 = d2v1.stamp())
//
| D3Pbang(d3p1) => auxdpat(d3p1)
| D3Pflat(d3p1) => auxdpat(d3p1)
| D3Pfree(d3p1) => auxdpat(d3p1)
//
| D3Psap0
  (d3p1, s2vs) => auxdpat(d3p1)
| D3Psap1
  (d3p1, s2vs) => auxdpat(d3p1)
//
| D3Pdapp(d3p1, npf, d3ps) =>
  (auxdpat(d3p1) || auxd3ps(d3ps))
//
| D3Ptrcd1
  (knd, npf, d3ps) => auxd3ps(d3ps)
//
| D3Panno
  (d3p1, s1e, s2e) => auxdpat(d3p1)
//
| D3Ptcast(d3p1, _) => auxdpat(d3p1)
//
(*
| D3Pint _ => false
| D3Pbtf _ => false
| D3Pchr _ => false
| D3Pflt _ => false
| D3Pstr _ => false
| D3Pcon1 _ => false
| D3Pcon2 _ => false
| D3Psym0(d1p1, d2ps) => false
| D3Pnone0() => false
| D3Pnone1 _ => faslse
| D3Pnone2(d3p1) => auxdpat(d3p1)
*)
| _(* rest-of-d3pat *) => ( false )
) (* end of [auxdpat] *)
//
and
auxd3ps
(d3ps: d3patlst): bool =
(
case+ d3ps of
| list_nil() => false
| list_cons(d3p0, d3ps) =>
  let
  val test = auxdpat(d3p0) 
  in
  if test then true else auxd3ps(d3ps)
  end // end of [list_cons]
)
//
} (* end of [d3pat_memq_dvar] *)

(* ****** ****** *)

implement
d3patlst_memq_dvar
  (d3ps, d2v0) =
(
case+ d3ps of
| list_nil() => false
| list_cons(d3p0, d3ps) =>
  ( if
    d3pat_memq_dvar(d3p0, d2v0)
    then true
    else d3patlst_memq_dvar(d3ps, d2v0)
  ) (* end of [list_cons] *)
)

(* ****** ****** *)

implement
f3arg_memq_dvar
( f3a0, d2v0 ) =
(
case+
f3a0.node() of
//
|
F3ARGsome_dyn
(npf, d3ps) =>
d3patlst_memq_dvar(d3ps, d2v0)
//
| _ (* rest-of-f3arg *) => false
//
) where
{
//
(*
val () =
println!
("f3arg_memq_dvar: f3a0 = ", f3a0)
val () =
println!
("f3arg_memq_dvar: d3v0 = ", d2v0)
*)
//
}(*case*)//end-of-[f3arg_memq_dvar]

(* ****** ****** *)

implement
f3arglst_memq_dvar
  ( f3as, d2v0 ) =
(
case+ f3as of
|
list_nil() => false
|
list_cons(f3a0, f3as) =>
(
if
f3arg_memq_dvar(f3a0, d2v0)
then true
else f3arglst_memq_dvar(f3as, d2v0)
) (* end of [list_cons] *)
)(*case*)//end of [f3arglst_memq_dvar]

(* ****** ****** *)

(* end of [xats_dynexp3_util0.dats] *)
