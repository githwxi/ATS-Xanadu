#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
(*
#staload "{$XATS}/SATS/dynexp0.sats"
#staload "{$XATS}/SATS/staexp0.sats"
*)
#staload "{$XATS}/SATS/dynexp1.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/label0.sats"


implement jsonize_val<d1exp>(x) = jsonize_d1exp(x)
implement jsonize_val<d1ecl>(x) = jsonize_d1ecl(x)


implement
jsonize_d1exp
  (x0) = labval2(jsonize("d1exp"), res) where
val res =
(
case+
x0.node() of
| D1Eid(tok) =>
  (* labval2(jsonize("D1Eid"), jsonize(tok)) // tok, ")") *)
  jsonify("D1Eid", "tok", rst) where
    val rst = jsonize(tok)
  end
//
| D1Eint(tok) =>
  (* labval2(jsonize("D1Eint"), jsonize(tok)) // tok, ")") *)
  jsonify("D1Eint", "tok", rst) where
    val rst = jsonize(tok)
  end
| D1Echr(tok) =>
  (* labval2(jsonize("D1Echr"), jsonize(tok)) // tok, ")") *)
  jsonify("D1Echr", "tok", rst) where
    val rst = jsonize(tok)
  end
| D1Eflt(tok) =>
  (* labval2(jsonize("D1Eflt"), jsonize(tok)) // tok, ")") *)
  jsonify("D1Eflt", "tok", rst) where
    val rst = jsonize(tok)
  end
| D1Estr(tok) =>
  (* labval2(jsonize("D1Estr"), jsonize(tok)) // tok, ")") *)
  jsonify("D1Estr", "tok", rst) where
    val rst = jsonize(tok)
  end
//
| D1Eapp() =>
  jsonify("D1Eapp")
//
| D1Ebs0() =>
  jsonify("D1Ebs0")
| D1Ebs1(d1e) =>
(*
  labval2(jsonize("D1Ebs1"), jsonize(d1e))
  (* where val _ = $showtype(d1e) end *)
*)
  jsonify("D1Ebs1", "d1e", rst) where
    val jd1e = jsonize(d1e)
    val rst = jd1e
  end
//
| D1Eapp1(d1e0, d1e1) =>
(*
  labval2(jsonize("D1Eapp1"), lst) // d1e0, "; ", d1e1, ")")
  where
    val j_d1e0 = jsonize(d1e0)
    val j_d1e1 = jsonize(d1e1)
    val lst = JSONlist(list_cons(j_d1e0, list_sing(j_d1e1)))
  end
  (* where val _ = $showtype(d1e1) end *)
*)
  jsonify("D1Eapp1", ("d1e0", "d1e1"), rst) where
    val jd1e0 = jsonize(d1e0)
    val jd1e1 = jsonize(d1e1)
    val rst = (jd1e0, jd1e1)
  end

| D1Eapp2(d1e0, d1e1, d1e2) =>
(*
  labval2(jsonize("D1Eapp2"), lst) // d1e0, "; ", d1e1, "; ", d1e2, ")")
  where
    val j_d1e0 = jsonize(d1e0)
    val j_d1e1 = jsonize(d1e1)
    val j_d1e2 = jsonize(d1e2)
    val lst = list_cons(j_d1e0, list_cons(j_d1e1, list_sing(j_d1e2)))
    val lst = JSONlist(lst)
  end
*)
  jsonify("D1Eapp2", ("d1e0", "d1e1", "d1e2"), rst) where
    val jd1e0 = jsonize(d1e0)
    val jd1e1 = jsonize(d1e1)
    val jd1e2 = jsonize(d1e2)
    val rst = (jd1e0, jd1e1, jd1e2)
  end

//
| D1Esqarg(s1es) =>
  (* labval2(jsonize("D1Esqarg"), jnul()) // s1es, ")") *)
  jsonify("D1Esqarg", "s1es", rst) where
    (* val jd1es = jsonize_list<s1exp>(s1es) *)
    val rst = jstr("...")
  end
| D1Etqarg(s1es) =>
  (* labval2(jsonize("D1Etqarg"), jnul()) // s1es, ")") *)
  jsonify("D1Etqarg", "s1es", rst) where
    (* val jd1es = jsonize_list<s1exp>(s1es) *)
    val rst = jstr("...")
  end
//
| D1Elist(d1es) =>
(*
  labval2(jsonize("D1Elist1"), jd1es) // d1es, ")")
  where
    val jd1es = jsonize_list<d1exp>(d1es)
    (* val jd1es = jsonize(d1es) *)
  end
*)
  jsonify("D1Elist", "d1es1", rst) where
    val jd1es = jsonize_list<d1exp>(d1es)
    val rst = jd1es
  end

| D1Elist(d1es1, d1es2) =>
(*
  labval2(jsonize("D1Elist2"), lst) // d1es1, "; ", d1es2, ")")
  where
    val jd1es1 = jsonize_list<d1exp>(d1es1)
    val jd1es2 = jsonize_list<d1exp>(d1es2)
    (* val jd1es1 = jsonize(d1es1) *)
    (* val jd1es2 = jsonize(d1es2) *)
    val lst = JSONlist($list{jsonval}(jd1es1,jd1es2))
  end
*)
  jsonify("D1Elist", ("d1es1", "d1es2"), rst) where
    val jd1es1 = jsonize_list<d1exp>(d1es1)
    val jd1es2 = jsonize_list<d1exp>(d1es2)
    val rst = (jd1es1, jd1es2)
  end
//
| D1Eseqn(d1es1, d1es2) =>
(*
  labval2(jsonize("D1Eseqn"), con)
  where
    val jd1es1 = jsonize_list<d1exp>(d1es1)
    val jd1es2 = jsonize_list<d1exp>(d1es2)
    (* val jd1es1 = jsonize(d1es1) *)
    (* val jd1es2 = jsonize(d1es2) *)
    val con = jsonval_labval2("d1es1", jd1es1, "d1es2", jd1es2)
    (* val lst = JSONlist($list{jsonval}(jd1es1,jd1es2)) *)
  end
*)
  jsonify("D1Eseqn", ("d1es1", "d1es2"), rst) where
    val jd1es1 = jsonize_list<d1exp>(d1es1)
    val jd1es2 = jsonize_list<d1exp>(d1es2)
    val rst = (jd1es1, jd1es2)
  end

//
| D1Etuple(tok, d1es) =>
  (* labval2(jsonize("D1Etuple"), con) *)
  (* where *)
  (*   val jd1es = jsonize_list<d1exp>(d1es) *)
  (*   (* val jd1es = jsonize(d1es) *) *)
  (*   val con = jsonval_labval2("tok", jsonize(tok), "d1es", jd1es) *)
  (* end *)
  jsonify("D1Etuple", ("tok", "d1es"), rst) where
    val jtok = jsonize(tok)
    val jd1es = jsonize_list<d1exp>(d1es)
    val rst = (jtok, jd1es)
  end

| D1Etuple(tok, d1es1, d1es2) =>
  (* labval2(jsonize("D1Etuple"), jnul()) // tok, "; ", d1es1, "; ", d1es2, ")") *)
  jsonify("D1Etuple", ("tok", "d1es1", "d1es2"), rst)
  where
    val jtok = jsonize(tok)
    val jd1es1 = jsonize_list<d1exp>(d1es1)
    val jd1es2 = jsonize_list<d1exp>(d1es2)
    (* val jd1es1 = jsonize(d1es1) *)
    (* val jd1es2 = jsonize(d1es2) *)
    (* val con = jsonval_labval3("tok", jtok, "d1es1", jd1es1, "d1es2", jd1es2) *)
    val rst = (jtok, jd1es1, jd1es2)
  end

//
| D1Ebrack(d1es) =>
  (* labval2(jsonize("D1Ebrack"), jnul()) // d1es, ")") *)
  (* where *)
  (*   val jd1es = jsonize_list<d1exp>(d1es) *)
  (*   (* val jd1es = jsonize(d1es) *) *)
  (*   val con = jsonval_labval1("d1es", jd1es) *)
  (* end *)
  jsonify("D1Ebrack", "d1es", rst) where
    val rst = jsonize_list<d1exp>(d1es)
  end

| D1Edtsel(lab1, arg2) =>
  (* labval2(jsonize("D1Edtsel"), rst) // lab1, "; ", arg2, ")") *)
  (* where *)
  (* (* val _ = $showtype(arg2) *) *)
  (* (* option_t0ype_bool_type(d1exp_tbox, b 15960): type *) *)
  (*   val rst = jsonval_labval2("lab1", jsonize(lab1), "arg2", jstr("...")) *)
  (* end *)
  jsonify("D1Edtsel", ("lab1", "arg2"), rst) where
    val rst = (jsonize(lab1), jstr("..."))
  end


//
| D1Elet(d1cs, d1es) =>
  jsonify("D1Elet", ("d1cs", "d1es"), json)
  (* labval2(jsonize("D1Elet"), jnul()) // d1cs, "; ", d1es, ")") *)
  (* where val _ = $showtype(d1es) end // list d1ecl, list d1exp *)
  where
    val jd1cs = jsonize_list<d1ecl>(d1cs)
    val jd1es = jsonize_list<d1exp>(d1es)
    val json = (jd1cs, jd1es)
  (* val rst = jsonval_labval2("d1cs", jd1cs, "d1es", jd1es) *)
  end
//
| D1Ewhere(d1e1, d1cs) =>
  (* labval2(jsonize("D1Ewhere"), jnul()) // d1e1, "; ", d1cs, ")") *)
  jsonify("D1Ewhere", ("d1e1", "d1cs"), rst) where
    val jd1e1 = jsonize(d1e1)
    val jd1cs = jsonize_list<d1ecl>(d1cs)
    val rst = (jd1e1, jd1cs)
  end
//
| D1Eif0(d1e1, d1e2, opt3) =>
  (* labval2(jsonize("D1Eif0"), jnul()) // d1e1, "; ", d1e2, "; ", opt3, ")") *)
  jsonify("D1Eif0", ("d1e1", "d1e2", "opt3"), rst) where
    val jd1e1 = jsonize(d1e1)
    val jd1e2 = jsonize(d1e1)
    val jopt3 = jstr("...")
    val rst = (jd1e1, jd1e2, jopt3)
  end
//
| D1Ecase(knd, d1e1, dcls) =>
  (* labval2(jsonize("D1Ecase"), jnul()) // knd, "; ", d1e1, "; ", dcls , ")") *)
  jsonify("D1Ecase", ("knd", "d1e1", "dcls"), rst) where
    val jknd = jsonize(knd)
    val jd1e1 = jsonize(d1e1)
    val jdcls = jstr("...") // list(d1clau)
    val rst = (jknd, jd1e1, jdcls)
  end
//
| D1Elam
  (knd, farg, tres, arrw, body) =>
  (* labval2(jsonize("D1Elam"), jnul()) // knd, "; ", farg, "; ", tres, "; ", arrw, "; ", body, ")") *)
  jsonify("D1Elam", ("knd", "farg", "tres", "arrw", "body"), rst) where
    val jknd = jsonize(knd)
    val jfarg = jnul()
    val jtres = jnul()
    val jarrw = jnul()
    val jbody = jnul()
    val rst = (jknd, jfarg, jtres, jarrw, jbody)
  end

| D1Efix
  (knd, fid, farg, tres, arrw, body) =>
  (* labval2(jsonize("D1Efix"), jnul()) // knd, "; ", fid, "; ", farg, "; ", tres, "; ", arrw, "; ", body, ")") *)
  jsonify("D1Efix", ("knd", "fid", "farg", "tres", "arrw", "body"), rst) where
    val jknd = jsonize(knd)
    val jfid = jnul()
    val jfarg = jnul()
    val jtres = jnul()
    val jarrw = jnul()
    val jbody = jnul()
    val rst = (jknd, jfid, jfarg, jtres, jarrw, jbody)
  end

//
| D1Eanno(d1e1, s1e2) =>
  (
    (* labval2(jsonize("D1Eanno"), jnul()) // d1e1, "; ", s1e2, ")") *)
    jsonify("D1Eanno", ("d1e1", "s1e2"), rst) where
      val js1e2 = jstr("...")
      val rst = (jsonize(d1e1), js1e2)
    end
  )
//
| D1Equal(tok1, d1e2) =>
  (
    (* labval2(jsonize("D1Equal"), jnul()) // tok1, "; ", d1e2, ")") *)
    jsonify("D1Equal", ("tok1", "d1e2"), rst) where
      val rst = (jsonize(tok1), jsonize(d1e2))
    end

  )
//
| D1Enone((*void*)) => jsonize("D1Enone") // ")")
//
) (* jsonize_d1exp *)
end


implement
jsonize_d1ecl
  (x0) = jnul()
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
