
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
  jsonify("S1Ttype", "knd", jsonize(knd))
*)
//
(*
| S1Tapp(s1t0, s1ts) =>
  jsonify("S1Tapp", ("s1t0", "s1ts"), (jsonize(s1t0), jsonize(s1ts)))
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
  jsonify("S1Eid", "sid", jsonize(sid))
//
| S1Eint(tok) =>
  jsonify("S1Eint", "tok", jsonize(tok))
| S1Echr(tok) =>
  jsonify("S1Echr", "tok", jsonize(tok))
| S1Eflt(tok) =>
  jsonify("S1Eflt", "tok", jsonize(tok))
| S1Estr(tok) =>
  jsonify("S1Estr", "tok", jsonize(tok))
//
| S1Eapp() =>
  jsonify("S1Eapp")
//
| S1Eapp1
  (s1e0, s1e1) =>
  jsonify("S1Eapp1", ("s1e0", "s1e1"), (jsonize(s1e0), jsonize(s1e1)))
| S1Eapp2
  (s1e0, s1e1, s1e2) =>
  jsonify("S1Eapp2", ("s1e0", "s1e1", "s1e2"), (jsonize(s1e0), jsonize(s1e1), jsonize(s1e2)))
//
| S1Ebs0() =>
  jsonify("S1Ebs0")
| S1Ebs1(s1e) =>
  jsonify("S1Ebs1", "s1e", jsonize(s1e))
//
| S1Eimp(s1es) =>
  jsonify("S1Eimp", "s1es", jsonize("..."))
//
(*
| S1Eapp(s1e0, s1es) =>
  jsonify("S1Eimp", ("s1e0", "s1es"), (jsonize(s1e0), jsonize(s1es)))
*)
//
| S1Elist(s1es) =>
  jsonify("S1Elist", "s1es", jsonize("..."))
| S1Elist(s1es1, s1es2) =>
  jsonify("S1Elist", ("s1es1", "s1es2"), (jsonize("..."), jsonize("...")))
//
| S1Etuple(k0, s1es) =>
  jsonify("S1Etuple", ("k0", "s1es"), (jsonize(k0), jsonize("...")))
| S1Etuple(k0, s1es1, s1es2) =>
  jsonify("S1Etuple", ("k0", "s1es1", "s1es2"), (jsonize(k0), jsonize("..."), jsonize("...")
  ))
//
| S1Erecord(k0, ls1es) =>
  jsonify("S1Erecord", ("k0", "ls1es"), (jsonize(k0), jsonize("...")))
| S1Erecord(k0, ls1es1, ls1es2) =>
  jsonify("S1Erecord", ("k0", "ls1es1", "ls1es2"), (jsonize(k0), jsonize("..."), jsonize("...")))
//
| S1Eforall(s1qs) =>
  jsonify("S1Eforall", "s1qs", jsonize("..."))
| S1Eexists(k0, s1qs) =>
  jsonify("S1Eexists", ("k0", "s1qs"), (jsonize(k0), jsonize("...")))
//
| S1Elam(arg, res, s1e) =>
  jsonify("S1Elam", ("arg", "res", "s1e"),
    (
      jsonize("..."), //jsonize(arg),
      jsonize("..."), //jsonize(res),
      jsonize(s1e)
    )
  )
//
| S1Eanno(s1e, s1t) =>
  jsonify("S1Eanno", ("s1e", "s1t"), (jsonize(s1e), jsonize(s1t)))
//
| S1Equal(tok, s1e) =>
  jsonify("S1Equal", ("tok", "s1e"), (jsonize(tok), jsonize(s1e)))
//
| S1Enone(loc) =>
  jsonify("S1Enone", "loc", jsonize("..."))
//
) (* jsonize_s0exp *)

end // end of [local]
