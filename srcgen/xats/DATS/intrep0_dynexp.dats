(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: November, 2019
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

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

local

fun
auxdapp
( d3p0
: d3pat): ir0pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Pdapp
( d3f0
, npf1
, d3ps) = d3p0.node()
//
val d3ps =
(
auxnpf(npf1, d3ps)
) where
{
fun
auxnpf
( npf1
: int
, d3ps
: d3patlst) : d3patlst =
(
if
npf1 > 0
then let
//
val-
list_cons
(_, d3ps) = d3ps
in
auxnpf(npf1-1, d3ps)
end // end of [then]
else d3ps // end of [else]
)
}
//
val irps =
irerase_dpatlst(d3ps)
//
in
//
case-
d3f0.node() of
|
D3Pcon1(d2c0) =>
ir0pat_make_node
(loc0, IR0Pcapp(d2c0, irps))
//
end // end of [auxdapp]

in(*in-of-local*)

implement
irerase_dpat
  (d3p0) =
let
//
val loc0 = d3p0.loc()
//
in
//
case+
d3p0.node() of
//
| D3Pint(tok) =>
  ir0pat_make_node
  (loc0, IR0Pint(tok))
| D3Pbtf(tok) =>
  ir0pat_make_node
  (loc0, IR0Pbtf(tok))
//
| D3Pany() =>
  ir0pat_make_node
  (loc0, IR0Pany((*void*)))
| D3Pvar(d2v) =>
  ir0pat_make_node(loc0, IR0Pvar(d2v))
//
| D3Pdapp _ => auxdapp(d3p0)
//
| D3Panno(d3p1, _) => irerase_dpat(d3p1)
//
| _(*rest-of-d3pat*) =>
  ir0pat_make_node(loc0, IR0Pnone1(d3p0))
//
end // end of [irerase_dpat]

end // end of [local]

(* ****** ****** *)

implement
irerase_dpatlst
  (d3ps) =
list_vt2t(irps) where
{
val
irps =
list_map<d3pat><ir0pat>
  (d3ps) where
{
implement
list_map$fopr<d3pat><ir0pat>(d3p) = irerase_dpat(d3p)
}
} (* end of [irerase_dpatlst] *)

(* ****** ****** *)

implement
irerase_farglst
  (f3as) =
(
case+ f3as of
|
list_nil() =>
list_nil()
|
list_cons
(f3a0, f3as) =>
(
case+
f3a0.node() of 
//
| F3ARGsome_dyn
    (npf, d3ps) =>
  (
    list_cons(ir0a, iras)
  ) where
  {
    val ir0a =
    IR0ARGsome
    (npf, irerase_dpatlst(d3ps))
    val iras = irerase_farglst(f3as)
  }
//
| F3ARGnone2 _ => irerase_farglst(f3as)
| F3ARGnone3 _ => irerase_farglst(f3as)
//
| F3ARGsome_sta _ => irerase_farglst(f3as)
| F3ARGsome_met _ => irerase_farglst(f3as)
)
) (* end of [irerase_farglst] *)


(* ****** ****** *)

implement
irerase_dexp
  (d3e0) =
let
//
val loc0 = d3e0.loc()
//
in
//
case+
d3e0.node() of
//
| D3Eint(tok) =>
  ir0exp_make_node
  (loc0, IR0Eint(tok))
| D3Ebtf(tok) =>
  ir0exp_make_node
  (loc0, IR0Ebtf(tok))
| D3Estr(tok) =>
  ir0exp_make_node
  (loc0, IR0Estr(tok))
//
| D3Evar(d2v) =>
  ir0exp_make_node
  (loc0, IR0Evar(d2v))
| D3Econ1(d2c) =>
  ir0exp_make_node
  (loc0, IR0Econ1(d2c))
| D3Ecst1(d2c) =>
  ir0exp_make_node
  (loc0, IR0Ecst1(d2c))
//
| D3Efcst(d2c) =>
  ir0exp_make_node
  (loc0, IR0Efcst(d2c))
//
| D3Edapp
  (d3f0, npf1, d3es) =>
  let
  val irf0 = irerase_dexp(d3f0)
  val ires = irerase_dexplst(d3es)
  in
    ir0exp_make_node
    ( loc0
    , IR0Edapp(irf0, npf1, ires))
  end
//
| D3Elet(d3cs, d3e1) =>
  let
    val
    ircs =
    irerase_declist(d3cs)
  in
    let
    val
    ire1 = irerase_dexp(d3e1)
    in
      ir0exp_make_node
      (loc0, IR0Elet(ircs, ire1))
    end
  end
| D3Ewhere(d3e1, d3cs) =>
  let
    val
    ire1 = irerase_dexp(d3e1)
    val
    ircs = irerase_declist(d3cs)
  in
    ir0exp_make_node
    (loc0, IR0Ewhere(ire1, ircs))
  end
//
| D3Etuple
  (knd0, npf1, d3es) =>
  let
    val
    ires = irerase_dexplst(d3es)
  in
    ir0exp_make_node
    ( loc0
    , IR0Etuple(knd0, npf1, ires))
  end
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  let
    val
    ire1 = irerase_dexp(d3e1)
    val
    ire2 = irerase_dexp(d3e2)
    val
    opt3 = irerase_dexpopt(opt3)
  in
    ir0exp_make_node
    (loc0, IR0Eif0(ire1, ire2, opt3))
  end
//
| D3Ecase
  (knd0, d3e1, d3cls) =>
  let
    val ire1 = irerase_dexp(d3e1)
    val ircls = irerase_dclaulst(d3cls)
  in
    ir0exp_make_node
    (loc0, IR0Ecase(knd0, ire1, ircls))
  end
//
| D3Elam
  ( knd0
  , f3as, res1, arrw, body) =>
  let
    val iras =
    irerase_farglst(f3as)
  in
    let
      val
      body = irerase_dexp(body)
    in
      ir0exp_make_node
      (loc0, IR0Elam(knd0, iras, body))
    end
  end
| D3Efix
  ( knd0
  , d2v0
  , f3as, res1, arrw, body) =>
  let
    val iras =
    irerase_farglst(f3as)
  in
    let
      val
      body = irerase_dexp(body)
    in
      ir0exp_make_node
      ( loc0
      , IR0Efix(knd0, d2v0, iras, body))
    end
  end
//
| _(*rest-of-d3exp*) =>
  ir0exp_make_node(loc0, IR0Enone1(d3e0))
//
end // end of [irerase_dexp]

(* ****** ****** *)

implement
irerase_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d3e) => Some(irerase_dexp(d3e))
) (* end of [irerase_dexpopt] *)

implement
irerase_dexplst
  (d3es) =
list_vt2t(ires) where
{
val
ires =
list_map<d3exp><ir0exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><ir0exp>(d3e) = irerase_dexp(d3e)
}
} (* end of [irerase_dexplst] *)

(* ****** ****** *)

implement
irerase_dgua
  (d3g0) =
let
val loc0 = d3g0.loc()
in
case+
d3g0.node() of
|
D3GUAexp(d3e1) =>
(
  ir0gua_make_node
  (loc0, IR0GUAexp(ire1))
) where
{
  val ire1 = irerase_dexp(d3e1)
}
|
D3GUAmat(d3e1, d3p2) =>
(
  ir0gua_make_node
  (loc0, IR0GUAmat(ire1, irp2))
) where
{
  val ire1 = irerase_dexp(d3e1)
  val irp2 = irerase_dpat(d3p2)
}
end // end of [irerase_dgua]

implement
irerase_dgualst
  (d3gs) =
list_vt2t(irgs) where
{
val
irgs =
list_map<d3gua><ir0gua>
  (d3gs) where
{
implement
list_map$fopr<d3gua><ir0gua>(d3g) = irerase_dgua(d3g)
}
} (* end of [irerase_dgualst] *)

(* ****** ****** *)

implement
irerase_dgpat
  (d3gp) =
let
val loc0 = d3gp.loc()
in
case+
d3gp.node() of
|
D3GPATpat(d3p1) =>
(
  ir0gpat_make_node
  (loc0, IR0GPATpat(irp1))
) where
{
  val irp1 = irerase_dpat(d3p1)
}
|
D3GPATgua(d3p1, d3gs) =>
(
  ir0gpat_make_node
  (loc0, IR0GPATgua(irp1, irgs))
) where
{
  val irp1 = irerase_dpat(d3p1)
  val irgs = irerase_dgualst(d3gs)
}
end // end of [irerase_dgpat]

(* ****** ****** *)

implement
irerase_dclau
  (d3cl) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
(
  ir0clau_make_node
  (loc0, IR0CLAUpat(irgp))
) where
{
  val
  irgp = irerase_dgpat(d3gp)
}
|
D3CLAUexp(d3gp, d3e2) =>
(
  ir0clau_make_node
  (loc0, IR0CLAUexp(irgp, ire2))
) where
{
//
  val
  irgp = irerase_dgpat(d3gp)
//
  val ire2 = irerase_dexp(d3e2)
//
}
end // end of [irerase_dclau]

implement
irerase_dclaulst
  (d3cls) =
list_vt2t(ircls) where
{
val
ircls =
list_map<d3clau><ir0clau>
  (d3cls) where
{
implement
list_map$fopr<d3clau><ir0clau>(d3cl) = irerase_dclau(d3cl)
}
} (* end of [irerase_dclaulst] *)

(* ****** ****** *)

implement
irerase_decl
  (d3cl) =
let
//
val loc0 = d3cl.loc()
//
in
//
case+
d3cl.node() of
//
| D3Cstatic
  (tok, d3c1) =>
  (
  ir0dcl_make_node
    (loc0, IR0Cstatic(tok, irc1))
  ) where
  {
    val irc1 = irerase_decl(d3c1)
  }
| D3Cextern
  (tok, d3c1) =>
  (
  ir0dcl_make_node
    (loc0, IR0Cextern(tok, irc1))
  ) where
  {
    val irc1 = irerase_decl(d3c1)
  }
//
| D3Clocal
  (head, body) =>
  let
  val head = irerase_declist(head)
  val body = irerase_declist(body)
  in
    ir0dcl_make_node
      (loc0, IR0Clocal(head, body))
    // ir0dcl_make_node
  end
//
| D3Cvaldecl
  (tok, mopt, v3ds) =>
  let
    val
    irds = irerase_valdeclist(v3ds)
  in
    ir0dcl_make_node
    (loc0, IR0Cvaldecl(tok, mopt, irds))
  end
//
| D3Cfundecl
  (tok, mopt, tqas, f3ds) =>
  let
    val
    irds = irerase_fundeclist(f3ds)
  in
    ir0dcl_make_node
    ( loc0
    , IR0Cfundecl(tok, mopt, tqas, irds))
  end
//
| _(*rest-of-d3ecl*) =>
  ir0dcl_make_node(loc0, IR0Cnone1(d3cl))
//
end // end of [irerase_decl]

implement
irerase_declist
  (d3cs) =
list_vt2t(ircs) where
{
val
ircs =
list_map<d3ecl><ir0dcl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><ir0dcl>(d3c) = irerase_decl(d3c)
}
} (* end of [irerase_declist] *)

(* ****** ****** *)

implement
irerase_valdecl
  (v3d0) =
let
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
//
val pat = irerase_dpat(pat)
val def = irerase_dexpopt(def)
//
in
IR0VALDECL(@{loc=loc,pat=pat,def=def})
end // end of [irerase_valdecl]

implement
irerase_valdeclist
  (v3ds) =
list_vt2t(irds) where
{
val
irds =
list_map<v3aldecl><ir0valdecl>
  (v3ds) where
{
implement
list_map$fopr<v3aldecl><ir0valdecl>(v3d) = irerase_valdecl(v3d)
}
} (* end of [irerase_valdeclist] *)

(* ****** ****** *)

implement
irerase_fundecl
  (f3d0) =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a2g = rcd.a2g
val a3g = rcd.a3g
val def = rcd.def
//
val a3g =
(
case+ a3g of
| None() =>
  None()
| Some(f3as) =>
  Some(irerase_farglst(f3as))
) : ir0arglstopt
//
val def = irerase_dexpopt(def)
//
in
IR0FUNDECL(
@{
 loc=loc
,nam=nam,d2c=d2c,a2g=a2g, a3g=a3g,def=def}
)(*IR0FUNDECL*)
end // end of [irerase_fundecl]

implement
irerase_fundeclist
  (f3ds) =
list_vt2t(irds) where
{
val
irds =
list_map<f3undecl><ir0fundecl>
  (f3ds) where
{
implement
list_map$fopr<f3undecl><ir0fundecl>(v3d) = irerase_fundecl(v3d)
}
} (* end of [irerase_fundeclist] *)

(* ****** ****** *)

(* end of [intrep0_erase.dats] *)
