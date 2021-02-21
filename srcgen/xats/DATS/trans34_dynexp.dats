(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans34.sats"

(* ****** ****** *)

implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
implement
fprint_val<d3exp> = fprint_d3exp
(* ****** ****** *)

implement
fprint_val<d3ecl> = fprint_d3ecl

(* ****** ****** *)
//
implement
fprint_val<f4undecl> = fprint_f4undecl
//
implement
fprint_val<v4aldecl> = fprint_v4aldecl
(*
implement
fprint_val<v4ardecl> = fprint_v4ardecl
*)
//
(* ****** ****** *)

implement
trans34_envless
  (prog) =
  (prog) where
{
//
val
env0 =
tr34env_make_nil()
//
val
prog =
trans34_declist(env0, prog)
//
val () = tr34env_free_nil(env0)
//
} (* end of [trans34_envless] *)

(* ****** ****** *)

local

in(*in-of-local*)

implement
trans34_dpat
(env0, d3p0) =
(
//
case+
d3p0.node() of
//
| _ (*rest-of-d3exp*) => d4pat_none1(d3p0)
//
)

end // end of [local]

(* ****** ****** *)

local

fun
auxi00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ei00(int) = d3e0.node()
//
val
s2i0 = s2exp_int(int)
val
s2e0 = s2exp_type_sint(s2i0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ei00(int))
end // end of [auxi00]

fun
auxb00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eb00(btf) = d3e0.node()
//
val
s2b0 = s2exp_btf(btf)
val
s2e0 = s2exp_type_bool(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Eb00(btf))
end // end of [auxb00]

fun
auxc00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ec00(chr) = d3e0.node()
//
val
s2ch = s2exp_chr(chr)
val
s2e0 = s2exp_type_char(s2ch)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ec00(chr))
end // end of [auxc00]

(* ****** ****** *)

fun
auxint
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eint(tok) = d3e0.node()
//
val
s2i0 =
s2exp_int(dint) where
{
val dint = token2dint(tok)
}
//
val
s2e0 = s2exp_type_sint(s2i0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Eint(tok))
end // end of [auxint]

(* ****** ****** *)

fun
auxbtf
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ebtf(tok) = d3e0.node()
//
val
s2b0 =
s2exp_btf(dbtf) where
{
val dbtf = token2dbtf(tok)
}
//
val
s2e0 = s2exp_type_bool(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ebtf(tok))
end // end of [auxbtf]

(* ****** ****** *)

fun
auxchr
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Echr(tok) = d3e0.node()
//
val
s2b0 =
s2exp_chr(dchr) where
{
val dchr = token2dchr(tok)
}
//
val
s2e0 = s2exp_type_char(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Echr(tok))
end // end of [auxchr]

(* ****** ****** *)

fun
auxfcst
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Efcst(d2c0) = d3e0.node()
//
val
s2e0 = d2cst_get_sexp(d2c0)
//
in
d4exp_make_node
(loc0, s2e0, t2p0, D4Efcst(d2c0))
end // end of [auxchr]

(* ****** ****** *)

in(*in-of-local*)

implement
trans34_dexp
( env0, d3e0) =
(
case+
d3e0.node() of
//
| D3Ei00 _ => auxi00(d3e0)
| D3Eb00 _ => auxb00(d3e0)
| D3Ec00 _ => auxc00(d3e0)
//
| D3Eint _ => auxint(d3e0)
| D3Ebtf _ => auxbtf(d3e0)
| D3Echr _ => auxchr(d3e0)
//
| D3Efcst _ => auxfcst(d3e0)
//
| _ (*rest-of-d3exp*) => d4exp_none1(d3e0)
)

end // end of [local]

(* ****** ****** *)
//
implement
trans34_dexpopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3e0) =>
  Some(trans34_dexp(env0, d3e0))
)
//
implement
trans34_dexplst
(  env0, d3es  ) =
(
list_vt2t
(
list_map<d3exp><d4exp>(d3es)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3exp><d4exp>
  (d3e0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4e0 = trans34_dexp(env0, d3e0)
//
in
let
prval () = $UN.cast2void(env0) in d4e0
end
end // list_map$fopr
} (* end of [trans34_dexplst] *)
//
(* ****** ****** *)

local

fun
aux_fundecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundecl
( tok0
, mopt
, tqas, f3ds) = d3cl.node()
//
val
f4ds =
trans34_fundeclist(env0, f3ds)
//
val () =
println!
("aux_fundecl: f4ds = ", f4ds)
//
in
d4ecl_make_node
( loc0
, D4Cfundecl(tok0, mopt, tqas, f4ds))
end

(* ****** ****** *)

fun
aux_valdecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvaldecl
( tok0
, mopt, v3ds) = d3cl.node()
//
val
v4ds =
trans34_valdeclist(env0, v3ds)
//
val () =
println!
("aux_valdecl: v4ds = ", v4ds)
//
in
d4ecl_make_node
(loc0, D4Cvaldecl(tok0, mopt, v4ds))
end // end of [aux_valdecl]

in(*in-of-local*)

implement
trans34_decl
( env0, d3cl) =
let
//
val () =
println!
("trans34_decl: d3cl = ", d3cl)
//
in(*in-of-local*)
//
case+
d3cl.node() of
//
| D3Cfundecl _ =>
  aux_fundecl(env0, d3cl)
//
| D3Cvaldecl _ =>
  aux_valdecl(env0, d3cl)
//
|
_(*rest-of-d3ecl*) =>
let
  val
  loc0 = d3cl.loc()
in
  d4ecl_make_node(loc0, D4Cnone1(d3cl))
end
//
end // end of [trans34_decl]

end // end of [local]

(* ****** ****** *)
//
implement
trans34_declopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3cl) =>
  Some(trans34_decl(env0, d3cl))
)
//
implement
trans34_declist
(  env0, dcls  ) =
(
list_vt2t
(
list_map<d3ecl><d4ecl>(dcls)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3ecl><d4ecl>
  (d3cl) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4cl = trans34_decl(env0, d3cl)
//
in
let
prval () = $UN.cast2void(env0) in d4cl
end
end // list_map$fopr
} (* end of [trans34_declist] *)
//
(* ****** ****** *)
//
(*
HX-2021-01-24:
For auxiliary trans34-functions
*)
//
(* ****** ****** *)

implement
trans34_fundecl
( env0, f3d0 ) =
let
//
val+
F3UNDECL(rcd) = f3d0
//
in(*in-of-let*)
//
F4UNDECL@{
  loc= rcd.loc
//
, nam= rcd.nam
, d2c= rcd.d2c
, a2g= rcd.a2g
//
, a4g= None( )
, res= rcd.res
//
, def= None( )
, rtp= rcd.rtp
, wtp= rcd.wtp, ctp= rcd.ctp
//
} (* end of [F4UNDECL] *)
//
end // end of [trans34_fundecl]

(* ****** ****** *)
//
implement
trans34_fundeclist
(  env0, f3ds  ) =
(
list_vt2t
(
list_map<f3undecl><f4undecl>(f3ds)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<f3undecl><f4undecl>
  (f3d0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
f4d0 = trans34_fundecl(env0, f3d0)
//
in
let
prval () = $UN.cast2void(env0) in f4d0
end
end // list_map$fopr
} (* end of [trans34_fundeclist] *)
//
(* ****** ****** *)
//
implement
trans34_valdecl
( env0, v3d0 ) =
let
//
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val d3p = rcd.pat
val def = rcd.def
//
val d4p =
trans34_dpat(env0, d3p)
val def =
trans34_dexpopt(env0, def)
//
in(*in-of-let*)
//
V4ALDECL@{
  loc= loc
, pat= d4p
, def= def, wtp= rcd.wtp
//
} (* end of [V4ALDECL] *)
//
end // end of [trans34_valdecl]
//
(* ****** ****** *)
//
implement
trans34_valdeclist
(  env0, v3ds  ) =
(
list_vt2t
(
list_map<v3aldecl><v4aldecl>(v3ds)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<v3aldecl><v4aldecl>
  (v3d0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
v4d0 = trans34_valdecl(env0, v3d0)
//
in
let
prval () = $UN.cast2void(env0) in v4d0
end
end // list_map$fopr
} (* end of [trans34_valdeclist] *)
//
(* ****** ****** *)

(* end of [xats_trans34_dynexp.dats] *)
