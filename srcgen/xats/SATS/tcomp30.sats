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
// Start Time: May 24, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)

#staload "./dynexp3.sats"

(* ****** ****** *)

#staload "./intrep0.sats"

(* ****** ****** *)
typedef
P2tr0(a:vt0p) =
[l:addr | l >= null] p2tr(a,l)
(* ****** ****** *)
//
fun
htcst_make_scst(s2cst): htcst
//
fun
the_scstmap_search_ref
(s2v: s2cst): P2tr0(htcst)
fun
the_scstmap_search_opt
(s2v: s2cst): Option_vt(htcst)
//
fun
the_scstmap_insert_any
(s2v0: s2cst, htc1: htcst): void
fun
the_scstmap_insert_exn
(s2v0: s2cst, htc1: htcst): void
//
(* ****** ****** *)
//
fun
htvar_make_svar(s2var): htvar
//
fun
the_svarmap_search_ref
(s2v: s2var): P2tr0(htvar)
fun
the_svarmap_search_opt
(s2v: s2var): Option_vt(htvar)
//
fun
the_svarmap_insert_any
(s2v0: s2var, htv1: htvar): void
fun
the_svarmap_insert_exn
(s2v0: s2var, htv1: htvar): void
//
(* ****** ****** *)
//
fun
hdcon_make_dcon(d2con): hdcon
fun
hdcst_make_dcst(d2cst): hdcst
//
fun
the_dconmap_search_ref
(d2c: d2con): P2tr0(hdcon)
fun
the_dconmap_search_opt
(d2c: d2con): Option_vt(hdcon)
//
fun
the_dconmap_insert_any
(d2c0: d2con, hdv1: hdcon): void
fun
the_dconmap_insert_exn
(d2c0: d2con, hdv1: hdcon): void
//
fun
the_dcstmap_search_ref
(d2c: d2cst): P2tr0(hdcst)
fun
the_dcstmap_search_opt
(d2c: d2cst): Option_vt(hdcst)
//
fun
the_dcstmap_insert_any
(d2c0: d2cst, hdv1: hdcst): void
fun
the_dcstmap_insert_exn
(d2c0: d2cst, hdv1: hdcst): void
//
(* ****** ****** *)
//
fun
hdvar_make_dvar(d2var): hdvar
//
fun
the_dvarmap_search_ref
(d2v: d2var): P2tr0(hdvar)
fun
the_dvarmap_search_opt
(d2v: d2var): Option_vt(hdvar)
//
fun
the_dvarmap_insert_any
(d2v0: d2var, hdv1: hdvar): void
fun
the_dvarmap_insert_exn
(d2v0: d2var, hdv1: hdvar): void
//
(* ****** ****** *)
//
fun
tcomp30_program
(prog: d3eclist): h0dclist

(* ****** ****** *)
//
fun
tcomp30_sort
  (s2t0: sort2): h0srt
fun
tcomp30_sortlst
  (s2ts: sort2lst): h0srtlst
//
(* ****** ****** *)
//
fun
tcomp30_scst
  (s2c0: s2cst): htcst
fun
tcomp30_scstlst
  (s2cs: s2cstlst): htcstlst
//
(* ****** ****** *)
//
fun
tcomp30_svar
  (s2v0: s2var): htvar
fun
tcomp30_svarlst
  (s2vs: s2varlst): htvarlst
//
(* ****** ****** *)
//
fun
tcomp30_type
  (t2p0: t2ype): h0typ
fun
tcomp30_typelst
  (t2ps: t2ypelst): h0typlst
//
(* ****** ****** *)
//
fun
tcomp30_labtype
  (labt2ype): labh0typ
fun
tcomp30_labtypelst
  (labt2ypelst): labh0typlst
//
(* ****** ****** *)
//
fun
tcomp30_dvar
  (d2v0: d2var): hdvar
fun
tcomp30_dvaropt
  (opt0: d2varopt): hdvaropt
//
(* ****** ****** *)
fun
tcomp30_dcon(d2c0: d2con): hdcon
fun
tcomp30_dcst(d2c0: d2cst): hdcst
//
(* ****** ****** *)
//
fun
tcomp30_dpat(d3p0: d3pat): h0pat
fun
tcomp30_dpatlst(d3patlst): h0patlst
//
(* ****** ****** *)
//
fun
tcomp30_farg(f3a0: f3arg): hfarg
fun
tcomp30_farglst(f3arglst): hfarglst
//
(* ****** ****** *)
//
fun
tcomp30_ti3arg(tia: ti3arg): htiarg
//
(* ****** ****** *)
//
fun
tcomp30_dexp(d3e0: d3exp): h0exp
fun
tcomp30_dexpopt(d3expopt): h0expopt
fun
tcomp30_dexplst(d3explst): h0explst
//
(* ****** ****** *)
//
fun
tcomp30_dgua(d3g0: d3gua): h0gua
fun
tcomp30_dgualst(d3gualst): h0gualst
//
fun
tcomp30_dclau(d3cl: d3clau): h0clau
fun
tcomp30_dgpat(d3gp: d3gpat): h0gpat
fun
tcomp30_dclaulst(d3claulst): h0claulst
//
(* ****** ****** *)
//
fun
tcomp30_decl(d3c0: d3ecl): h0dcl
fun
tcomp30_declist(d3eclist): h0dclist
//
(* ****** ****** *)
//
fun
tcomp30_tqarg(tqa0: tq2arg): htqarg
fun
tcomp30_tqarglst(tq2arglst): htqarglst
//
(* ****** ****** *)

(* end of [xats_tcomp30.sats] *)
