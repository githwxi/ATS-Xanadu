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
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_solve(x0: inp): out
//
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_divide
(x0: inp): list_vt(inp)
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_conquer
(xs: list_vt(inp)): list_vt(out)
//
(* ****** ****** *)

datavwtp
either
(i: vt, o: vt) =
| either_l of (i) | either_r of (o)

(* ****** ****** *)
//
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_solve_rec
  (x0: inp): out
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_solve_try
  (x0: inp): either(inp, out)
//
#extern
fun
<inp:vt>
<out:vt>
dvdcnq_solved_cmb(rs: list_vt(out)): out
//
(* ****** ****** *)

impltmp
<inp:vt>
<out:vt>
dvdcnq_solve(x0) =
let
val xr =
dvdcnq_solve_try<inp><out>(x0)
in
//
case+ xr of
| ~
either_r(r0) => r0
| ~
either_l(x0) => let
//
val xs =
dvdcnq_divide<inp><out>(x0)
val rs =
dvdcnq_conquer<inp><out>(xs)
//
in
  dvdcnq_solved_cmb<inp><out>(rs)
end
//
end // end of [dvdcnq_solve]

(* ****** ****** *)

impltmp
<inp:vt>
<out:vt>
dvdcnq_conquer(xs) =
(
list_vt_map0<inp><out>(xs)
) where
{
  impltmp
  map0$fopr<inp><out>(x1) =
  dvdcnq_solve_rec<inp><out>(x1)
}

(* ****** ****** *)

(* end of [dvdcnq.dats] *)
