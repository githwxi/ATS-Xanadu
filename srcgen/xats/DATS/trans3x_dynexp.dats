(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: October, 2019
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

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3x.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
implement
trans3x_program
  (prog0) =
  (prog1) where
{
//
val
env0 = tr3xenv_make_nil()
//
val
prog1 =
trans3x_declist(env0, prog0)
//
val () = tr3xenv_free_nil(env0)
//
} (* end of [trans3x_program] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

typedef
d3end = d3exp_node

(* ****** ****** *)

fun
auxvar
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Evar(d2v0) = dend
in
D3Evknd(knd, d2v0) where
{
val
knd =
tr3xenv_dvar_kind(env0, d2v0)
}
end

fun
aux_lam
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Elam
( knd
, f3as
, res1, arrw, body) = dend
//
val body =
aux_f3as_body(env0, f3as, body)
//
in
  D3Elam
  (knd, f3as, res1, arrw, body)
end // end of [aux_lam]
//
and
aux_fix
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Efix
( knd
, d2v0
, f3as
, res1, arrw, body) = dend
//
val () =
tr3xenv_add_fix1(env0, d2v0)
val body =
aux_f3as_body(env0, f3as, body)
//
in
let
val () = tr3xenv_pop_fix1(env0)
in
D3Efix
( knd
, d2v0, f3as, res1, arrw, body)
end
end // end of [aux_fix]
and
aux_f3as_body
( env0
: !tr3xenv
, f3as
: f3arglst, body: d3exp): d3exp =
(
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
val () = tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
)

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
trans3x_dexp
(env0, d3e0) = let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
dend = d3e0.node()
//
val
t2p0 =
t2ype_normize(t2p0)
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("trans3x_dexp: d3e0 = ", d3e0)
*)
#endif//__XATSOPT_DEBUG__
//
in(*in-of-let*)
//
case+ dend of
//
|
D3Eint(int) =>
d3exp_make_node
(loc0, t2p0, D3Eint(int))
|
D3Ebtf(btf) =>
d3exp_make_node
(loc0, t2p0, D3Ebtf(btf))
|
D3Echr(chr) =>
d3exp_make_node
(loc0, t2p0, D3Echr(chr))
|
D3Eflt(flt) =>
d3exp_make_node
(loc0, t2p0, D3Eflt(flt))
|
D3Estr(str) =>
d3exp_make_node
(loc0, t2p0, D3Estr(str))
//
|
D3Evar _ =>
let
val
dend = auxvar(env0, dend)
in
d3exp_make_node(loc0, t2p0, dend)
end
//
|
D3Esap0
(d3f1, s2es) =>
let
val
d3f1 = trans3x_dexp(env0, d3f1)
in
d3exp_make_node
(loc0, t2p0, D3Esap0(d3f1, s2es))
end
|
D3Esap1
(d3f1, s2es) =>
let
val
d3f1 = trans3x_dexp(env0, d3f1)
in
d3exp_make_node
(loc0, t2p0, D3Esap1(d3f1, s2es))
end
//
|
D3Etapp
(d2f1, s2es) =>
(
d3exp_make_node
(loc0, t2p0, D3Etapp(d2f1, s2es))
)
|
D3Edapp
(d3f1, npf2, d3es) =>
let
val
d3f1 =
trans3x_dexp(env0, d3f1)
val
d3es =
trans3x_dexplst(env0, d3es)
in
d3exp_make_node
( loc0
, t2p0, D3Edapp(d3f1, npf2, d3es)
)
end
|
D3Epcon
(d3e1(*con*), lab2) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
(loc0, t2p0, D3Epcon(d3e1, lab2))
end
|
D3Epbox
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Epbox(d3e1, lab2, idx2)
)
end
//
|
D3Eproj
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Eproj(d3e1, lab2, idx2)
)
end
|
D3Eplft
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Eplft(d3e1, lab2, idx2)
)
end
|
D3Epptr
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Epptr(d3e1, lab2, idx2)
)
end
//
|
D3Elet
(d3cs, d3e1(*seqn*)) =>
let
val () =
tr3xenv_add_let1(env0)
val
d3cs =
trans3x_declist(env0, d3cs)
val
d3e1 = trans3x_dexp(env0, d3e1)
val () = tr3xenv_pop_let1(env0)
in
  d3exp_make_node
  (loc0, t2p0, D3Elet(d3cs, d3e1))
end
|
D3Ewhere(d3e1, d3cs) =>
let
val () =
tr3xenv_add_let1(env0)
val
d3cs =
trans3x_declist(env0, d3cs)
val
d3e1 = trans3x_dexp(env0, d3e1)
val () = tr3xenv_pop_let1(env0)
in
  d3exp_make_node
  (loc0, t2p0, D3Ewhere(d3e1, d3cs))
end
//
|
D3Eif0
(d3e1, d3e2, opt3) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val d3e2 =
trans3x_dexp(env0, d3e2)
val opt3 =
trans3x_dexpopt(env0, opt3)
in
d3exp_make_node
( loc0
, t2p0, D3Eif0(d3e1, d3e2, opt3))
end
|
D3Elam _ =>
let
val dend = aux_lam(env0, dend)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Efix _ =>
let
val dend = aux_fix(env0, dend)
in
  d3exp_make_node(loc0, t2p0, dend)
end
//
|
D3Eaddr(d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Eaddr(d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Eeval
(knd0, d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Eeval(knd0, d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Efree
(knd0, d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Efree(knd0, d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
//
|
dend(*else*) =>
let
val d3e0 =
d3exp_make_node(loc0, t2p0, dend) in d3e0
end
//
end // end of [trans3x_dexp]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
trans3x_dexpopt
(env0, opt) =
(
case+ opt of
| None() => None()
| Some(d3e) =>
  Some(trans3x_dexp(env0, d3e))
) (* end of [trans3x_dexpopt] *)

(* ****** ****** *)

implement
trans3x_dexplst
  (env0, d3es) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3exp><d3exp>(d3es)
) where
{
implement
list_map$fopr<d3exp><d3exp>(d3e0) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3e0 = trans3x_dexp(env0, d3e0)
in
let
prval () = $UN.cast2void(env0) in d3e0
end
end
}
end // end of [trans3x_dexplst]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cinclude
( tok
, src, knd
, fopt, dopt) = d3cl.node()
//
val dopt =
(
case+ dopt of
| None() =>
  None((*void*))
| Some(d3cs) =>
  Some(trans3x_declist(env0, d3cs))
) : d3eclistopt // end-of-val
//
in
//
d3ecl_make_node
( loc0
, D3Cinclude(tok, src, knd, fopt, dopt))
end // end of [aux_include]

(* ****** ****** *)

fun
aux_staload
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl = d3cl

(* ****** ****** *)

fun
aux_fundecl
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cfundecl
( knd
, mopt
, tqas, f3ds) = d3cl.node()
//
fun
auxf3d0
( env0:
! tr3xenv
, f3d0
: f3undecl
)
: f3undecl =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val a2g = rcd.a2g
val a3g = rcd.a3g
val res = rcd.res
val d2c = rcd.d2c
val def = rcd.def
val rtp = rcd.rtp
val wtp = rcd.wtp
val ctp = rcd.ctp
//
val def =
(
case+ a3g of
|
None() => def
|
Some(f3as) =>
(
case+ def of
|
None() => None()
|
Some(body) =>
Some
(aux_f3as_body(env0, f3as, body))
)
) : d3expopt // val
//
val rtp = t2ype_normize(rtp) 
//
in
F3UNDECL
@{
 loc=loc
,nam=nam,d2c=d2c
,a2g=a2g,a3g=a3g
,res=res,def=def,rtp=rtp,wtp=wtp,ctp=ctp}
end // end of [auxf3d0]
//
and
auxf3ds
( env0:
! tr3xenv
, f3ds
: f3undeclist
)
: f3undeclist =
list_vt2t
(
list_map<f3undecl><f3undecl>(f3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<f3undecl><f3undecl>
  (f3d0) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val f3d0 = auxf3d0(env0, f3d0)
in
let
prval () = $UN.cast2void(env0) in f3d0
end
end
} (* end of [auxf3ds] *)
//
and
aux_f3as_body
( env0
: !tr3xenv
, f3as
: f3arglst, body: d3exp): d3exp =
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
val () = tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
//
val f3ds = auxf3ds(env0, f3ds)
//
in
d3ecl_make_node
(loc0, D3Cfundecl(knd, mopt, tqas, f3ds))
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_valdecl
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cvaldecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! tr3xenv
, v3d0
: v3aldecl
)
: v3aldecl =
let
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val () =
tr3xenv_add_dpat(env0, pat)
//
val def =
(
case+ def of
|
None() => None()
|
Some(d3e0) =>
Some(trans3x_dexp(env0, d3e0))
) : d3expopt // end-of-val
//
in
V3ALDECL
(@{loc=loc,pat=pat,def=def,wtp=wtp})
end // end of [auxv3d0]
and
auxv3ds
( env0:
! tr3xenv
, v3ds
: v3aldeclist
)
: v3aldeclist =
list_vt2t
(
list_map<v3aldecl><v3aldecl>(v3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<v3aldecl><v3aldecl>
  (v3d0) =
let
  val env0 =
  $UN.castvwtp0{tr3xenv}(env0)
  val v3d0 = auxv3d0(env0, v3d0)
in
let
prval () = $UN.cast2void(env0) in v3d0
end
end
} (* end of [auxv3ds] *)
//
val v3ds = auxv3ds(env0, v3ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvaldecl(knd, mopt, v3ds))
end // end-of-let // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cvardecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! tr3xenv
, v3d0
: v3ardecl
)
: v3ardecl =
let
val+
V3ARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val res = rcd.res
val ini = rcd.ini
//
val () =
tr3xenv_add_dvar(env0, d2v)
val () =
(
case+ wth of
|
None() => ()
|
Some(d2v) =>
tr3xenv_add_dvar(env0, d2v)
)
//
val ini =
(
case+ ini of
|
None() => None()
|
Some(d3e0) =>
Some(trans3x_dexp(env0, d3e0))
) : d3expopt // end-of-val
//
in
V3ARDECL
@{
 loc=loc
,d2v=d2v,wth=wth,res=res,ini=ini}
end // end of [auxv3d0]
and
auxv3ds
( env0:
! tr3xenv
, v3ds
: v3ardeclist
)
: v3ardeclist =
list_vt2t
(
list_map<v3ardecl><v3ardecl>(v3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<v3ardecl><v3ardecl>
  (v3d0) =
let
  val env0 =
  $UN.castvwtp0{tr3xenv}(env0)
  val v3d0 = auxv3d0(env0, v3d0)
in
let
prval () = $UN.cast2void(env0) in v3d0
end
end
} (* end of [auxv3ds] *)
//
val v3ds = auxv3ds(env0, v3ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvardecl(knd, mopt, v3ds))
end // end-of-let // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_impdecl3
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimpdecl3
( tok0
, stmp, mopt
, sqas, tqas
, id2c
, ti3a, ti2s
, f3as
, res1, body) = d3cl.node()
//
local
fun
aux_f3as_body
( env0
: !tr3xenv
, f3as
: f3arglst, body: d3exp): d3exp =
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
val () = tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
in
val body =
aux_f3as_body(env0, f3as, body)
end // end of [local]
//
in
d3ecl_make_node
( loc0
, D3Cimpdecl3
  ( tok0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s, f3as, res1, body))
end // end of [aux_impdecl3]

(* ****** ****** *)

in(*in-of-local*)

implement
trans3x_decl
(env0, d3cl) = let
//
val loc0 = d3cl.loc()
//
in(* in-of-let *)
//
case+
d3cl.node() of
//
D3Clocal
(head, body) => let
  val () =
  tr3xenv_add_loc1(env0)
  val
  head =
  trans3x_declist(env0, head)
//
  val () =
  tr3xenv_add_loc2(env0)
  val
  body =
  trans3x_declist(env0, body)
//
in
let
val () = tr3xenv_pop_loc12(env0)
in
d3ecl_make_node(loc0, D3Clocal(head, body))
end
end
//
|
D3Cinclude _ => aux_include(env0, d3cl)
|
D3Cstaload _ => aux_staload(env0, d3cl)
//
|
D3Cfundecl _ => aux_fundecl(env0, d3cl)
//
|
D3Cvaldecl _ => aux_valdecl(env0, d3cl)
|
D3Cvardecl _ => aux_vardecl(env0, d3cl)
//
|
D3Cimpdecl3 _ => aux_impdecl3(env0, d3cl)
//
| _(*rest-of-d3ecl*) => d3cl // yet-to-be-handled
//
end // end of [trans3x_decl]

end // end of [local]
//
(* ****** ****** *)
//
implement
trans3x_declist
  (env0, dcls) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3ecl><d3ecl>(dcls)
) where
{
implement
list_map$fopr<d3ecl><d3ecl>(d3cl) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3cl = trans3x_decl(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3x_declist]
//
(* ****** ****** *)

(* end of [xats_trans3x_dynexp.dats] *)
