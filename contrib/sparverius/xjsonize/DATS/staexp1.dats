
#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp0.sats"
#staload "{$XATS}/SATS/staexp1.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"

#staload "./../SATS/staexp1.sats"

#staload SYM_J = "./../SATS/symbol.sats"
overload jsonize with $SYM_J.jsonize_symbol


local

implement
jsonize_val<sort1> = jsonize_sort1

in (* in-of-local *)

implement
jsonize_sort1
  (x0) =
(
case+ x0.node() of
//
| S1Tid(id) =>
  jsonify("S1Tid", "id", jsonize(id))
//
| S1Tint(int) =>
  jsonify("S1Tapp", "int", jsonize(int))
//
| S1Tapp() =>
  jsonify("S1Tapp")
//
(*
| S1Ttype(knd) =>
  fprint!(out, "S1Ttype", knd, ")")
*)
//
(*
| S1Tapp(s1t0, s1ts) =>
  fprint!
  (out, "S1Tapp(", s1t0, "; ", s1ts, ")")
*)
//
| S1Tapp1
  (s1t0, s1t1) =>
  jsonify("S1Tapp1", ("s1t0", "s1t1"), (jsonize(s1t0), jsonize(s1t1)))
| S1Tapp2
  (s1t0, s1t1, s1t2) =>
  jsonify("S1Tapp2", ("s1t0", "s1t1", "s1t2"),
    (
      jsonize(s1t0),
      jsonize(s1t1),
      jsonize(s1t2)
    )
  )
//
| S1Tlist(s1ts) =>
  jsonify("S1Tlist", "s1ts", jsonize_list<sort1>(s1ts))
//
| S1Tqual(tok0, s1t1) =>
  jsonify("S1Tnone", ("tok0", "s1t1"), (jsonize(tok0), jsonize(s1t1)))
//
| S1Tnone((*void*)) =>
  jsonify("S1Tnone")
//
) (* end of [jsonize_sort1] *)

end // end of [local]



local

implement
jsonize_val<s1exp> = jsonize_s1exp

in (* in-of-local *)

implement
jsonize_s1exp
  (x0) =
(
case+ x0.node() of
//
| S1Eid(sid) =>
  jsonize("S1Eid")
//
| S1Eint(tok) =>
  jsonize("S1Eint")
| S1Echr(tok) =>
  jsonize("S1Echr")
| S1Eflt(tok) =>
  jsonize("S1Eflt")
| S1Estr(tok) =>
  jsonize("S1Estr")
//
| S1Eapp() =>
  jsonize("S1Eapp")
//
| S1Eapp1
  (s1e0, s1e1) =>
  jsonize("S1Eapp1")
| S1Eapp2
  (s1e0, s1e1, s1e2) =>
  jsonize("S1Eapp2")
//
| S1Ebs0() =>
  jsonize("S1Ebs0")
| S1Ebs1(s1e) =>
  jsonize("S1Ebs1")
//
| S1Eimp(s1es) =>
  jsonize("S1Eimp")
//
(*
| S1Eapp(s1e0, s1es) =>
*)
//
| S1Elist(s1es) =>
  jsonize("S1Elist")
| S1Elist(s1es1, s1es2) =>
  jsonize("S1Elist")
//
| S1Etuple(k0, s1es) =>
  jsonize("S1Etuple")
| S1Etuple(k0, s1es1, s1es2) =>
  jsonize("S1Etuple")
//
| S1Erecord(k0, ls1es) =>
  jsonize("S1Erecord")
| S1Erecord(k0, ls1es1, ls1es2) =>
  jsonize("S1Erecord")
//
| S1Eforall(s1qs) =>
  jsonize("S1Eforall")
| S1Eexists(k0, s1qs) =>
  jsonize("S1Eexists")
//
| S1Elam(arg, res, s1e) =>
  jsonize("S1Elam")
//
| S1Eanno(s1e, s1t) =>
  jsonize("S1Eanno")
//
| S1Equal(tok, s1e) =>
  jsonize("S1Equal")
//
| S1Enone(loc) =>
  jsonize("S1Enone")
//
) (* jsonize_s0exp *)

end // end of [local]
