
#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

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


implement
jsonize_val<filpath> = jsonize_filpath


implement
jsonize_val<s2exp> = jsonize_s2exp
implement
jsonize_val<d2exp> = jsonize_d2exp
implement
jsonize_val<d3pat> = jsonize_d3pat

implement
jsonize_val<d2pitm> = jsonize_d2pitm
implement
jsonize_val<s2var> = jsonize_s2var
implement
jsonize_val<d2var> = jsonize_d2var
implement
jsonize_val<d2cst> = jsonize_d2cst
implement
jsonize_val<d2con> = jsonize_d2con
implement
jsonize_val<ti2arg> = jsonize_ti2arg
implement
jsonize_val<tq2arg> = jsonize_tq2arg
implement
jsonize_val<sq2arg> = jsonize_sq2arg
implement
jsonize_val<f2arg> = jsonize_f2arg

implement
jsonize_val<t2ype> = jsonize_t2ype

implement
jsonize_val<d3ecl> = jsonize_d3ecl
implement
jsonize_val<d3clau> = jsonize_d3clau
implement
jsonize_val<f3arg> = jsonize_f3arg
implement
jsonize_val<d3gua> = jsonize_d3gua
implement
jsonize_val<v3aldecl> = jsonize_v3aldecl
implement
jsonize_val<v3ardecl> = jsonize_v3ardecl
implement
jsonize_val<f3undecl> = jsonize_f3undecl
implement
jsonize_val<d3exp> = jsonize_d3exp


implement
jsonize_d3pat
  (x0) =
node("d3pat", res) where
val res =
(
case- x0.node() of
//
| D3Pnil() =>
  jsonify("D3Pnil")
| D3Pany() =>
  jsonify("D3Pany")
//
| D3Pint(tok) =>
  jsonify("D3Pint", "tok", jsonize(tok))
| D3Pbtf(tok) =>
  jsonify("D3Pbtf", "tok", jsonize(tok))
| D3Pchr(tok) =>
  jsonify("D3Pchr", "tok", jsonize(tok))
| D3Pflt(tok) =>
  jsonify("D3Pflt", "tok", jsonize(tok))
| D3Pstr(tok) =>
  jsonify("D3Pstr", "tok", jsonize(tok))
//
| D3Pvar(d2v) =>
  jsonify("D3Pvar", "d2v", jsonize(d2v))
//
| D3Pcon1(d2c0) =>
  jsonify("D3Pcon1", "d2c0", jsonize(d2c0))
| D3Pcon2(d2cs) =>
  jsonify("D3Pcon2", "d2cs", jsonize_list<d2con>(d2cs))
//
| D3Psym0(sym0, d2pis) =>
  jsonify("D3Psym0", ("sym0", "d2pis"),
    (jsonize(sym0), jsonize_list<d2pitm>(d2pis))
  )
//
| D3Pdapp
  (d3f0, npf0, d3ps) =>
  jsonify("D3Pdapp", ("d3f0", "npf0", "d3ps"),
    (jsonize(d3f0), jsonize(npf0), jsonize_list<d3pat>(d3ps))
  )
//
| D3Ptuple
  (knd1, npf2, ldps) =>
  jsonify("D3Ptuple", ("knd1", "npf2", "ldps"),
    (jsonize(knd1), jsonize(npf2), jsonize_list<d3pat>(ldps))
  )
//
| D3Panno(d3p1, s2e2) =>
  jsonify("D3Panno", ("d3p1", "s2e2"), (jsonize(d3p1), jsonize(s2e2)))
//
| D3Ptcast(d3p1, t2p2) =>
  jsonify("D3Ptcast", ("d3p1", "t2p2"), (jsonize(d3p1), jsonize(t2p2)))
//
| D3Pnone0() =>
  jsonify("D3Pnone0")
| D3Pnone1(d1psrc) =>
  jsonify("D3Pnone1", "d1psrc", jsonize(d1psrc))
| D3Pnone2(d2psrc) =>
  jsonify("D3Pnone2", "d2psrc", jsonize(d2psrc))
//
) (* end of [jsonize_d3pat] *)
end


implement
jsonize_f3arg
  (x0) =
node("f3arg", res) where
val res =
(
//
case+
x0.node() of
//
| F3ARGnone2(f2a) =>
  jsonify("F3ARGnone2", "f2a", jsonize(f2a))
| F3ARGnone3(f3a) =>
  jsonify("F3ARGnone2", "f3a", jsonize(f3a))
//
| F3ARGsome_met(s2es) =>
  jsonify("F3ARGsome_met", "s2es", jsonize_list<s2exp>(s2es))
//
| F3ARGsome_dyn(npf, d3ps) =>
  jsonify("F3ARGsome_dyn", ("npf", "d3ps"),
    (
      jsonize(npf),
      jsonize_list<d3pat>(d3ps)
    )
  )
| F3ARGsome_sta(s2vs, s2ps) =>
  jsonify("F3ARGsome_sta", ("s2vs", "s2ps"),
    (
      jsonize_list<s2var>(s2vs),
      jsonize_list<s2exp>(s2ps)
    )
  )
//
) (* end of [jsonize_f3arg] *)
end

implement
jsonize_d3exp
  (x0) =
node("d3exp", res) where
val res =
(
case+
x0.node() of
//
| D3Eint(tok) =>
  jsonify("D3Eint", "tok", jsonize(tok))
| D3Ebtf(tok) =>
  jsonify("D3Ebtf", "tok", jsonize(tok))
| D3Echr(tok) =>
  jsonify("D3Echr", "tok", jsonize(tok))
| D3Eflt(tok) =>
  jsonify("D3Eflt", "tok", jsonize(tok))
| D3Estr(tok) =>
  jsonify("D3Estr", "tok", jsonize(tok))
//
| D3Etop(tok) =>
  jsonify("D3Etop", "tok", jsonize(tok))
//
| D3Evar(d2v1) =>
  jsonify("D3Evar", "d2v1", jsonize(d2v1))
//
| D3Econ1(d2c1) =>
  jsonify("D3Econ1", "d2c1", jsonize(d2c1))
| D3Ecst1(d2c1) =>
  jsonify("D3Ecst1", "d2c1", jsonize(d2c1))
//
| D3Econ2(d2cs) =>
  jsonify("D3Econ2", "d2cs", jsonize_list<d2con>(d2cs))
| D3Ecst2(d2cs) =>
  jsonify("D3Ecst2", "d2cs", jsonize_list<d2cst>(d2cs))
//
| D3Esym0
  (d1e1, dpis) =>
(*
  jsonify("D3Esym0", d1e1)
*)
(*
  jsonify("D3Esym0", d1e1, dpis)
*)
// (*
  let
  val t2p0 = x0.type()
  in
  jsonify("D3Esym0", ("d1e1", "t2p0"), (jsonize(d1e1), jsonize(t2p0)))
  end
// *)
//
| D3Efcst(d2c1) =>
  jsonify("D3Efcst", "d2c1", jsonize(d2c1))
//
| D3Etcst
  (d2c1, ti3a, ti2s) =>
  jsonify("D3Etcst", ("d2c1", "ti3a", "ti2s"),
    (jsonize(d2c1), jsonize(ti3a), jsonize_list<ti2arg>(ti2s))
  )
//
| D3Etimp
  (d2e1, tsub1, d2c2, tsub2) =>
  jsonify("D3Etimp", ("d2e1", "tsub1", "d2c2", "tsub2"),
    (
      jsonize(d2e1),
      jsonize_list<t2ype>(tsub1),
      jsonize(d2c2),
      jsonize_list<t2ype>(tsub2)
    )
  )
//
| D3Esap0
  (d3e1, s2es) =>
  jsonify("D3Esap0", ("d3e1", "s2es"),
    (
      jsonize(d3e1),
      jsonize_list<s2exp>(s2es)
    )
  )
| D3Esap1
  (d3e1, s2es) =>
  jsonify("D3Esap1", ("d3e1", "s2es"),
    (
      jsonize(d3e1),
      jsonize_list<s2exp>(s2es)
    )
  )
//
| D3Etapp
  (d2f0, s2es) =>
  jsonify("D3Etapp", ("d2f0", "s2es"),
    (
      jsonize(d2f0),
      jsonize_list<s2exp>(s2es)
    )
  )
//
| D3Edapp
  (d3e1, npf2, d3es) =>
  jsonify("D3Edapp", ("d3e1", "npf2", "d3es"),
    (
      jsonize(d3e1),
      jsonize(npf2),
      jsonize_list<d3exp>(d3es)
    )
  )
//
| D3Eproj
  (d3e1, lab2, idx2) =>
  jsonify("D3Eproj", ("d3e1", "lab2", "idx2"),
    (
      jsonize(d3e1),
      jsonize(lab2),
      jsonize(idx2)
    )
  )
//
| D3Elet(d3cs, d3e2) =>
  jsonify("D3Elet", ("d3cs", "d3e2"),
    (
      jsonize_list<d3ecl>(d3cs),
      jsonize(d3e2)
    )
  )
| D3Ewhere(d3e1, d3cs) =>
  jsonify("D3Ewhere", ("d3e1", "d3cs"),
    (
      jsonize(d3e1),
      jsonize_list<d3ecl>(d3cs)
    )
  )
//
| D3Eseqn(d3es, d3e2) =>
  jsonify("D3Eseqn", ("d3es", "d3e2"),
    (
      jsonize_list<d3exp>(d3es),
      jsonize(d3e2)
    )
  )
//
| D3Etuple
  (knd1, npf2, d3es) =>
  jsonify("D3Etuple", ("knd1", "npf2", "d3es"),
    (
      jsonize(knd1),
      jsonize(npf2),
      jsonize_list<d3exp>(d3es)
    )
  )
//
| D3Eassgn
  (d3e1, d3e2) =>
  jsonify("D3Eassgn", ("d3e1", "d3e2"), (jsonize(d3e1), jsonize(d3e2)))
//
| D3Edtsel
  (lab0, dpis, npf2, arg3) =>
  (
  case+
  arg3 of
  |
  None() =>
  jsonify("D2Edtsel", ("lab0", "dpis"),
    (
      jsonize(lab0),
      jsonize_list<d2pitm>(dpis)
    )
  )
  |
  Some(d3es) =>
  jsonify("D2Edtsel", ("lab0", "dpis", "npf2", "d3es"),
    (
      jsonize(lab0),
      jsonize_list<d2pitm>(dpis),
      jsonize(npf2),
      jsonize_list<d3exp>(d3es)
    )
  )
  )
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  jsonify("D3Eif0", ("d3e1", "d3e2", "opt3"),
    (
      jsonize(d3e1),
      jsonize(d3e2),
      jsonize_option<d3exp>(opt3)
    )
  )
//
| D3Ecase
  (knd0, d3e1, dcls) =>
  jsonify("D3Ecase", ("knd0", "d3e1", "dcls"),
    (
      jsonize(knd0),
      jsonize(d3e1),
      jsonize_list<d3clau>(dcls)
    )
  )
//
| D3Elam
  (knd, f3as, tres, arrw, body) =>
  jsonify("D3Elam", ("knd", "f3as", "tres", "arrw", "body"),
    (
      jsonize(knd),
      jsonize_list<f3arg>(f3as),
      jsonize(tres),
      jsonize(arrw),
      jsonize(body)
    )
  )
| D3Efix
  (knd, fid, f3as, tres, arrw, body) =>
  jsonify("D3Efix", ("knd", "fid", "f3as", "tres", "arrw", "body"),
    (
      jsonize(knd),
      jsonize(fid),
      jsonize_list<f3arg>(f3as),
      jsonize(tres),
      jsonize(arrw),
      jsonize(body)
    )
  )
//
| D3Eaddr(d3e1) =>
  (
   jsonify("D3Eaddr", "d3e1", jsonize(d3e1))
  )
| D3Efold(d3e1) =>
  (
   jsonify("D3Efold", "d3e1", jsonize(d3e1))
  )
//
| D3Eeval
  (knd, d3e1) =>
  jsonify("D3Eeval", ("knd", "d3e1"), (jsonize(knd), jsonize(d3e1)))
//
| D3Elazy(d3e1) =>
  (
   jsonify("D3Elazy", "d3e1", jsonize(d3e1))
  )
| D3Ellazy(d3e1, opt2) =>
  jsonify("D3Ellazy", ("d3e1", "opt2"),
    (
      jsonize(d3e1),
      jsonize_option<d3exp>(opt2)
    )
  )
//
| D3Eanno(d3e1, s2e2) =>
  jsonify("D3Eanno", ("d3e1", "s2e2"), (jsonize(d3e1), jsonize(s2e2)))
//
| D3Eflat(d3e1) =>
  (
   jsonify("D3Eflat", "d3e1", jsonize(d3e1))
  )
| D3Etalf(d3e1) =>
  (
   jsonify("D3Etalf", "d3e1", jsonize(d3e1))
  )
//
| D3Elcast(d3e1, lab2) =>
  jsonify("D3Elcast", ("d3e1", "lab2"), (jsonize(d3e1), jsonize(lab2)))
| D3Etcast(d3e1, t2p2) =>
  jsonify("D3Etcast", ("d3e1", "t2p2"), (jsonize(d3e1), jsonize(t2p2)))
//
| D3Enone0() =>
  jsonify("D3Enone0")
| D3Enone1(d2esrc) =>
  jsonify("D3Enone1", "d2esrc", jsonize(d2esrc))
| D3Enone2(d3esrc) =>
  jsonify("D3Enone2", "d3esrc", jsonize(d3esrc))
//
)
end

implement
jsonize_d3gua
  (x0) =
node("d3gua", res) where
val res =
(
case+
x0.node() of
| D3GUAexp(d3e) =>
  jsonify("D3GUAexp", "d3e", jsonize(d3e))
| D3GUAmat(d3e, d3p) =>
  jsonify("D3GUAmat", ("d3e", "d3p"), (jsonize(d3e), jsonize(d3p)))
) (* end of [jsonize_d3gua] *)
end

implement
jsonize_d3clau
  (x0) =
node("d3clau", res) where
val res =
(
case+
x0.node() of
//
| D3CLAUpat(d3gp) =>
  jsonify("D3CLAUpat", "d3gp", jsonize(d3gp))
//
| D3CLAUexp(d3gp, d0e0) =>
  jsonify("D3CLAUexp", ("d3gp", "d0e0"), (jsonize(d3gp), jsonize(d0e0)))
//
) (* end of [jsonize_d3clau] *)
end

implement
jsonize_d3gpat
  (x0) =
node("d3gpat", res) where
val res =
(
case+
x0.node() of
//
| D3GPATpat(d3p) =>
  jsonify("D3GPATpat", "d3p", jsonize(d3p))
//
| D3GPATgua(d3p, d3gs) =>
  jsonify("D3GPATgua", ("d3p", "d3gs"),
    (
      jsonize(d3p),
      jsonize_list<d3gua>(d3gs)
    )
  )
//
) (* end of [jsonize_d3gpat] *)
end

local

implement jsonize_val<t2ype> = jsonize_t2ype

in

implement
jsonize_ti3arg
  (x0) =
node("ti3arg", res) where
val res =
(
case+ x0 of
| TI3ARGnone() =>
  jsonify("TI3ARGnone")
| TI3ARGsome(t2ps) =>
  jsonify("TI3ARGnone", "t2ps", jsonize_list<t2ype>(t2ps))
)
end

end


local

implement
jsonize_val<d3ecl> = jsonize_d3ecl
implement
jsonize_val<v3aldecl> = jsonize_v3aldecl
implement
jsonize_val<v3ardecl> = jsonize_v3ardecl
implement
jsonize_val<f3undecl> = jsonize_f3undecl

in(*in-of-local*)

implement
jsonize_d3ecl
  (x0) =
node("d3ecl", res) where
val res =
(
//
case+
x0.node() of
//
| D3Cd2ecl(d2c) =>
  jsonify("D3Cd2ecl", "d2c", jsonize(d2c))
//
| D3Cstatic
  (tok, d3c) =>
  jsonify("D3Cstatic", "d3c", jsonize(d3c))
| D3Cextern
  (tok, d3c) =>
  jsonify("D3Cextern", "d3c", jsonize(d3c))
//
| D3Cinclude
  (tok, src, knd, fopt, body) =>
  (
  jsonify("D3Cinclude", ("tok", "src", "knd", "fopt", "body"),
    (
      jsonize(tok),
      jsonize(src),
      jsonize(knd),
      jsonize_option<filpath>(fopt),
      jsonize(body)
    )
  )
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<d3cls>)"): string
  }
//
| D3Clocal(head, body) =>
  jsonify("D3Clocal", ("head", "body"),
    (
      jsonize_list<d3ecl>(head),
      jsonize_list<d3ecl>(body)
    )
  )
//
| D3Cvaldecl
  (knd, mopt, v3ds) =>
  jsonify("D3Cvaldecl", ("knd", "mopt", "v3ds"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<v3aldecl>(v3ds)
    )
  )
| D3Cvardecl
  (knd, mopt, v3ds) =>
  jsonify("D3Cvardecl", ("knd", "mopt", "v3ds"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<v3ardecl>(v3ds)
    )
  )
//
| D3Cfundecl
  (knd, mopt, tqas, f3ds) =>
  jsonify("D3Cfundecl", ("knd", "mopt", "tqas", "f3ds"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<tq2arg>(tqas),
      jsonize_list<f3undecl>(f3ds)
    )
  )
//
| D3Cimpdecl1
  ( knd, mopt, sqas, tqas, id2c, ti3a, ti2s, f3as, res0, d3e0) =>
  jsonify("D3Cimpdecl1",
    ("knd", "mopt", "sqas", "tqas", "id2c", "ti3a", "ti2s", "f3as", "res0", "d3e0"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<sq2arg>(sqas),
      jsonize_list<tq2arg>(tqas),
      jsonize(id2c),
      jsonize(ti3a),
      jsonize_list<ti2arg>(ti2s),
      jsonize_list<f3arg>(f3as),
      jsonize(res0),
      jsonize(d3e0)
    )
  )
| D3Cimpdecl2
  ( knd, mopt, sqas, tqas, id2c, ti3a, ti2s, f3as, res0, d3e0) =>
  jsonify("D3Cimpdecl2",
    ("knd", "mopt", "sqas", "tqas", "id2c", "ti3a", "ti2s", "f3as", "res0", "d3e0"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<sq2arg>(sqas),
      jsonize_list<tq2arg>(tqas),
      jsonize(id2c),
      jsonize(ti3a),
      jsonize_list<ti2arg>(ti2s),
      jsonize_list<f3arg>(f3as),
      jsonize(res0),
      jsonize(d3e0)
    )
  )
| D3Cimpdecl3
  ( knd, mopt, sqas, tqas, id2c, ti3a, ti2s, f3as, res0, d3e0) =>
  jsonify("D3Cimpdecl3",
    ("knd", "mopt", "sqas", "tqas", "id2c", "ti3a", "ti2s", "f3as", "res0", "d3e0"),
    (
      jsonize(knd),
      jsonize(mopt),
      jsonize_list<sq2arg>(sqas),
      jsonize_list<tq2arg>(tqas),
      jsonize(id2c),
      jsonize(ti3a),
      jsonize_list<ti2arg>(ti2s),
      jsonize_list<f3arg>(f3as),
      jsonize(res0),
      jsonize(d3e0)
    )
  )
//
| D3Cnone0() =>
  jsonify("D3Cnone0")
| D3Cnone1(d3csrc) =>
  jsonify("D3Cnone1", "d3csrc", jsonize(d3csrc))
)
end
//
end // end of [local]


implement
jsonize_t2pcast
  (x0) =
node("t2pcats", res) where
val res =
(
case+ x0 of
| T2PCASTnone() =>
  jsonify("T2PCASTnone")
| T2PCASTsome(t2p1, t2p2) =>
  jsonify("T2PCASTsome", ("t2p1", "t2p2"), (jsonize(t2p1), jsonize(t2p2)))
) (* end of [jsonize_t2pcast] *)
end

implement
jsonize_v3aldecl
  (x0) = let
//
val+V3ALDECL(rcd) = x0
//
in
node("v3aldecl", res) where
val res =
  jsonify("V3ALDECL", ("pat", "def", "wtp"),
    (
      jsonize(rcd.pat),
      jsonize_option<d3exp>(rcd.def),
      jsonize_option<s2exp>(rcd.wtp)
    )
  )
end
end // end of [jsonize_v3aldecl]


implement
jsonize_v3ardecl
  (x0) = let
//
val+V3ARDECL(rcd) = x0
//
in
node("v3ardecl", res) where
val res =
  jsonify("V3ARDECL", ("d2v", "wth", "res", "ini"),
    (
      jsonize(rcd.d2v),
      jsonize_option<d2var>(rcd.wth),
      jsonize_option<s2exp>(rcd.res),
      jsonize_option<d3exp>(rcd.ini)
    )
  )
end
end // end of [jsonize_v3ardecl]


implement
jsonize_f3undecl
  (x0) = let
//
val+F3UNDECL(rcd) = x0
//
in
node("f3undecl", res) where
val res =
  jsonify("F3UNDECL", ("nam", "d2c", "arg", "res", "def", "ctp", "wtp"),
    (
      jsonize(rcd.nam),
      jsonize(rcd.d2c),
      jsonize_list<f2arg>(rcd.a2g),
      jsonize(rcd.res),
      jsonize_option<d3exp>(rcd.def),
      jsonize(rcd.ctp),
      jsonize_option<s2exp>(rcd.wtp)
    )
  )
end
end // end of [jsonize_f3undecl]
