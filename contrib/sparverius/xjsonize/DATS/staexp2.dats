
#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp0.sats"
#staload "{$XATS}/SATS/staexp1.sats"
#staload "{$XATS}/SATS/staexp2.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/basics.sats"


#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/lexing.sats"

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

#staload SYM = "./../SATS/symbol.sats"
#staload LOC = "./../SATS/locinfo.sats"
#staload STM = "./../SATS/stamp0.sats"
#staload LAB = "./../SATS/label0.sats"

overload jsonize with $LOC.jsonize_location
overload jsonize with $SYM.jsonize_symbol
overload jsonize with $STM.jsonize_stamp

overload jsonize with $LAB.jsonize_label


local

implement
jsonize_val<sort2> = jsonize_sort2

in (* in-of-local *)

implement
jsonize_sort2
  (s2t0) =
(
case+ s2t0 of
//
| S2Tid(id) =>
  jsonify("S2Tid", "id", jsonize(id))
| S2Tint(i0) =>
  jsonify("S2Tint", "i0", jsonize(i0))
| S2Tbas(s2tb) =>
  jsonify("S2Tbas", "s2tb", jsonize(s2tb))
| S2Ttup() =>
  jsonify("S2Ttup")
| S2Ttup(s2ts) =>
  jsonify("S2tup", "s2ts", jsonize_list<sort2>(s2ts))
| S2Tfun() =>
  jsonify("S2Tfun")
| S2Tfun(s2ts, s2t1) =>
  jsonify("S2fun",
    ("s2ts", "s2t1"),
    (
      jsonize_list<sort2>(s2ts),
      jsonize(s2t1)
    )
  )
| S2Tapp(s2t1, s2ts) =>
  jsonify("S2app",
    ("s2t1", "s2ts"),
    (
      jsonize(s2t1),
      jsonize_list<sort2>(s2ts)
    )
  )
| S2Tnone0() =>
  jsonify("S2Tnone0")
| S2Tnone1(s1tsrc) =>
  jsonify("S2Tnone1", "s1tsrc", jsonize(s1tsrc))
) (* end of [jsonize_sort2] *)

end // end of [local]


implement
jsonize_t2bas
  (s2tb) =
(
case+ s2tb of
| T2BASpre(sym) =>
  jsonify("T2BASpre", "sym", jsonize(sym))
| T2BASabs(abs) =>
  jsonify("T2BASabs", "sym", jsonize(abs))
| T2BASdat(dat) =>
  jsonify("T2BASabs", "dat", jsonize(dat))
| T2BASimp(knd, sym) =>
  (* fprint!(out, "T2BASimp(", knd, "; ", sym, ")") *)
  jsonify("T2BASimp", ("knd", "sym"), (jsonize(knd), jsonize(sym)))
)


implement
jsonize_t2abs(x0) =
jsonval_labval1("t2abs", jsonize(x0.sym()))


implement
jsonize_t2dat(x0) =
jsonval_labval1("t2dat", $SYM.jsonize_symbol(x0.sym()))


implement
jsonize_s2cst
  (x0) =
  jsonval_labval1("s2cst", rst) where
    val lst = $list{labjsonval}(
      $SYM.labify_symbol(x0.sym()), $STM.labify_stamp(x0.stamp())
    )
    val rst = JSONlablist(lst)
  end
// (* end of [jsonize_s2cst] *)


implement
jsonize_s2var
  (x0) =
jsonval_labval2("s2var", rst, "sort", jsrt) where
    val lst = $list{labjsonval}(
      $SYM.labify_symbol(x0.sym()),
      $STM.labify_stamp(x0.stamp())
    )
    val rst = JSONlablist(lst)
    val jsrt = jsonize(x0.sort())
  end


implement
jsonize_tyrec
  (knd) =
(
case+ knd of
//
| TYRECbox0() =>
  jsonify("TYRECbox0")
| TYRECbox1() =>
  jsonify("TYRECbox1")
//
| TYRECflt0() =>
  jsonify("TYRECflt0")
(*
| TYRECflt1(stm) =>
  fprint!(out, "TYRECflt1(", stm, ")")
*)
| TYRECflt2(nam) =>
  jsonify("TYRECflt2", "nam", jsonize(nam))
//
) (* end of [fprint_tyrec] *)




local

implement
jsonize_val<s2exp> = jsonize_s2exp
implement
jsonize_val<s2var> = jsonize_s2var
implement
jsonize_val<labs2exp> = jsonize_labs2exp

in (* in-of-local *)

implement
jsonize_s2exp
  (s2e0) =
(
case+
s2e0.node() of
//
| S2Eint(i0) =>
  jsonify("S2Eint", "i0", jsonize(i0))
| S2Echr(c0) =>
  jsonify("S2Echr", "c0", jsonize(c0))
//
| S2Estr(s0) =>
  jsonify("S2Estr", "s0", jsonize(s0))
//
| S2Ecst(s2c) =>
  jsonify("S2Ecst", "s2c", jsonize(s2c))
(*
  fprint!
  (out, "S2Ecst(", s2c, "; ", s2c.sort(), ")")
*)
| S2Evar(s2v) =>
  jsonify("S2Evar", "s2v", jsonize(s2v))
(*
  fprint!
  (out, "S2Evar(", s2v, "; ", s2v.sort(), ")")
*)
//
| S2Extv(xtv) =>
  let
(*
    val s2e = "..."
*)
    val s2e = s2xtv_get_sexp(xtv)
  in
    (* fprint!(out, "S2Extv(", s2e, ")") *)
    jsonify("S2Extv", "xtv", jsonize(s2e))
  end
//
| S2Eapp
  (s2fn, s2es) =>
  jsonify (
    "S2Eapp",
    (
      "s2fn",
      "s2es"
    ),
    (
      jsonize(s2fn),
      jsonize_list<s2exp>(s2es)
    )
  )
| S2Elam
  (s2vs, body) =>
  jsonify (
    "S2Elam",
    (
      "s2vs",
      "body"
    ),
    (
      jsonize("..."),
      jsonize("...")
    )
  )
//
| S2Eany(knd) =>
  jsonify("S2Eany", "knd", jsonize(knd))
//
| S2Etop(knd, s2e) =>
  jsonify("S2Eany", ("knd", "s2e"), (jsonize(knd), jsonize(s2e)))
//
| S2Earg(knd, s2e) =>
  jsonify("S2Earg", ("knd", "s2e"), (jsonize(knd), jsonize(s2e)))
| S2Eatx(bef, aft) =>
  jsonify("S2Eatx", ("bef", "aft"), (jsonize(bef), jsonize(aft)))
//
| S2Efun
  (fc2, npf, arg, res) =>
  jsonify(
    "S2Efun",
    (
      "fc2",
      "npf",
      "arg",
      "res"
    ),
    (
      jsonize(fc2),
      jsonize(npf),
      jsonize_list<s2exp>(arg),
      jsonize(res)
    )
  )

//
| S2Ecimp(loc, s2e) =>
  jsonify(
    "S2Ecimp",
    (
      "loc",
      "s2e"
    ),
    (
      jsonize(loc),
      jsonize(s2e)
    )
  )
| S2Ecprf(loc, s2e) =>
  jsonify(
    "S2Ecprf",
    (
      "loc",
      "s2e"
    ),
    (
      jsonize(loc),
      jsonize(s2e)
    )
  )

| S2Ectcd(loc, s2e) =>
  jsonify(
    "S2Ectcd",
    (
      "loc",
      "s2e"
    ),
    (
      jsonize(loc),
      jsonize(s2e)
    )
  )

| S2Ecast(loc, s2e, s2t) =>
  jsonify(
    "S2Ecast",
    (
      "loc",
      "s2e",
      "s2t"
    ),
    (
      jsonize(loc),
      jsonize(s2e),
      jsonize(s2t)
    )
  )
(*
  fprint!
  ( out
  , "S2Ecast("
  , loc, "; ", s2e, "; ", s2t, ")")
*)
//
| S2Emet
  (s2es, body) =>
  jsonify("S2Emet", ("s2es", "body"), (jsonize_list<s2exp>(s2es), jsonize(body)))
//
| S2Eexi
  (s2vs, s2ps, body) =>
  jsonify(
    "S2Eexi",
    (
      "s2vs",
      "s2ps",
      "body"
    ),
    (
      jsonize_list<s2var>(s2vs),
      jsonize_list<s2exp>(s2ps),
      jsonize(body)
    )
  )
| S2Euni
  (s2vs, s2ps, body) =>
  jsonify(
    "S2Euni",
        (
      "s2vs",
      "s2ps",
      "body"
    ),
    (
      jsonize_list<s2var>(s2vs),
      jsonize_list<s2exp>(s2ps),
      jsonize(body)
    )
  )

//
(*
| S2Elist(s2es) =>
  fprint!(out, "S2Elist(", s2es, ")")
*)
//
| S2Etyrec
  (knd, npf, ls2es) =>
  jsonify(
    "S2Etyrec",
    (
      "knd",
      "npf",
      "ls2es"
    ),
    (
      jsonize(knd),
      jsonize(npf),
      jsonize_list<labs2exp>(ls2es)
    )
  )

  (* where val _ = $showtype(ls2es) end *)
//
| S2Etyext(tnm1, s2es) =>
  jsonify("S2Etyext",
    (
      "tnm1",
      "s2es"
    ),
    (
      jsonize(tnm1),
      jsonize_list<s2exp>(s2es)
    )
  )
//
| S2Enone0() =>
  jsonify("S2Enone")
| S2Enone1(s1esrc) =>
  jsonify("S2Enone1", "s1esrc", jsonize(s1esrc))
) (* end of [jsonize_s2exp] *)

end // end of [local]


implement
jsonize_labs2exp
  (ls2e) =
(
case+ ls2e of
| SLABELED(l0, s2e) =>
  jsonify("SLABELED", ("l0", "s2e"), (
    jsonize(l0),
    jsonize(s2e))
  )
) (* end of [jsonize_labs2exp] *)


local implement jsonize_val<s2cst> = jsonize_s2cst in

implement
jsonize_s2itm
  (x0) =
(
case+ x0 of
//
| S2ITMvar(s2v) =>
  jsonify("S2ITMvar", "s2v", jsonize(s2v))
//
| S2ITMcst(s2cs) =>
  jsonify("S2ITMcst", "s2cs", jsonize_list<s2cst>(s2cs))
//
| S2ITMfmodenv(fmod) =>
  jsonify("S2ITMcst", "fmod", jsonize("..."))
)
end


implement
jsonize_effs2expopt
  (x0) =
(
case+ x0 of
| EFFS2EXPnone() =>
  jsonify("EFFS2EXPnone")
| EFFS2EXPsome(s2e) =>
  jsonify("EFFS2EXPsome", "s2e", jsonize(s2e))
(*
| EFFS2EXPsome(s2f, s2e) =>
  jsonify("EFFS2EXPsome", ("s2f", "s2e"), (jsonize(s2f), jsonize(s2e)))
*)
) (* end of [fprint_effs2expopt] *)
