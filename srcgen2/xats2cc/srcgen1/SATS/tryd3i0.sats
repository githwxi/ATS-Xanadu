(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Apr  4 08:22:03 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_of_tryd3i0
( ipar : i0parsed ): i0parsed
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx enwd3i0_vtbx // p0tr
#vwtpdef enwd3i0 = enwd3i0_vtbx
(* ****** ****** *)
(* ****** ****** *)
//
fun
enwd3i0_make_nil
  ( (*void*) ): enwd3i0
fun
enwd3i0_free_nil
  ( enw0: !enwd3i0 ): void
//
(* ****** ****** *)
//
(*
fun
enwd3i0_pshlam0
  (enw0: !enwd3i0): void//endfun
fun
enwd3i0_poplam0
  (enw0: !enwd3i0): void//endfun
*)
//
(* ****** ****** *)
//
fun
enwd3i0_pshlet0
  (enw0: !enwd3i0): void//endfun
fun
enwd3i0_poplet0
  (enw0: !enwd3i0): void//endfun
//
(* ****** ****** *)
//
fun
enwd3i0_dfix$search
( env0:
! enwd3i0, dfix: d2var): i0varlst
//
(* ****** ****** *)
//
fun
enwd3i0_dfix$insert
( env0:
! enwd3i0
, dfix: d2var, i0vs: i0varlst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_tryd3i0_fnp
(
xs: list(x0),
e1: !enwd3i0,
fopr: (x0, !enwd3i0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_tryd3i0_fnp
(
xs: optn(x0),
e1: !enwd3i0,
fopr: (x0, !enwd3i0)->y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pat_tryd3i0
(i0p0: i0pat, enw0: !enwd3i0): i0pat
fun
l0i0p_tryd3i0
(li0p: l0i0p, enw0: !enwd3i0): l0i0p
//
(* ****** ****** *)
//
fun
i0exp_tryd3i0
(i0e0: i0exp, enw0: !enwd3i0): i0exp
//
fun
l0i0e_tryd3i0
(li0e: l0i0e, enw0: !enwd3i0): l0i0e
//
(* ****** ****** *)
//
fun
fiarg_tryd3i0
(farg: fiarg, enw0: !enwd3i0): fiarg
//
(* ****** ****** *)
//
fun
i0gua_tryd3i0
(igua: i0gua, enw0: !enwd3i0): i0gua
fun
i0gpt_tryd3i0
(igpt: i0gpt, enw0: !enwd3i0): i0gpt
fun
i0cls_tryd3i0
(icls: i0cls, enw0: !enwd3i0): i0cls
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t0imp_tryd3i0
(timp: t0imp, enw0: !enwd3i0): t0imp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dcl_tryd3i0
(idcl: i0dcl, enw0: !enwd3i0): i0dcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0patlst_tryd3i0
(i0ps: i0patlst, enw0: !enwd3i0): i0patlst
fun
l0i0plst_tryd3i0
(ldps: l0i0plst, enw0: !enwd3i0): l0i0plst
//
(* ****** ****** *)
//
fun
i0explst_tryd3i0
(i0es: i0explst, enw0: !enwd3i0): i0explst
fun
i0expopt_tryd3i0
(iopt: i0expopt, enw0: !enwd3i0): i0expopt
fun
l0i0elst_tryd3i0
(ldes: l0i0elst, enw0: !enwd3i0): l0i0elst
//
(* ****** ****** *)
//
fun
fiarglst_tryd3i0
(fias: fiarglst, enw0: !enwd3i0): fiarglst
//
(* ****** ****** *)
//
fun
i0gualst_tryd3i0
(i0gs: i0gualst, enw0: !enwd3i0): i0gualst
fun
i0clslst_tryd3i0
(icls: i0clslst, enw0: !enwd3i0): i0clslst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dclist_tryd3i0
(dcls: i0dclist, enw0: !enwd3i0): i0dclist
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
teqi0exp_tryd3i0
(tdxp: teqi0exp, enw0: !enwd3i0): teqi0exp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl_tryd3i0
(ival: i0valdcl, enw0: !enwd3i0): i0valdcl
fun
i0vardcl_tryd3i0
(ivar: i0vardcl, enw0: !enwd3i0): i0vardcl
//
fun
i0fundcl_tryd3i0
(ifun: i0fundcl, enw0: !enwd3i0): i0fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdclist_tryd3i0
(i0vs: i0valdclist, enw0: !enwd3i0): i0valdclist
fun
i0vardclist_tryd3i0
(i0vs: i0vardclist, enw0: !enwd3i0): i0vardclist
//
fun
i0fundclist_tryd3i0
(i0fs: i0fundclist, enw0: !enwd3i0): i0fundclist
//
(* ****** ****** *)
//
fun
i0dclistopt_tryd3i0
(i0ds: i0dclistopt, enw0: !enwd3i0): i0dclistopt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
lvl0$i0vs_tryd3i0(
  lvl0: sint, i0vs: i0varlst, enw0: !enwd3i0): i0varlst
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_tryd3i0.sats] *)
(***********************************************************************)
