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
#staload "{$XATS}/SATS/dynexp3.sats"
(* #staload "{$XATS}/SATS/staexp2.sats" *)

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/statyp2.sats"

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/intrep0.sats"


implement
jsonize_ir0pat
  (x0) =
(
case+ x0.node() of
//
| IR0Pint(tok) =>
  (* fprint!(out, "IR0Pint(", tok, ")") *)
  jsonify("IR0Pint", "tok", jsonize(tok))
| IR0Pbtf(tok) =>
  (* fprint!(out, "IR0Pbtf(", tok, ")") *)
  jsonify("IR0Pbtf", "tok", jsonize(tok))
//
| IR0Pany() =>
  (* fprint!(out, "IR0Pany(", ")") *)
  jsonify("IR0Pany")
| IR0Pvar(d2v) =>
  (* fprint!(out, "IR0Pvar(", d2v, ")") *)
  jsonify("IR0Pvar", "d2v", jsonize(d2v))
//
| IR0Pcapp(d2c0, irps) =>
(*
  fprint!
  ( out
  , "IR0Pcapp(", d2c0, "; ", irps, ")")
*)
  jsonify("IR0Pcapp", ("d2c0", "irps"), rst) where
    val jd2c0 = jsonize(d2c0)
    val jirps = jstr("...")
    val rst = (jd2c0, jirps)
  end
//
| IR0Ptuple(knd, irps) =>
  (* fprint! *)
  (* ( out *)
  (* , "IR0Ptuple(", knd, "; ", irps, ")") *)
  jsonify("IR0Ptuple", ("knd", "irps"), rst) where
    val jd2c0 = jsonize(knd)
    val jirps = jstr("...")
    val rst = (jd2c0, jirps)
  end

//
| IR0Pnone0() =>
    (* fprint!(out, "IR0Pnone0(", ")") *)
    jsonify("IR0Pnone0")
  // end of [IR0Pnone0]
| IR0Pnone1(d3p) =>
    (* fprint!(out, "IR0Pnone1(", d3p, ")") *)
    jsonify("IR0Pnone1", "d3p", rst) where
      val rst = jstr("...")
    end
  // end of [IR0Pnone1]
//
)


implement jsonize_val<ir0pat>(x) = jsonize_ir0pat(x)

implement
jsonize_ir0arg
  (x0) =
let
val+IR0ARGsome(npf, irps) = x0
in
(*
fprint!
(out, "IR0ARGsome(", npf, "; ", irps, ")")
*)
jsonify("IR0ARGsome", ("npf", "irps"), rst) where
  val jnpf = jsonize(npf)
  val jirps = jsonize_list<ir0pat>(irps)
  val rst = (jnpf, jirps)
end
end


local

implement jsonize_val<ir0exp> = jsonize_ir0exp
implement jsonize_val<ir0dcl> = jsonize_ir0dcl
implement jsonize_val<t2ype> = jsonize_t2ype
implement jsonize_val<ir0arg> = jsonize_ir0arg

in
//
implement
jsonize_ir0exp(x0) =
  (* (x0) = jsonval_labval2("node", jsonize("ir0exp"), "val", res) where *)
  (* jsonval_labval1("ir0exp", res) where *)
  res where
val res =
(
case+
x0.node() of
//
| IR0Eint(tok) =>
  jsonval_labval2("node", jsonize("IR0Eint"), "val", JSONlist(list_nil()))
  (* jsonize("IR0Eint") //, tok, ")") *)
| IR0Ebtf(tok) =>
  (* jsonize("IR0Ebtf") //, tok, ")") *)
  jsonify("IR0Ebtf", "tok", jsonize(tok))
(*
| IR0Eflt(tok) =>
  jsonize("IR0Eflt") //, tok, ")")
*)
| IR0Estr(tok) =>
  (* let val _ = $showtype(tok) in *)
  (* jsonize("IR0Estr") //, tok, ")") *)
  jsonify("IR0Estr", "tok", jsonize(tok))
  (* end *)
//
| IR0Evar(d2v) =>
  (* jsonize("IR0Evar") //, d2v, ")") *)
  jsonify("IR0Evar", "d2v", jsonize(d2v))
//
| IR0Econ1(d2c) =>
  (* jsonize("IR0Econ1") //, d2c, ")") *)
  (* where *)
  (* val _ = $showtype(d2c) *)
  (* end *)
  jsonify("IR0Econ1", "d2c", jsonize(d2c))

| IR0Ecst1(d2c) =>
  (* jsonize("IR0Ecst1") //, d2c, ")") *)
  jsonify("IR0Ecst1", "d2c", jsonize(d2c))
//
| IR0Efcst(d2c) =>
  (* jsonize("IR0Efcst") //, d2c, ")") *)
  jsonify("IR0Efst1", "d2c", jsonize(d2c))
//
| IR0Etcst
  (d2c1, ti3a, ti2s) =>
  (* jsonize("IR0Etcst") //, d2c1, "; ", ti3a, "; [", ti2s, "])") *)
  (* jsonify("IR0Etcst", ("d2c1", "ti3a", "ti2s"), rst) where *)
  jsonify("IR0Etcst", args, rst) where
    val args = (
      "d2c1",
      "ti3a",
      "ti2s"
    )
    val rst = (
      fst,
      snd,
      thd
    ) where
      val fst = jsonize(d2c1)
      val snd = jsonize(ti3a) //jstr("...")
      (* val _ = $showtype(ti3a) *)
      val _ = $showtype(ti2s)
      val thd = jstr("...")
    end
  end
| IR0Etimp
  ( ire1
  , targ, irc2, tsub) =>
  (* jsonize("IR0Etimp") //, ire1, "; [", targ, "]; ", irc2, "; [", tsub, "])") *)
  jsonify("IR0Etimp", args, rst) where
    (* val _ = $showtype(irc2) *)
    val args = (
      "ire1",
      "targ",
      "irc2",
      "tsub"
    )
    val rst = (
      fst,
      snd,
      thd,
      frh
    ) where
      val fst = jsonize(ire1)
      val snd = jsonize_list<t2ype>(targ)
      val thd = jsonize(irc2)
      val frh = jsonize_list<t2ype>(tsub)
    end
  end
//
| IR0Edapp
  (irf0, npf1, ires) =>
(*
  let
    (* val _ = $showtype(irf0) *)
    (* val _ = $showtype(npf1) // int *)
    (* val _ = $showtype(ires) // int *)
    val json_irf0 = jsonize(irf0)
    val json_npf1 = jsonize(npf1)
    val ires0 = list_map<ir0exp><jsonval>(ires) where
        implement
        list_map$fopr<ir0exp><jsonval>(x) = jsonize(x)
      end
    val ires0 = list_of_list_vt(ires0)
    val json_ires = JSONlist(ires0)
    val xys0 =
    list_cons(json_irf0, list_cons(json_npf1, list_cons(json_ires, list_nil())))
  in
  (* jsonize("IR0Edapp") //, irf0, "; ", npf1, "; [", ires, "])") *)
  jsonval_labval2("node", jsonize("IR0Edapp"), "val", JSONlist(xys0))
  end
*)
  (* jsonify("IR0Edapp", ("irf0", "npf1", "ires"), rst) where *)
  (*   val jirf0 = jsonize(irf0) *)
  (*   val jnpf1 = jsonize(npf1) *)
  (*   val jires = jsonize_list<ir0exp>(ires) *)
  (*   val rst = (jirf0, jnpf1, jires) *)
  (* end *)
  jsonify("IR0Edapp", args, rst) where
    val args = (
      "irf0",
      "npf1",
      "ires"
    )
    val rst = (
      fst,
      snd,
      thd
    ) where
      val fst = jsonize(irf0)
      val snd = jsonize(npf1)
      val thd = jsonize_list<ir0exp>(ires)
    end
  end


//
| IR0Eproj
  (ire1, lab2, idx2) =>
  (* jsonize("IR0Eproj") //, ire1, "; ", lab2, "; ", idx2, ")") *)
  jsonify("IR0Eproj", args, rst) where
    val args = (
      "ire1",
      "lab2",
      "idx2"
    )
    val rst = (fst,snd,thd) where
      val fst = jsonize(ire1)
      (* val _ = $showtype(idx2) *)
      val snd = jsonize(lab2)
      val thd = jsonize(idx2)
    end
  end
//
| IR0Elet(irds, ire1) =>
  (* jsonize("IR0Elet") //, irds, "; ", ire1, ")") *)
  jsonify("IR0Elet", args, rst) where
    (* val _ = $showtype(irds) *)
    val args = (
      "irds",
      "ire1"
    )
    val rst = (
      fst,
      snd
    ) where
      val fst = jsonize_list<ir0dcl>(irds)
      val snd = jsonize(ire1)
    end
  end
| IR0Ewhere(ire1, irds) =>
  (* jsonize("IR0Ewhere") //, ire1, "; [", irds, "])") *)
  jsonify("IR0Ewhere", args, rst) where
    val args = (
      "ire1",
      "irds"
    )
    val rst = (
      fst,
      snd
    ) where
      val fst = jsonize(ire1)
      val snd = jsonize_list<ir0dcl>(irds)
  end
  end
//
| IR0Etuple
  (knd0, npf1, ires) =>
  (* jsonize("IR0Etuple") //, knd0, "; ", npf1, "; [", ires, "])") *)
  jsonify("IR0Etuple", args, rst) where
    val args = (
      "knd0",
      "npf1",
      "ires"
    )
    val rst = (fst,snd,thd) where
      val fst = jstr("...")
      val snd = jsonize(npf1)
      val thd = jsonize_list<ir0exp>(ires)
      (* val _ = $showtype(ires) *)
    end
  end

//
| IR0Eif0
  (ire1, ire2, opt3) =>
  (* jsonize("IR0Eif0") //, ire1, "; ", ire2, "; ", opt3, ")") *)
  jsonify("IR0Eif0", args, rst) where
    val args = (
      "ire1",
      "ire2",
      "opt3"
    )
    val rst = (fst,snd,thd) where
      val fst = jsonize(ire1)
      val snd = jsonize(ire2)
      val thd = jstr("...")
    end
  end
//
| IR0Ecase
  (knd0, ire1, ircls) =>
  (* jsonize("IR0Ecase") //, knd0, "; ", ire1, "; ", "...", ")") *)
  jsonify("IR0Ecase", args, rst) where
    (* val _ = $showtype(ircls) *)
    val args = (
      "knd0",
      "ire1",
      "ircls"
    )
    val rst = (fst,snd,thd) where
      val fst = jstr("...")
      val snd = jstr("...")
      val thd = jstr("...")
    end
  end
//
| IR0Elam
  (knd0, farg, body) =>
  (* jsonize("IR0Elam") //, knd0, "; [", farg, "]; ", body, ")") *)
  jsonify("IR0Elam", args, rst) where
    val args = (
      "knd0",
      "farg",
      "body"
    )
    val rst = (fst,snd,thd) where
      val fst = jsonize(knd0)
      (* val _ = $showtype(body) *)
      val snd = jsonize_list<ir0arg>(farg)
      val thd = jsonize(body)
    end
  end
| IR0Efix
  (knd0, d2v0, farg, body) =>
  (* jsonize("IR0Efix") //, knd0, "; ", d2v0, "; [", farg, "]; ", body, ")") *)
  jsonify("IR0Efix", args, rst) where
    val args = (
      "knd0",
      "d2v0",
      "farg",
      "body"
    )
    val rst = (
      fst,
      snd,
      thd,
      frh
    ) where
      val fst = jstr("...")
      val snd = jstr("...")
      val thd = jstr("...")
      val frh = jstr("...")
    end
  end
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
end

end


implement
jsonize_ir0gua
  (x0) =
(
case+
x0.node() of
| IR0GUAexp(ir0e) =>
  (* fprint! *)
  (* (out, "IR0GUAexp(", ir0e, ")") *)
  jsonify("IR0GUAexp", "ir0e", jsonize(ir0e))
| IR0GUAmat(ir0e, ir0p) =>
  (* fprint! *)
  (* (out, "IR0GUAmat(", ir0e, "; ", ir0p, ")") *)
  jsonify("IR0GUAmat", ("ir0e", "ir0p"),
    (
      jsonize(ir0e),
      jsonize(ir0p)
    )
  )
) (* end of [jsonize_ir0gua] *)


implement
jsonize_ir0clau
  (x0) =
(
case+
x0.node() of
//
|
IR0CLAUpat(ir0gp) =>
(* fprint! *)
(* (out, "IR0CLAUpat(", ir0gp, ")") *)
jsonify("IR0CLAUpat", "ir0gp", jsonize(ir0gp))
//
|
IR0CLAUexp(ir0gp, d0e0) =>
(* fprint! *)
(* (out, "IR0CLAUexp(", ir0gp, "; ", d0e0, ")") *)
jsonify("IR0CLAUpat", ("ir0gp", "d0e0"), (jstr("..."), jstr("...")))
//
) (* end of [jsonize_ir0clau] *)


implement jsonize_val<ir0gua> = jsonize_ir0gua

implement
jsonize_ir0gpat
  (x0) =
(
case+
x0.node() of
//
|
IR0GPATpat(ir0p) =>
(* fprint! *)
(* (out, "IR0GPATpat(", ir0p, ")") *)
jsonify("IR0GPATpat", "ir0p", jsonize(ir0p))
//
|
IR0GPATgua(ir0p, ir0gs) =>
(* fprint! *)
(* (out, "IR0GPATgua(", ir0p, "; ", ir0gs, ")") *)
jsonify("IR0CLAUpat", ("ir0p", "ir0gs"),
  (
    (* jstr("..."),  *)
    (* jstr("...") *)
    jsonize(ir0p),
    jsonize_list<ir0gua>(ir0gs)
  )
)
//
) (* end of [fprint_ir0gpat] *)
//


implement jsonize_val<ir0dcl> = jsonize_ir0dcl
implement jsonize_val<ir0fundecl> = jsonize_ir0fundecl
implement jsonize_val<tq2arg> = jsonize_tq2arg
implement jsonize_val<sq2arg> = jsonize_sq2arg
implement jsonize_val<ti2arg> = jsonize_ti2arg
implement jsonize_val<ir0arg> = jsonize_ir0arg
implement jsonize_val<ir0valdecl> = jsonize_ir0valdecl

implement
jsonize_ir0dcl(x0) =
(
case+ x0.node() of
//
| IR0Cstatic
  (tok, irc1) =>
  (* fprint!(out,"IR0Cstatic(", tok, "; ", irc1, ")") *)
  jsonify("IR0Cstatic", ("tok", "irc1"), (jsonize(tok), jstr("...")))
| IR0Cextern
  (tok, irc1) =>
  (* fprint!(out,"IR0Cextern(", tok, "; ", irc1, ")") *)
  jsonify("IR0Cextern", ("tok", "irc1"), (jsonize(tok), jstr("...")))
//
| IR0Cinclude
  (tok, src, knd, fopt, body) =>
  jsonify("IR0Cinclude", ("tok", "src", "knd", "fopt", "body"), rst) where
  (* val _ = $showtype(fopt) // filpath *)
    val jsrc = jsonize(src)
    val jknd = jsonize(knd)
    val jfopt = jstr("...")
    val jbody = (
      case+ body of
      | Some(x) => jsonize_list<ir0dcl>(x)
      | None() => JSONlist(list_nil())
    )
    val rst = (jsonize(tok), jsrc, jknd, jfopt, jbody)
  end
(*
  (
  (* fprint!(out,"IR0Cinclude(", "src= ", src, "; ", "knd= ", knd, "; ", fopt, "; ", body, ")") *)
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<irdcls>)"): string
  }
*)
//
| IR0Clocal
  (head, body) =>
  (* fprint!(out,"IR0Clocal(", head, "; ", body, ")") *)
  jsonify("IR0Clocal", ("head", "body"), rst) where
    val jhead = jstr("...")
    val jbody = jstr("...")
    val rst = (jhead, jbody)
  end
//
| IR0Cvaldecl
  (knd, mopt, irds) =>
  (* fprint!(out,"IR0Cvaldecl(", knd, "; ", mopt, "; ", irds, ")") *)
  jsonify("IR0Cvaldecl", ("knd", "mopt", "irds"), rst) where
    val jknd = jsonize(knd)
    (* val _ = $showtype(mopt) *)
    val jmopt = jstr("...")
    val jirds = jsonize_list<ir0valdecl>(irds)
    val rst = (jknd, jmopt, jirds)
  end
//
| IR0Cfundecl
  (knd, mopt, tqas, irds) =>
  (* fprint!(out,"IR0Cfundecl(", knd, "; ", mopt, "; ", tqas, "; ", irds, ")") *)
  jsonify("IR0Cfundecl", ("knd", "mopt", "tqas", "irds"), rst) where
    val jknd = jsonize(knd)
    val jmopt = jsonize(mopt)
    (* val _ = $showtype(tqas) // list tq2arg *)
    val jtqas = //jstr("...")
      jsonize_list<tq2arg>(tqas)
    (* val _ = $showtype(irds) // list ir0fundecl *)
    val jirds = //jstr("...")
      jsonize_list<ir0fundecl>(irds)
    val rst = (jknd, jmopt, jtqas, jirds)
  end
//
| IR0Cimpdecl3
  (knd, mopt, sqas, tqas, id2c, ti3a, ti2s, iras, body) =>
  (* fprint!(out,"IR0Cimpdecl3(", knd, "; ", mopt, "; ", sqas, "; ", tqas, "; ", id2c, "; ", ti3a, "; ", ti2s, "; ", iras, "; ", body, ")") *)
  jsonify("IR0Cimpdecl3", args, rst) where
    val args = ("knd", "mopt", "sqas", "tqas", "id2c", "ti3a", "ti2s", "iras", "body")
    val jknd = jsonize(knd)//jstr("...")
    val jmopt = jsonize(mopt)//jstr("...")
    val jsqas = jsonize_list<sq2arg>(sqas)
    val jtqas = jsonize_list<tq2arg>(tqas)
    val jid2c = jsonize(id2c)
    val jti3a = jsonize(ti3a)
    val jti2s = jsonize_list<ti2arg>(ti2s)
    val jiras = jsonize_list<ir0arg>(iras) where val _ = $showtype(iras) end
    val jbody = jsonize(body)
    val rst = (jknd, jmopt, jsqas, jtqas, jid2c, jti3a, jti2s, jiras, jbody)
  end

//
| IR0Cnone0() =>
  (* fprint!(out, "IR0Cnone0(", ")") *)
  jsonify("IR0Cnone0")

| IR0Cnone1(d3cl) =>
  (* fprint!(out, "IR0Cnone1(", d3cl, ")") *)
  jsonify("IR0Cnone1", "d3cl", rst) where
    val rst = jstr("...")
  end
//
) // end of jsonize_



implement
jsonize_ir0valdecl
  (x0) = let
//
val+IR0VALDECL(rcd) = x0
//
in
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
end // end of [fprint_ir0valdecl]


implement jsonize_val<f2arg> = jsonize_f2arg

implement
jsonize_ir0fundecl
  (x0) = let
//
val+IR0FUNDECL(rcd) = x0
//
in
(*
  fprint!
  ( out
  , "IR0FUNDECL@{"
  , ", nam=", rcd.nam
  , ", d2c=", rcd.d2c
  , ", a2g=", rcd.a2g
(*
  , ", a3g=", rcd.a3g
*)
  , ", def=", rcd.def, "}")
*)
jsonify("IR0FUNDECL", ("nam", "d2c", "a2g", "a3g", "def"), rst) where
  val jnam = jsonize(rcd.nam)
  val jd2c = jsonize(rcd.d2c)
  (* val _ = $showtype(rcd.a2g) *)
  val ja2g = jsonize_list<f2arg>(rcd.a2g) //jstr("...")//jsonize(rcd.a2g)
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
  (* val _ = $showtype(rcd.def) *)

  val rst = (jnam, jd2c, ja2g, ja3g, jdef)
end
end
