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
#staload "{$XATS}/SATS/dynexp2.sats"
(* #staload "{$XATS}/SATS/staexp2.sats" *)

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/lexing.sats"
#staload D1 = "./../SATS/dynexp1.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/dynexp2.sats"


#staload "./../SATS/staexp2.sats"

#staload SYM_J = "./../SATS/symbol.sats"
#staload STM_J = "./../SATS/stamp0.sats"

overload jsonize with $D1.jsonize_d1exp
overload jsonize with $D1.jsonize_d1ecl

overload jsonize with $SYM_J.jsonize_symbol
overload jsonize with $STM_J.jsonize_stamp


implement
jsonize_val<d2con> = jsonize_d2con

implement
jsonize_d2con
  (x0) =
(
(*
  labval2(nd,vl) where
  {
    val nd = jstr("d2con")
    val sym = $SYM_J.jsonize_symbol(x0.sym())
    val stamp = $STM_J.jsonize_stamp(x0.stamp())
    val vl = list_cons(sym, list_sing(stamp))
    val vl = JSONlist(vl)
  }
*)
(*
  jsonval_labval1("d2con", rst) where
  {
    val sym = $SYM_J.jsonize_symbol(x0.sym())
    val stamp = $STM_J.jsonize_stamp(x0.stamp())
    val rst = JSONlist($list{jsonval}(sym, stamp))
  }
*)

(*
  jsonval_conarg2("d2con", sym, stamp) where
    val sym = $SYM_J.jsonize_symbol(x0.sym())
    val stamp = $STM_J.jsonize_stamp(x0.stamp())
  end
*)
  jsonval_labval1("d2con", rst) where
  (* labval2(jsonize("d2con"), rst) where *)
    val lst = $list{labjsonval}($SYM_J.labify_symbol(x0.sym()), $STM_J.labify_stamp(x0.stamp()))
    val rst = JSONlablist(lst)
  end

)

implement
jsonize_val<d2cst> = jsonize_d2cst

implement
jsonize_d2cst
  (x0) =
(
(*
  labval2(nd, vl) where
  {
    val nd = jstr("d2cst")
    val sym = $SYM_J.jsonize_symbol(x0.sym())
    val stamp = $STM_J.jsonize_stamp(x0.stamp())
    val vl = list_cons(sym, list_sing(stamp))
    val vl = JSONlist(vl)
  }
*)
  jsonval_labval1("d2cst", rst) where
  (* labval2(jsonize("d2var"), rst) where *)
    val lst = $list{labjsonval}(
      $SYM_J.labify_symbol(x0.sym()), $STM_J.labify_stamp(x0.stamp())
    )
    val rst = JSONlablist(lst)
  end

)




implement
jsonize_val<d2var> = jsonize_d2var

implement
jsonize_d2var
  (x0) =
(*
(
  labval2(nd, vl) where
  {
    val nd = jstr("d2var")
    val sym = $SYM_J.jsonize_symbol(x0.sym())
    val stamp = $STM_J.jsonize_stamp(x0.stamp())
    val vl = list_cons(sym, list_sing(stamp))
    val vl = JSONlist(vl)
  }
)
*)
  jsonval_labval1("d2var", rst) where
  (* labval2(jsonize("d2var"), rst) where *)
    val lst = $list{labjsonval}(
      $SYM_J.labify_symbol(x0.sym()), $STM_J.labify_stamp(x0.stamp())
    )
    val rst = JSONlablist(lst)
  end


implement
jsonize_val<f2arg> = jsonize_f2arg

implement
jsonize_f2arg
  (x0) = let
in
(
//
case+
x0.node() of
(*
| F2ARGnone(tok) =>
  fprint!(out, "F2ARGnone(", tok, ")")
*)
| F2ARGsome_met(s2es) =>
  (* labval2(jstr("f2arg"), jsonval_sing(jsonize("F2ARGsome_met"))) *)
  jsonify("F2ARGsome_met", "s2es", jstr("..."))
(*
  let
    (* val _ = $showtype(s2es) // s2exp *)
  in
  (
    labval2(jstr("f2arg"), jsonval_nil())
  )
  end
*)
  (* fprint!(out, "F2ARGsome_met(", s2es, ")") *)
| F2ARGsome_dyn(npf, d2ps) =>
  (* labval2(jstr("f2arg"), jsonval_sing(jsonize("F2ARGsome_dyn"))) *)
  jsonify("F2ARGsome_dyn", ("npf", "d2ps"), (jsonize(npf), jstr("...")))
  (* fprint!(out, "F2ARGsome_dyn(", npf, "; ", d2ps, ")") *)
(*
  let
    (* val _ = $showtype(npf) *)
  in
  jnul()
  end
*)

| F2ARGsome_sta(s2vs, s2ps) =>
  (* labval2(jstr("f2arg"), jsonval_sing(jsonize("F2ARGsome_sta"))) *)
  jsonify("F2ARGsome_sta", ("s2vs", "s2ps"), (jstr("..."), jstr("...")))
  (* fprint!(out, "F2ARGsome_sta(", s2vs, "; ", s2ps, ")") *)
(*
  let
    (* val _ = $showtype(s2vs) *)
  in
  jnul()
  end
*)

)
end




implement
jsonize_val<d2pat> = jsonize_d2pat

implement
jsonize_d2pat
  (x0) = labval2(jsonize("d2pat"), res) where
val res =
(
case- x0.node() of
//
| D2Pint(tok) =>
  (* fprint!(out, "D2Pint(", tok, ")") *)
  labval2(jsonize("D2Pint"), jnul())
| D2Pbtf(tok) =>
  labval2(jsonize("D2Pbtf"), jnul()) // tok, ")")
| D2Pchr(tok) =>
  labval2(jsonize("D2Pchr"), jnul()) // tok, ")")
| D2Pflt(tok) =>
  labval2(jsonize("D2Pflt"), jnul()) // tok, ")")
| D2Pstr(tok) =>
  labval2(jsonize("D2Pstr"), jnul()) // tok, ")")
//
| D2Pvar(d2v) =>
  labval2(jsonize("D2Pvar"), jnul()) // d2v, ")")
//
| D2Pcon1(d2c0) =>
  labval2(jsonize("D2Pcon1"), jnul()) // d2c0, ")")
| D2Pcon2(d2cs) =>
  labval2(jsonize("D2Pcon2"), jnul()) // d2cs, ")")
//
| D2Psym0(sym, d2pis) =>
  (
  labval2(jsonize("D2Psym0"), jnul()) // sym, ")");
(*
  labval2(jsonize("D2Psym0"), jnul()) // sym, "; ", d2pis, ")");
*)
  )
//
| D2Psapp(d2f0, s2vs) =>
  labval2(jsonize("D2Psapp"), jnul()) // d2f0, "; ", s2vs, ")")
| D2Pdapp(d2f0, npf0, d2ps) =>
  labval2(jsonize("D2Pdapp"), jnul()) // d2f0, "; ", npf0, "; ", d2ps, ")")
//
| D2Ptuple(knd, npf, d2ps) =>
  labval2(jsonize("D2Ptuple"), jnul()) // knd, "; ", npf, "; ", d2ps, ")")
//
| D2Panno(d2p1, s2e2) =>
  labval2(jsonize("D2Panno"), jnul()) // d2p1, "; ", s2e2, ")")
//
| D2Pnone0() =>
  labval2(jsonize("D2Pnone0"), jnul()) // ")")
| D2Pnone1(d1psrc) =>
  labval2(jsonize("D2Pnone1"), jnul()) // d1psrc, ")")
//
) (* end of [jsonize_d2pat] *)
end




implement
jsonize_val<d2exp> = jsonize_d2exp

implement
jsonize_d2exp
  (x0) = labval2(jsonize("d2exp"), res) where
val res =
(
case- x0.node() of
//
| D2Eint(tok) =>
  labval2(jsonize("D2Eint"), jsonize(tok)) // tok, ")")
| D2Ebtf(tok) =>
  labval2(jsonize("D2Ebtf"), jsonize(tok)) // tok, ")")
| D2Echr(tok) =>
  labval2(jsonize("D2Echr"), jsonize(tok)) // tok, ")")
| D2Eflt(tok) =>
  labval2(jsonize("D2Eflt"), jsonize(tok)) // tok, ")")
| D2Estr(tok) =>
  labval2(jsonize("D2Estr"), jsonize(tok)) // tok, ")")
//
| D2Etop(tok) =>
  labval2(jsonize("D2Etop"), jsonize(tok)) // tok, ")")
//
| D2Evar(d2v) =>

  labval2(jsonize("D2Evar"), jsonize(d2v)) // d2v, ")")
//
| D2Ecst1(d2c) =>
  labval2(jsonize("D2Ecst1"), jsonize(d2c)) // d2c, ")")
| D2Econ1(d2c) =>
  labval2(jsonize("D2Econ1"), jsonize(d2c)) // d2c, ")")
| D2Ecst2(d2cs) =>
  labval2(jsonize("D2Ecst2"), j_d2cs) // d2cs, ")")
  where
    val j_d2cs = jsonize_list<d2cst>(d2cs)
  end
| D2Econ2(d2cs) =>
  labval2(jsonize("D2Econ2"), j_d2cs) // d2cs, ")")
  where
    val j_d2cs = jsonize_list<d2con>(d2cs)
  end
//
| D2Esym0
  (d1e1, dpis) =>
  labval2(jsonize("D2Esym0"), jnul()) // d1e1, ")")
  (* where *)
  (*   val _ = $showtype(d1e1) *)
  (* end *)

(*
  fprint!
  (out, "D2Esym0"), jnul()) // d1e1, "; ", dpis, ")")
*)
//
| D2Esapp
  (d2f0, s2as) =>
  labval2(jsonize("D2Esapp"), jnul()) // d2f0, "; ", s2as, ")")
| D2Etapp
  (d2f0, s2as) =>
  labval2(jsonize("D2Etapp"), jnul()) // d2f0, "; ", s2as, ")")
| D2Edapp
  (d2f0, npf0, d2as) =>
  labval2(jsonize("D2Edapp"), jnul()) // d2f0, "; ", npf0, "; ", d2as, ")")
//
| D2Elet
  (d2cs, d2e2) =>
  labval2(jsonize("D2Elet"), jnul()) // d2cs, "; ", d2e2, ")")
| D2Ewhere
  (d2e1, d2cs) =>
  labval2(jsonize("D2Ewhere"), jnul()) // d2e1, "; ", d2cs, ")")
//
| D2Eseqn
  (d2es, d1e1) =>
  labval2(jsonize("D2Eseqn"), jnul()) // d2es, "; ", d1e1(*last*), ")")
//
| D2Etuple
  (knd, npf, d2es) =>
  labval2(jsonize("D2Etuple"), jnul()) // knd, "; ", npf, "; ", d2es, ")")
//
| D2Eassgn
  (d2e1, d2e2) =>
  labval2(jsonize("D2Eassgn"), jnul()) // d2e1, "; ", d2e2, ")")
//
| D2Edtsel
  ( lab0
  , dpis, npf2, arg3) =>
  (
  case+
  arg3 of
  |
  None() =>
  labval2(jsonize("D2Edtsel"), jnul()) // lab0, "(", dpis, ")", ")")
  |
  Some(d2es) =>
  labval2(jsonize("D2Edtsel"), jnul()) // lab0, "(", dpis, ")", "(", npf2, "; ", d2es, ")", ")")
  )
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  labval2(jsonize("D2Eif0"), jnul()) // d2e1, "; ", d2e2, "; ", opt3, ")")
//
| D2Ecase
  (knd, d2e1, d2cls) =>
  labval2(jsonize("D2Ecase"), jnul()) // knd, "; ", d2e1, "; ", d2cls, ")")
//
| D2Elam
  (knd, f2as, tres, arrw, body) =>
  labval2(jsonize("D2Elam"), jnul()) // knd, "; ", f2as, "; ", tres, "; ", arrw, "; ", body, ")")
| D2Efix
  (knd, fid, f2as, tres, arrw, body) =>
  labval2(jsonize("D2Efix"), jnul()) // knd, "; ", fid, "; ", f2as, "; ", tres, "; ", arrw, "; ", body, ")")
//
| D2Eaddr(d2e1) =>
  labval2(jsonize("D2Eaddr"), jnul()) // d2e1, ")")
| D2Efold(d2e1) =>
  labval2(jsonize("D2Efold"), jnul()) // d2e1, ")")
//
| D2Eanno(d2e1, s2e2) =>
  labval2(jsonize("D2Eanno"), jnul()) // d2e1, "; ", s2e2, ")")
//
| D2Enone0() => labval2(jsonize("D2Enone0"), jnul()) // ")")
| D2Enone1(d1esrc) => labval2(jsonize("D2Enone1"), jnul()) // d1esrc, ")")
//
)
end // end of where



local

implement
jsonize_val<d2ecl> = jsonize_d2ecl
implement
jsonize_val<v2aldecl> = jsonize_v2aldecl
implement
jsonize_val<v2ardecl> = jsonize_v2ardecl
implement
jsonize_val<f2undecl> = jsonize_f2undecl

in (* in-of-local *)

implement
jsonize_d2ecl
  (x0) =
(
case- x0.node() of
//
| D2Cstatic
  (tok, d2c) =>
  jsonify("D2static", "d2c", jsonize(d2c))
| D2Cextern
  (tok, d2c) =>
  jsonify("D2extern", ("tok", "d2c"), (jsonize(tok), jsonize(d2c)))
//
| D2Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
  jsonify("D2Cinclude",
    (
      "tok", "src", "knd", "fopt", "body"
    ),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize("..."),
      jsonize(body)
    ) where

      val body =
      (
      case+ body of
      | None _ => "None()"
      | Some _ => "Some(<d2cls>)"
      ): string
    end
  )
//
| D2Cstaload
  ( tok
  , src, knd
  , fopt, flag, body) =>
  jsonify("D2Cinclude",
    (
      "tok", "src", "knd", "fopt", "flag", "body"
    ),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize("..."),
      jsonize(flag),
      jsonize(body)
    ) where
      val body =
      (
      case+ body of
      | None _ => "None()"
      | Some _ => "Some(<fmodenv>)"
      ): string
      end
  )
//
| D2Clocal(head, body) =>
  jsonify("D2Clocal", ("head", "body"), (jsonize("..."), jsonize("...")))
//
| D2Cabssort(d1c) =>
  jsonify("D2Cabssort", "d1c", jsonize("..."))
//
| D2Cstacst0(s2c, s2t) =>
  jsonify("D2Cstacst0", ("s2c", "s2t"), (jsonize(s2c), jsonize(s2t)))
//
| D2Csortdef(sym, s2tx) =>
  jsonify("D2Csortdef", ("sym", "s2tx"), (jsonize(sym), jsonize("...")))
//
| D2Csexpdef(s2c, s2e) =>
  jsonify("D2Csexpdef", ("s2c", "s2e"), (jsonize(s2c), jsonize(s2e)))
//
| D2Cabstype(s2c, df2) =>
  jsonify("D2Cabstype", ("s2c", "df2"), (jsonize(s2c), jsonize("...")))
//
| D2Cabsimpl
  (knd, sqid, def0) =>
  jsonify(
    "D2Csymload",
    (
      "knd", "sqid", "def0"
    ),
    (
      jsonize(knd),
      jsonize("..."),
      jsonize(def0)
    )
  )

//
| D2Csymload
  (tok, sym0, dpi1) =>
  jsonify(
    "D2Csymload",
    (
      "tok", "sym0", "dpi1"
    ),
    (
      jsonize(tok),
      jsonize(sym0),
      jsonize("...")
    )
  )
//
| D2Cvaldecl
  (knd, mopt, v2ds) =>
  jsonify(
    "D2Cvaldecl",
    (
      "knd", "mopt", "v2ds"
    ),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize("...")
    )
  )

| D2Cfundecl
  (knd, mopt, tqas, f2ds) =>
  jsonify(
    "D2Cfundecl",
    (
      "knd", "mopt", "tqas", "f2ds"
    ),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize("..."),
      jsonize("...")
    )
  )

//
| D2Cvardecl(knd, v2ds) =>
  jsonify("D2Cvardecl", ("knd", "v2ds"), (jsonize(knd), jsonize("...")))
//
| D2Cimpdecl1
  ( knd, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  jsonify(
    "D2Cimpdecl1",
    (
      "knd", "mopt", "sqas", "tqas", "dqid", "tias", "f2as", "res0", "d2e1"
    ),
    (
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("...")
    )
  )
| D2Cimpdecl2
  ( knd, mopt, sqas, tqas
  , dqid, tias, f2as, res0, d2e1) =>
  jsonify(
    "D2Cimpdecl2",
    (
      "knd", "mopt", "sqas", "tqas", "dqid", "tias", "f2as", "res0", "d2e1"
    ),
    (
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("..."),
      jsonize("...")
    )
  )
//
| D2Cdatasort(d1c) =>
  jsonify("D2Cdatasort", "d1c", jsonize(d1c))
| D2Cdatatype(d1c) =>
  jsonify("D2Cdatatype", "d1c", jsonize(d1c))
//
| D2Cdynconst
  (knd, tqas, d2cs) =>
  jsonify(
    "D2Cdynconst",
    (
      "knd", "tqas", "d2cs"
    ),
    (
      jsonize("..."),
      jsonize("..."),
      jsonize("...")
    )
  )
//
| D2Cnone0() =>
  jsonify("D2Cnone0")
| D2Cnone1(d1csrc) =>
  jsonify("D2Csortdef", "d1csrc", jsonize(d1csrc))
//
) (* end of [fprint_d2ecl] *)

end // end of [local]


(*
implement
fprint_d2itm
  (out, x0) =
(
case+ x0 of
//
| D2ITMvar(d2v0) =>
  fprint!(out, "D2ITMvar(", d2v0, ")")
//
| D2ITMcon(d2cs) =>
  fprint!(out, "D2ITMcon(", d2cs, ")")
//
| D2ITMcst(d2cs) =>
  fprint!(out, "D2ITMcst(", d2cs, ")")
//
| D2ITMsym(sym, dpis) =>
  fprint!
  (out, "D2ITMsym(", sym, "; ", dpis, ")")
//
) (* end of [fprint_d2itm] *)
//
implement
fprint_d2pitm
  (out, x0) =
(
case+ x0 of
| D2PITMnone(dqid) =>
  fprint!(out, "D2PITMnone(", dqid, ")")
| D2PITMsome(pval, d2i0) =>
  fprint!
  (out, "D2PITMsome(", pval, "; ", d2i0, ")")
)
*)




local

implement
jsonize_val<s2var> = jsonize_s2var

in

implement
jsonize_sq2arg
  (x0) =
(
  jsonval_labval1("sq2arg", jsonize_list<s2var>(x0.s2vs()))
) (* end of [fprint_sq2arg] *)

end


implement
jsonize_tq2arg
  (x0) =
(
  (* fprint!(out, "<", x0.s2vs(), ">") *)
  jsonval_labval1("tq2arg", jstr("..."))
) (* end of [jsonize_tq2arg] *)


implement
jsonize_ti2arg
  (x0) =
(
  jsonify("ti2arg", "s2es", rst)
  where
    val rst = jsonize("...")
    (* val _ = $showtype(x0.s2es()) *)
  end
) (* end of [jsonize_ti2arg] *)


local

implement jsonize_val<d2cst> = jsonize_d2cst

in

implement
jsonize_impld2cst
  (x0) =
(
case+ x0 of
|
IMPLD2CST1(dqid, d2cs) =>
  jsonify("IMPLD2CST1", ("d2qid", "d2cs"), (
    jsonize(dqid), jsonize_list<d2cst>(d2cs))
  )
|
IMPLD2CST2(dqid, d2cs, opt2) =>
  jsonify("IMPLD2CST2", ("d2qid", "d2cs", "opt"), (
      jsonize(dqid), jsonize_list<d2cst>(d2cs), jstr("...")
    )
  )
) // end of [fprint_impld2cst]

end
