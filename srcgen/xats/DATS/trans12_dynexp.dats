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
// Start Time: December, 2018
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
SYM = "./../SATS/symbol.sats"
#staload
MAP = "./../SATS/symmap.sats"
#staload
ENV = "./../SATS/symenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)
//
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
//
(* ****** ****** *)
//
implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
//
(*
implement
fprint_val<d2exp> = fprint_d2exp
*)
//
(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_dexp
  (d1e0) = let
//
val
loc0 = d1e0.loc()
//
val () =
println!
("trans12_dexp: d1e0 = ", d1e0)
//
in (* in-of-let *)
//
case-
d1e0.node() of
| _(*rest-of-D1EXP*) =>
  exit_errmsg
  (1, "trans12_dexp: yet-to-be-implemented!\n")
//
end // end of [trans12_dexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d1e) => Some(trans12_dexp(d1e))
) (* end of [trans12_dexpopt] *)

implement
trans12_dexplst
  (d1es) =
list_vt2t(d2es) where
{
val
d2es =
list_map<d1exp><d2exp>
  (d1es) where
{
implement
list_map$fopr<d1exp><d2exp> = trans12_dexp
}
} (* end of [trans12_dexplst] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_abssort
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cabssort
(knd, tok) =
d1c0.node((*void*))
//
val tid = sortid_sym(tok)
val s2ta = t2abs_new(tid)
val s2tx =
  S2TXTsrt(S2Tbas(T2BASabs(s2ta)))
//
in
  the_sortenv_add(tid, s2tx);
  d2ecl_make_node(loc0, D2Cabssort(d1c0))
end // end of [aux_abssort]

(* ****** ****** *)

fun
aux_stacst0
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cstacst0
( knd
, sid, arg, res) =
d1c0.node((*void*))
//
fun
auxargs
( xs
: t1arglst
) : sort2lst =
(
case+ xs of
| list_nil() =>
  (
  list_nil(*void*)
  )
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1ARGsome(s1t, _) =>
    list_cons
    (trans12_sort(s1t), auxargs(xs))
  )
) (* end of [auxargs] *)
//
fun
auxmargs
( xs: t1marglst
, res: sort2): sort2 =
(
case+ xs of
| list_nil() => res
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1MARGlist(t1as) =>
    S2Tfun
    (auxargs(t1as), auxmargs(xs, res))
  )
) (* end of [auxmargs] *)
//
val
res = trans12_sort(res)
val
s2t0 = auxmargs(arg, res)
val
s2c0 = s2cst_make_idst(sid, s2t0)
//
val () = the_sexpenv_add_cst(s2c0)
//
(*
val () =
println!
("tran12_decl: aux_stacst0: s2t0 = ", s2t0)
val () =
println!
("tran12_decl: aux_stacst0: s2c0 = ", s2c0)
*)
//
in
  d2ecl_make_node(loc0, D2Cstacst0(d1c0))
end // end of [aux_stacst0]

(* ****** ****** *)

fun
aux_sortdef
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Csortdef
(knd, tid, def0) =
d1c0.node((*void*))
//
val sym = sortid_sym(tid)
//
in (* in-of-let *)
//
case+
def0.node() of
| S1RTDEFsort(s1t) =>
  let
    val s2tx = trans12_stxt(s1t)
  in
    the_sortenv_add(sym, s2tx);
    d2ecl_make_node(loc0, D2Csortdef(d1c0))
  end
| S1RTDEFsbst(s1a, s1ps) =>
  (
  case+ s1a.node() of
  | S1ARGsome(tok, opt) =>
    let
//
      val tx0 =
      (
        case+ opt of
        | None() =>
          (
            S2TXTsrt(S2Tnone0())
          )
        | Some(s1t) => trans12_stxt(s1t)
      ) : s2txt // end of [val]
//
      val s2t =
      (
        case+ tx0 of
        | S2TXTsrt(s2t) => s2t
        | S2TXTsub(s2v, _) => s2v.sort()
        | S2TXTerr((*void*)) => S2Tnone0()
      ) : sort2 // end of [val]
//
      val id0 =
        sargid_sym(tok)
      val s2v1 =
        s2var_make_idst(id0, s2t)
//
      val (pf0|()) =
        the_sexpenv_pushnil()
      val ((*void*)) =
        the_sexpenv_add_var(s2v1)
//
      val s2ps1 =
      (
        case+ tx0 of
        | S2TXTsrt(s2t) =>
          (
            trans12_sexplst_ck
            (s1ps, the_sort2_bool)
          ) (* S2TXTsrt *)
        | S2TXTsub(s2v, s2ps) =>
          (
            s2ps1 + s2ps2
          ) where
          {
            val s2ps1 =
            s2explst_revar(s2ps, s2v, s2v1)
            val s2ps2 = trans12_sexplst(s1ps)
          }
        | S2TXTerr((*void*)) => list_nil(*void*)
      ) : s2explst // end of [val]
//
      val ((*void*)) =
        the_sexpenv_popfree(pf0|(*void*))
      // end of [val]
//
    in
      let
        val
        s2tx =
        S2TXTsub(s2v1, s2ps1)
      in
        the_sortenv_add(sym, s2tx);
        d2ecl_make_node(loc0, D2Csortdef(d1c0))
      end
    end
  ) (* end of [S1RTDEFsubset] *)
//
end // end of [aux_sortdef]

(* ****** ****** *)

fun
aux_sexpdef
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Csexpdef
( knd
, sid
, arg, res, body) = d1c0.node()
//
val (pf0|()) =
the_sexpenv_pushnil()
//
val
s2e0 =
(
auxlams(arg, res, body)
) where
{
//
fun
auxlams
( arg
: s1marglst
, res
: sort1opt
, body: s1exp): s2exp =
(
case+ arg of
| list_nil() =>
  (
  case res of
  | None() =>
    trans12_sexp(body)
  | Some(s1t) =>
    trans12_sexp_ck
    (body, trans12_sort(s1t))
  )
| list_cons(x0, xs) =>
  let
    val
    s2vs = trans12_smarg(x0)
    val () = 
    the_sexpenv_add_varlst(s2vs)
  in
    s2exp_lam(s2vs, auxlams(xs, res, body))
  end // end of [list_cons]
)
//
} (* end of [val] *)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val () =
println!
("\
trans12_decl:\
 aux_sexpdef: s2e0 = ", s2e0)
//
val
s2c0 =
s2cst_make_idst(sid, s2e0.sort())
//
in
  the_sexpenv_add_cst(s2c0);
  d2ecl_make_node(loc0, D2Csexpdef(d1c0))
end // end of [aux_sexpdef]

(* ****** ****** *)

fun
aux_abstdef
( def
: abstdf1): abstdf2 =
(
case+ def of
| ABSTDF1nil() =>
  ABSTDF2nil((*void*))
| ABSTDF1lteq(s1e) =>
  ABSTDF2lteq(trans12_sexp(s1e))
| ABSTDF1eqeq(s1e) =>
  ABSTDF2eqeq(trans12_sexp(s1e))
) (* end of [aux_abstdef] *)

and
aux_abstype
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cabstype
( knd
, sid, arg
, res, def) = d1c0.node()
//
fun
auxargs
( xs
: t1arglst
) : sort2lst =
(
case+ xs of
| list_nil() =>
  (
  list_nil(*void*)
  )
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1ARGsome(s1t, _) =>
    list_cons
    (trans12_sort(s1t), auxargs(xs))
  )
) (* end of [auxargs] *)
//
fun
auxmargs
( xs: t1marglst
, res: sort2): sort2 =
(
case+ xs of
| list_nil() => res
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | T1MARGlist(t1as) =>
    S2Tfun
    (auxargs(t1as), auxmargs(xs, res))
  )
) (* end of [auxmargs] *)
//
val
res =
(
case+ res of
| None() => the_sort2_type
| Some(s1t) => trans12_sort(s1t)
) : sort2 // end of [val]
//
val
def = aux_abstdef(def)
//
val
s2t0 = auxmargs(arg, res)
val
s2c0 = s2cst_make_idst(sid, s2t0)
//
val () = the_sexpenv_add_cst(s2c0)
//
val () =
println!
("\
tran12_decl:\
 aux_abstype: s2t0 = ", s2t0)
val () =
println!
("\
tran12_decl:\
 aux_abstype: s2c0 = ", s2c0)
//
in
  d2ecl_make_node(loc0, D2Cabstype(d1c0))
end // end of [aux_abstype]

(* ****** ****** *)

fun
aux_datasort
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cdatasort
(knd, d1ts) = d1c0.node()
//
val s2ts =
auxd1ts(d1ts) where
{
//
fun
auxd1t
( d1t0
: d1tsort): sort2 = let
//
val+
D1TSORT
(tok, s1cs) = d1t0.node()
//
val tid = sortid_sym(tok)
//
val s2td = t2dat_new(tid)
val s2t0 = S2Tbas(T2BASdat(s2td))
//
in
  the_sortenv_add(tid, S2TXTsrt(s2t0)); s2t0
end // end of [auxd1t]
and
auxd1ts
( d1ts
: d1tsortlst): sort2lst =
(
  list_vt2t
  (list_map<d1tsort><sort2>(d1ts))
) where
{
  implement
  list_map$fopr<d1tsort><sort2>(d1t) = auxd1t(d1t)
} (* end of [auxd1ts] *)
}
//
val () =
auxd1ts(d1ts, s2ts) where
{
fun
auxd1t
( d1t0
: d1tsort
, s2t0: sort2): void = let
//
fun
loop
( s1cs
: s1rtconlst): void =
(
//
case+ s1cs of
| list_nil() => ()
| list_cons(s1c0, s1cs) =>
  let
    val+
    S1RTCON
    (tok, opt) = s1c0.node()
    val sid = sexpid_sym(tok)
    val arg =
    (
    case+ opt of
    | None() => list_nil()
    | Some(s1t) =>
      (
      case+ s1t.node() of
      | S1Tlist(s1ts) =>
        trans12_sortlst(s1ts)
      | _(*non-S1Tlist*) =>
        list_sing(trans12_sort(s1t))
      ) : sort2lst // end of [val]
    )
    val
    s2t1 = S2Tfun(arg, s2t0)
    val
    s2c0 =
    s2cst_make_idst(tok, s2t1)
(*
    val () =
    println!("aux_datasort: tok = ", tok)
    val () =
    println!("aux_datasort: s2t1 = ", s2t1)
*)
  in
    the_sexpenv_add_cst(s2c0); loop(s1cs)
  end // end of [list_cons]
)
//
in
let
  val+
  D1TSORT(tok, s1cs) = d1t0.node() in loop(s1cs)
end
end // end of [auxd1t]
and
auxd1ts
( d1ts
: d1tsortlst,
  s2ts: sort2lst): void =
(
case+ d1ts of
| list_nil() => ()
| list_cons(d1t0, d1ts) =>
  let
    val-
    list_cons
    (s2t0, s2ts) = s2ts
    val () = auxd1t(d1t0, s2t0) in auxd1ts(d1ts, s2ts)
  end // end of [auxd1ts]
) (* end of [auxd1ts] *)
}
//
in
  d2ecl_make_node(loc0, D2Cdatasort(d1c0))
end // end of [aux_datasort]

(* ****** ****** *)

fun
aux_datatype
( d1c0
: d1ecl): d2ecl = let
//
val
loc0 = d1c0.loc()
val-
D1Cdatatype
( knd // datatype
, d1ts
, wd1cs) = d1c0.node()
//
val
s2cs =
trans12_datypelst(d1ts)
val () =
the_sexpenv_add_cstlst(s2cs)
//
val
d2cs = aux_wdeclseq(wd1cs)
//
val () =
aux2_datypelst(s2cs, d1ts)
//
in
  d2ecl_make_node(loc0, D2Cdatatype(d1c0))
end // end of [aux_datatype]

and
aux_wdeclseq
( wd1cs
: wd1eclseq): d2eclist =
(
case+ wd1cs of
| WD1CSnone() => list_nil()
| WD1CSsome(d1cs) => trans12_declist(d1cs)
) (* end of [aux_wdeclseq] *)

and
aux2_datype
( s2c0: s2cst
, d1t0: d1atype): void =
let
//
val+
D1ATYPE
(
_(*tok*), tmas
,
_(*res*), d1cs
) = d1t0.node((*void*))
//
val svss =
aux2_tmarglst(tmas)
//
val (pf0|()) =
the_sexpenv_pushnil()
//
val () =
the_sexpenv_add_varlstlst(svss)
//
val d2cs =
trans12_datconlst(s2c0, svss, d1cs)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
//
the_dexpenv_add_conlst(d2cs) where
{
val () =
println!
("trans12_datype: aux2_datype: s2c0 = ", s2c0)
val () =
println!
("trans12_datype: aux2_datype: d2cs = ", d2cs)
}  
//
end // end of [aux2_datype]

and
aux2_tmarg
(x0: t1marg): s2varlst =
let
//
val+
T1MARGlist(t1as) = x0.node()
//
in
//
list_vt2t
(
list_map<t1arg><s2var>(t1as)
) where
{
//
implement
list_map$fopr<t1arg><s2var>
  (t1a) = let
//
  val+
  T1ARGsome
  (s1t, opt) = t1a.node()
  val s2t = trans12_sort(s1t)
  val sym =
  (
  case+ opt of
  | None() => $SYM.symbol_nil
  | Some(tok) => sargid_sym(tok)
  ) : sym_t // end of [val]
//
in
  s2var_make_idst(sym, s2t)
end // end of [list_map$fopr]
//
} (* end of [where] *)
//
end // end of [aux2_tmarg]

and
aux2_tmarglst
(xs: t1marglst): s2varlstlst =
(
case+ xs of
| list_nil() => list_nil()
| list_cons(x0, xs) =>
  list_cons(aux2_tmarg(x0), aux2_tmarglst(xs))
)

and
aux2_datypelst
( s2cs: s2cstlst
, d1ts: d1atypelst): void =
(
case+ s2cs of
| list_nil() => ()
| list_cons(s2c0, s2cs) =>
  let
    val-
    list_cons
    (d1t0, d1ts) = d1ts
  in
    aux2_datype(s2c0, d1t0); aux2_datypelst(s2cs, d1ts)
  end // end of [let]
) (* end of [aux2_datatypelst] *)

(* ****** ****** *)

fun
aux_dynconst
( d1c0
: d1ecl
) : d2ecl = let
//
val
loc0 = d1c0.loc()
//
val-
D1Cdynconst
( knd
, tqas, d1cs) = d1c0.node()
//
val
tqas =
trans12_tqarglst(tqas)
//
val (pf0|()) =
the_sexpenv_pushnil()
//
local
fun
loop
(xs: tq2arglst): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    loop(xs)
  ) where
  {
    val () =
    the_sexpenv_add_varlstlst(x0.svss())
  }
) (* end of [loop] *)
in
val ((*void*)) = loop(tqas)
end // end of [local]
//
val
d2cs = aux_dcstdeclist(d1cs)
//
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val
((*void*)) =
the_dexpenv_add_cstlst(d2cs)
//
in
  d2ecl_make_node
  (loc0, D2Cdynconst(knd, tqas, d2cs))
end // end of [aux_dynconst]

and
aux_dcstdecl
( d1c0
: d1cstdecl): d2cst = let
//
  val+D1CSTDECL(rcd) = d1c0
//
//
val (pf0|()) =
the_sexpenv_pushnil()
val
s2e0 =
auxarg1(0, rcd.arg, rcd.res)
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
in
  d2cst_make_idtp(rcd.nam, s2e0)
end // end of [aux_dcstdecl]

and
auxsid
( tok0
: token): s2exp =
let
//
val s1e0 =
s1exp_make_node
( tok0.loc()
, S1Eid(sexpid_sym(tok0)))
in
  trans12_sexp(s1e0)
end // end of [auxsid]

and
auxres0
( res0
: effs1expopt): s2exp =
(
case+ res0 of
| EFFS1EXPnone
  ((*void*)) => s2exp_none0()
| EFFS1EXPsome
  (s1f, s1e) => trans12_sexp(s1e)
) (* end of [auxres0] *)

and
auxarg1
( nfc0: int
, d1as: d1arglst
, res0: effs1expopt): s2exp =
(
case+ d1as of
| list_nil() =>
  auxres0(res0)
| list_cons(d1a0, d1as) =>
  auxarg2(nfc0, d1a0, d1as, res0)
)

and
auxarg2
( nfc0: int
, d1a0: d1arg
, d1as: d1arglst
, res0: effs1expopt): s2exp =
(
case-
d1a0.node() of
|
D1ARGsome_sta(s1qs) =>
let
  var s2vs_
    : s2varlst_vt =
    list_vt_nil(*void*)
  var s2ps_
    : s2varlst_vt =
    list_vt_nil(*void*)
  val ((*void*)) =
    trans12_squalst(s1qs, s2vs_, s2ps_)
  val s2vs = list_vt2t(s2vs_)
  val s2ps = list_vt2t(s2ps_)
  val s2e0 = auxarg1(nfc0+0, d1as, res0)
in
  s2exp_uni(s2vs, s2ps, s2e0)
end // end of [D1ARGsome_sta]
|
D1ARGsome_dyn1(tok0) =>
let
  val npf = ~1
  and lin = (0)
  and eff = S2EFFnil()
  val fc2 =
  (
    if
    nfc0 <= 0
    then FC2fun() else FC2cloref
  ) : funclo2
  val s2es = list_sing(auxsid(tok0))
  val s2e0 = auxarg1(nfc0+1, d1as, res0)
in
  s2exp_fun_full(fc2, lin, eff, npf, s2es, s2e0)
end
|
D1ARGsome_dyn2(arg0, opt1) =>
let
  var npf
    : int = ~1
  val lin = (0)
  and eff = S2EFFnil()
  val fc2 =
  (
    if
    nfc0 <= 0
    then FC2fun() else FC2cloref
  ) : funclo2 // end of [val]
  val s2es = trans12_atyplst(arg0)
  val s2es =
  (
  case+ opt1 of
  | None() => s2es
  | Some(arg1) =>
    (
      s2es1 + s2es1
    ) where
    {
      val () =
        (npf := list_length(s2es))
      val s2es1 = s2es
      val s2es2 = trans12_atyplst(arg1)
    }
  ) : s2explst // end-of-val
  val s2e0 = auxarg1(nfc0+1, d1as, res0)
in
  s2exp_fun_full(fc2, lin, eff, npf, s2es, s2e0)
end
) (* end of [auxarg2]  *)

and
aux_dcstdeclist
( d1cs
: d1cstdeclist): d2cstlst =
list_vt2t
(
list_map<d1cstdecl><d2cst>(d1cs)
) where
{
implement
list_map$fopr<d1cstdecl><d2cst>(d1c) = aux_dcstdecl(d1c)
} (* end of [aux_dcstdeclist] *)

(* ****** ****** *)

in (* in-of-local *)

implement
trans12_decl
  (d1c0) = let
//
val
loc0 = d1c0.loc()
//
val () =
println!
("trans12_decl: d1c0 = ", d1c0)
//
in (* in-of-let *)
//
case-
d1c0.node() of
//
| D1Cnone() => d2ecl_none1(d1c0)
| D1Cnone(_) => d2ecl_none1(d1c0)
//
| D1Cabssort _ => aux_abssort(d1c0)
//
| D1Cstacst0 _ => aux_stacst0(d1c0)
//
| D1Csortdef _ => aux_sortdef(d1c0)
//
| D1Csexpdef _ => aux_sexpdef(d1c0)
//
| D1Cabstype _ => aux_abstype(d1c0)
//
| D1Cdatasort _ => aux_datasort(d1c0)
//
| D1Cdatatype _ => aux_datatype(d1c0)
//
| D1Cdynconst _ => aux_dynconst(d1c0)
//
| D1Clocal
  (d1cs1, d1cs2) => let
    val
    (pf1|()) = the_trans12_pushnil()
    val d2cs1 = trans12_declist(d1cs1)
    val
    (pf2|()) = the_trans12_pushnil()
    val d2cs2 = trans12_declist(d1cs2)
    val ((*void*)) =
    the_trans12_locjoin(pf1, pf2 | (*none*))
  in
    d2ecl_make_node(loc0, D2Clocal(d2cs1, d2cs2))
  end // end of [D1Clocal]
//
| _(*rest-of-D1ECL*) => d2ecl_none1(d1c0)
//
end // end of [trans12_decl]

end // end of [local]

(* ****** ****** *)

implement
trans12_declist
  (d1cs) =
list_vt2t(d1cs) where
{
val
d1cs =
list_map<d1ecl><d2ecl>
  (d1cs) where
{
  implement
  list_map$fopr<d1ecl><d2ecl> = trans12_decl
}
} (* end of [trans12_declist] *)

(* ****** ****** *)

(*
datatype
d1atcon_node =
| D1ATCON of
  (s1unilst, token, s1exp, s1expopt) 
*)
local

(* ****** ****** *)

fun
auxarg
( opt
: s1expopt
, npf
: &int >> _
) : s2explst =
(
case+ opt of
| None() =>
  list_nil()
| Some(s1e0) =>
  (
  case+
  s1e0.node() of
  | S1Elist(s1es) =>
    trans12_sexplst(s1es)
  | S1Elist(xs1, xs2) =>
    (
      s2es1 + s2es2
    ) where
    {
      val () = (npf := length(xs1))
      val s2es1 = trans12_sexplst(xs1)
      val s2es2 = trans12_sexplst(xs2)
    }
  | _(*non-S1Elist*) =>
    list_sing(trans12_sexp(s1e0))
  )
)

fun
auxind
( svss
: s2varlstlst
, s1is: s1explst
) : s2explstlst =
(
case+ s1is of
| list_nil _ => auxsvss(svss)
| list_cons _ => auxs1is(s1is)
) (* end of [auxind] *)

and
auxsvs
( s2vs
: s2varlst
) : s2explst =
list_vt2t
(
list_map<s2var><s2exp>(s2vs)
) where
{
implement
list_map$fopr<s2var><s2exp> = s2exp_var
}

and
auxsvss
( svss
: s2varlstlst
) : s2explstlst =
(
case+ svss of
| list_nil() => list_nil()
| list_cons(s2vs, svss) =>
  list_cons(auxsvs(s2vs), auxsvss(svss))
)

and
auxs1is
( s1is
: s1explst
) : s2explstlst =
(
case+ s1is of
| list_nil() =>
  list_nil(*void*)
| list_cons(s1i0, s1is) =>
  (
  case+
  s1i0.node() of
  | S1Elist(s1es) =>
    (
    list_cons(s2es, auxs1is(s1is))
    ) where
    {
      val s2es = trans12_sexplst(s1es)
    }
  | S1Elist(xs1, xs2) =>
    (
    list_cons
    (s2es1 + s2es2, auxs1is(s1is))
    ) where
    {
      val s2es1 = trans12_sexplst(xs1)
      val s2es2 = trans12_sexplst(xs2)
    }
  | _(* non-S1Elist *) =>
    let
      val s2e0 = trans12_sexp(s1i0)
    in
      list_cons
      (list_sing(s2e0), auxs1is(s1is))
    end // end of [non-S1Elist]
  )
) (* end of [auxs1is] *)

fun
auxres
( s2e0: s2exp
, sess: s2explstlst
) : s2exp =
(
case+ sess of
| list_nil() => s2e0
| list_cons
    (s2es, sess) =>
  (
    auxres(s2e0, sess)
  ) where
  {
    val s2e0 = s2exp_apps(s2e0, s2es)
  }
)

in (* in-of-local *)

implement
trans12_datcon
(s2c0, svss, d1c0) =
let
//
val (pf0|()) =
the_sexpenv_pushnil()
val s2e0 = auxuni(s1us)
val ((*void*)) =
the_sexpenv_popfree(pf0|(*void*))
//
val s2e0 =
(
s2exp_uni(s2us, s2ps, s2e0)
) where
{
  val s2ps = list_nil(*void*)
}
//
in
  d2con_make_idtp(tok0, s2e0)
end where
{
//
val+
D1ATCON
( s1us
, tok0
, s1is, argopt) = d1c0.node()
//
val () =
println!
("trans12_datcon: tok0 = ", tok0)
//
val
s2us =
list_vt2t
(list_vt_reverse(s2us)) where
{
fun
loop1
( svss
: s2varlstlst
, s2us
: s2varlst_vt): s2varlst_vt =
(
case+ svss of
| list_nil() => s2us
| list_cons(s2vs, svss) =>
  loop1(svss, loop2(s2vs, s2us))
)
and
loop2
( s2vs
: s2varlst
, s2us
: s2varlst_vt): s2varlst_vt =
(
case+ s2vs of
| list_nil() => s2us
| list_cons(x0, s2vs) =>
  if
  s2var_is_nil(x0)
  then
  loop2(s2vs, s2us)
  else
  loop2(s2vs, list_vt_cons(x0, s2us))
)
//
val
s2us = loop1(svss, list_vt_nil(*void*))
//
} (* end of [val] *)
//
val () =
println!
("trans12_datcon: s2us = ", s2us)
//
fun
auxuni
(s1us: s1unilst): s2exp =
(
case+ s1us of
| list_nil() =>
  let
//
    var npf: int = ~1
//
    val ind =
      auxind(svss, s1is)
    val arg =
      auxarg(argopt, npf)
//
    val s2e0 = s2exp_cst(s2c0)
    val s2e0 = auxres(s2e0, ind)
//
  in
    s2exp_fun_nil(npf, arg, s2e0)
  end // end of [list_nil]
| list_cons(s1u0, s1us) =>
  let
//
    var s2vs_
      : s2varlst_vt = list_vt_nil()
    var s2ps_
      : s2explst_vt = list_vt_nil()
//
    val+S1UNIsome(s1qs) = s1u0.node()
//
    val () =
    trans12_squalst(s1qs, s2vs_, s2ps_)
//
  in
    let
      val s2vs =
        list_vt2t(list_vt_reverse(s2vs_))
      val s2ps =
        list_vt2t(list_vt_reverse(s2ps_))
    in
      s2exp_uni(s2vs, s2ps, auxuni(s1us))
    end // end of [let]
  end
)
//
} (* end of [trans12_datcon] *)

end // end of [local]

(* ****** ****** *)

implement
trans12_datconlst
(s2c0, svss, d1cs) =
list_vt2t
(
list_map<d1atcon><d2con>(d1cs)
) where
{
//
implement
list_map$fopr<d1atcon><d2con>
  (d1c) = trans12_datcon(s2c0, svss, d1c)
//
} (* end of [trans12_datconlst] *)

(* ****** ****** *)

implement
trans12_atyp(x0) =
(
  trans12_sexp(s1e)
) where
{
//
val+
A1TYPsome
(s1e, opt) = x0.node()
//
} (* end of [trans12_atyp] *)

implement
trans12_atyplst
  (xs) =
list_vt2t
(
list_map<a1typ><s2exp>(xs)
) where
{
//
implement
list_map$fopr<a1typ><s2exp> = trans12_atyp
//
} (* trans12_atyplst *)

(* ****** ****** *)

implement
trans12_qarg(q1a) =
(
case+
q1a.node() of
|
Q1ARGsome(xs, opt) =>
let
//
val
opt = trans12_sortopt(opt)
//
val s2t =
(
case+ opt of
| Some(s2t) => s2t
| None((*void*)) => S2Tnone0()
) : sort2 // end of [val]
//
in
//
(
auxlst(xs)
) where
{
fun
auxlst
(xs: tokenlst): s2varlst =
(
case+ xs of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  (
  list_cons(s2v0, auxlst(xs))
  ) where
  {
    val tid = sortid_sym(x0)
    val s2v0 = s2var_make_idst(tid, s2t)
  }
)
} (* end of [where] *)
//
end // end of [trans12_qarg]
)

implement
trans12_qarglst
  (q1as) =
list_vt2t(svss) where
{
val
svss =
list_map<q1arg><s2varlst>
  (q1as) where
{
implement
list_map$fopr<q1arg><s2varlst> = trans12_qarg
}
} (* end of [trans12_qarglst] *)

(* ****** ****** *)

implement
trans12_tqarg
  (tq1a) = let
//
val loc0 = tq1a.loc()
//
val-
TQ1ARGsome(q1as) = tq1a.node()
//
val svss = trans12_qarglst(q1as)
//
in
  tq2arg_make(loc0, svss)
end // end of [trans12_tqarg]

implement
trans12_tqarglst
  (tqas) =
list_vt2t(tqas) where
{
val
tqas =
list_map<tq1arg><tq2arg>
  (tqas) where
{
implement
list_map$fopr<tq1arg><tq2arg> = trans12_tqarg
}
} (* end of [trans12_tqarglst] *)

(* ****** ****** *)

(* end of [xats_trans12_dynecl.dats] *)
