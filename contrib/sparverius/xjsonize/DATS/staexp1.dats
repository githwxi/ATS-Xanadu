
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


implement
jsonize_val<s1exp> = jsonize_s1exp

implement
jsonize_val<token> = jsonize_token


local

implement
jsonize_val<g1exp> = jsonize_g1exp

in (* in-of-local *)

implement
jsonize_g1exp
  (x0) =
node("g1exp", res) where
val res =
(
case+ x0.node() of
//
| G1Eid(tok) =>
  jsonify("G1Eid", "tok", jsonize(tok))
//
| G1Eint(int) =>
  jsonify("G1Eint", "int", jsonize(int))
//
| G1Eapp() =>
  jsonify("G1Eapp")
//
| G1Eapp1
  (g1e0, g1e1) =>
  jsonify("G1Eapp1", ("g1e0", "g1e1"), (jsonize(g1e0), jsonize(g1e1)))
| G1Eapp2
  (g1e0, g1e1, g1e2) =>
  jsonify("G1Eapp2", ("g1e0", "g1e1", "g1e2"),
    (jsonize(g1e0), jsonize(g1e1), jsonize(g1e2))
  )
//
| G1Elist(g1es) =>
  jsonify("G1Elist", "g1es", jsonize_list<g1exp>(g1es))
//
| G1Enone(loc) =>
  jsonify("G1Enone")
//
) (* end of [jsonize_g1exp] *)
end

end // end of [local]


local

implement
jsonize_val<g1arg> = jsonize_token

in(* in-of-local *)

implement
jsonize_g1marg
  (x0) =
node("g1marg", res) where
val res =
(
case+
x0.node() of
| G1MARGsarg(g1as) =>
  jsonify("G1MARGsarg", "g1as", jsonize_list<g1arg>(g1as))
| G1MARGdarg(g1as) =>
  jsonify("G1MARGdarg", "g1as", jsonize_list<g1arg>(g1as))
) (* end of [jsonize_g1marg] *)
end

end // end of [local]



local

implement
jsonize_val<sort1> = jsonize_sort1

in (* in-of-local *)

implement
jsonize_sort1
  (x0) =
node("sort1", res) where
val res =
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
end

end // end of [local]


implement
jsonize_val<sort1> = jsonize_sort1
implement
jsonize_val<s1rtcon> = jsonize_s1rtcon


implement
jsonize_s1rtcon
  (x0) =
node("s1rtcon", res) where
val res =
(
case+ x0.node() of
| S1RTCON(sid, opt) =>
  jsonify("S1RTCON", ("sid", "opt"),
    (
      jsonize(sid),
      jsonize_option<sort1>(opt)
    )
  )
) (* end of [jsonize_s1rtcon] *)
end



implement
jsonize_d1tsort
  (x0) =
node("d1sort", res) where
val res =
(
case+ x0.node() of
| D1TSORT(tid, s1cs) =>
  jsonify("D1TSORT", ("tid", "s1cs"),
    (jsonize(tid), jsonize_list<s1rtcon>(s1cs))
  )
) (* end of [jsonize_d1tsort] *)
end

implement
jsonize_s1rtdef
  (x0) =
node("s1rtdef", res) where
val res =
(
case+ x0.node() of
| S1RTDEFsort(s1t) =>
  jsonify("S1RTDEFsort", "s1t", jsonize(s1t))
| S1RTDEFsbst(s1a0, s1es) =>
  jsonify("S1RTDEFsbst(", ("s1a0", "s1es"), (jsonize(s1a0), jsonize_list<s1exp>(s1es)))
) (* end of [jsonize_s1rtdef] *)
end

implement
jsonize_s1arg
  (x0) =
node("s1arg", res) where
val res =
(
case+
x0.node() of
(*
| S1ARGnone() =>
  jsonify("S1ARGnone()")
*)
| S1ARGsome(tok, opt) =>
  jsonify("S1ARGsome(", ("tok", "opt"), (jsonize(tok), jsonize_option<sort1>(opt)))
) (* jsonize_s1arg *)
end

local

implement
jsonize_val<s1arg> = jsonize_s1arg

in (* in-of-local *)

implement
jsonize_s1marg
  (x0) =
node("s1marg", res) where
val res =
(
case+
x0.node() of
(*
| S1MARGnone _ => ...
| S1MARGsing _ => ...
*)
| S1MARGlist(s1as) =>
  jsonify("S1MARGlist", "s1as", jsonize_list<s1arg>(s1as))
) (* jsonize_s1marg *)
end

end // end of [local]


implement jsonize_val<t1arg> = jsonize_t1arg

implement
jsonize_t1arg
  (x0) =
node("t1arg", res) where
val res =
(
case+
x0.node() of
(*
| T1ARGnone() =>
  jsonify("T1ARGnone")
*)
| T1ARGsome(tok, opt) =>
  jsonify("T1ARGsome", ("tok", "opt"), (jsonize(tok), jsonize_option<token>(opt)))
) (* jsonize_t1arg *)
end

local

implement
jsonize_val<t1arg> = jsonize_t1arg

in (* in-of-local *)

implement
jsonize_t1marg
  (x0) =
node("t1marg", res) where
val res =
(
case+
x0.node() of
(*
| T1MARGnone _ => ...
*)
| T1MARGlist(t1as) =>
  jsonify("T1MARGlist", "t1as", jsonize_list<t1arg>(t1as))
) (* jsonize_t1marg *)
end

end // end of [local]


implement
jsonize_s1qua
  (x0) =
node("", res) where
val res =
(
case+ x0.node() of
| S1QUAprop(s1e) =>
  jsonify("S1QUAprop(", "s1e", jsonize(s1e))
| S1QUAvars(ids, opt) =>
  jsonify("S1QUAvars(", ("ids", "opt"), (jsonize_list<token>(ids), jsonize_option<sort1>(opt)))
)
end

implement
jsonize_val<s1qua> = jsonize_s1qua

implement
jsonize_s1uni
  (x0) =
node("s1uni", res) where
val res =
(
case+ x0.node() of
| S1UNIsome(s1qs) =>
  jsonify("S1UNIsome", "s1qs", jsonize_list<s1qua>(s1qs))
)
end


local

implement
jsonize_val<s1exp> = jsonize_s1exp

in (* in-of-local *)

implement
jsonize_s1exp
  (x0) =
node("", res) where
val res =
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
end

end // end of [local]


implement
jsonize_effs1expopt
  (x0) =
node("effs1expopt", res) where
val res =
(
case+ x0 of
| EFFS1EXPnone() =>
  jsonify("EFFS1EXPnone")
| EFFS1EXPsome(s1e) =>
  jsonify("EFFS1EXPsome", "s1e", jsonize(s1e))
(*
| EFFS1EXPsome(s1f, s1e) =>
  jsonify("EFFS1EXPsome", ("s1f", "s1e"), (jsonize(s1f), jsonize(s1e)))
*)
) (* end of [jsonize_effs1expopt] *)
end

implement
jsonize_val<t1marg> = jsonize_t1marg
implement
jsonize_val<d1atcon> = jsonize_d1atcon
implement
jsonize_val<s1uni> = jsonize_s1uni

implement
jsonize_d1atype
  (x0) =
node("d1atype", res) where
val res =
(
case+ x0.node() of
| D1ATYPE(tok, arg, res, d1cs) =>
  jsonify("D1ATYPE", ("tok", "arg", "res", "d1cs"),
    (
      jsonize(tok),
      jsonize_list<t1marg>(arg),
      jsonize_option<sort1>(res),
      jsonize_list<d1atcon>(d1cs)
    )
  )
) (* end of [jsonize_d1atype] *)
end

implement
jsonize_d1atcon
  (x0) =
node("d1atcon", res) where
val res =
(
case+ x0.node() of
| D1ATCON(s1us, tok, s1is, argopt) =>
  jsonify("D1ATCON", ("s1us", "tok", "s1is", "argopt"),
    (
      jsonize_list<s1uni>(s1us),
      jsonize(tok),
      jsonize_list<s1exp>(s1is),
      jsonize_option<s1exp>(argopt)
    )
  )
) (* end of [jsonize_d1atcon] *)
end
