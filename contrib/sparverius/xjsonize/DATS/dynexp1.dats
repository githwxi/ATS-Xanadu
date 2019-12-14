#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

(*
#include "./../HATS/libxatsopt.hats"
*)

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"

#staload "{$XATS}/SATS/staexp0.sats"
#staload "{$XATS}/SATS/dynexp0.sats"

#staload "{$XATS}/SATS/staexp1.sats"
#staload "{$XATS}/SATS/dynexp1.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"


implement
jsonize_val<token> = jsonize_token
implement
jsonize_val<sort1> = jsonize_sort1


implement
jsonize_q1arg
  (x0) =
node("q1arg", res) where
val res =
(
//
case+ x0.node() of
(*
| Q1ARGnone(tok) =>
  jsonify("Q1ARGnone", "tok", jsonize(tok))
*)
| Q1ARGsome(tok, opt) =>
  jsonify("Q1ARGsome", ("tok", "opt"),
    (
      jsonize(tok),
      jsonize_option<sort1>(opt)
    )
  )
//
) (* end of [jsonize_q1arg] *)
end

implement
jsonize_a1typ
  (x0) =
node("a1typ", res) where
val res =
(
//
case+ x0.node() of
| A1TYPsome(s1e, opt) =>
  jsonify("A1TYPsome", ("s1e", "opt"),
    (
      jsonize(s1e),
      jsonize_option<token>(opt)
    )
  )
//
) (* end of [jsonize_a1typ] *)
end


local
//
implement
jsonize_val<a1typ> = jsonize_a1typ

fun
jsonize_a1typlstopt
(opt: a1typlstopt): jsonval =
(
case+ opt of
| None() => jsonify("None")
| Some(a1ts) => jsonval_labval1("Some", jsonize_list<a1typ>(a1ts))
)
//
overload jsonize with jsonize_a1typlstopt of 100
//

implement
jsonize_val<s1qua> = jsonize_s1qua

in (* in-of-local *)

implement
jsonize_d1arg
  (x0) =
node("d1arg", res) where
val res =
(
//
case+ x0.node() of
//
| D1ARGsome_sta(s1qs) =>
  jsonify("D1ARGsome_sta", "s1qs", jsonize_list<s1qua>(s1qs))
//
| D1ARGsome_dyn1(tok) =>
  jsonify("D1ARGsome_dyn1", "tok", jsonize(tok))
| D1ARGsome_dyn2(arg0, opt1) =>
  jsonify("D1ARGsome_dyn2", ("arg0", "opt1"),
    (
      jsonize_list<a1typ>(arg0),
      jsonize(opt1)
    )
  )
//
) (* end of [jsonize_d1arg] *)
end
end // end of [local]


implement
jsonize_val<s1qua> = jsonize_s1qua
implement
jsonize_val<s1exp> = jsonize_s1exp
implement
jsonize_val<q1arg> = jsonize_q1arg


implement
jsonize_f1arg
  (x0) =
node("f1arg", res) where
val res =
(
//
case+
x0.node() of
(*
| F1ARGnone(tok) =>
  jsonify("F1ARGnone", "tok", jsonize(tok))
*)
| F1ARGsome_dyn(d1p0) =>
  jsonify("F1ARGsome_dyn", "d1p0", jsonize(d1p0))
| F1ARGsome_sta(s1qs) =>
  jsonify("F1ARGsome_sta", "s1qs", jsonize_list<s1qua>(s1qs))
| F1ARGsome_met(s1es) =>
  jsonify("F1ARGsome_met", "s1es", jsonize_list<s1exp>(s1es))
//
) (* end of [jsonize_f1arg] *)
end

(* ****** ****** *)

implement
jsonize_sq1arg
  (x0) =
node("sq1arg", res) where
val res =
(
//
case+
x0.node() of
| SQ1ARGnone(tok) =>
  jsonify("SQ1ARGnone", "tok", jsonize(tok))
| SQ1ARGsome(q1as) =>
  jsonify("SQ1ARGsome", "q1as", jsonize_list<q1arg>(q1as))
//
) (* end of [jsonize_sq1arg] *)
end

(* ****** ****** *)

implement
jsonize_ti1arg
  (x0) =
node("ti1arg", res) where
val res =
(
//
case+
x0.node() of
| TI1ARGnone(tok) =>
  jsonify("TI1ARGnone", "tok", jsonize(tok))
| TI1ARGsome(s1es) =>
  jsonify("TI1ARGsome", "s1es", jsonize_list<s1exp>(s1es))
//
) (* end of [jsonize_ti1arg] *)
end

(* ****** ****** *)

implement
jsonize_tq1arg
  (x0) =
node("tq1arg", res) where
val res =
(
//
case+
x0.node() of
| TQ1ARGnone(tok) =>
  jsonify("TQ1ARGnone", "tok", jsonize(tok))
| TQ1ARGsome(q1as) =>
  jsonify("TQ1ARGsome", "q1as", jsonize_list<q1arg>(q1as))
//
) (* end of [jsonize_tq1arg] *)
end


implement jsonize_val<d1exp> = jsonize_d1exp
implement jsonize_val<d1ecl> = jsonize_d1ecl
implement jsonize_val<f1arg> = jsonize_f1arg
implement jsonize_val<s1exp> = jsonize_s1exp

implement
jsonize_d1exp
  (x0) = //labval2(jsonize("d1exp"), res) where
(* res where *)
node("d1exp", res) where
{
val res =
(
case+ x0.node() of
| D1Eid(tok) =>
  jsonify("D1Eid", "tok", jsonize(tok))
//
| D1Eint(tok) =>
  jsonify("D1Eint", "tok", jsonize(tok))
| D1Echr(tok) =>
  jsonify("D1Echr", "tok", jsonize(tok))
| D1Eflt(tok) =>
  jsonify("D1Eflt", "tok", jsonize(tok))
| D1Estr(tok) =>
  jsonify("D1Estr", "tok", jsonize(tok))
//
| D1Eapp() =>
  jsonify("D1Eapp")
//
| D1Ebs0() =>
  jsonify("D1Ebs0")
| D1Ebs1(d1e) =>
  jsonify("D1Ebs1", "d1e", jsonize(d1e))
//
| D1Eapp1(d1e0, d1e1) =>
  jsonify("D1Eapp1", ("d1e0", "d1e1"), (jsonize(d1e0), jsonize(d1e1)))

| D1Eapp2(d1e0, d1e1, d1e2) =>
  jsonify("D1Eapp2", ("d1e0", "d1e1", "d1e2"),
    (jsonize(d1e0), jsonize(d1e1), jsonize(d1e2))
  )
| D1Esqarg(s1es) =>
  jsonify("D1Esqarg", "s1es", jsonize_list<s1exp>(s1es))
| D1Etqarg(s1es) =>
  jsonify("D1Etqarg", "s1es", jsonize_list<s1exp>(s1es))
//
| D1Elist(d1es) =>
  jsonify("D1Elist", "d1es1", jsonize_list<d1exp>(d1es))
| D1Elist(d1es1, d1es2) =>
  jsonify("D1Elist", ("d1es1", "d1es2"),
    (jsonize_list<d1exp>(d1es1), jsonize_list<d1exp>(d1es2))
  )
//
| D1Eseqn(d1es1, d1es2) =>
  jsonify("D1Eseqn", ("d1es1", "d1es2"),
    (jsonize_list<d1exp>(d1es1), jsonize_list<d1exp>(d1es2))
  )
//
| D1Etuple(tok, d1es) =>
  jsonify("D1Etuple", ("tok", "d1es"), (jsonize(tok), jsonize_list<d1exp>(d1es)))

| D1Etuple(tok, d1es1, d1es2) =>
  jsonify("D1Etuple", ("tok", "d1es1", "d1es2"),
    (jsonize(tok), jsonize_list<d1exp>(d1es1), jsonize_list<d1exp>(d1es2))
  )
//
| D1Ebrack(d1es) =>
  jsonify("D1Ebrack", "d1es", jsonize_list<d1exp>(d1es))

| D1Edtsel(lab1, arg2) =>
  jsonify("D1Edtsel", ("lab1", "arg2"), (jsonize(lab1), jsonize_option<d1exp>(arg2)))
//
| D1Elet(d1cs, d1es) =>
  jsonify("D1Elet", ("d1cs", "d1es"),
    (jsonize_list<d1ecl>(d1cs), jsonize_list<d1exp>(d1es))
  )
//
| D1Ewhere(d1e1, d1cs) =>
  jsonify("D1Ewhere", ("d1e1", "d1cs"),
    (jsonize(d1e1), jsonize_list<d1ecl>(d1cs))
  )
//
| D1Eif0(d1e1, d1e2, opt3) =>
  jsonify("D1Eif0", ("d1e1", "d1e2", "opt3"),
    (jsonize(d1e1), jsonize(d1e2), jsonize_option<d1exp>(opt3))
  )
//
| D1Ecase(knd, d1e1, dcls) =>
  jsonify("D1Ecase", ("knd", "d1e1", "dcls"),
    (jsonize(knd), jsonize(d1e1), jsonize("..."))
  )
//
| D1Elam
  (knd, farg, tres, arrw, body) =>
  jsonify("D1Elam", ("knd", "farg", "tres", "arrw", "body"),
    (
      jsonize(knd),
      jsonize_list<f1arg>(farg),
      jsonize(tres),
      jsonize(arrw),
      jsonize(body)
    )
  )

| D1Efix
  (knd, fid, farg, tres, arrw, body) =>
  jsonify(
    "D1Efix", ("knd", "fid", "farg", "tres", "arrw", "body"), (
      jsonize(knd),
      jsonize(fid),
      jsonize_list<f1arg>(farg),
      jsonize(tres),
      jsonize(arrw),
      jsonize(body)
    )
  )
//
| D1Erecord(tok, ld1es) =>
  jsonify (
    "D1Erecord", ("tok", "ld1es"),
    (jsonize(tok), jsonize("...")) // jsonize_list<dl0abeled(d1exp)>(ld1es)
  )
| D1Erecord(tok, ld1es1, ld1es2) =>
  jsonify (
    "D1Erecord", ("tok", "ld1es1", "ld1es2"),
    (jsonize(tok), jsonize("..."), jsonize("..."))
  )
| D1Eanno(d1e1, s1e2) =>
  jsonify("D1Eanno", ("d1e1", "s1e2"), (jsonize(d1e1), jsonize(s1e2)))
//
| D1Equal(tok1, d1e2) =>
  jsonify("D1Equal", ("tok1", "d1e2"), (jsonize(tok1), jsonize(d1e2)))
//
| D1Enone((*void*)) => jsonize("D1Enone") // ")")
//
) (* jsonize_d1exp *)
}


implement jsonize_val<d1ecl> = jsonize_d1ecl
implement jsonize_val<d1exp> = jsonize_d1exp
implement jsonize_val<v1aldecl> = jsonize_v1aldecl
implement jsonize_val<v1ardecl> = jsonize_v1ardecl
implement jsonize_val<g1exp> = jsonize_g1exp

implement jsonize_val<f1undecl> = jsonize_f1undecl
implement jsonize_val<f1arg> = jsonize_f1arg
implement jsonize_val<ti1arg> = jsonize_ti1arg
implement jsonize_val<tq1arg> = jsonize_tq1arg
implement jsonize_val<sq1arg> = jsonize_sq1arg

implement jsonize_val<g1marg> = jsonize_g1marg
implement jsonize_val<s1marg> = jsonize_s1marg
implement jsonize_val<t1marg> = jsonize_t1marg
implement jsonize_val<t0int> = jsonize_t0int

implement jsonize_val<d1atype> = jsonize_d1atype
implement jsonize_val<d1tsort> = jsonize_d1tsort
implement jsonize_val<d1cstdecl> = jsonize_d1cstdecl


implement
jsonize_d1ecl
  (x0) =
node("d1ecl", res) where
val res =
(
case+ x0.node() of
//
| D1Cnone() =>
  jsonify("D1Cnone")
| D1Cnone(d0c) =>
  jsonify("D1Cnone", "d0c", jsonize(d0c))
//
| D1Cstatic(knd, d1c) =>
  jsonify("D1Cstatic", ("knd", "d1c"), (jsonize(knd), jsonize(d1c)))
//
| D1Cextern(knd, d1c) =>
  jsonify("D1Cextern", ("knd", "d1c"), (jsonize(knd), jsonize(d1c)))
//
| D1Cdefine
  (tok, sym, arg, def) =>
  jsonify("D1Cdefine", ("tok", "sym", "arg", "def"),
    (
      jsonize(tok),
      jsonize(sym),
      jsonize_list<g1marg>(arg),
      jsonize_option<g1exp>(def)
    )
  )
| D1Cmacdef
  (tok, sym, arg, def) =>
  jsonify("D1Cmacdef", ("tok", "sym", "arg", "def"),
    (
      jsonize(tok),
      jsonize(sym),
      jsonize_list<g1marg>(arg),
      jsonize_option<d1exp>(def)
    )
  )
//
| D1Cinclude
  (tok, src, knd, opt, body) =>
  (
  jsonify("D1Cinclude", ("tok", "src", "knd", "opt", "body"),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize("..."),
      jsonize(body)
    )
  )
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d1cls>)"): string
  }
//
| D1Cstaload
  ( tok, src, knd, opt, flag, body) =>
  (
  jsonify("D1Cstaload",
    ("tok", "src", "knd", "opt", "flag", "body"),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize("..."),
      jsonize(flag),
      jsonize(body)
    )
  )
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d1cs>)") : string
  }
//
| D1Cabssort(tok, tid) =>
  jsonify("D1Cabssort", ("tok", "tid"), (jsonize(tok), jsonize(tid)))
//
| D1Cstacst0
  (tok, sid, tmas, s0t) =>
  jsonify("D1Cstacst0", ("tok", "sid", "tmas", "s0t"),
    (
      jsonize(tok),
      jsonize(sid),
      jsonize_list<t1marg>(tmas),
      jsonize(s0t)
    )
  )
//
| D1Csortdef
  (knd, tok, def) =>
  jsonify("D1Csortdef", ("knd", "tok", "def"),
    (jsonize(knd), jsonize(tok), jsonize(def))
  )
//
| D1Csexpdef
  ( knd, sid, arg, res, def) =>
  jsonify("D1Csexpdef", ("knd", "sid", "arg", "res", "def"),
    (
      jsonize(knd),
      jsonize(sid),
      jsonize_list<s1marg>(arg),
      jsonize_option<sort1>(res),
      jsonize(def)
    )
  )
//
| D1Cabstype
  (knd, sid, arg, res, def) =>
  jsonify("D1Cabstype", ("knd", "sid", "arg", "res", "def"),
    (
      jsonize(knd),
      jsonize(sid),
      jsonize_list<t1marg>(arg),
      jsonize_option<sort1>(res),
      jsonize(def)
    )
  )
//
| D1Cabsimpl
  (tok, sqid, smas, res0, def1) =>
  jsonify("D1Cabsimpl", ("tok", "sqid", "smas", "res0", "def1"),
    (jsonize(tok),
    jsonize(sqid),
    jsonize_list<s1marg>(smas),
    jsonize_option<sort1>(res0),
    jsonize(def1))
  )
//
| D1Cvaldecl
  (tok, mods, d1cs) =>
  jsonify("D1Cvaldecl", ("tok", "mods", "d1cs"),
    (
      jsonize(tok),
      jsonize(mods),
      jsonize_list<v1aldecl>(d1cs)
    )
  )
//
| D1Cvardecl(tok, mopt, d1cs) =>
  jsonify("D1Cvardecl", ("tok", "mopt", "d1cs"),
    (
      jsonize(tok),
      jsonize(mopt),
      jsonize_list<v1ardecl>(d1cs)
    )
  )
//
| D1Cfundecl
  (tok, mopt, tqas, d1cs) =>
  jsonify("D1Cfundecl", ("tok", "mopt", "tqas", "d1cs"),
    (
      jsonize(tok),
      jsonize(mopt),
      jsonize_list<tq1arg>(tqas),
      jsonize_list<f1undecl>(d1cs)
    )
  )
//
| D1Cimpdecl
  (tok, mopt, sqas, tqas, dqid, tias, f1as, res0, teq1, d1e2) =>
  jsonify("D1Cimpdecl",
    ("tok", "mopt", "sqas", "tqas", "dqid", "tias", "f1as", "res0", "teq1", "d1e2"),
    (
      jsonize(tok),
      jsonize(mopt),
      jsonize_list<sq1arg>(sqas),
      jsonize_list<tq1arg>(tqas),
      jsonize(dqid),
      jsonize_list<ti1arg>(tias),
      jsonize_list<f1arg>(f1as),
      jsonize(res0),
      jsonize(teq1),
      jsonize(d1e2)
    )
  )
//
| D1Csymload
  (knd, sym, dqid, tint) =>
  jsonify("D1Csymload", ("knd", "sym", "dqid", "tint"),
    (jsonize(knd), jsonize(sym), jsonize(dqid), jsonize_option<t0int>(tint))
  )
//
| D1Cdatasort
  (knd, d1tsts) =>
  jsonify("D1Cdatasort", ("knd", "d1tsts"),
    (
      jsonize(knd),
      jsonize_list<d1tsort>(d1tsts)
    )
  )
//
| D1Cdatatype
  (knd, d1typs, wopt) =>
  jsonify("D1Cdatatype", ("knd", "d1typs", "wopt"),
    (
      jsonize(knd),
      jsonize_list<d1atype>(d1typs),
      jsonize(wopt)
    )
  )
//
| D1Cdynconst
  (tok, tqas, d1cs) =>
  jsonify("D1Cdynconst", ("tok", "tqas", "d1cs"),
    (
      jsonize(tok),
      jsonize_list<tq1arg>(tqas),
      jsonize_list<d1cstdecl>(d1cs)
    )
  )
//
| D1Clocal
  (d1cs_head, d1cs_body) =>
  jsonify("D1Clocal", ("d1cs_head", "d1cs_body"),
    (
      jsonize_list<d1ecl>(d1cs_head),
      jsonize_list<d1ecl>(d1cs_body)
    )
  )
//
| D1Ctokerr(d0c0) =>
  jsonify("D1Ctokerr", "d0c0", jsonize(d0c0))
//
(*
| _(*rest-of-d1ecl*) =>
    jsonize!(out, "jsonize_d1ecl: D1C...: not-yet-implemented")
*)
//
) (* end of [jsonize_d1ecl] *)
end


local

implement
jsonize_val<d1pat> = jsonize_d1pat
implement
jsonize_val<s1arg> = jsonize_s1arg

in (* in-of-local *)

implement
jsonize_d1pat
  (x0) =
node("d1pat", res) where
val res =
(
case+
x0.node() of
| D1Pid(tok) =>
  jsonify("D1Pid", "tok", jsonize(tok))
//
| D1Pint(tok) =>
  jsonify("D1Pint", "tok", jsonize(tok))
| D1Pchr(tok) =>
  jsonify("D1Pchr", "tok", jsonize(tok))
| D1Pflt(tok) =>
  jsonify("D1Pflt", "tok", jsonize(tok))
| D1Pstr(tok) =>
  jsonify("D1Pstr", "tok", jsonize(tok))
//
| D1Papp() =>
  jsonify("D1Papp")
//
| D1Pbs0() =>
  jsonify("D1Pbs0")
| D1Pbs1(d1p) =>
  jsonify("D1Pbs1", "d1p", jsonize(d1p))
//
| D1Papp1(d1p0, d1p1) =>
  jsonify("D1Papps", ("d1p0", "d1p1"), (jsonize(d1p0), jsonize(d1p1)))
| D1Papp2(d1p0, d1p1, d1p2) =>
  jsonify("D1Papps", ("d1p0", "d1p1", "d1p2"), (jsonize(d1p0), jsonize(d1p1), jsonize(d1p2)))
//
| D1Psarg(s1as) =>
  jsonify("D1Psarg", "s1as", jsonize_list<s1arg>(s1as))
//
| D1Plist(d1ps) =>
  jsonify("D1Plist1", "d1ps", jsonize_list<d1pat>(d1ps))
| D1Plist(d1ps1, d1ps2) =>
  jsonify("D1Plist2", ("d1ps1", "d1ps2"), (jsonize_list<d1pat>(d1ps1), jsonize_list<d1pat>(d1ps2)))
//
| D1Ptuple(tok, d1ps) =>
  jsonify("D1Ptuple1", ("tok", "d1ps"), (jsonize(tok), jsonize_list<d1pat>(d1ps)))
| D1Ptuple(tok, d1ps1, d1ps2) =>
  jsonify("D1Ptuple2", ("tok", "d1ps1", "d1ps2"),
    (
      jsonize(tok),
      jsonize_list<d1pat>(d1ps1),
      jsonize_list<d1pat>(d1ps2)
    )
  )
//
| D1Precord(tok, ld1ps) =>
  jsonify("D1Precord1", ("tok", "ld1ps"),
    (jsonize(tok), jsonize("..."))
  )
| D1Precord(tok, ld1ps1, ld1ps2) =>
  jsonify("D1Precord2", ("tok", "ld1ps1", "ld1ps2"),
    (
      jsonize(tok),
      jsonize("..."),
      jsonize("...")
    )
  )
//
| D1Panno(d1p, s1e) =>
  jsonify("D1Panno", ("d1p", "s1e"), (jsonize(d1p), jsonize(s1e)))
//
| D1Pnone((*void*)) =>
  jsonify("D1Pnone")
//
) (* end of [jsonize_d1pat] *)
end

end // end of [local]


implement jsonize_val<s1exp> = jsonize_s1exp

implement
jsonize_f1unarrow
  (x0) =
node("f1unarrow", res) where
val res =
(
case+ x0 of
| F1UNARROWdflt() =>
  jsonify("F1UNARROWdflt")
| F1UNARROWlist(s1es) =>
  jsonify("F1UNARROWlist", "s1es", jsonize_list<s1exp>(s1es))
) (* end of [jsonize_f1unarrow] *)
end

implement
jsonize_teqd1expopt
  (x0) =
node("teqd1expopt", res) where
val res =
(
case+ x0 of
| TEQD1EXPnone() =>
  jsonify("TEQD1EXPnone")

| TEQD1EXPsome(tok, d1e) =>
  jsonify("TEQD1EXPsome", ("tok", "d1e"), (jsonize(tok), jsonize(d1e)))
)
end

implement
jsonize_wths1expopt
  (x0) =
node("wths1expopt", res) where
val res =
(
case+ x0 of
| WTHS1EXPnone() =>
  jsonify("WTHS1EXPnone")
| WTHS1EXPsome(tok, s1e) =>
  jsonify("WTHS1EXPsome", ("tok", "s1e"), (jsonize(tok), jsonize(s1e)))
)
end

implement
jsonize_d1gua
  (x0) =
node("d1gua", res) where
val res =
(
case+
x0.node() of
| D1GUAexp(d1e) =>
  jsonify("D1GUAexp", "d1e", jsonize(d1e))
| D1GUAmat(d1e, d1p) =>
  jsonify("D1GUAexp", ("d1e", "d1p"), (jsonize(d1e), jsonize(d1p)))
) (* end of [jsonize_d1gua] *)
end


implement
jsonize_d1clau
  (x0) =
node("d1clau", res) where
val res =
(
case+
x0.node() of
| D1CLAUgpat(d1gp) =>
  jsonify("D1CLAUgpat", "d1gp", jsonize(d1gp))
| D1CLAUclau(d1gp, d0e0) =>
  jsonify("D1CLAUclau", ("d1gp", "d0e0"), (jsonize(d1gp), jsonize(d0e0)))
) (* end of [jsonize_d1clau] *)
end

implement
jsonize_val<d1gua> = jsonize_d1gua

implement
jsonize_d1gpat
  (x0) =
node("d1gpat", res) where
val res =
(
case+
x0.node() of
| D1GPATpat(d1p) =>
  jsonify("D1GPATpat", "d1p", jsonize(d1p))
| D1GPATgua(d1p, d1gs) =>
  jsonify("D1GPATgua", ("d1p", "d1gs"), (jsonize(d1p), jsonize_list<d1gua>(d1gs)))
) (* end of [jsonize_d1gpat] *)
end

implement
jsonize_abstdf1
  (x0) =
node("abstdf1", res) where
val res =
(
case+ x0 of
| ABSTDF1some() =>
  jsonify("ABSTDF1some")
| ABSTDF1lteq(s0e) =>
  jsonify("ABSTDF1lteq", "s0e", jsonize(s0e))
| ABSTDF1eqeq(s0e) =>
  jsonify("ABSTDF1eqeq", "s0e", jsonize(s0e))
) (* end of [jsonize_abstdf1] *)
end

implement
jsonize_wd1eclseq
  (x0) =
node("wd1eclseq", res) where
val res =
(
case+ x0 of
| WD1CSnone() =>
  jsonify("WD1CSnone")
| WD1CSsome(d1cs) =>
  jsonify("WD1CSsome", "d1cs", jsonize_list<d1ecl>(d1cs))
) (* end of [jsonize_wd1eclseq] *)
end

implement
jsonize_v1aldecl
  (x0) = let
//
val+V1ALDECL(rcd) = x0
//
in
node("v1aldecl", res) where
val res =

  jsonify("V1ALDECL", ("pat", "def", "wtp"),
    (
      jsonize(rcd.pat),
      jsonize_option<d1exp>(rcd.def),
      jsonize(rcd.wtp)
    )
  )
end

end // end of [jsonize_v1aldecl]


implement
jsonize_v1ardecl
  (x0) = let
//
val+V1ARDECL(rcd) = x0
//
in
node("v1ardecl", res) where
val res =

  jsonify("V1ARDECL", ("nam", "wth", "res", "ini"),
    (
      jsonize(rcd.nam),
      jsonize_option<token>(rcd.wth),
      jsonize_option<s1exp>(rcd.res),
      jsonize(rcd.ini)
    )
  )
end

end // end of [jsonize_v1ardecl]


implement
jsonize_f1undecl
  (x0) = let
//
val+F1UNDECL(rcd) = x0
//
in
node("f1undecl", res) where
val res =
  jsonify("F1UNDECL", ("nam", "arg", "res", "def", "wtp"),
    (
      jsonize(rcd.nam),
      jsonize_list<f1arg>(rcd.arg),
      jsonize(rcd.res),
      jsonize_option<d1exp>(rcd.def),
      jsonize(rcd.wtp)
    )
  )
end
end // end of [jsonize_f1undecl]


implement jsonize_val<d1arg> = jsonize_d1arg

implement
jsonize_d1cstdecl
  (x0) = let
//
val+D1CSTDECL(rcd) = x0
//
in
node("d1cstdecl", res) where
val res =
  jsonify(
    "D1CSTDEC", ("nam", "arg", "res", "def"),
    (
      jsonize(rcd.nam),
      jsonize_list<d1arg>(rcd.arg),
      jsonize(rcd.res),
      jsonize(rcd.def)
    )
  )
end
end // end of [jsonize_d1cstdecl]
