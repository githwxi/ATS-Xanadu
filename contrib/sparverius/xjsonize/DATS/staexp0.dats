
#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp0.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"


implement
jsonize_val<token> = jsonize_token

implement
jsonize_t0int
  (x0) =
(
case+ x0.node() of
| T0INTnone(tok) =>
  jsonify("T0INTnone", "tok", jsonize(tok))
| T0INTsome(tok) =>
  jsonify("T0INTsome", "tok", jsonize(tok))
)

implement
jsonize_t0chr
  (x0) =
(
case+ x0.node() of
| T0CHRnone(tok) =>
  jsonify("T0CHRnone", "tok", jsonize(tok))
| T0CHRsome(tok) =>
  jsonify("T0CHRsome", "tok", jsonize(tok))
)


implement
jsonize_t0flt
  (x0) =
(
case+ x0.node() of
| T0FLTnone(tok) =>
  jsonify("T0FLTnone", "tok", jsonize(tok))
| T0FLTsome(tok) =>
  jsonify("T0FLTsome", "tok", jsonize(tok))
)


implement
jsonize_t0str
  (x0) =
(
case+ x0.node() of
| T0STRnone(tok) =>
  jsonify("T0STRnone", "tok", jsonize(tok))
| T0STRsome(tok) =>
  jsonify("T0STRsome", "tok", jsonize(tok))
)


implement
jsonize_i0dnt
  (x0) =
(
case+ x0.node() of
| I0DNTnone(tok) =>
  jsonify("I0DNTnone", "tok", jsonize(tok))
| I0DNTsome(tok) =>
  jsonify("I0DNTsome", "tok", jsonize(tok))
)


implement
jsonize_l0abl
  (l0) =
(
case+
l0.node() of
| L0ABLsome(lab) =>
  jsonify("L0ABLsome", "lab", jsonize(lab))
| L0ABLnone(tok) =>
  jsonify("L0ABLnone", "tok", jsonize(tok))
)


implement
jsonize_s0ymb
  (x0) =
(
case+
x0.node() of
//
| S0YMBi0dnt(id0) =>
  jsonify("S0YMBi0dnt", "id0", jsonize(id0))
//
| S0YMBdtlab(dot1, lab2) =>
  jsonify("S0YMBdtlab", ("dot1", "lab2"), (jsonize(dot1), jsonize(lab2)))
| S0YMBbrack(tok1, tok2) =>
  jsonify("S0YMBbrack", ("tok1", "tok2"), (jsonize(tok1), jsonize(tok2)))
//
) (* end of [jsonize_s0ymb] *)



implement
jsonize_sq0eid
  (x0) =
(
case+ x0 of
| SQ0EIDnone(sid) =>
  jsonify("SQ0EIDnone", "sid", jsonize(sid))
| SQ0EIDsome(tok, sid) =>
  jsonify("SQ0EIDsome", ("tok", "sid"), (jsonize(tok), jsonize(sid)))
)


implement
jsonize_dq0eid
  (x0) =
(
case+ x0 of
| DQ0EIDnone(sid) =>
  jsonify("DQ0EIDnone", "sid", jsonize(sid))
| DQ0EIDsome(tok, sid) =>
  jsonify("DQ0EIDsome", ("tok", "sid"), (jsonize(tok), jsonize(sid)))
)



local

implement
jsonize_val<g0exp> = jsonize_g0exp

in (* in-of-local *)

implement
jsonize_g0exp
  (x0) =
(
case+ x0.node() of
//
| G0Eid(tid) =>
  jsonify("GOEid", "tid", jsonize(tid))
//
| G0Eint(int) =>
  jsonify("GOEint", "int", jsonize(int))
//
| G0Eapps(s0ts) =>
  jsonify("GOEapps", "s0ts", jsonize_list<g0exp>(s0ts))
//
| G0Elist(t0, g0es, t1) =>
  jsonify("GOElist", ("t0", "g0es", "t1"),
    (jsonize(t0), jsonize_list<g0exp>(g0es), jsonize(t1))
  )
//
| G0Enone(tok) =>
  jsonify("G0Enone", "tok", jsonize(tok))
//
) (* end of [jsonize_g0exp] *)

end


local

implement
jsonize_val<g0eid> = jsonize_i0dnt

in (* in-of-local *)

implement
jsonize_g0marg
  (x0) =
(
case+
x0.node() of
| G0MARGnone(tok) =>
  jsonify("G0MARGnone", "tok", jsonize(tok))
| G0MARGsarg(tbeg, g0as, tend) =>
  jsonify("G0MARGsarg", ("tbeg", "g0as", "tend"), rst) where
    val rst = (jsonize(tbeg), jsonize_list<g0eid>(g0as), jsonize(tend))
  end
| G0MARGdarg(tbeg, g0as, tend) =>
  jsonify("G0MARGdarg", ("tbeg", "g0as", "tend"), rst) where
    val rst = (jsonize(tbeg), jsonize_list<g0eid>(g0as), jsonize(tend))
  end
) (* jsonize_g0marg *)

end // end of [local]


local

implement
jsonize_val<sort0> = jsonize_sort0

in (* in-of-local *)

implement
jsonize_sort0
  (x0) =
(
case+ x0.node() of
//
| S0Tid(tid) =>
  jsonify("S0Tid", "tid", jsonize(tid))
//
| S0Tint(int) =>
  jsonify("S0Tint", "tid", jsonize(int))
//
| S0Tapps(s0ts) =>
  jsonify("S0Tapps", "s0ts", jsonize_list<sort0>(s0ts))
//
| S0Tlist(t0, s0ts, t1) =>
  jsonify("S0Tlist", ("t0", "s0ts", "t1"), rst) where
    val js0ts = jsonize_list<sort0>(s0ts)
    val rst = (jsonize(t0), js0ts, jsonize(t1))
  end
//
| S0Tqual(q0, s0t) =>
  jsonify("S0Tqid", ("q0", "s0t"), (jsonize(q0), jsonize(s0t)))
//
| S0Tnone(tok) =>
  jsonify("S0Tnone", "tok", jsonize(tok))
//
) (* end of [jsonize_sort0] *)

end // end of [local]

implement
jsonize_val<sort0> = jsonize_sort0

implement
jsonize_s0rtcon
  (x0) =
(
case+ x0.node() of
| S0RTCON(sid, opt) =>
  jsonify("S0RTCON", ("sid", "opt"),
    (jsonize(sid), jsonize_option<sort0>(opt))
  )
) (* end of [jsonize_s0rtcon] *)


local

implement jsonize_val<s0rtcon> = jsonize_s0rtcon

in

implement
jsonize_d0tsort
  (x0) =
(
case+ x0.node() of
| D0TSORT(tid, tok, s0cs) =>
  jsonify("D0RTCON", ("tid", "tok", "s0cs"), (
      jsonize(tid),
      jsonize(tok),
      jsonize_list<s0rtcon>(s0cs)
    )
  )
) (* end of [jsonize_d0tsort] *)

end


implement
jsonize_val<s0exp> = jsonize_s0exp


implement
jsonize_s0rtdef
  (x0) =
(
case+ x0.node() of
| S0RTDEFsort(s0t) =>
  jsonify("S0RTDEFsort", "s0t", jsonize(s0t))
| S0RTDEFsbst(tbeg, s0a0, tbar, s0es, tend) =>
  jsonify("S0RTDEFsbst", args, rst) where
    val args = ("tbeg", "s0a0", "tbar", "s0es", "tend")
    val rst = (
      jsonize(tbeg),
      jsonize(s0a0),
      jsonize(tbar),
      jsonize_list<s0exp>(s0es),
      jsonize(tend)
    )
  end
) (* end of [jsonize_s0rtdef] *)


implement
jsonize_s0arg
  (x0) =
(
case+
x0.node() of
| S0ARGnone(tok) =>
  jsonify("S0ARGnone", "tok", jsonize(tok))
| S0ARGsome(sid, opt) =>
  jsonify("S0ARGsome", ("sid", "opt"),
    (jsonize(sid), jsonize_option<sort0>(opt))
  )
) (* jsonize_s0arg *)


implement
jsonize_val<s0arg> = jsonize_s0arg

implement
jsonize_s0marg
  (x0) =
(
case+
x0.node() of
| S0MARGnone(tok) =>
  jsonify("S0MARGnone", "tok", jsonize(tok))
| S0MARGsing(tid) =>
  jsonify("S0MARGsing", "tid", jsonize(tid))
| S0MARGlist(tbeg, s0as, tend) =>
  jsonify("S0MARGlist", ("tbeg", "s0as", "tend"),
    (
      jsonize(tbeg),
      jsonize_list<s0arg>(s0as),
      jsonize(tend)
    )
  )
) (* jsonize_s0marg *)


implement
jsonize_t0arg
  (x0) =
(
case+
x0.node() of
| T0ARGsome(tid, opt) =>
  jsonify("T0ARGsome", ("sid", "opt"),
    (jsonize(tid), jsonize_option<token>(opt))
  )
) (* jsonize_t0arg *)


implement
jsonize_val<t0arg> = jsonize_t0arg

implement
jsonize_t0marg
  (x0) =
(
case+
x0.node() of
| T0MARGnone(tok) =>
  jsonify("T0MARGnone", "tok", jsonize(tok))
| T0MARGlist(tbeg, t0as, tend) =>
  jsonify("T0MARGlist", ("tbeg", "t0as", "tend"),
    (
      jsonize(tbeg),
      jsonize_list<t0arg>(t0as),
      jsonize(tend)
    )
  )
) (* jsonize_t0marg *)

implement
jsonize_val<i0dnt> = jsonize_i0dnt

implement
jsonize_s0qua
  (x0) =
(
case+ x0.node() of
| S0QUAprop(s0e) =>
  jsonify("S0QUAprop", "s0e", jsonize(s0e))
| S0QUAvars(ids, opt) =>
  jsonify("S0QUAprop", ("ids", "opt"),
    (jsonize_list<i0dnt>(ids), jsonize_option<sort0>(opt))
  )
)

implement
jsonize_val<s0qua> = jsonize_s0qua


implement
jsonize_s0uni
  (x0) =
(
case+ x0.node() of
| S0UNInone(tok) =>
  jsonify("S0UNInone", "tok", jsonize(tok))
| S0UNIsome(tbeg, s0qs, tend) =>
  jsonify("S0UNIsome", ("tbeg", "s0qs", "tend"), (
      jsonize(tbeg),
      jsonize_list<s0qua>(s0qs),
      jsonize(tend)
    )
  )
)

implement
jsonize_val<sl0abled(s0exp)> = jsonize_sl0abled<s0exp>


implement
{a}(*tmp*)
jsonize_sl0abled
  (x0) = let
//
val+SL0ABLED(l0, t0, x1) = x0
//
in
node("sl0abled", res) where
val res =
  jsonify("SL0ABLED", ("l0", "t0", "x1"), rst) where
    val rst = (
      jsonize(l0),
      jsonize(t0),
      jsonize_val<a>(x1)
    )
  end
end

end // end of [jsonize_sl0abled]



local

implement jsonize_val<s0exp> = jsonize_s0exp
implement jsonize_val<s0marg> = jsonize_s0marg
(*
implement(a:t@ype)
jsonize_val<sl0abled(a)> = jsonize_sl0abled
*)

in (* in-of-local *)

implement
jsonize_s0exp
  (x0) =
(
case+ x0.node() of
//
| S0Eid(sid) =>
  jsonify("S0Eid", "sid", jsonize(sid))
//
| S0Eop1(opid) =>
  jsonify("S0Eop1", "opid", jsonize(opid))
| S0Eop2(tbeg, opid, tend) =>
  jsonify(
    "S0Eop1", (
      "tbeg",
      "opid",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize(opid),
      jsonize(tend)
    )
  )
//
| S0Eint(i0) =>
  jsonify("S0Eint", "i0", jsonize(i0))
| S0Echr(c0) =>
  jsonify("S0Echr", "c0", jsonize(c0))
| S0Eflt(f0) =>
  jsonify("S0Eflt", "f0", jsonize(f0))
| S0Estr(s0) =>
  jsonify("S0Estr", "s0", jsonize(s0))
//
| S0Eapps(s0es) =>
  jsonify("S0Eapps", "s0es", jsonize_list<s0exp>(s0es))
//
| S0Eimp(tbeg, s0es, tend) =>
  jsonify(
    "S0Eimp", (
      "tbeg",
      "s0es",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_list<s0exp>(s0es),
      jsonize(tend)
    )
  )
| S0Eparen
  (tbeg, s0es, tend) =>
  jsonify(
    "S0Eparen", (
      "tbeg",
      "s0es",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_list<s0exp>(s0es),
      jsonize(tend)
    )
  )

//
| S0Eforall(tbeg, s0qs, tend) =>
  jsonify(
    "S0Eforall", (
      "tbeg",
      "s0qs",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_list<s0qua>(s0qs),
      jsonize(tend)
    )
  )

| S0Eexists(tbeg, s0qs, tend) =>
  jsonify(
    "S0Eexists", (
      "tbeg",
      "s0qs",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_list<s0qua>(s0qs),
      jsonize(tend)
    )
  )
//
| S0Etuple
  (tbeg, topt, s0es, tend) =>
  jsonify(
    "S0Etuple", (
      "tbeg",
      "topt",
      "s0es",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_option<token>(topt),
      jsonize_list<s0exp>(s0es),
      jsonize(tend)
    )
  )
| S0Erecord
  (tbeg, topt, s0es, tend) =>
  jsonify(
    "S0Erecord", (
      "tbeg",
      "topt",
      "s0es",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_option<token>(topt),
      jsonize_list<sl0abled(s0exp)>(s0es),
      jsonize(tend)
    )
  )
//
| S0Elam
  ( tbeg
  , arg0, res1
  , tok1, s0e0, tend) =>
  jsonify(
    "S0Elam", (
      "tbeg",
      "arg0",
      "res1",
      "tok1",
      "s0e0",
      "tend"
    ), (
      jsonize(tbeg),
      jsonize_list<s0marg>(arg0),
      jsonize_option<sort0>(res1),
      jsonize(tok1),
      jsonize(s0e0),
      jsonize_option<token>(tend)
    )
  )
//
| S0Eanno
  (s0e, ann) =>
  jsonify(
    "S0Eanno", (
      "s0e",
      "ann"
    ), (
      jsonize(s0e),
      jsonize(ann)
    )
  )
//
| S0Equal
  (tok, s0e) =>
  jsonify(
    "S0Equal", (
      "tok",
      "s0e"
    ), (
      jsonize(tok),
      jsonize(s0e)
    )
  )
//
| S0Enone(tok) =>
  jsonify("S0Enone", "tok", jsonize(tok))
//
) (* end of [jsonize_s0exp] *)

end // end of [local]



local

implement
jsonize_val<s0exp> = jsonize_s0exp

in (* in-of-local *)

implement
jsonize_s0exp_RPAREN
  (x0) =
(
case+ x0 of
| s0exp_RPAREN_cons0(tok) =>
  jsonify("s0exp_RPAREN_cons0", "tok", jsonize(tok))
| s0exp_RPAREN_cons1(tok1, s0es, tok2) =>
  jsonify("s0exp_RPAREN_cons1", (
      "tok1",
      "s0es",
      "tok2"
    ), (
      jsonize(tok1),
      jsonize_list<s0exp>(s0es),
      jsonize(tok2)
    )
  )
) (* end of [jsonize_s0exp_RPAREN] *)

end // end of [local]



local

implement
jsonize_val<s0exp> = jsonize_s0exp

in (* in-of-local *)

implement
jsonize_labs0exp_RBRACE
  (x0) =
(
case+ x0 of
| labs0exp_RBRACE_cons0(tok) =>
  jsonify("labs0exp_RBRACE_cons0", "tok", jsonize(tok))
| labs0exp_RBRACE_cons1(tok1, ls0es, tok2) =>
  jsonify("labs0exp_RBRACE_cons0", (
      "tok1",
      "ls0es",
      "tok2"
    ), (
      jsonize(tok1),
      jsonize_list<labs0exp>(ls0es),
      jsonize(tok2)
    )
  )
) (* end of [jsonize_labs0exp_RBRACE] *)

end // end of [local]



implement
jsonize_effs0expopt
  (x0) =
(
case+ x0 of
| EFFS0EXPnone() =>
  jsonify("EFFS0EXPnone")
| EFFS0EXPsome(s0e) =>
  jsonify("EFFS0EXPsome", "s0e", jsonize(s0e))
(*
| EFFS0EXPsome(s0f, s0e) =>
  jsonify("EFFS0EXPsome", ("s0f", "s0e"), (jsonize(s0f), jsonize(s0e)))
*)
) (* end of [jsonize_effs0expopt] *)



implement jsonize_val<t0marg> = jsonize_t0marg
implement jsonize_val<d0atcon> = jsonize_d0atcon
implement jsonize_val<sort0> = jsonize_sort0

implement
jsonize_d0atype
  (x0) =
(
case+ x0.node() of
| D0ATYPE(tid, arg, res, teq, d0cs) =>
  jsonify (
    "D0ATYPE",
    (
      "tid",
      "arg",
      "res",
      "teq",
      "d0cs"
    ),
    (
      jsonize(tid),
      jsonize_list<t0marg>(arg),
      jsonize_option<sort0>(res),
      jsonize(teq),
      jsonize_list<d0atcon>(d0cs)
    )
  )
) (* end of [jsonize_d0atype] *)


local

implement jsonize_val<s0uni> = jsonize_s0uni
implement jsonize_val<s0exp> = jsonize_s0exp

in

implement
jsonize_d0atcon
  (x0) =
(
case+ x0.node() of
| D0ATCON(s0us, dcon, s0is, argopt) =>
  jsonify(
    "D0ATCON",
    (
      "s0us",
      "dcon",
      "s0is",
      "argopt"
    ),
    (
      jsonize_list<s0uni>(s0us),
      jsonize(dcon),
      jsonize_list<s0exp>(s0is),
      jsonize_option<s0exp>(argopt)
    )
  )
  where
    val jargopt = (
      case+ argopt of
      | None() => jsonify("None")
      | Some(x) => jsonize(x)
    )
  end
) (* end of [jsonize_d0atcon] *)

end
