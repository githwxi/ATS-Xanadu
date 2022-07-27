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
STM = "./../SATS/xstamp0.sats"
overload
fprint with $STM.fprint_stamp
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"

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
//
implement
sq2arglst_get_s2vs
  (xs) =
(
case+ xs of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) => 
  (
  case+ xs of
  | list_nil() => x0.s2vs()
  | list_cons _ =>
    (x0.s2vs() + sq2arglst_get_s2vs(xs))
  )
)
//
implement
tq2arglst_get_s2vs
  (xs) =
(
case+ xs of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) => 
  (
  case+ xs of
  | list_nil() => x0.s2vs()
  | list_cons _ =>
    (x0.s2vs() + tq2arglst_get_s2vs(xs))
  )
)
//
(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2con_stamp_new
((*void*)) = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)
//
implement
d2cst_stamp_new
((*void*)) =
stamp where
{
  val
  stamp = $STM.stamper_getinc( stamper )
(*
  val () =
  fprintln!
  ( stdout_ref
  , "d2cst_stamp_new: stamp = ", stamp )
*)
}
//
end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2var_stamp_new
((*void*)) = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

implement
s2cst_isdat(s2c) =
let
//
val
opt =
s2cst_get_d2conlst(s2c)
//
in
//
case+ opt of
| ~None_vt() => false
| ~Some_vt(d2cs) => true
//
end // end of [s2cst_isdat]

(* ****** ****** *)

implement
d2cst_fcastq(d2c) =
let
val
knd = d2cst_get_kind(d2c)
in
//
case+ knd of
|
T_FUN(fnk) =>
(
case+ fnk of
| FNKfcast() => true
| _(*non-FNKfcast*) => false
)
(*
  | T_VAL(vlk) => false
*)
| _ (* rest-of-tnode *) => false
//
end // end of [d2cst_iscast]

(* ****** ****** *)
//
implement
eq_d2con_d2con
(x1, x2) =
$STM.eq_stamp_stamp(x1.stamp(), x2.stamp())
implement
eq_d2cst_d2cst
(x1, x2) =
$STM.eq_stamp_stamp(x1.stamp(), x2.stamp())
implement
eq_d2var_d2var
(x1, x2) =
$STM.eq_stamp_stamp(x1.stamp(), x2.stamp())
//
(* ****** ****** *)
//
implement
cmp_d2var_d2var
(x1, x2) =
$STM.cmp_stamp_stamp(x1.stamp(), x2.stamp())
//
(* ****** ****** *)

local

absimpl
d2typ_tbox = $rec{
  d2typ_loc= loc_t
, d2typ_node= d2typ_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
d2typ_get_loc(x0) = x0.d2typ_loc
implement
d2typ_get_node(x0) = x0.d2typ_node

(* ****** ****** *)

implement
d2typ_make_node
(loc, node) = $rec
{
  d2typ_loc= loc, d2typ_node= node
} (* end of [d2typ_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2pat_tbox = $rec
{
//
d2pat_loc= loc_t
,
d2pat_node= d2pat_node
//
(*
, d2pat_type= t2ype_tbox
*)
//
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
{
  d2pat_loc= loc0
, d2pat_node= node
//
(*
, d2pat_type= the_t2ype_none
*)
//
} (*$rec*) // d2pat_make_node
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

implement
d2pat_nil(loc0) =
d2pat_make_node(loc0, D2Pnil())

(* ****** ****** *)
//
implement
d2pat_any(loc0) =
d2pat_make_node(loc0, D2Pany())
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
d2pat_sym0
(loc0, d1p0, dpis) =
(
  d2pat_make_node
  (loc0, D2Psym0(d1p0, dpis))
)
//
(* ****** ****** *)
//
implement
d2pat_app2
(loc0, d2f0, d2a1, d2a2) =
(
  d2pat_dapp
  (loc0, d2f0, npf0, d2as)
) where
{
val npf0 = ~1
val d2as = list_pair(d2a1, d2a2)
}
//
implement
d2pat_sapp
(loc0, d2f0, s2es) =
(
  d2pat_make_node
  (loc0, D2Psapp(d2f0, s2es))
)
//
implement
d2pat_dapp
(loc0, d2f0, npf1, d2ps) =
(
  d2pat_make_node
  (loc0, D2Pdapp(d2f0, npf1, d2ps))
)
//
(* ****** ****** *)
//
implement
d2pat_trcd1
(loc0, knd, npf, d2ps) =
let
val isnil =
(
if knd = 0
then iseqz(d2ps) else false
) : bool // end of [val]
in
if isnil
then d2pat_nil(loc0)
else
(
  d2pat_make_node
  (loc0, D2Ptrcd1(knd, npf, d2ps))
)
end // end of [d2pat_trcd1]
//
(* ****** ****** *)

local

val
stamper =
$STM.stamper_new()
val () =
$STM.stamper_set(stamper, 1001u)

in (* in-of-local *)

implement
d2cimp_stamp_new
((*void*)) = $STM.stamper_getinc(stamper)

end // end of [local]

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
d2exp_btf
(loc0, tok) =
d2exp_make_node(loc0, D2Ebtf(tok))

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
d2exp_top
(loc0, tok) =
d2exp_make_node(loc0, D2Etop(tok))
//
(* ****** ****** *)
//
implement
d2exp_var
(loc0, d2v0) =
d2exp_make_node(loc0, D2Evar(d2v0))
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
d2exp_trcd1
(loc0, knd, npf, d2es) =
(
  d2exp_make_node
  (loc0, D2Etrcd1(knd, npf, d2es))
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
d2gpat_tbox = $rec
{ d2gpat_loc= loc_t
, d2gpat_node= d2gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d2gpat_get_loc(x0) = x0.d2gpat_loc
implement
d2gpat_get_node(x0) = x0.d2gpat_node

implement
d2gpat_make_node
  (loc0, node) = $rec
{
  d2gpat_loc= loc0, d2gpat_node= node
} (* d2gpat_make_node *)

end // end of [local]

(* ****** ****** *)
//
implement
impls2cst_ns2c
  (is2c) =
(
case+ is2c of
| IMPLS2CST1
  (sqid, s2cs) => list_length(s2cs)
| IMPLS2CST2
  (sqid, s2cs, _) => list_length(s2cs)
)
implement
impld2cst_nd2c
  (id2c) =
(
case+ id2c of
| IMPLD2CST1
  (dqid, d2cs) => list_length(d2cs)
| IMPLD2CST2
  (dqid, d2cs, _) => list_length(d2cs)
)
//
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

end (*local*) // end of [local]

(* ****** ****** *)

implement
d2valdecl_get_loc
  (d1c0) = let
//
val+
D2VALDECL(rcd) = d1c0 in rcd.loc
//
end // end of [d2valdecl_get_loc]

implement
d2valdecl_get_pat
  (d1c0) = let
//
val+
D2VALDECL(rcd) = d1c0 in rcd.pat
//
end // end of [d2valdecl_get_pat]

(* ****** ****** *)

implement
d2fundecl_get_loc
  (d1c0) = let
//
val+
D2FUNDECL(rcd) = d1c0 in rcd.loc
//
end // end of [d2fundecl_get_loc]

(* ****** ****** *)

implement
d2pat_get_sexp
  (d2p0) =
(
case+
d2p0.node() of
| D2Panno
  (d2p1, s1e2, s2e2) => s2e2
| _ (*else*) => the_s2exp_none0
)
implement
d2patlst_get_s2es
  (d2ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d2pat><s2exp>
  (d2ps) where
{
implement
list_map$fopr<d2pat><s2exp> = d2pat_get_sexp
}
} (* end of [d2patlst_get_s2es] *)

(* ****** ****** *)

implement
d2fundecl_get_sexp
  (f2d0) = let
//
val+D2FUNDECL(rcd) = f2d0
//
in
//
  case+
  rcd.wtp of
  | Some(s2e) => s2e
  | None((*void*)) =>
    (
      auxf2g(f2g, res)
    ) where
    {
      val f2g = rcd.f2g
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
auxf2g
( arg
: f2arglst
, res: s2exp): s2exp =
(
case+ arg of
| list_nil() => res
| list_cons(x0, xs) =>
  let
  val
  res = auxf2g(xs, res)
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
      val s2es = d2patlst_get_s2es(d2ps)
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
} (* end of [d2fundecl_get_sexp] *)

(* ****** ****** *)

local
//
#staload
"libats/SATS/hashfun.sats"
#staload
"libats/SATS/hashtbl_chain.sats"
//
#staload _(*anon*) = "libats/DATS/qlist.dats"
//
#staload _(*anon*) = "libats/DATS/hashfun.dats"
#staload _(*anon*) = "libats/DATS/linmap_list.dats"
#staload _(*anon*) = "libats/DATS/hashtbl_chain.dats"
//
typedef key = uint
typedef itm = d2conlst
//
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 1*1024
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in of local *)

(* ****** ****** *)
//
implement
hash_key<key>(key) =
$UN.cast
(inthash_jenkins($UN.cast(key)))
//
implement
gequal_val_val<key>(x, y) = (x = y)
//
(* ****** ****** *)

implement
s2cst_get_d2conlst
  (s2c) = let
//
val key =
  $STM.stamp2uint(s2c.stamp())
val tbl =
  $UN.castvwtp0{hashtbl}(theHashtbl)
//
val ans =
(
  hashtbl_search_opt<key,itm>(tbl, key)
)
//
in
  let prval () = $UN.cast2void(tbl) in ans end
//
end // end of [s2cst_get_d2conlst]

(* ****** ****** *)

implement
s2cst_set_d2conlst
  (s2c, d2cs) =
{
//
val key =
  $STM.stamp2uint(s2c.stamp())
val tbl =
  $UN.castvwtp0{hashtbl}(theHashtbl)
//
val-~None_vt() =
(
  hashtbl_insert_opt<key,itm>(tbl, key, d2cs)
)
//
prval ((*void*)) = $UN.cast2void(tbl)
//
} (* end of [s2cst_set_d2conlst] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp2.dats] *)
