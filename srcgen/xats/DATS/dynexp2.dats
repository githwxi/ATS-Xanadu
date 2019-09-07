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
// Start Time: October, 2018
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
//
#staload
STM = "./../SATS/stamp0.sats"
overload print with $STM.print_stamp
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)

#staload "./../SATS/trans01.sats"

(* ****** ****** *)

local

absimpl
sq2arg_tbox = $rec
{
sq2arg_loc= loc_t
,
sq2arg_s2vs= s2varlst
}

in (* in-of-local *)

implement
sq2arg_make
(loc, s2vs) = $rec
{
sq2arg_loc= loc, sq2arg_s2vs= s2vs
} (* sq2arg_make *)

implement
sq2arg_get_loc(x0) = x0.sq2arg_loc
implement
sq2arg_get_s2vs(x0) = x0.sq2arg_s2vs

end // end of [local]

(* ****** ****** *)

local

absimpl
tq2arg_tbox = $rec
{
tq2arg_loc= loc_t
,
tq2arg_s2vs= s2varlst
}

in (* in-of-local *)

implement
tq2arg_make
(loc, s2vs) = $rec
{
tq2arg_loc= loc, tq2arg_s2vs= s2vs
}

implement
tq2arg_get_loc(x0) = x0.tq2arg_loc
implement
tq2arg_get_s2vs(x0) = x0.tq2arg_s2vs

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2con_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2cst_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2var_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2con_tbox = $rec{
//
  d2con_loc= loc_t // loc
, d2con_sym= sym_t // name
, d2con_sexp= s2exp // sexp
, d2con_type= t2ype // type
, d2con_stamp= stamp // unicity
//
} (* end of [d2con_tbox] *)

in (* in-of-local *)

implement
d2con_make_idtp
  (tok, s2e1) =
(
$rec{
  d2con_loc= loc
, d2con_sym= sym
, d2con_sexp= s2e1
, d2con_type= t2p2
, d2con_stamp= stamp
}
) where
{
  val loc = tok.loc()
  val sym = dexpid_sym(tok)
//
  val t2p2 = s2exp_erase(s2e1)
//
  val
  stamp = d2con_stamp_new((*void*))
//
(*
  val () =
  println!("d2con_make_idtp: sym = ", sym)
  val () =
  println!("d2con_make_idtp: s2e1 = ", s2e1)
  val () =
  println!("d2con_make_idtp: t2p2 = ", t2p2)
  val () =
  println!("d2con_make_idtp: stamp = ", stamp)
*)
//
} (* d2con_make_idtp *)

implement
d2con_get_loc(x0) = x0.d2con_loc
implement
d2con_get_sym(x0) = x0.d2con_sym
implement
d2con_get_sexp(x0) = x0.d2con_sexp
implement
d2con_get_type(x0) = x0.d2con_type
implement
d2con_get_stamp(x0) = x0.d2con_stamp

end // end of [local]

(* ****** ****** *)

local

typedef
d2cst_struct = @{
//
  d2cst_loc= loc_t // loc
, d2cst_sym= sym_t // name
, d2cst_tqas= tq2as // tqas
, d2cst_sexp= s2exp // sexp
, d2cst_type= t2ype // type
, d2cst_stamp= stamp // unicity
//
} (* end of [d2cst_tbox] *)

absimpl
d2cst_tbox = ref(d2cst_struct)

in (* in-of-local *)

implement
d2cst_make_dvar
  (d2v) =
(
ref<d2cst_struct>
@{
  d2cst_loc= loc
, d2cst_sym= sym
, d2cst_tqas= tqas
, d2cst_sexp= s2e1
, d2cst_type= t2p2
, d2cst_stamp= stamp
}
) where
{
//
  val loc = d2var_get_loc(d2v)
  val sym = d2var_get_sym(d2v)
  val tqas = d2var_get_tqas(d2v)
  val s2e1 = d2var_get_sexp(d2v)
  val t2p2 = d2var_get_type(d2v)
//
  val
  stamp = d2cst_stamp_new((*void*))
//
(*
  val () =
  println!("d2cst_make_dvar: d2v = ", d2v)
  val () =
  println!("d2cst_make_dvar: tqa0 = ", tqa0)
  val () =
  println!("d2cst_make_dvar: s2e1 = ", s2e1)
  val () =
  println!("d2cst_make_dvar: t2p2 = ", t2p2)
*)
//
} (* d2cst_make_dvar *)

implement
d2cst_make_idtp
(tok, tqas, s2e1) =
(
ref<d2cst_struct> 
@{
  d2cst_loc= loc
, d2cst_sym= sym
, d2cst_tqas= tqas
, d2cst_sexp= s2e1
, d2cst_type= t2p2
, d2cst_stamp= stamp
}
) where
{
//
  val loc = tok.loc()
  val sym = dexpid_sym(tok)
//
  val t2p2 = s2exp_erase(s2e1)
//
  val
  stamp = d2cst_stamp_new((*void*))
//
(*
  val () =
  println!("d2cst_make_idtp: sym = ", sym)
  val () =
  println!("d2cst_make_idtp: tqa0 = ", tqa0)
  val () =
  println!("d2cst_make_idtp: s2e1 = ", s2e1)
  val () =
  println!("d2cst_make_idtp: t2p2 = ", t2p2)
*)
//
} (* d2cst_make_idtp *)

implement
d2cst_get_loc(x0) = x0->d2cst_loc
implement
d2cst_get_sym(x0) = x0->d2cst_sym
implement
d2cst_get_tqas(x0) = x0->d2cst_tqas
implement
d2cst_get_sexp(x0) = x0->d2cst_sexp
implement
d2cst_get_type(x0) = x0->d2cst_type
implement
d2cst_get_stamp(x0) = x0->d2cst_stamp
//
implement
d2cst_set_type
  (x0, t2p0) = (x0->d2cst_type := t2p0)
//
end // end of [local]

(* ****** ****** *)

local

typedef
d2var_struct = @{
//
  d2var_loc= loc_t // loc
, d2var_sym= sym_t // name
, d2var_tqas= tq2as // tqas
, d2var_sexp= s2exp // sexp
, d2var_type= t2ype // type
, d2var_stamp= stamp // unicity
//
} (* end of [d2var_tbox] *)

absimpl
d2var_tbox=ref(d2var_struct)

in (* in-of-local *)

implement
d2var_new1
  (tok) = let
//
val
loc = tok.loc()
val
sym = dexpid_sym(tok)
//
in
  d2var_new2(loc, sym)
end // end of [d2var_new1]

implement
d2var_new2
(loc, sym) =
(
ref<d2var_struct>
@{
  d2var_loc= loc
, d2var_sym= sym
, d2var_tqas= tqas
, d2var_sexp= s2e1
, d2var_type= t2p2
, d2var_stamp= stamp
}
) where
{
//
  val tqas = list_nil()
//
  val s2e1 = the_s2exp_none0
  val t2p2 = the_t2ype_none0
  val stamp = d2var_stamp_new()
//
}
//
implement
d2var_get_loc(x0) = x0->d2var_loc
implement
d2var_get_sym(x0) = x0->d2var_sym
implement
d2var_get_tqas(x0) = x0->d2var_tqas
implement
d2var_get_sexp(x0) = x0->d2var_sexp
implement
d2var_get_type(x0) = x0->d2var_type
implement
d2var_get_stamp(x0) = x0->d2var_stamp
//
implement
d2var_set_tqas
  (x0, tqas) = (x0->d2var_tqas := tqas)
implement
d2var_set_type
  (x0, t2p0) = (x0->d2var_type := t2p0)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
d2pat_tbox = $rec
{ d2pat_loc= loc_t
, d2pat_node= d2pat_node
(*
, d2pat_type= t2ype_tbox
*)
} (* end of [absimpl] *)

in (* in-of-local *)
//
implement
d2pat_get_loc
  (d2p) = d2p.d2pat_loc
implement
d2pat_get_node
  (d2p) = d2p.d2pat_node
//
implement
d2pat_make_node
  (loc0, node) = $rec
{ d2pat_loc= loc0
, d2pat_node= node
(*
, d2pat_type= the_t2ype_none
*)
} (* d2pat_make_node *)
//
end // end of [local]

(* ****** ****** *)
//
implement
d2pat_none1(d1p0) =
(
d2pat_make_node
(loc0, D2Pnone1(d1p0))
) where
{
  val loc0 = d1p0.loc((*void*))
}
//
(* ****** ****** *)
//
implement
d2pat_var
(loc0, d2v) =
d2pat_make_node(loc0, D2Pvar(d2v))
//
(* ****** ****** *)
//
implement
d2pat_con1
(loc0, d2c0) =
d2pat_make_node(loc0, D2Pcon1(d2c0))
implement
d2pat_con2
(loc0, d2cs) =
d2pat_make_node(loc0, D2Pcon2(d2cs))
//
(* ****** ****** *)
//
implement
d2pat_sapp
(loc0, d2f0, s2vs) =
(
  d2pat_make_node
  (loc0, D2Psapp(d2f0, s2vs))
)
//
implement
d2pat_dapp
(loc0, d2f0, npf0, d2ps) =
(
  d2pat_make_node
  (loc0, D2Pdapp(d2f0, npf0, d2ps))
)
//
(* ****** ****** *)
//
implement
d2pat_tuple
(loc0, knd, npf, d2ps) =
(
  d2pat_make_node
  (loc0, D2Ptuple(knd, npf, d2ps))
)
//
(* ****** ****** *)

local

absimpl
f2arg_tbox = $rec{
  f2arg_loc= loc_t
, f2arg_node= f2arg_node
} (* f2arg_tbox *)

in (* in-of-local *)

implement
f2arg_get_loc(x0) = x0.f2arg_loc
implement
f2arg_get_node(x0) = x0.f2arg_node

(* ****** ****** *)

implement
f2arg_make_node
(loc, node) = $rec
{
  f2arg_loc= loc, f2arg_node= node
} (* end of [f2arg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2exp_tbox = $rec
{ d2exp_loc= loc_t
, d2exp_node= d2exp_node
(*
, d2exp_type= t2ype_tbox
*)
} (* end of [absimpl] *)

in (* in-of-local *)
//
implement
d2exp_get_loc
  (d2e) = d2e.d2exp_loc
implement
d2exp_get_node
  (d2e) = d2e.d2exp_node
//
implement
d2exp_make_node
  (loc0, node) = $rec
{ d2exp_loc= loc0
, d2exp_node= node
(*
, d2exp_type= t2ype_none(loc0)
*)
} (* d2exp_make_node *)
//
end // end of [local]

(* ****** ****** *)
//
implement
d2exp_none0(loc0) =
(
d2exp_make_node
(loc0, D2Enone0(*void*))
)
implement
d2exp_none1(d1e0) =
(
d2exp_make_node
(loc0, D2Enone1(d1e0))
) where
{
  val loc0 = d1e0.loc((*void*))
}
//
(* ****** ****** *)

implement
d2exp_int
(loc0, tok) =
d2exp_make_node(loc0, D2Eint(tok))

implement
d2exp_chr
(loc0, tok) =
d2exp_make_node(loc0, D2Echr(tok))

implement
d2exp_flt
(loc0, tok) =
d2exp_make_node(loc0, D2Eflt(tok))

implement
d2exp_str
(loc0, tok) =
d2exp_make_node(loc0, D2Estr(tok))

(* ****** ****** *)
//
implement
d2exp_var
(loc0, d2v) =
d2exp_make_node(loc0, D2Evar(d2v))
//
(* ****** ****** *)
//
implement
d2exp_con1
(loc0, d2c0) =
d2exp_make_node(loc0, D2Econ1(d2c0))
//
implement
d2exp_cst1
(loc0, d2c0) =
d2exp_make_node(loc0, D2Ecst1(d2c0))
//
(* ****** ****** *)
//
implement
d2exp_con2
(loc0, d2cs) =
d2exp_make_node(loc0, D2Econ2(d2cs))
//
implement
d2exp_cst2
(loc0, d2cs) =
d2exp_make_node(loc0, D2Ecst2(d2cs))
//
(* ****** ****** *)
//
implement
d2exp_sym0
(loc0, d1e0, dpis) =
d2exp_make_node(loc0, D2Esym0(d1e0, dpis))
//
(* ****** ****** *)
//
implement
d2exp_sapp
(loc0, d2f0, s2as) =
(
  d2exp_make_node
  (loc0, D2Esapp(d2f0, s2as))
)
//
implement
d2exp_tapp
(loc0, d2f0, s2as) =
(
d2exp_make_node
(loc0, D2Etapp(d2f0, s2as))
)
//
(* ****** ****** *)
//
implement
d2exp_app2
(loc0, d2f0, d2a1, d2a2) =
(
  d2exp_dapp
  (loc0, d2f0, npf0, d2as)
) where
{
val npf0 = ~1
val d2as = list_pair(d2a1, d2a2)
}
//
implement
d2exp_dapp
(loc0, d2f0, npf0, d2as) =
(
d2exp_make_node
(loc0, D2Edapp(d2f0, npf0, d2as))
)
//
(* ****** ****** *)
//
implement
d2exp_let
(loc0, d2cs, d2e2) =
(
  d2exp_make_node
  (loc0, D2Elet(d2cs, d2e2))
)
//
implement
d2exp_where
(loc0, d2e1, d2cs) =
(
  d2exp_make_node
  (loc0, D2Ewhere(d2e1, d2cs))
)
//
(* ****** ****** *)
//
implement
d2exp_tuple
(loc0, knd, npf, d2es) =
(
  d2exp_make_node
  (loc0, D2Etuple(knd, npf, d2es))
)
//
(* ****** ****** *)

local

absimpl
d2gua_tbox = $rec
{ d2gua_loc= loc_t
, d2gua_node= d2gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d2gua_get_loc(x0) = x0.d2gua_loc
implement
d2gua_get_node(x0) = x0.d2gua_node

implement
d2gua_make_node
  (loc0, node) = $rec
{
  d2gua_loc= loc0, d2gua_node= node
} (* d2gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2clau_tbox = $rec
{ d2clau_loc= loc_t
, d2clau_node= d2clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d2clau_get_loc(x0) = x0.d2clau_loc
implement
d2clau_get_node(x0) = x0.d2clau_node

implement
d2clau_make_node
  (loc0, node) = $rec
{
  d2clau_loc= loc0, d2clau_node= node
} (* d2clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
dg2pat_tbox = $rec
{ dg2pat_loc= loc_t
, dg2pat_node= dg2pat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
dg2pat_get_loc(x0) = x0.dg2pat_loc
implement
dg2pat_get_node(x0) = x0.dg2pat_node

implement
dg2pat_make_node
  (loc0, node) = $rec
{
  dg2pat_loc= loc0, dg2pat_node= node
} (* dg2pat_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2ecl_tbox = $rec
{
  d2ecl_loc= loc_t
, d2ecl_node= d2ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d2ecl_get_loc(x0) = x0.d2ecl_loc
implement
d2ecl_get_node(x0) = x0.d2ecl_node

(* ****** ****** *)

implement
d2ecl_make_node
(loc, node) = $rec
{
  d2ecl_loc= loc, d2ecl_node= node
} (* end of [d2ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
d2ecl_none0
(loc0) =
d2ecl_make_node
(
  loc0, D2Cnone0()
)
implement
d2ecl_none1
(d0c0) =
d2ecl_make_node
(
  d0c0.loc(), D2Cnone1(d0c0)
)

(* ****** ****** *)

local

absimpl
ti2arg_tbox = $rec
{
ti2arg_loc= loc_t
,
ti2arg_s2es= s2explst
}

in (* in-of-local *)

implement
ti2arg_make
(loc, s2es) = $rec
{
ti2arg_loc= loc, ti2arg_s2es= s2es
}

implement
ti2arg_get_loc(x0) = x0.ti2arg_loc
implement
ti2arg_get_s2es(x0) = x0.ti2arg_s2es

end // end of [local]

(* ****** ****** *)

implement
v2aldecl_get_loc
  (d1c0) = let
//
val+
V2ALDECL(rcd) = d1c0 in rcd.loc
//
end // end of [v2aldecl_get_loc]

implement
v2aldecl_get_pat
  (d1c0) = let
//
val+
V2ALDECL(rcd) = d1c0 in rcd.pat
//
end // end of [v2aldecl_get_pat]

(* ****** ****** *)

implement
f2undecl_get_loc
  (d1c0) = let
//
val+
F2UNDECL(rcd) = d1c0 in rcd.loc
//
end // end of [f2undecl_get_loc]

(* ****** ****** *)

implement
s2exp_of_d2pat
  (d2p0) =
(
case+
d2p0.node() of
| D2Panno(d2p1, s2e2) => s2e2
| _ (*else*) => the_s2exp_none0
)
implement
s2explst_of_d2patlst
  (d2ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d2pat><s2exp>
  (d2ps) where
{
implement
list_map$fopr<d2pat><s2exp> = s2exp_of_d2pat
}
} (* end of [s2explst_of_d2patlst] *)

(* ****** ****** *)

implement
f2undecl_get_s2exp
  (f2d0) = let
//
val+F2UNDECL(rcd) = f2d0
//
in
//
  case+
  rcd.wtp of
  | Some(s2e) => s2e
  | None((*void*)) =>
    (
      auxarg(arg, res)
    ) where
    {
      val arg = rcd.arg
      val res = auxres(rcd.res)
    }
//
end where
{
//
fun
auxres
( res
: effs2expopt): s2exp =
(
case+ res of
| EFFS2EXPnone() =>
  (
    the_s2exp_none0(*void*)
  )
| EFFS2EXPsome(s2e) => s2e
)
//
fun
auxarg
( arg
: f2arglst
, res: s2exp): s2exp =
(
case+ arg of
| list_nil() => res
| list_cons(x0, xs) =>
  let
  val
  res = auxarg(xs, res)
  in
  (
  case+
  x0.node() of
  | F2ARGsome_dyn
    (npf, d2ps) => let
      val
      fc2 =
      (
      case+ xs of
      | list_nil() => FC2fun((*void*))
      | list_cons _ => FC2cloref(*void*)
      ) : funclo2 // end-of-val
      val s2es =
      s2explst_of_d2patlst(d2ps)
    in
      s2exp_fun_full(fc2, npf, s2es, res)
    end
  | F2ARGsome_sta
    (s2vs, s2ps) => s2exp_uni(s2vs, s2ps, res)
  | F2ARGsome_met(s2es) => s2exp_met(s2es, res)
  )
  end
)
//
} (* end of [s2exp_of_f2undecl] *)

(* ****** ****** *)

(* end of [xats_dynexp2.dats] *)
