#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#include
"./../HATS/libxatsopt.hats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp0.sats"
#staload "{$XATS}/SATS/staexp0.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/lexing.sats"


(*
overload jsonize with jsonize_option
*)

implement jsonize_val<token> = jsonize_token
implement jsonize_val<s0exp> = jsonize_s0exp
implement jsonize_val<sort0> = jsonize_sort0
implement jsonize_val<s0arg> = jsonize_s0arg
implement jsonize_val<t0arg> = jsonize_t0arg
implement jsonize_val<s0marg> = jsonize_s0marg
implement jsonize_val<t0marg> = jsonize_t0marg
implement jsonize_val<sq0arg> = jsonize_sq0arg
implement jsonize_val<tq0arg> = jsonize_tq0arg
implement jsonize_val<ti0arg> = jsonize_ti0arg
implement jsonize_val<f0arg> = jsonize_f0arg

implement
jsonize_q0arg
  (x0) =
(
//
case+
x0.node() of
(*
| Q0ARGnone(tok) =>
  jsonify("Q0ARGnone", "tok", jsonize(tok))
*)
| Q0ARGsome(sid, opt) =>
  jsonify("Q0ARGsome", ("sid", "opt"), (jsonize(sid), jsonize_option<sort0>(opt)))
//
) (* end of [jsonize_q0arg] *)

implement
jsonize_a0typ
  (x0) =
(
//
case+ x0.node() of
(*
| A0TYPnone(tok) =>
  jsonify("A0TYPnone", tok)
*)
| A0TYPsome(s0e, opt) =>
  jsonify("A0TYPsome", ("s0e", "opt"), (jsonize(s0e), jsonize_option<token>(opt)))
//
) (* end of [jsonize_a0typ] *)


local
//
implement jsonize_val<a0typ> = jsonize_a0typ

fun
jsonize_a0typlstopt
(opt: a0typlstopt): jsonval =
(
case+ opt of
| None() => jsonify("None")
| Some(a0ts) => jsonify("Some", "a0ts", jsonize_list<a0typ>(a0ts))
)
//
overload jsonize with jsonize_a0typlstopt of 100
//

implement jsonize_val<s0qua> = jsonize_s0qua

in (* in-of-local *)

implement
jsonize_d0arg
  (x0) =
(
//
case+ x0.node() of
//
| D0ARGnone(tok) =>
  jsonify("D0ARGnone", "tok", jsonize(tok))
//
| D0ARGsome_sta
  (tbeg, s0qs, tend) =>
  jsonify("D0ARGsome_sta", ("tbeg", "s0qs", "tend"),
  (jsonize(tbeg), jsonize_list<s0qua>(s0qs), jsonize(tend)))
//
| D0ARGsome_dyn1
  (tok) =>
  jsonify("D0ARGsome_dyn1", "tok", jsonize(tok))
| D0ARGsome_dyn2
  (tbeg, arg0, opt1, tend) =>
  jsonify(
    "D0ARGsome_dyn",
    ("tbeg", "arg0", "opt1", "tend"),
    (jsonize(tbeg), jsonize_list<a0typ>(arg0), jsonize(opt1), jsonize(tend))
  )
//
) (* end of [jsonize_d0arg] *)

end // end of [local]


implement jsonize_val<s0qua> = jsonize_s0qua
implement jsonize_val<s0exp> = jsonize_s0exp

implement
jsonize_f0arg
  (x0) =
(
//
case+
x0.node() of
| F0ARGnone(tok) =>
  jsonify("F0ARGnone", "tok", jsonize(tok))
| F0ARGsome_dyn(d0p) =>
  jsonify("F0ARGsome_dyn", "d0p", jsonize(d0p))
| F0ARGsome_sta(tbeg, s0qs, tend) =>
  jsonify(
    "F0ARGsome_sta", ("tbeg", "s0qs", "tend"),
    (jsonize(tbeg), jsonize_list<s0qua>(s0qs), jsonize(tend))
  )

| F0ARGsome_met(tbeg, s0es, tend) =>
  jsonify(
    "F0ARGsome_met", ("tbeg", "s0es", "tend"),
    (jsonize(tbeg), jsonize_list<s0exp>(s0es), jsonize(tend))
  )
    (* where val _ = $showtype(s0es) end *)
//
) (* end of [jsonize_f0arg] *)

implement jsonize_val<q0arg> = jsonize_q0arg

implement
jsonize_sq0arg
  (x0) =
(
//
case+
x0.node() of
| SQ0ARGnone(tok) =>
  jsonify("SQ0ARGnone", "tok", jsonize(tok))
| SQ0ARGsome(tbeg, q0as, tend) =>
  jsonify(
    "SQ0ARGsome", ("tbeg", "q0as", "tend"),
    (jsonize(tbeg), jsonize_list<q0arg>(q0as), jsonize(tend))
  )

//
) (* end of [jsonize_sq0arg] *)

implement
jsonize_tq0arg
  (x0) =
(
//
case+
x0.node() of
| TQ0ARGnone(tok) =>
  jsonify("TQ0ARGnone", "tok", jsonize(tok))
| TQ0ARGsome(tbeg, q0as, tend) =>
  jsonify(
    "TQ0ARGsome", ("tbeg", "q0as", "tend"),
    (jsonize(tbeg), jsonize_list<q0arg>(q0as), jsonize(tend))
  )
//
) (* end of [jsonize_tq0arg] *)


implement
jsonize_ti0arg
  (x0) =
(
//
case+
x0.node() of
| TI0ARGnone(tok) =>
  jsonify("TI0ARGnone", "tok", jsonize(tok))
| TI0ARGsome(tbeg, q0as, tend) =>
  jsonify(
    "TI0ARGsome", ("tbeg", "q0as", "tend"),
    (jsonize(tbeg), jsonize_list<s0exp>(q0as), jsonize(tend))
  )
//
) (* end of [jsonize_ti0arg] *)


(*
implement
{a}(*tmp*)
jsonize_dl0abeled
  (x0) = let
//
val+DL0ABELED(l0, t0, x1) = x0
//
in
  jsonify("SL0ABELED(");
  jsonify(l0, ", ", t0, ", ");
  jsonize_val<a>(x1); jsonify(")")
end // end of [jsonize_dl0abeled]
*)


local

implement
jsonize_val<d0pat> = jsonize_d0pat

in (* in-of-local *)

implement
jsonize_d0pat
  (x0) =
(
case+ x0.node() of
//
| D0Pid(id) =>
  jsonify("D0Pid", "id", jsonize(id))
//
| D0Pint(i0) =>
  jsonify("D0Pint", "i0", jsonize(i0))
| D0Pchr(c0) =>
  jsonify("D0Pchr", "c0", jsonize(c0))
| D0Pflt(f0) =>
  jsonify("D0Pflt", "f0", jsonize(f0))
| D0Pstr(s0) =>
  jsonify("D0Pstr", "s0", jsonize(s0))
//
| D0Papps(d0ps) =>
  jsonify("D0Papps", "d0ps", jsonize_list<d0pat>(d0ps))

//
| D0Psqarg
  (tbeg, s0as, tend) =>
  jsonify(
    "D0Psqarg", ("tbeg", "s0as", "tend"),
    (jsonize(tbeg), jsonize_list<s0arg>(s0as), jsonize(tend))
  )
  (* where val _ = $showtype(s0as) end *)
//
| D0Pparen
  (tbeg, d0ps, tend) =>
  jsonify(
    "D0Pparen", ("tbeg", "d0ps", "tend"),
    (jsonize(tbeg), jsonize_list<d0pat>(d0ps), jsonize(tend))
  )
//
| D0Ptuple
  (tbeg, topt, d0ps, tend) =>
  jsonify(
    "D0Ptuple", ("tbeg", "topt", "d0ps", "tend"),
    (jsonize(tbeg), jsonize_option<token>(topt), jsonize_list<d0pat>(d0ps), jsonize(tend))
  )
| D0Precord
  (tbeg, topt, ld0ps, tend) =>
  jsonify(
    "D0Precord", ("tbeg", "topt", "ld0ps", "tend"),
    (jsonize(tbeg), jsonize_option<token>(topt), jsonize("..."), jsonize(tend))
  )
//
| D0Panno
  (d0p, ann) =>
  jsonify("D0Panno", ("d0p", "ann"), (jsonize(d0p), jsonize(ann)))
//
| D0Pqual
  (tok, d0p) =>
  jsonify("D0Pqual", ("tok", "d0p"), (jsonize(tok), jsonize(d0p)))
//
| D0Pnone(tok) => jsonify("D0Pnone", "tok", jsonize(tok))
//
) (* end of [jsonize_d0pat] *)

end // end of [local]


local

implement
jsonize_val<d0pat> = jsonize_d0pat

in (* in-of-local *)

implement
jsonize_d0pat_RPAREN
  (x0) =
(
case+ x0 of
| d0pat_RPAREN_cons0(tok) =>
  jsonify("d0pat_RPAREN_cons0", "tok", jsonize(tok))
| d0pat_RPAREN_cons1(tok1, d0ps, tok2) =>
  jsonify(
    "d0pat_RPAREN_cons1", ("tok1", "d0ps", "tok2"),
    (jsonize(tok1), jsonize_list<d0pat>(d0ps), jsonize(tok2))
  )
) (* end of [jsonize_d0pat_RPAREN] *)

end // end of [local]


local

implement
jsonize_val<d0pat> = jsonize_d0pat

in (* in-of-local *)

implement
jsonize_labd0pat_RBRACE
  (x0) =
(
case+ x0 of
| labd0pat_RBRACE_cons0(tok) =>
  jsonify("labd0pat_RBRACE_cons0", "tok", jsonize(tok))
| labd0pat_RBRACE_cons1(tok1, ld0ps, tok2) =>
  jsonify(
    "labd0pat_RBRACE_cons1", ("tok1", "ld0ps", "tok2"),
    (jsonize(tok1), jsonize("..."), jsonize(tok2))
  )
) (* end of [jsonize_labd0pat_RBRACE] *)

end // end of [local]


local

implement
jsonize_val<d0exp> = jsonize_d0exp
implement
jsonize_val<s0exp> = jsonize_s0exp
implement
jsonize_val<d0ecl> = jsonize_d0ecl
implement
jsonize_val<f0arg> = jsonize_f0arg

in (* in-of-local *)

implement
jsonize_d0exp
  (x0) =
(
case+ x0.node() of
//
| D0Eid(id) =>
  jsonify("D0Eid", "id", jsonize(id))
//
| D0Eint(i0) =>
  jsonify("D0Eint", "i0", jsonize(i0))
| D0Echr(c0) =>
  jsonify("D0Echr", "c0", jsonize(c0))
| D0Eflt(f0) =>
  jsonify("D0Eflt", "f0", jsonize(f0))
| D0Estr(s0) =>
  jsonify("D0Estr", "s0", jsonize(s0))
//
| D0Eapps(d0es) =>
  jsonify("D0Eapps", "d0es", jsonize_list<d0exp>(d0es))
//
| D0Esqarg
  (tbeg, s0es, tend) =>
  jsonify(
    "D0Esqarg", ("tbeg", "s0es", "tend"),
    (jsonize(tbeg), jsonize_list<s0exp>(s0es), jsonize(tend))
  )
| D0Etqarg
  (tbeg, s0es, tend) =>
  jsonify(
    "D0Etqarg", ("tbeg", "s0es", "tend"),
    (jsonize(tbeg), jsonize_list<s0exp>(s0es), jsonize(tend))
  )
//
| D0Eparen
  (tbeg, d0es, tend) =>
  jsonify(
    "D0Eparen", ("tbeg", "d0es", "tend"),
    (jsonize(tbeg), jsonize_list<d0exp>(d0es), jsonize(tend))
  )
//
| D0Etuple
  (tbeg, topt, d0es, tend) =>
  jsonify(
    "D0Etuple", ("tbeg", "topt", "d0es", "tend"),
    (jsonize(tbeg), jsonize_option<token>(topt), jsonize_list<d0exp>(d0es), jsonize(tend))
  )
| D0Erecord
  (tbeg, topt, ld0es, tend) =>
  jsonify(
    "D0Erecord", ("tbeg", "topt", "ld0es", "tend"),
    (jsonize(tbeg), jsonize_option<token>(topt), jsonize("..."), jsonize(tend))
  )
//
| D0Eif0
  (tif0, d0e1, d0e2, d0e3, tend) =>
  jsonify(
    "D0Eif0", ("tif0", "d0e1", "d0e2", "d0e3", "tend"),
    (jsonize(tif0), jsonize(d0e1), jsonize(d0e2), jsonize(d0e3), jsonize_option<token>(tend))
  )
//
| D0Ecase
  (tok0, d0e1, tof2, tbar, d0cs, tend) =>
  jsonify(
    "D0Ecase", ("tok0", "d0e1", "tof2", "tbar", "d0cs"(*...*), "tend"),
    (
      jsonize(tok0),
      jsonize(d0e1),
      jsonize(tof2),
      jsonize_option<token>(tbar),
      jsonize("..."),
      jsonize_option<token>(tend)
    )
  )
//
| D0Elet
  (tok0, d0cs, topt, d0es, tok2) =>
  jsonify(
    "D0Elet", ("tok0", "d0cs", "topt", "d0es", "tok2"),
    (
      jsonize(tok0),
      jsonize_list<d0ecl>(d0cs),
      jsonize_option<token>(topt),
      jsonize_list<d0exp>(d0es),
      jsonize(tok2)
    )
  )
//
| D0Ewhere(d0e1, d0cs) =>
  jsonify("D0Ewhere", ("d0e1", "d0cs"), (jsonize(d0e1), jsonize(d0cs)))
//
//
| D0Ebrack
  (tbeg, d0es, tend) =>
  jsonify(
    "D0Ebrack", ("tbeg", "d0es", "tend"),
    (jsonize(tbeg), jsonize_list<d0exp>(d0es), jsonize(tend))
  )
| D0Edtsel
  (tdot, lab1, arg2) =>
  jsonify(
    "D0Edtsel", ("tdot", "lab1", "arg2"),
    (jsonize(tdot), jsonize(lab1), jsonize_option<d0exp>(arg2))
  )
//
| D0Elam
  (tok0, arg1, res2, farrw, fbody, tend) =>
  jsonify(
    "D0Elam", ("tok0", "arg1", "res2", "farrw", "fbody", "tend"),
    (jsonize(tok0), jsonize_list<f0arg>(arg1), jsonize(res2), jsonize(farrw), jsonize(fbody), jsonize_option<token>(tend))
  )
| D0Efix
  (tok0, fid0, arg1, res2, farrw, fbody, tend) =>
  jsonify(
    "D0Efix", ("tok0", "fid0", "arg1", "res2", "farrw", "fbody", "tend"),
    (jsonize(tok0), jsonize(fid0), jsonize_list<f0arg>(arg1), jsonize(res2), jsonize(farrw), jsonize(fbody), jsonize_option<token>(tend)))
//
| D0Eanno
  (d0e, ann) =>
  jsonify("D0Eanno", ("d0e", "ann"), (jsonize(d0e), jsonize(ann)))
//
| D0Equal
  (tok, d0e) =>
  jsonify("D0Equal", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
//
| D0Enone(tok) => jsonify("D0Enone"," tok", jsonize(tok))
//
) (* end of [jsonize_d0exp] *)

end // end of [local]

local

implement
jsonize_val<d0exp> = jsonize_d0exp

in (* in-of-local *)

implement
jsonize_d0exp_RPAREN
  (x0) =
(
case+ x0 of
| d0exp_RPAREN_cons0(tok) =>
  jsonify("d0exp_RPAREN_cons0", "tok", jsonize(tok))
| d0exp_RPAREN_cons1(tok1, d0es, tok2) =>
  jsonify(
    "d0exp_RPAREN_cons1", ("tok1", "d0es", "tok2"),
    (jsonize(tok1), jsonize_list<d0exp>(d0es), jsonize(tok2))
  )
| d0exp_RPAREN_cons2(tok1, d0es, tok2) =>
  jsonify(
    "d0exp_RPAREN_cons2", ("tok1", "d0es", "tok2"),
    (jsonize(tok1), jsonize_list<d0exp>(d0es), jsonize(tok2))
  )
) (* end of [jsonize_d0exp_RPAREN] *)

end // end of [local]

local

implement
jsonize_val<d0exp> = jsonize_d0exp

in (* in-of-local *)

implement
jsonize_labd0exp_RBRACE
  (x0) =
(
case+ x0 of
| labd0exp_RBRACE_cons0(tok) =>
  jsonify("labd0exp_RBRACE_cons0", "tok", jsonize(tok))
| labd0exp_RBRACE_cons1(tok1, ld0es, tok2) =>
  jsonify(
    "labd0exp_RBRACE_cons1", ("tok1", "ld0es", "tok2"),
    (jsonize(tok1), jsonize("..."), jsonize(tok2))
  )
) (* end of [jsonize_labd0exp_RBRACE] *)

end // end of [local]


implement
jsonize_d0exp_THEN(x0) =
(
case+ x0 of
| d0exp_THEN(tok, d0e) =>
  jsonify("d0exp_THEN", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
) (* end of [jsonize_d0exp_THEN] *)


implement
jsonize_d0exp_ELSE(x0) =
(
case+ x0 of
| d0exp_ELSEnone() =>
  jsonify("d0exp_ELSEnone")
| d0exp_ELSEsome(tok, d0e) =>
  jsonify("d0exp_ELSEsome", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
) (* end of [jsonize_d0exp_ELSE] *)


implement
jsonize_endwhere(x0) =
(
case+ x0 of
| endwhere_cons1(tok) =>
  jsonify("endwhere_cons1", "tok", jsonize(tok))
| endwhere_cons2(tok1, opt2) =>
  jsonify("endwhere_cons2", ("tok1", "opt2"), (jsonize(tok1), jsonize_option<token>(opt2)))
)

implement jsonize_val<d0ecl> = jsonize_d0ecl


implement
jsonize_d0eclseq_WHERE(x0) =
(
case+ x0 of
| d0eclseq_WHERE
  (tok0, opt1, d0cs, opt2) =>
  jsonify(
    "d0eclseq_WHERE", ("tok0", "opt1", "d0cs", "opt2"),
    (jsonize(tok0), jsonize_option<token>(opt1), jsonize_list<d0ecl>(d0cs), jsonize(opt2))
  )
) (* end of [jsonize_d0eclseq_WHERE] *)


implement jsonize_val<s0exp> = jsonize_s0exp

implement
jsonize_f0unarrow(x0) =
(
case+ x0 of
| F0UNARROWnone(tok) =>
  jsonify("F0UNARROWnone", "tok", jsonize(tok))
| F0UNARROWdflt(tok) =>
  jsonify("F0UNARROWdflt", "tok", jsonize(tok))
| F0UNARROWlist(tbeg, s0es, tend) =>
  jsonify(
    "F0UNARROWlist", ("tbeg", "s0es", "tend"),
    (jsonize(tbeg), jsonize_list<s0exp>(s0es), jsonize(tend))
  )
) (* end of [jsonize_f0unarrow] *)



implement jsonize_val<i0dnt>(x) = jsonize_i0dnt(x)

implement
jsonize_decmodopt
  (x0) =
(
case+ x0 of
//
| DECMODnone() =>
  jsonify("DECMODnone")
//
| DECMODsing(tok, id0) =>
  jsonify("DECMODsing", ("tok", "id0"), rst) where
    val rst = (jsonize(tok), jsonize(id0))
  end
| DECMODlist(tok, tbeg, ids, tend) =>
  (* jsonize!( out, "DECMODlist", tok, tbeg, ids, tend) *)
  jsonify("DECMODsing", ("tok", "tbeg", "ids", "tend"), rst) where
    (* val _ = $showtype(ids) *)
    val xys = jsonize_list<i0dnt>(ids)
    val rst = (jsonize(tok), jsonize(tbeg), xys, jsonize(tend))
  end
)


implement
jsonize_teqd0expopt
  (x0) =
(
case+ x0 of
| TEQD0EXPnone() =>
  jsonify("TEQD0EXPnone")
| TEQD0EXPsome(tok, d0e) =>
  jsonify("TEQD0EXPsome", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
)

implement
jsonize_wths0expopt
  (x0) =
(
case+ x0 of
| WTHS0EXPnone() =>
  jsonify("WTHS0EXPnone")
| WTHS0EXPsome(tok, d0e) =>
  jsonify("WTHS0EXPsome", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
)


local

implement
jsonize_val<d0ecl> = jsonize_d0ecl
implement
jsonize_val<g0marg> = jsonize_g0marg
implement
jsonize_val<v0aldecl> = jsonize_v0aldecl
implement
jsonize_val<v0ardecl> = jsonize_v0ardecl
implement
jsonize_val<f0undecl> = jsonize_f0undecl
implement
jsonize_val<d0cstdecl> = jsonize_d0cstdecl
implement
jsonize_val<i0dnt> = jsonize_i0dnt

implement
jsonize_val<d0tsort> = jsonize_d0tsort
implement
jsonize_val<d0atype> = jsonize_d0atype

implement
jsonize_val<t0int> = jsonize_t0int

in (* in-of-local *)

implement
jsonize_d0ecl
  (x0) =
(
case+ x0.node() of
//
| D0Cnone(tok) =>
  jsonify("D0Cnone", "tok", jsonize(tok))
//
| D0Ctokerr(tok) =>
  jsonify("D0Ctokerr", "tok", jsonize(tok))
//
| D0Cnonfix(tok, ids) =>
  jsonify("D0Cnonfix", ("tok", "ids"), (jsonize(tok), jsonize_list<i0dnt>(ids)))
| D0Cfixity(tok, ids, opt) =>
  jsonify(
    "D0Cfixity", ("tok", "ids", "opt"),
    (jsonize(tok), jsonize_list<i0dnt>(ids), jsonize(opt))
  )
//
| D0Cstatic(tok, d0c) =>
  jsonify("D0Cstatic", ("tok", "d0c"), (jsonize(tok), jsonize(d0c)))
| D0Cextern(tok, d0c) =>
  jsonify("D0Cextern", ("tok", "d0c"), (jsonize(tok), jsonize(d0c)))
//
| D0Cdefine
  (tok, gid, gmas, gdef) =>
  jsonify(
    "D0Cdefine", ("tok", "gid", "gmas", "gdef"),
    (jsonize(tok), jsonize(gid), jsonize_list<g0marg>(gmas), jsonize(gdef))
  )
//
| D0Cmacdef
  (tok, gid, gmas, mdef) =>
  jsonify(
    "D0Cmacdef", ("tok", "gid", "gmas", "mdef"),
    (jsonize(tok), jsonize(gid), jsonize_list<g0marg>(gmas), jsonize(mdef))
  )
//
| D0Cinclude(tok, d0e) =>
  jsonify("D0Cinclude", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
//
| D0Cstaload(tok, d0e) =>
  jsonify("D0Cstaload", ("tok", "d0e"), (jsonize(tok), jsonize(d0e)))
(*
| D0Cdynload(tok, d0e) =>
  jsonify("D0Cdynload", tok, d0e)
*)
//
| D0Cabssort(tok, tid) =>
  jsonify("D0Cabssort", ("tok", "tid"), (jsonize(tok), jsonize(tid)))
//
| D0Cstacst0
  (tok, sid, tmas, tok1, s0t2) =>
  jsonify(
    "D0Cstacst0", ("tok", "sid", "tmas", "tok1", "s0t2"),
    (
      jsonize(tok),
      jsonize(sid),
      jsonize_list<t0marg>(tmas),
      jsonize(tok1), jsonize(s0t2)
    )
  )
//
| D0Csortdef
  (tok, tid, tok1, def2) =>
  jsonify(
    "D0Csortdef", ("tok", "tid", "tok1", "def2"),
    (jsonize(tok), jsonize(tid), jsonize(tok1), jsonize(def2))
  )
| D0Csexpdef
  (tok, sid, arg, res, tok1, tdef) =>
  jsonify(
    "D0Csexpdef", ("tok", "sid", "arg", "res", "tok1", "tdef"),
    (jsonize(tok), jsonize(sid), jsonize_list<s0marg>(arg), jsonize_option<sort0>(res), jsonize(tok1), jsonize(tdef))
  )
//
| D0Cabstype
  (tok, sid, arg, res, tdef) =>
  jsonify(
    "D0Cabstype", ("tok", "sid", "arg", "res", "tdef"),
    (jsonize(tok), jsonize(sid), jsonize_list<t0marg>(arg), jsonize_option<sort0>(res), jsonize(tdef))
  )
//
| D0Cabsimpl
  (tok, sqid, smas, res0, teq1, def2) =>
  jsonify(
    "D0Cabsimpl", ("tok", "sqid", "smas", "res0", "teq1", "def2"),
    (
      jsonize(tok),
      jsonize(sqid),
      jsonize_list<s0marg>(smas),
      jsonize_option<sort0>(res0),
      jsonize(teq1),
      jsonize(def2)
    )
  )
//
| D0Cvaldecl
  (tok, mopt, d0cs) =>
  jsonify(
    "D0Cvaldecl", ("tok", "mopt", "d0cs"),
    (jsonize(tok), jsonize(mopt), jsonize_list<v0aldecl>(d0cs))
  )
//
| D0Cvardecl
  (tok, mopt, d0cs) =>
  jsonify(
    "D0Cvardecl", ("tok", "mopt", "d0cs"),
    (jsonize(tok), jsonize(mopt), jsonize_list<v0ardecl>(d0cs))
  )
//
| D0Cfundecl
  (tok, mopt, tqas, d0cs) =>
  jsonify(
    "D0Cfundecl", ("tok", "mopt", "tqas", "d0cs"),
    (jsonize(tok), jsonize(mopt), jsonize_list<tq0arg>(tqas), jsonize_list<f0undecl>(d0cs))
  )
//
| D0Cimpdecl
  (tok, mopt, sqas, tqas, dqid, tias, f0as, res0, teq1, d0e2) =>
  jsonify(
    "D0Cimpdecl",
    ("tok", "mopt", "sqas", "tqas", "dqid", "tias", "f0as", "res0", "teq1", "d0e2"),
    (
      jsonize(tok),
      jsonize(mopt),
      jsonize_list<sq0arg>(sqas),
      jsonize_list<tq0arg>(tqas),
      jsonize(dqid),
      jsonize_list<ti0arg>(tias),
      jsonize_list<f0arg>(f0as),
      jsonize(res0),
      jsonize(teq1),
      jsonize(d0e2)
    )
  )
//
| D0Csymload
  (tok, sym, twth, dqid, tint) =>
  jsonify(
    "D0Csymload", ("tok", "sym", "twth", "dqid", "tint"),
    (jsonize(tok), jsonize(sym), jsonize(twth), jsonize(dqid), jsonize_option<t0int>(tint))
  )
//
| D0Cdatasort(tok, d0cs) =>
  jsonify("D0Cdatasort", ("tok", "d0cs"), (jsonize(tok), jsonize_list<d0tsort>(d0cs)))
//
| D0Cdatatype(tok, d0cs, wopt) =>
  jsonify(
    "D0Cdatatype", ("tok", "d0cs", "wopt"),
    (jsonize(tok), jsonize_list<d0atype>(d0cs), jsonize(wopt))
  )
//
| D0Cdynconst
  (tok, tqas, d0cs) =>
  jsonify(
    "D0Cdynconst", ("tok", "tqas", "d0cs"),
    (jsonize(tok), jsonize_list<tq0arg>(tqas), jsonize_list<d0cstdecl>(d0cs))
  )
//
| D0Clocal
  (tbeg, d0cs0, topt, d0cs1, tend) =>
  jsonify(
    "D0Clocal", ("tbeg", "d0cs0", "topt", "d0cs1", "tend"),
    (jsonize(tbeg), jsonize_list<d0ecl>(d0cs0), jsonize_option<token>(topt), jsonize_list<d0ecl>(d0cs1), jsonize(tend))
  )
//
(*
| _(*rest-of-d1ecl*) =>
    jsonify("jsonize_d1ecl: D0C...: not-yet-implemented")
*)
//
) (* end of [jsonize_d0ecl] *)

end // end of [local]


implement
jsonize_precopt
  (x0) =
(
case+ x0 of
| PRECOPTnil() =>
  jsonify("PRECOPTnil")
| PRECOPTint(tint) =>
  jsonify("PRECOPTint", "tint", jsonize(tint))
| PRECOPTopr(topr, pmod) =>
  jsonify("PRECOPTopr", ("topr", "pmod"), (jsonize(topr), jsonize(pmod)))
) (* end of [jsonize_precopt] *)



implement
jsonize_signint
  (x0) =
(
case+ x0 of
| SIGNINTint(tint) =>
  jsonify("SIGNINTint", "tint", jsonize(tint))
| SIGNINTopr(topr, tint) =>
  jsonify("SIGNINTopr", ("topr", "tint"), (jsonize(topr), jsonize(tint)))
)
//
implement
jsonize_precmod
  (x0) =
(
case+ x0 of
| PRECMODnone() =>
  jsonify("PRECMODnone")
| PRECMODsome(tbeg, sint, tend) =>
  jsonify("PRECMODsome", ("tbeg", "sint", "tend"), (jsonize(tbeg), jsonize(sint), jsonize(tend)))
)



implement
jsonize_abstdf0
  (x0) =
(
case+ x0 of
| ABSTDF0some() =>
  jsonify("ABSTDF0some")
| ABSTDF0lteq(tok, s0e) =>
  jsonify("ABSTDF0lteq", ("tok", "s0e"), (jsonize(tok), jsonize(s0e)))
| ABSTDF0eqeq(tok, s0e) =>
  jsonify("ABSTDF0eqeq", ("tok", "s0e"), (jsonize(tok), jsonize(s0e)))
) (* end of [jsonize_abstdf0] *)


implement
jsonize_g0expdef
  (x0) =
(
case+ x0 of
| G0EDEFnone() =>
  jsonify("G0EDEFnone")
| G0EDEFsome(topt, g0e1) =>
  jsonify("G0EDEFsome", ("topt", "g0e1"), (jsonize_option<token>(topt), jsonize(g0e1)))
)


implement
jsonize_d0macdef
  (x0) =
(
case+ x0 of
| D0MDEFnone() =>
  jsonify("D0MDEFnone")
| D0MDEFsome(topt, d0e1) =>
  jsonify("D0MDEFsome", ("topt", "d0e1"), (jsonize_option<token>(topt), jsonize(d0e1)))
)


implement
jsonize_wd0eclseq
  (x0) =
(
case+ x0 of
| WD0CSnone() =>
  jsonify("WD0CSnone")
| WD0CSsome(tbeg, topt, d0cs, tend) =>
  jsonify("WD0CSsome", ("tbeg", "topt", "d0cs", "tend"), (jsonize(tbeg), jsonize_option<token>(topt), jsonize_list<d0ecl>(d0cs), jsonize(tend)))
) (* end of [jsonize_wd0eclseq] *)


implement jsonize_val<d0exp> = jsonize_d0exp

implement
jsonize_v0aldecl
  (x0) = let
//
val+V0ALDECL(rcd) = x0
//
in
  (* jsonify("V0ALDECL@{", "pat=", rcd.pat, ", teq=", rcd.teq, ", def=", rcd.def, ", wtp=", rcd.wtp, "}") *)
  jsonify("V0ALDECL@{", ("pat", "teq", "def", "wtp"),
    (jsonize(rcd.pat), jsonize_option<token>(rcd.teq), jsonize_option<d0exp>(rcd.def), jsonize(rcd.wtp)))
end // end of [jsonize_v0aldecl]


implement jsonize_val<i0dnt> = jsonize_i0dnt
implement jsonize_val<s0exp> = jsonize_s0exp

implement
jsonize_v0ardecl
  (x0) = let
//
val+V0ARDECL(rcd) = x0
//
in
  jsonify("V0ARDECL", ("nam", "wth", "res", "ini"),
  (jsonize(rcd.nam), jsonize_option<i0dnt>(rcd.wth), jsonize_option<s0exp>(rcd.res), jsonize(rcd.ini)))
end // end of [jsonize_v0ardecl]


implement jsonize_val<f0arg> = jsonize_f0arg

implement
jsonize_f0undecl
  (x0) = let
//
val+F0UNDECL(rcd) = x0
//
in
  jsonify("F0UNDECL", ("nam", "arg", "res", "teq", "def", "wtp"),
    (jsonize(rcd.nam), jsonize_list<f0arg>(rcd.arg), jsonize(rcd.res), jsonize_option<token>(rcd.teq), jsonize_option<d0exp>(rcd.def), jsonize(rcd.wtp)))
end // end of [jsonize_f0undecl]


implement jsonize_val<d0arg> = jsonize_d0arg

implement
jsonize_d0cstdecl
  (x0) = let
//
val+D0CSTDECL(rcd) = x0
//
in
  jsonify(
    "D0CSTDECL", ("nam", "arg", "res", "def"),
    (
      jsonize(rcd.nam),
      jsonize_list<d0arg>(rcd.arg),
      jsonize(rcd.res),
      jsonize(rcd.def)
    )
  )
end // end of [jsonize_d0cstdecl]
