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



implement jsonize_val<d1exp> = jsonize_d1exp
implement jsonize_val<d1ecl> = jsonize_d1ecl

implement jsonize_val<s1exp> = jsonize_s1exp

implement
jsonize_d1exp
  (x0) = labval2(jsonize("d1exp"), res) where
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
  jsonify("D1Edtsel", ("lab1", "arg2"), (jsonize(lab1), jstr("...")))
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
    (jsonize(d1e1), jsonize(d1e2), jsonize("..."))
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
    (jsonize(knd), jsonize("..."), jsonize("..."), jsonize("..."), jsonize("..."))
  )

| D1Efix
  (knd, fid, farg, tres, arrw, body) =>
  jsonify(
    "D1Efix", ("knd", "fid", "farg", "tres", "arrw", "body"), (
      jsonize(knd),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("...")
    )
  )
//
| D1Erecord(tok, ld1es) =>
  jsonify (
    "D1Erecord", ("tok", "ld1es"),
    (jsonize(tok), jsonize("..."))
  )
| D1Erecord(tok, ld1es1, ld1es2) =>
  jsonify (
    "D1Erecord", ("tok", "ld1es1", "ld1es2"),
    (jsonize(tok), jsonize("..."), jsonize("..."))
  )
| D1Eanno(d1e1, s1e2) =>
  jsonify("D1Eanno", ("d1e1", "s1e2"), (jsonize(d1e1), jsonize("...")))
//
| D1Equal(tok1, d1e2) =>
  jsonify("D1Equal", ("tok1", "d1e2"), (jsonize(tok1), jsonize(d1e2)))
//
| D1Enone((*void*)) => jsonize("D1Enone") // ")")
//
) (* jsonize_d1exp *)
}


implement
jsonize_d1ecl
  (x0) = jsonize("...")
(*
(
case+ x0.node() of
//
| D1Cnone() =>
  fprint!(out, "D1Cnone(", ")")
| D1Cnone(d0c) =>
  fprint!(out, "D1Cnone(", d0c, ")")
//
| D1Cstatic(knd, d1c) =>
  fprint!
  (out, "D1Cstatic(", knd, "; ", d1c, ")")
//
| D1Cextern(knd, d1c) =>
  fprint!
  (out, "D1Cextern(", knd, "; ", d1c, ")")
//
| D1Cdefine
  (tok, sym, arg, def) =>
  fprint!
  ( out
  , "D1Cdefine("
  , tok, "; ", sym, "; ", arg, "; ", def, ")")
| D1Cmacdef
  (tok, sym, arg, def) =>
  fprint!
  ( out
  , "D1Cmacdef("
  , tok, "; ", sym, "; ", arg, "; ", def, ")")
//
| D1Cinclude
  (tok, src, knd, opt, body) =>
  (
  fprint!
  ( out
  , "D1Cinclude("
  , tok, "; "
  , src, "; " // src: d1exp
  , knd, "; ", opt, "; ", body, ")")
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
  ( tok, src
  , knd, opt, flag, body) =>
  (
  fprint!
  ( out
  , "D1Cstaload("
  , tok, "; "
  , src, "; " // src: d1exp
  , knd, "; " // knd: stadyn
  , opt, "; ", flag, "; ", body, ")")
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
  fprint!
  (out, "D1Cabssort(", tok, "; ", tid, ")")
//
| D1Cstacst0
  (tok, sid, tmas, s0t) =>
  fprint!
  ( out
  , "D1Cstacst0("
  , tok, "; ", sid, "; ", tmas, "; ", s0t, ")")
//
| D1Csortdef
  (knd, tok, def) =>
  fprint!
  ( out
  , "D1Csortdef(", knd, "; ", tok, "; ", def, ")")
//
| D1Csexpdef
  ( knd, sid
  , arg, res, def) =>
  fprint!
  ( out, "D1Csexpdef("
  , knd, "; ", sid, "; ", arg, "; ", res, "; ", def, ")")
//
| D1Cabstype
  (knd, sid, arg, res, def) =>
  fprint!
  ( out, "D1Cabstype("
  , knd, "; ", sid, "; ", arg, "; ", res, "; ", def, ")")
//
| D1Cabsimpl
  (tok, sqid, smas, res0, def1) =>
  fprint!
  ( out, "D1Cabsimpl("
  , tok, "; ", sqid, "; ", smas, "; ", res0, "; ", def1, ")")
//
| D1Cvaldecl
  (tok, mods, d1cs) =>
  fprint!
  ( out
  , "D1Cvaldecl(", tok, "; ", mods, "; ", d1cs, ")")
//
| D1Cvardecl(tok, d1cs) =>
  (
    fprint!(out, "D1Cvardecl(", tok, "; ", d1cs, ")")
  )
//
| D1Cfundecl
  (tok, mopt, tqas, d1cs) =>
  fprint!
  ( out
  , "D1Cfundecl(", tok, "; ", mopt, "; ", tqas, "; ", d1cs, ")")
//
| D1Cimpdecl
  ( tok, mopt, sqas, tqas
  , dqid, tias, f1as, res0, teq1, d1e2) =>
  fprint!
  ( out
  , "D1Cimpdecl("
  , tok, "; ", mopt, "; ", sqas, "; ", tqas, "; "
  , dqid, "; ", tias, "; ", f1as, "; ", res0, "; ", teq1, "; ", d1e2, ")")
//
| D1Csymload
  (knd, sym, dqid, tint) =>
  fprint!
  ( out, "D1Csymload("
  , knd, "; ", sym, "; ", dqid, "; ", tint, ")")
//
| D1Cdatasort
  (knd, d1tsts) =>
  fprint!
  ( out, "D1Cdatasort(", knd, "; ", d1tsts, ")" )
//
| D1Cdatatype
  (knd, d1typs, wopt) =>
  fprint!
  ( out
  , "D1Cdatatype(", knd, "; ", d1typs, "; ", wopt, ")")
//
| D1Cdynconst
  (tok, tqas, d1cs) =>
  fprint!
  (out, "D1Cdynconst(", tok, "; ", tqas, "; ", d1cs, ")")
//
| D1Clocal
  (d1cs_head, d1cs_body) =>
  fprint!
  (out, "D1Clocal(", d1cs_head, "; ", d1cs_body, ")")
//
| D1Ctokerr(d0c0) => fprint!(out, "D1Ctokerr(", d0c0, ")")
//
(*
| _(*rest-of-d1ecl*) =>
    fprint!(out, "fprint_d1ecl: D1C...: not-yet-implemented")
*)
//
) (* end of [jsonize_d1ecl] *)
*)


local

implement
jsonize_val<d1pat> = jsonize_d1pat

in (* in-of-local *)

implement
jsonize_d1pat
  (x0) =
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
  jsonify("D1Psarg", "s1as", jsonize("..."))
//
| D1Plist(d1ps) =>
  jsonify("D1Plist1", "d1ps", jsonize("..."))
| D1Plist(d1ps1, d1ps2) =>
  jsonify("D1Plist2", ("d1ps1", "d1ps2"), (jsonize("..."), jsonize("...")))
//
| D1Ptuple(tok, d1ps) =>
  jsonify("D1Ptuple1", ("tok", "d1ps"), (jsonize(tok), jsonize("...")))
| D1Ptuple(tok, d1ps1, d1ps2) =>
  jsonify("D1Ptuple2", ("tok", "d1ps1", "d1ps2"), (jsonize(tok), jsonize("..."), jsonize("...")))
//
| D1Precord(tok, ld1ps) =>
  jsonify("D1Precord1", ("tok", "ld1ps"), (jsonize(tok), jsonize("...")))
| D1Precord(tok, ld1ps1, ld1ps2) =>
  jsonify("D1Precord2", ("tok", "ld1ps1", "ld1ps2"), (jsonize(tok), jsonize("..."), jsonize("...")))
//
| D1Panno(d1p, s1e) =>
  jsonify("D1Panno", ("d1p", "s1e"), (jsonize(d1p), jsonize(s1e)))
//
| D1Pnone((*void*)) =>
  jsonify("D1Pnone")
//
) (* end of [fprint_d1pat] *)

end // end of [local]


implement jsonize_val<s1exp> = jsonize_s1exp

implement
jsonize_f1unarrow
  (x0) =
(
case+ x0 of
| F1UNARROWdflt() =>
  jsonify("F1UNARROWdflt")
| F1UNARROWlist(s1es) =>
  jsonify("F1UNARROWlist", "s1es", jsonize_list<s1exp>(s1es))
) (* end of [fprint_f1unarrow] *)
