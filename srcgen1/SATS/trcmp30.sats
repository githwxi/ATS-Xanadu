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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./intrep0.sats"
//
(* ****** ****** *)
//
absvtype
compenv_vtype = ptr
vtypedef
compenv = compenv_vtype
//
(* ****** ****** *)
typedef
P2tr0(a:vt0p) =
[l:addr|l >= null] p2tr(a,l)
(* ****** ****** *)

fun
compenv_make_nil
( (*void*) ) : compenv
fun
compenv_free_nil
( env0: compenv ) : void

(* ****** ****** *)
//
fun
compenv_pop0_timp
(env0: !compenv): void
fun
compenv_push_timp
( env0
: !compenv
, d3e0: d3exp
, s2vs: s2varlst
, tsub: t2ypelst): void
//
(* ****** ****** *)
//
fun
t2ype_subst_compenv
( t2p0: t2ype
, env0: !compenv ) : t2ype
//
(* ****** ****** *)
//
fun
htcst_make_scst(s2cst): htcst
fun
htvar_make_svar(s2var): htvar
//
(* ****** ****** *)
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
h0con_make_dcon(d2con): h0con
fun
h0cst_make_dcst(d2cst): h0cst
//
(* ****** ****** *)
//
fun
the_dconmap_search_ref
(d2c: d2con): P2tr0(h0con)
fun
the_dconmap_search_opt
(d2c: d2con): Option_vt(h0con)
//
fun
the_dconmap_insert_any
(d2c0: d2con, hdv1: h0con): void
fun
the_dconmap_insert_exn
(d2c0: d2con, hdv1: h0con): void
//
fun
the_dcstmap_search_ref
(d2c: d2cst): P2tr0(h0cst)
fun
the_dcstmap_search_opt
(d2c: d2cst): Option_vt(h0cst)
//
fun
the_dcstmap_insert_any
(d2c0: d2cst, hdv1: h0cst): void
fun
the_dcstmap_insert_exn
(d2c0: d2cst, hdv1: h0cst): void
//
(* ****** ****** *)
//
fun
h0var_make_dvar(d2var): h0var
//
fun
the_dvarmap_search_ref
(d2v: d2var): P2tr0(h0var)
fun
the_dvarmap_search_opt
(d2v: d2var): Option_vt(h0var)
//
fun
the_dvarmap_insert_any
(d2v0: d2var, hdv1: h0var): void
fun
the_dvarmap_insert_exn
(d2v0: d2var, hdv1: h0var): void
//
(* ****** ****** *)
//
fun
trcmp30_envless
(prog: d3eclist): h0dclist
fun
trcmp30_package
(p3kg: d3transd): h0comped

(* ****** ****** *)
//
fun
trcmp30_sort
  (s2t0: sort2): h0srt
fun
trcmp30_sortlst
  (s2ts: sort2lst): h0srtlst
//
(* ****** ****** *)
//
fun
trcmp30_scst
  (s2c0: s2cst): htcst
fun
trcmp30_scstlst
  (s2cs: s2cstlst): htcstlst
//
(* ****** ****** *)
//
fun
trcmp30_svar
  (s2v0: s2var): htvar
fun
trcmp30_svarlst
  (s2vs: s2varlst): htvarlst
//
(* ****** ****** *)
//
fun
trcmp30_type
  (t2p0: t2ype): h0typ
fun
trcmp30_typelst
  (t2ps: t2ypelst): h0typlst
//
(* ****** ****** *)
//
fun
trcmp30_labtype
  (labt2ype): labh0typ
fun
trcmp30_labtypelst
  (labt2ypelst): labh0typlst
//
(* ****** ****** *)
//
fun
trcmp30_tqa0
(tqa0: tq2arg): htqarg
fun
trcmp30_tqas
(tqas: tq2arglst): htqarglst
//
(* ****** ****** *)
//
fun
trcmp30_dvar
  (d2v0: d2var): h0var
fun
trcmp30_dvaropt
  (opt0: d2varopt): h0varopt
//
(* ****** ****** *)
//
fun
trcmp30_dcon(d2c0: d2con): h0con
fun
trcmp30_dcst(d2c0: d2cst): h0cst
//
fun
trcmp30_dconlst(d2conlst): h0conlst
fun
trcmp30_dcstlst(d2cstlst): h0cstlst
//
(* ****** ****** *)
//
fun
trcmp30_dpat
( env0:
! compenv
, d3p0: d3pat): h0pat
fun
trcmp30_dpatlst
( env0:
! compenv
, d3ps: d3patlst): h0patlst
//
(* ****** ****** *)
//
fun
trcmp30_farg
( env0:
! compenv
, f3a0: f3arg): h0fag
fun
trcmp30_farglst
( env0:
! compenv
, f3as: f3arglst): h0faglst
//
(* ****** ****** *)
//
fun
trcmp30_ti3arg(tia0: ti3arg): htiarg
//
(* ****** ****** *)
//
fun
trcmp30_dexp
( env0:
! compenv, d3e0: d3exp): h0exp
fun
trcmp30_dexpopt
( env0:
! compenv, d3e0: d3expopt): h0expopt
fun
trcmp30_dexplst
( env0:
! compenv, d3e0: d3explst): h0explst
//
(* ****** ****** *)
//
fun
trcmp30_dgua
( env0:
! compenv, d3g0: d3gua): h0gua
//
fun
trcmp30_dgualst
( env0:
! compenv, d3gs: d3gualst): h0gualst
//
fun
trcmp30_dclau
( env0:
! compenv, d3cl: d3clau): h0clau
fun
trcmp30_dgpat
( env0:
! compenv, d3gp: d3gpat): h0gpat
//
fun
trcmp30_dclaulst
( env0:
! compenv, dcls: d3claulst): h0claulst
//
(* ****** ****** *)
//
fun
trcmp30_decl
( env0:
! compenv, d3c0: d3ecl): h0dcl
fun
trcmp30_declist
( env0:
! compenv, d3cs: d3eclist): h0dclist
//
(* ****** ****** *)

(* end of [xats_trcmp30.sats] *)
