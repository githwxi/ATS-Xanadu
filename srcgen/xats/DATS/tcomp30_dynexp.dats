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
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#include
"./../HATS/xatsopt.hats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)
//
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
//
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)
//
implement
tcomp30_program
  (prog0) =
  (prog1) where
{
//
val
prog1 =
tcomp30_declist(prog0)
//
} (* end of [tcomp30_program] *)
//
(* ****** ****** *)

implement
tcomp30_dvar
  (d2v0) =
let
val opt =
the_dvarmap_search_opt(d2v0)
in
case+ opt of
| ~
Some_vt
( hdv1 ) => hdv1
| ~
None_vt() =>
let
val hdv1 =
hdvar_make_dvar(d2v0)
in
the_dvarmap_insert_any(d2v0, hdv1); hdv1
end
end // end of [tcomp30_dvar]

(* ****** ****** *)
//
implement
tcomp30_dvaropt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d2v0) => Some(tcomp30_dvar(d2v0))
)
//
(* ****** ****** *)

implement
tcomp30_dcon
  (d2c0) =
let
val opt =
the_dconmap_search_opt(d2c0)
in
case+ opt of
| ~
Some_vt
( hdc1 ) => hdc1
| ~
None_vt((*void*)) =>
let
val hdc1 = hdcon_make_dcon(d2c0)
in
the_dconmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [tcomp30_dcon]

implement
tcomp30_dcst
  (d2c0) =
let
val opt =
the_dcstmap_search_opt(d2c0)
in
case+ opt of
| ~
Some_vt(hdc1) => hdc1
| ~
None_vt((*void*)) =>
let
val hdc1 =
hdcst_make_dcst(d2c0)
in
the_dcstmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [tcomp30_dcst]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxnil
(d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
in
h0pat_make_node(loc0, h0t0, H0Pnil)
end
fun
auxany
(d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
in
h0pat_make_node(loc0, h0t0, H0Pany)
end

(* ****** ****** *)

fun
auxvar
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdv1 =
(
  tcomp30_dvar(d2v0)
) where
{
  val-
  D3Pvar(d2v0) = d3p0.node()
}
//
val hend = H0Pvar(hdv1)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxdapp
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = d3p0.node()
//
val
h0f0 = tcomp30_dpat(d3f0)
val
h0ps = tcomp30_dpatlst(d3ps)
//
val
hend = H0Pdapp(h0f0, npf1, h0ps)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_tuple
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Ptuple
( knd0
, npf1
, d3ps) = d3p0.node()
//
val
h0ps = tcomp30_dpatlst(d3ps)
//
val
hend = H0Ptuple(knd0, npf1, h0ps)
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [aux_tuple]

(* ****** ****** *)

in

(* ****** ****** *)

implement
tcomp30_dpat
  (d3p0) = let
//
(*
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val () =
println!
("tcomp30_dpat: d3p0 = ", d3p0)
val () =
println!
("tcomp30_dpat: t2p0 = ", t2p0)
*)
//
in(*in-of-let*)
//
case+
d3p0.node() of
//
|
D3Pnil() => auxnil(d3p0)
|
D3Pany() => auxany(d3p0)
//
|
D3Pvar _ => auxvar(d3p0)
//
|
D3Pcon1(d2c0) =>
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
val
hdc0 = tcomp30_dcon(d2c0)
in
h0pat_make_node
(loc0, h0t0, H0Pcon(hdc0))
end
//
|
D3Pbang(d3p1) =>
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
val
h0p1 = tcomp30_dpat(d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pbang(h0p1))
end
|
D3Pflat(d3p1) =>
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
val
h0p1 = tcomp30_dpat(d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pflat(h0p1))
end
|
D3Pfree(d3p1) =>
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
val
h0p1 = tcomp30_dpat(d3p1)
in
h0pat_make_node
(loc0, h0t0, H0Pfree(h0p1))
end
|
D3Psap0
( d3p1
, sarg) => tcomp30_dpat(d3p1)
|
D3Psap1
( d3p1
, sarg) => tcomp30_dpat(d3p1)
|
D3Pdapp
( d3f0
, npf1, d3ps) => auxdapp(d3p0)
|
D3Ptuple
( knd0
, npf1, d3ps) => aux_tuple(d3p0)
|
D3Panno
(d3p1, s2e2) => tcomp30_dpat(d3p1)
//
| _(* rest-of_d3pat *) =>
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Pnone1($UN.cast{ptr}(d3p0))
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [tcomp30_dpat]

end // end of [local]

(* ****** ****** *)
implement
tcomp30_dpatlst
  (d3ps) =
list_vt2t(h0ps) where
{
val
h0ps =
list_map<d3pat><h0pat>
  (d3ps) where
{
implement
list_map$fopr<d3pat><h0pat>(d3p) = tcomp30_dpat(d3p)
}
} (* end of [tcomp30_dpatlst] *)
(* ****** ****** *)

implement
tcomp30_farg
  (f3a0) =
let
val
loc0 = f3a0.loc()
in
case+
f3a0.node() of
| F3ARGsome_dyn
  (npf0, d3ps) =>
  let
  val
  h0ps =
  tcomp30_dpatlst(d3ps)
  in
  hfarg_make_node
  (loc0, HFARGnpats(npf0, h0ps))
  end
| _ (* else *) =>
  let
  val
  hend =
  $UN.cast{ptr}(f3a0)
  in
  hfarg_make_node(loc0, HFARGnone1(hend))
  end
end // end of [tcomp30_farg]

(* ****** ****** *)
implement
tcomp30_farglst
  (f3as) =
list_vt2t(hfas) where
{
val
hfas =
list_map<f3arg><hfarg>
  (f3as) where
{
implement
list_map$fopr<f3arg><hfarg>(f3a) = tcomp30_farg(f3a)
}
} (* end of [tcomp30_farglst] *)
(* ****** ****** *)

implement
tcomp30_ti3arg
  (ti3a) =
(
case+ ti3a of
| TI3ARGnone() =>
  HTIARGnone()
| TI3ARGsome(t2ps) =>
  HTIARGsome(tcomp30_typelst(t2ps))
)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxi00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Ei00(int) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ei00(int))
end // end of [auxi00]

fun
auxb00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Eb00(btf) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eb00(btf))
end // end of [auxb00]

fun
auxs00
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Es00(str) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Es00(str))
end // end of [auxs00]

(* ****** ****** *)

fun
auxint
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Eint(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eint(tok))
end // end of [auxint]

(* ****** ****** *)

fun
auxbtf
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Ebtf(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ebtf(tok))
end // end of [auxbtf]

fun
auxchr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Echr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Echr(tok))
end // end of [auxchr]

(* ****** ****** *)

fun
auxflt
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Eflt(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eflt(tok))
end // end of [auxflt]

fun
auxstr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Estr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Estr(tok))
end // end of [auxstr]

(* ****** ****** *)

fun
auxtop
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Etop(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Etop(tok))
end // end of [auxtop]

(* ****** ****** *)

fun
auxvar
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdv1 =
(
  tcomp30_dvar(d2v0)
) where
{
  val-
  D3Evar(d2v0) = d3e0.node()
}
//
val hend = H0Evar(hdv1)
//
in
h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxvknd
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Evknd
(k0, d2v0) = d3e0.node()
val
hdv1 = tcomp30_dvar(d2v0)
//
val hend = H0Evknd(k0, hdv1)
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxfcon
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdc1 =
(
  tcomp30_dcon(d2c0)
) where
{
  val-
  D3Efcon(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcon(hdc1))
end

(* ****** ****** *)

fun
auxfcst
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdc1 =
(
  tcomp30_dcst(d2c0)
) where
{
  val-
  D3Efcst(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcst(hdc1))
end

(* ****** ****** *)

fun
auxtcon
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Etcon
( d2c0
, ti3a, ti2s) = d3e0.node()
//
val hdc1 = tcomp30_dcon(d2c0)
val htia = tcomp30_ti3arg(ti3a)
//
in
  h0exp_make_node
  (loc0, h0t0, H0Etcon(hdc1, htia))
end

(* ****** ****** *)

fun
auxtcst
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Etcst
( d2c0
, ti3a, ti2s) = d3e0.node()
//
val hdc1 = tcomp30_dcst(d2c0)
val htia = tcomp30_ti3arg(ti3a)
//
in
  h0exp_make_node
  (loc0, h0t0, H0Etcst(hdc1, htia))
end

(* ****** ****** *)

fun
auxtimp
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Etimp
( stmp
, d3e1, targ
, d3cl, tsub) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
val targ = tcomp30_typelst(targ)
//
val hdcl = tcomp30_decl(d3cl)
val tsub = tcomp30_typelst(tsub)
//
in
h0exp_make_node
(loc0, h0t0, H0Etimp(stmp, h0e1, targ, hdcl, tsub))
end // end of [auxtimp]

(* ****** ****** *)

fun
auxdapp
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Edapp(h0f0, npf1, h0es)
) where
{
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
val h0f0 = tcomp30_dexp(d3f0)
val h0es = tcomp30_dexplst(d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_let
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Elet(hdcl, h0e1)
) where
{
val-
D3Elet
(d3cs, d3e1) = d3e0.node()
//
val
hdcl = tcomp30_declist(d3cs)
//
val h0e1 = tcomp30_dexp(d3e1)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_let]

fun
aux_where
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Elet(hdcl, h0e1)
) where
{
val-
D3Ewhere
(d3e1, d3cs) = d3e0.node()
//
val
hdcl = tcomp30_declist(d3cs)
//
val h0e1 = tcomp30_dexp(d3e1)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_where]

(* ****** ****** *)

fun
aux_pcon
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Epcon(h0e1, lab2)
) where
{
val-
D3Epcon
(d3e1, lab2) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
//
} (* where *) // end-of-val
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_pbox
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
H0Epbox(h0e1, lab2, idx2)
) where
{
val-
D3Epbox
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
//
} (* where *) // end-of-val
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_proj
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
H0Eproj(h0e1, lab2, idx2)
) where
{
val-
D3Eproj
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_plft
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
H0Eplft(h0e1, lab2, idx2)
) where
{
val-
D3Eplft
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

fun
aux_pptr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
H0Epptr(h0e1, lab2, idx2)
) where
{
val-
D3Epptr
( d3e1
, lab2, idx2) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
//
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_seqn
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Eseqn(h0es, h0e1)
) where
{
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
val
h0es = tcomp30_dexplst(d3es)
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_tuple
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
H0Etuple(knd0, npf1, h0es)
) where
{
val-
D3Etuple
( knd0
, npf1, d3es) = d3e0.node()
val
h0es = tcomp30_dexplst(d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_assgn
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Eassgn
  (h0e1(*l*), h0e2(*r*))
) where
{
val-
D3Eassgn
( d3e1
, d3e2 ) = d3e0.node()
val h0e1 = tcomp30_dexp(d3e1)
val h0e2 = tcomp30_dexp(d3e2)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_assgn]

(* ****** ****** *)

fun
aux_if0
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Eif0(h0e1, h0e2, opt3)
) where
{
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
val h0e1 = tcomp30_dexp(d3e1)
val h0e2 = tcomp30_dexp(d3e2)
val opt3 = tcomp30_dexpopt(opt3)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_if0]

(* ****** ****** *)

fun
aux_case
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Ecase(knd0, h0e1, hcls)
) where
{
val-
D3Ecase
( knd0
, d3e1, dcls) = d3e0.node()
val h0e1 = tcomp30_dexp(d3e1)
val hcls = tcomp30_dclaulst(dcls)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_case]

(* ****** ****** *)

fun
aux_lam
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val hend =
(
H0Elam(knd, hfas, body)
) where
{
val-
D3Elam
( knd
, f3as, res1
, arrw, body) = d3e0.node()
val
hfas = tcomp30_farglst(f3as)
val body = tcomp30_dexp(body)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val hend =
(
  H0Efix
  (knd, fid, hfas, body)
) where
{
val-
D3Efix
( knd
, fid
, f3as, res1
, arrw, body) = d3e0.node()
//
val fid = tcomp30_dvar(fid)
//
val
hfas = tcomp30_farglst(f3as)
val body = tcomp30_dexp(body)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_try0
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Etry0(knd0, h0e1, hcls)
) where
{
val-
D3Etry0
( knd0
, d3e1, dcls) = d3e0.node()
val h0e1 = tcomp30_dexp(d3e1)
val hcls = tcomp30_dclaulst(dcls)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_try0]

(* ****** ****** *)

fun
aux_addr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Eaddr(h0e1) where
{
//
val-
D3Eaddr(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_addr]

(* ****** ****** *)

fun
aux_flat
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Eflat(h0e1) where
{
//
val-
D3Eflat(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_flat]

(* ****** ****** *)

fun
aux_talf
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Etalf(h0e1) where
{
//
val-
D3Etalf(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_talf]

(* ****** ****** *)

fun
aux_fold
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Efold(h0e1) where
{
//
val-
D3Efold(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_fold]

(* ****** ****** *)

fun
aux_eval
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Eeval(knd0, h0e1) where
{
//
val-
D3Eeval
(knd0, d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_eval]

(* ****** ****** *)

fun
aux_free
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Efree(knd0, h0e1) where
{
//
val-
D3Efree
(knd0, d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_free]

(* ****** ****** *)

fun
aux_raise
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Eraise(h0e1) where
{
//
val-
D3Eraise(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_raise]

(* ****** ****** *)

fun
aux_lazy
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend = H0Elazy(h0e1) where
{
//
val-
D3Elazy(d3e1) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_lazy]

(* ****** ****** *)

fun
aux_llazy
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Ellazy(h0e1, h0es) where
{
//
val-
D3Ellazy
(d3e1, d3es) = d3e0.node()
//
val h0e1 = tcomp30_dexp(d3e1)
val h0es = tcomp30_dexplst(d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_llazy]

(* ****** ****** *)

in(*in-of-local*)

implement
tcomp30_dexp
  (d3e0) = let
//
#if(__XATSOPT_DEBUG__)
(*
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val () =
println!
("tcomp30_dexp: d3e0 = ", d3e0)
val () =
println!
("tcomp30_dexp: t2p0 = ", t2p0)
*)
#endif//__XATSOPT_DEBUG__
//
in
//
case+
d3e0.node() of
//
|
D3Ei00 _ => auxi00(d3e0)
|
D3Eb00 _ => auxb00(d3e0)
|
D3Es00 _ => auxs00(d3e0)
//
|
D3Eint _ => auxint(d3e0)
|
D3Ebtf _ => auxbtf(d3e0)
|
D3Echr _ => auxchr(d3e0)
|
D3Eflt _ => auxflt(d3e0)
|
D3Estr _ => auxstr(d3e0)
//
|
D3Etop _ => auxtop(d3e0)
//
|
D3Evar _ => auxvar(d3e0)
|
D3Evknd _ => auxvknd(d3e0)
//
|
D3Efcon _ => auxfcon(d3e0)
|
D3Efcst _ => auxfcst(d3e0)
//
|
D3Etcon _ => auxtcon(d3e0)
|
D3Etcst _ => auxtcst(d3e0)
//
|
D3Etimp _ => auxtimp(d3e0)
//
|
D3Edapp _ => auxdapp(d3e0)
//
| D3Elet _ => aux_let(d3e0)
|
D3Ewhere _ => aux_where(d3e0)
//
|
D3Epcon _ => aux_pcon(d3e0)
|
D3Epbox _ => aux_pbox(d3e0)
//
|
D3Eproj _ => aux_proj(d3e0)
|
D3Eplft _ => aux_plft(d3e0)
|
D3Epptr _ => aux_pptr(d3e0)
//
|
D3Eseqn _ => aux_seqn(d3e0)
//
|
D3Etuple _ => aux_tuple(d3e0)
//
|
D3Eassgn _ => aux_assgn(d3e0)
//
| D3Eif0 _ => aux_if0(d3e0)
//
| D3Ecase _ => aux_case(d3e0)
//
| D3Elam _ => aux_lam(d3e0)
| D3Efix _ => aux_fix(d3e0)
//
| D3Etry0 _ => aux_try0(d3e0)
//
| D3Eaddr _ => aux_addr(d3e0)
| D3Eflat _ => aux_flat(d3e0)
| D3Etalf _ => aux_talf(d3e0)
//
| D3Efold _ => aux_fold(d3e0)
//
| D3Eeval _ => aux_eval(d3e0)
| D3Efree _ => aux_free(d3e0)
//
| D3Eraise _ => aux_raise(d3e0) 
//
| D3Elazy _ => aux_lazy(d3e0)
| D3Ellazy _ => aux_llazy(d3e0)
//
|
D3Eanno
(d3e1, _) => tcomp30_dexp(d3e1)
|
D3Enone0 _ =>
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
in
  h0exp_make_node
  (loc0, h0t0, H0Enone0(*void*))
end // end of [let]
//
| _(*rest-of_d3exp*) =>
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Enone1($UN.cast{ptr}(d3e0))
//
in
h0exp_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [tcomp30_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
tcomp30_dexpopt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d3e) => Some(tcomp30_dexp(d3e))
)
//
implement
tcomp30_dexplst
  (d3es) =
list_vt2t(h0es) where
{
val
h0es =
list_map<d3exp><h0exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><h0exp>(d3e) = tcomp30_dexp(d3e)
}
} (* end of [tcomp30_dexplst] *)
//
(* ****** ****** *)
//
implement
tcomp30_dgua
  (d3g0) =
let
val
loc0 = d3g0.loc()
in
case+
d3g0.node() of
|
D3GUAexp(d3e1) =>
let
  val
  h0e1 = tcomp30_dexp(d3e1)
in
  h0gua_make_node(loc0, H0GUAexp(h0e1))
end
|
D3GUAmat(d3e1, d3p2) =>
let
val
h0e1 = tcomp30_dexp(d3e1)
val
h0p2 = tcomp30_dpat(d3p2)
in
h0gua_make_node(loc0, H0GUAmat(h0e1, h0p2))
end
end // end of [tcomp30_dgua]
//
implement
tcomp30_dgualst
  (d3gs) =
list_vt2t(h0gs) where
{
val
h0gs =
list_map<d3gua><h0gua>
  (d3gs) where
{
implement
list_map$fopr<d3gua><h0gua>(d3g) = tcomp30_dgua(d3g)
}
} (* end of [tcomp30_dgualst] *)
//
(* ****** ****** *)
//
implement
tcomp30_dclau
  (d3cl) =
let
val
loc0 = d3cl.loc()
in
//
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
let
val
h0gp =
tcomp30_dgpat(d3gp)
in
h0clau_make_node(loc0, H0CLAUpat(h0gp))
end
|
D3CLAUexp(d3gp, d3e1) =>
let
val
h0gp =
tcomp30_dgpat(d3gp)
val
h0e1 = tcomp30_dexp(d3e1)
in
h0clau_make_node(loc0, H0CLAUexp(h0gp, h0e1))
end
//
end // end of [tcomp30_dclau]
//
implement
tcomp30_dgpat
  (d3gp) =
let
val
loc0 = d3gp.loc()
in
//
case+
d3gp.node() of
|
D3GPATpat(d3p1) =>
let
val
h0p1 =
tcomp30_dpat(d3p1)
in
h0gpat_make_node(loc0, H0GPATpat(h0p1))
end
|
D3GPATgua(d3p1, d3gs) =>
let
val
h0p1 =
tcomp30_dpat(d3p1)
val
h0gs =
tcomp30_dgualst(d3gs)
in
h0gpat_make_node(loc0, H0GPATgua(h0p1, h0gs))
end
//
end // end of [tcomp30_dgpat]
//
implement
tcomp30_dclaulst
  (dcls) =
list_vt2t(hcls) where
{
val
hcls =
list_map<d3clau><h0clau>
  (dcls) where
{
implement
list_map$fopr<d3clau><h0clau>(dcl) = tcomp30_dclau(dcl)
}
} (* end of [tcomp30_dclaulst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)
//
fun
aux_fundecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundecl
( knd
, mopt
, tqas
, f3ds) = d3cl.node()
//
val
tqas =
tcomp30_tqarglst(tqas)
//
fun
auxf3d0
( f3d0
: f3undecl): hfundecl =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
val rtp = rcd.rtp
//
val nam = tcomp30_dvar(nam)
val hdc = tcomp30_dcst(d2c)
val hag =
(
case+ a3g of
|
None() =>
None()
|
Some(f3as) =>
Some(tcomp30_farglst(f3as))
) : hfarglstopt // end-of-val
val rtp = tcomp30_type(rtp)
val def = tcomp30_dexpopt(def)
//
in
HFUNDECL(
@{
 loc=loc,nam=nam
,hdc=hdc,hag=hag,def=def,rtp=rtp}
) (* HFUNDECL *)
end // end of [auxf3d0]
and
auxf3ds
( f3ds
: f3undeclist
)
: hfundeclist =
list_vt2t
(
list_map<f3undecl><hfundecl>(f3ds)
) where
{
implement
list_map$fopr<f3undecl><hfundecl>(f3d) = auxf3d0(f3d)
}
//
in
//
let
val
hfds = auxf3ds(f3ds)
in
  h0dcl_make_node
  ( loc0
  , H0Cfundecl(knd, mopt, tqas, hfds))
end // end of [let]
//
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_valdecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvaldecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( v3d0
: v3aldecl
)
: hvaldecl =
let
//
val+
V3ALDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
tcomp30_dpat(pat)
val def =
tcomp30_dexpopt(def)
//
in
HVALDECL
( @{loc=loc,pat=pat,def=def} )
end // end of [auxv3d0]
and
auxv3ds
( v3ds
: v3aldeclist
)
: hvaldeclist =
list_vt2t
(
list_map<
  v3aldecl><hvaldecl>(v3ds)
) where
{
implement
list_map$fopr<v3aldecl><hvaldecl>(v3d) = auxv3d0(v3d)
}
//
in
let
val hvds = auxv3ds(v3ds)
in
  h0dcl_make_node
  (loc0, H0Cvaldecl(knd, mopt, hvds))
end
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvardecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( v3d0
: v3ardecl
)
: hvardecl =
let
//
val+
V3ARDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val ini = rcd.ini
//
val hdv =
tcomp30_dvar(d2v)
val wth =
tcomp30_dvaropt(wth)
val ini =
tcomp30_dexpopt(ini)
//
in
HVARDECL
(
@{loc=loc,hdv=hdv,wth=wth,ini=ini}
)
end // end of [auxv3d0]
and
auxv3ds
( v3ds
: v3ardeclist
)
: hvardeclist =
list_vt2t
(
list_map<v3ardecl><hvardecl>(v3ds)
) where
{
implement
list_map$fopr<v3ardecl><hvardecl>(v3d) = auxv3d0(v3d)
}
//
in
let
  val
  hvds = auxv3ds(v3ds)
in
  h0dcl_make_node
  (loc0, H0Cvardecl(knd, mopt, hvds))
end
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_excptcon
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cexcptcon
(d1cl, d2cs) = d3cl.node()
//
fun
auxd2cs
( d2cs
: d2conlst): hdconlst =
(
case+ d2cs of
|
list_nil() =>
list_nil()
|
list_cons
(d2c1, d2cs) =>
let
  val hdc1 =
  tcomp30_dcon(d2c1)
in
  list_cons(hdc1, auxd2cs(d2cs))
end
)
//
in
//
let
val hdcs = auxd2cs(d2cs)
in
h0dcl_make_node(loc0, H0Cexcptcon(hdcs))
end
//
end // end of [aux_excptcon]

(* ****** ****** *)

fun
aux_impdecl3
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimpdecl3
( knd
, stmp, mopt
, sqas, tqas
, id2c, ti3a
, ti2s, f3as
, res1, body) = d3cl.node()
//
local
//
fun
auxs2vs
( s2vs
: s2varlst
, htvs
: htvarlst): htvarlst =
(
case+ s2vs of
|
list_nil() => htvs
|
list_cons(s2v1, s2vs) =>
let
val
htv1 = tcomp30_svar(s2v1)
in
list_cons
(htv1, auxs2vs(s2vs, htvs))
end // end of [list_cons]
)
//
in
//
val
htvs = list_nil()
val
htvs =
auxs2vs(tqas.s2vs(), htvs)
val
htvs =
auxs2vs(sqas.s2vs(), htvs)
//
end // end of [local]
//
val htqa =
(
case+ htvs of
|
list_nil() => None()
|
list_cons _ =>
Some(htqarg_make(loc0, htvs))
) : htqargopt // end-of-val
//
val
d2c0 =
(
case+ id2c of
|
IMPLD2CST1(_, d2cs) =>
let
  val-
  list_cons
  (d2c0, _) = d2cs in d2c0
end
|
IMPLD2CST2
(_, d2cs, opt0) =>
let
val-Some(d2c0) = opt0 in d2c0
end
) : d2cst // end-of-val
//
val
hdc0 = tcomp30_dcst(d2c0)
//
val
htia = tcomp30_ti3arg(ti3a)
//
val
hfas = tcomp30_farglst(f3as)
//
val body = tcomp30_dexp(body)
//
val
hend =
H0Cimpdecl3
( knd
, stmp, mopt
, htqa, hdc0, htia, hfas, body)
in
  h0dcl_make_node(loc0, hend(*impdecl*))
end // end of [aux_impdecl3]

(* ****** ****** *)

in(*in-of-local*)

implement
tcomp30_decl
  (d3cl) = let
//
val
loc0 = d3cl.loc()
//
(*
val () =
println!
("tcomp30_decl: d3cl = ", d3cl)
*)
//
in(*in-of-local*)
//
case+
d3cl.node() of
//
|
D3Cstatic
(tok, d3c1) => let
  val
  h0c1 = tcomp30_decl(d3c1)
in
  h0dcl_make_node
  (loc0, H0Cstatic(tok, h0c1))
end
|
D3Cextern
(tok, d3c1) => let
  val
  h0c1 = tcomp30_decl(d3c1)
in
  h0dcl_make_node
  (loc0, H0Cextern(tok, h0c1))
end
//
|
D3Clocal
(head, body) => let
  val
  head = tcomp30_declist(head)
  val
  body = tcomp30_declist(body)
in
  h0dcl_make_node
  ( loc0, H0Clocal(head, body) )
end
//
|
D3Cfundecl _ => aux_fundecl(d3cl)
//
|
D3Cvaldecl _ => aux_valdecl(d3cl)
|
D3Cvardecl _ => aux_vardecl(d3cl)
//
|
D3Cexcptcon _ => aux_excptcon(d3cl)
//
|
D3Cimpdecl3 _ => aux_impdecl3(d3cl)
|
_(* rest-of_d3exp *) =>
let
  val
  node =
  H0Cnone1($UN.cast{ptr}(d3cl))
in h0dcl_make_node(loc0, node) end
//
end // end of [tcomp30_decl]

end // end of [local]

(* ****** ****** *)

implement
tcomp30_declist
  (d3cs) =
list_vt2t(h0cs) where
{
val
h0cs =
list_map<d3ecl><h0dcl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><h0dcl>(d3c) = tcomp30_decl(d3c)
}
} (* end of [tcomp30_declist] *)

(* ****** ****** *)
//
implement
tcomp30_tqarg
  (tqa0) =
(
  htqarg_make(loc0, htvs)
) where
{
val loc0 = tqa0.loc()
val htvs =
tcomp30_svarlst(tqa0.s2vs())
}

implement
tcomp30_tqarglst
  (tqas) =
list_vt2t(tqas) where
{
val
tqas =
list_map<tq2arg><htqarg>
  (tqas) where
{
implement
list_map$fopr<tq2arg><htqarg>(tqa) = tcomp30_tqarg(tqa)
}
} (* end of [tcomp30_tqarglst] *)
//
(* ****** ****** *)

(* end of [xats_tcomp30_dynexp.dats] *)
