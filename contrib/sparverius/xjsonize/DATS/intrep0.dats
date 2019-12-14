#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp1.sats"
#staload "{$XATS}/SATS/dynexp2.sats"
#staload "{$XATS}/SATS/dynexp3.sats"


#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#staload "./../SATS/lexing.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/filpath.sats"

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

#staload "./../SATS/statyp2.sats"

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

#staload "./../SATS/intrep0.sats"


implement
jsonize_val<filpath> = jsonize_filpath


implement
jsonize_val<ir0pat> = jsonize_ir0pat

implement
jsonize_ir0pat
  (x0) =
node("ir0pat", res) where
val res =
(
case+ x0.node() of
//
| IR0Pnil() =>
  jsonify("IR0Pnil")
| IR0Pint(tok) =>
  jsonify("IR0Pint", "tok", jsonize(tok))
| IR0Pbtf(tok) =>
  jsonify("IR0Pbtf", "tok", jsonize(tok))
//
| IR0Pany() =>
  jsonify("IR0Pany")
| IR0Pvar(d2v) =>
  jsonify("IR0Pvar", "d2v", jsonize(d2v))
//
| IR0Pcapp(d2c0, irps) =>
  jsonify("IR0Pcapp", ("d2c0", "irps"), (jsonize(d2c0), jsonize_list<ir0pat>(irps)))
//
| IR0Ptuple(knd, irps) =>
  jsonify("IR0Ptuple", ("knd", "irps"),
    (jsonize(knd), jsonize_list<ir0pat>(irps))
  )
//
| IR0Pnone0() =>
  jsonify("IR0Pnone0")
| IR0Pnone1(d3p) =>
  jsonify("IR0Pnone1", "d3p", jsonize("..."))
//
) // end of [jsonize_ir0pat]
end

implement jsonize_val<ir0pat>(x) = jsonize_ir0pat(x)

implement
jsonize_ir0arg
  (x0) =
let
  val+IR0ARGsome(npf, irps) = x0
in
node("ir0arg", res) where
val res =
  jsonify("IR0ARGsome", ("npf", "irps"), (jsonize(npf), jsonize_list<ir0pat>(irps)))
end
end // end of [jsonize_ir0arg]


local

implement jsonize_val<ir0exp> = jsonize_ir0exp
implement jsonize_val<ir0clau> = jsonize_ir0clau
implement jsonize_val<ir0dcl> = jsonize_ir0dcl
implement jsonize_val<t2ype> = jsonize_t2ype
implement jsonize_val<ir0arg> = jsonize_ir0arg

implement jsonize_val<ti2arg> = jsonize_ti2arg

in
//
implement
jsonize_ir0exp(x0) =
(* jsonval_labval1("ir0exp", res) where *)
(* res where val res = *)
node("ir0exp", res) where
val res =
(
case+
x0.node() of
//
| IR0Eint(tok) =>
  jsonify("IR0Eint", "tok", jsonize(tok))
| IR0Ebtf(tok) =>
  jsonify("IR0Ebtf", "tok", jsonize(tok))
(*
| IR0Eflt(tok) =>
  jsonize("IR0Eflt") //, tok, ")")
*)
| IR0Estr(tok) =>
  jsonify("IR0Estr", "tok", jsonize(tok))
//
| IR0Evar(d2v) =>
  jsonify("IR0Evar", "d2v", jsonize(d2v))
//
| IR0Econ1(d2c) =>
  jsonify("IR0Econ1", "d2c", jsonize(d2c))

| IR0Ecst1(d2c) =>
  jsonify("IR0Ecst1", "d2c", jsonize(d2c))
//
| IR0Efcst(d2c) =>
  jsonify("IR0Efst1", "d2c", jsonize(d2c))
//
| IR0Etcst
  (d2c1, ti3a, ti2s) =>
  jsonify("IR0Etcst", ("d2c1", "ti3a", "ti2s"),
    (jsonize(d2c1), jsonize(ti3a), jsonize_list<ti2arg>(ti2s))
  )
| IR0Etimp
  (ire1, targ, irc2, tsub) =>
  jsonify(
    "IR0Etimp", ("ire1", "targ", "irc2", "tsub"),
    (
      jsonize(ire1),
      jsonize_list<t2ype>(targ),
      jsonize(irc2),
      jsonize_list<t2ype>(tsub)
    )
  )
//
| IR0Edapp
  (irf0, npf1, ires) =>
  jsonify(
    "IR0Edapp", ("irf0", "npf1", "ires"),
    (jsonize(irf0), jsonize(npf1), jsonize_list<ir0exp>(ires))
  )
//
| IR0Eproj
  (ire1, lab2, idx2) =>
  jsonify(
    "IR0Eproj", ("ire1", "lab2", "idx2"),
    (jsonize(ire1), jsonize(lab2), jsonize(idx2))
  )
//
| IR0Elet(irds, ire1) =>
  jsonify(
    "IR0Elet", ("irds", "ire1"),
    (jsonize_list<ir0dcl>(irds), jsonize(ire1))
  )
| IR0Ewhere(ire1, irds) =>
  jsonify("IR0Ewhere", ("ire1", "irds"),
      (jsonize(ire1), jsonize_list<ir0dcl>(irds))
  )
//
| IR0Eseqn
  (ires, ire1) =>
  jsonify("IR0Eseqn", ("ires", "ire1"), (jsonize_list<ir0exp>(ires), jsonize(ire1)))
| IR0Etuple
  (knd0, npf1, ires) =>
  jsonify(
    "IR0Etuple", ("knd0", "npf1", "ires"),
    (jsonize(knd0), jsonize(npf1), jsonize_list<ir0exp>(ires))
  )
| IR0Eassgn(irel, irer) =>
  jsonify("IR0Eassgn", ("irel", "irer"), (jsonize(irel), jsonize(irer)))
//
| IR0Eif0
  (ire1, ire2, opt3) =>
  jsonify("IR0Eif0",
    ("ire1", "ire2", "opt3"),
    (jsonize(ire1), jsonize(ire2), jsonize_option<ir0exp>(opt3))
  )
//
| IR0Ecase
  (knd0, ire1, ircls) =>
  jsonify("IR0Ecase", ("knd0", "ire1", "ircls"),
    (jsonize(knd0), jsonize(ire1), jsonize_list<ir0clau>(ircls))
  )
//
| IR0Elam
  (knd0, farg, body) =>
  jsonify(
    "IR0Elam", ("knd0", "farg", "body"),
    (jsonize(knd0), jsonize_list<ir0arg>(farg), jsonize(body))
  )
| IR0Efix
  (knd0, d2v0, farg, body) =>
  jsonify("IR0Efix", ("knd0", "d2v0", "farg", "body"),
    (
      jsonize(knd0),
      jsonize(d2v0),
      jsonize_list<ir0arg>(farg),
      jsonize(body)
    )
  )
//
| IR0Eaddr(ire1) =>
  jsonify("IR0Eaddr", "ire1", jsonize(ire1))
| IR0Eflat(ire1) =>
  jsonify("IR0Eflat", "ire1", jsonize(ire1))
| IR0Etalf(ire1) =>
  jsonify("IR0Etalf", "ire1", jsonize(ire1))
//
| IR0Enone0() =>
  (
    jsonize("IR0Enone0") //, ")")
  )
| IR0Enone1(d3e1) =>
  (
    jsonize("IR0Enone1") //, d3e1, ")")
  )
//
)
end // end of [jsonize_ir0exp]

end // end of local


implement
jsonize_ir0gua
  (x0) =
node("ir0gua", res) where
val res =
(
case+
x0.node() of
| IR0GUAexp(ir0e) =>
  jsonify("IR0GUAexp", "ir0e", jsonize(ir0e))
| IR0GUAmat(ir0e, ir0p) =>
  jsonify("IR0GUAmat", ("ir0e", "ir0p"),
    (
      jsonize(ir0e),
      jsonize(ir0p)
    )
  )
) (* end of [jsonize_ir0gua] *)
end

implement
jsonize_ir0clau
  (x0) =
node("ir0clau", res) where
val res =
(
case+
x0.node() of
//
| IR0CLAUpat(ir0gp) =>
  jsonify("IR0CLAUpat", "ir0gp", jsonize(ir0gp))
//
| IR0CLAUexp(ir0gp, d0e0) =>
  jsonify("IR0CLAUpat", ("ir0gp", "d0e0"),
    (jsonize(ir0gp), jsonize(d0e0))
  )
//
) (* end of [jsonize_ir0clau] *)
end

implement jsonize_val<ir0gua> = jsonize_ir0gua

implement
jsonize_ir0gpat
  (x0) =
node("ir0gpat", res) where
val res =
(
case+
x0.node() of
//
| IR0GPATpat(ir0p) =>
  jsonify("IR0GPATpat", "ir0p", jsonize(ir0p))
| IR0GPATgua(ir0p, ir0gs) =>
  jsonify("IR0CLAUpat", ("ir0p", "ir0gs"),
    (
      jsonize(ir0p),
      jsonize_list<ir0gua>(ir0gs)
    )
  )
//
) (* end of [jsonize_ir0gpat] *)
end

implement jsonize_val<ir0dcl> = jsonize_ir0dcl
implement jsonize_val<ir0fundecl> = jsonize_ir0fundecl
implement jsonize_val<tq2arg> = jsonize_tq2arg
implement jsonize_val<sq2arg> = jsonize_sq2arg
implement jsonize_val<ti2arg> = jsonize_ti2arg
implement jsonize_val<ir0arg> = jsonize_ir0arg
implement jsonize_val<ir0valdecl> = jsonize_ir0valdecl
implement jsonize_val<ir0vardecl> = jsonize_ir0vardecl

implement
jsonize_ir0dcl(x0) =
node("ir0dcl", res) where
val res =
(
case+ x0.node() of
//
| IR0Cstatic
  (tok, irc1) =>
  jsonify("IR0Cstatic", ("tok", "irc1"), (jsonize(tok), jsonize(irc1)))
| IR0Cextern
  (tok, irc1) =>
  jsonify("IR0Cextern", ("tok", "irc1"), (jsonize(tok), jsonize(irc1)))
//
| IR0Cinclude
  (tok, src, knd, fopt, body) =>
  jsonify("IR0Cinclude", ("tok", "src", "knd", "fopt", "body"),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize_option<filpath>(fopt),
      jbody
    )
  ) where
    val jbody = (
      case+ body of
      | Some(x) => jsonize_list<ir0dcl>(x)
      | None() => JSONlist(list_nil())
    )
    end
//
| IR0Clocal
  (head, body) =>
  jsonify("IR0Clocal", ("head", "body"),
    (jsonize_list<ir0dcl>(head), jsonize_list<ir0dcl>(body))
  )
//
| IR0Cvardecl
  (knd, mopt, irds) =>
  jsonify("IR0Cvardecl", ("knd", "mopt", "irds"),
    (jsonize(knd), jsonize(mopt), jsonize_list<ir0vardecl>(irds))
  )
| IR0Cvaldecl
  (knd, mopt, irds) =>
  jsonify("IR0Cvaldecl", ("knd", "mopt", "irds"),
    (jsonize(knd), jsonize(mopt), jsonize_list<ir0valdecl>(irds))
  )
//
| IR0Cfundecl
  (knd, mopt, tqas, irds) =>
  jsonify("IR0Cfundecl", ("knd", "mopt", "tqas", "irds"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<tq2arg>(tqas),
      jsonize_list<ir0fundecl>(irds)
    )
  )
//
| IR0Cimpdecl3
  (knd, mopt, sqas, tqas, id2c, ti3a, ti2s, iras, body) =>
  jsonify(
    "IR0Cimpdecl3",
    ("knd", "mopt", "sqas", "tqas", "id2c", "ti3a", "ti2s", "iras", "body"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<sq2arg>(sqas),
      jsonize_list<tq2arg>(tqas),
      jsonize(id2c),
      jsonize(ti3a),
      jsonize_list<ti2arg>(ti2s),
      jsonize_list<ir0arg>(iras),
      jsonize(body)
    )
  )
  (* where val _ = $showtype(iras) end *)
//
| IR0Cnone0() =>
  jsonify("IR0Cnone0")
| IR0Cnone1(d3cl) =>
  jsonify("IR0Cnone1", "d3cl", jsonize("..."))
//
) // end of [jsonize_ir0dcl]
end

implement jsonize_val<ir0exp> = jsonize_ir0exp

implement
jsonize_ir0vardecl
  (x0) = let
//
val+IR0VARDECL(rcd) = x0
//
in
node("ir0vardecl", res) where
val res =
  jsonify (
    "IR0VARDECL", ("d2v", "ini"),
    (jsonize(rcd.d2v), jsonize_option<ir0exp>(rcd.ini))
  )
end
end // end of [jsonize_ir0vardecl]


implement
jsonize_ir0valdecl
  (x0) = let
//
val+IR0VALDECL(rcd) = x0
//
in
node("ir0valdecl", res) where
val res =
  jsonify("IR0VALDECL", ("pat", "def"), (
      jsonize(rcd.pat),
      defopt
    )
  ) where
    val defopt = (
      case+ rcd.def of
      | None() => jsonize("None")
      | Some(x) => jsonize(x)
    )
  end
end
end // end of [jsonize_ir0valdecl]


implement jsonize_val<f2arg> = jsonize_f2arg

implement
jsonize_ir0fundecl
  (x0) = let
//
val+IR0FUNDECL(rcd) = x0
//
in
node("ir0fundecl", res) where
val res =
  jsonify(
    "IR0FUNDECL", ("nam", "d2c", "a2g", "a3g", "def"),
    (jsonize(rcd.nam), jsonize(rcd.d2c),  jsonize_list<f2arg>(rcd.a2g), ja3g, jdef)
  )
  where
    val ja3g = (
      case+ rcd.a3g of
      | None() => JSONlist(list_nil())
      | Some(x) => jsonize_list<f2arg>(rcd.a2g)
    )
    val jdef = (
      case+ rcd.def of
      | None() => JSONlist(list_nil())
      | Some(x) => jsonize_list<f2arg>(rcd.a2g)
    )
  end
end
end // end of [jsonize_ir0fundecl]
