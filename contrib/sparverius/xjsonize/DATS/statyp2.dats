#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp0.sats"
#staload "{$XATS}/SATS/staexp1.sats"
#staload "{$XATS}/SATS/staexp2.sats"
#staload "{$XATS}/SATS/statyp2.sats"

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"

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
jsonize_val<labt2ype> = jsonize_labt2ype
implement
jsonize_val<t2ype> = jsonize_t2ype
implement
jsonize_val<s2var> = jsonize_s2var

in (* in-of-local *)
//
implement
jsonize_t2ype
  (x0) =
(
case+
x0.node() of
//
| T2Pbas(sym) =>
  (* fprint!(out, "T2Pbas(", sym, ")") *)
  jsonify("T2Pbas", "sym", jsonize(sym))
  (* where val _ = $showtype(sym) end *)
| T2Pcst(s2c) =>
  (* fprint!(out, "T2Pcst(", s2c, ")") *)
  jsonify("T2Pcst", "s2c", jsonize(s2c))
| T2Pvar(s2v) =>
  (* fprint!(out, "T2Pvar(", s2v, ")") *)
  jsonify("T2Pvar", "s2v", jsonize(s2v))
//
| T2Pxtv(xtv) =>
  let
(*
    val t2p = "..."
*)
    val t2p = t2xtv_get_type(xtv)
  in
    case+
    t2p.node() of
    | T2Pnone0() =>
      (
      jsonify("T2Pxtv", "xtv", rst)
      (* end *)
      (* fprint! *)
      (* (out, "T2Pxtv(", stm, ")") *)
      (* )  *)
      where
      {
        val stm = xtv.stamp((*void*))
        val rst = $STM.jsonize_stamp(stm)
      }
      )
    | _ (* else *) =>
      (* fprint!(out, "T2Pxtv(", t2p, ")") *)
      jsonify("T2Pxtv", "xtv", rst)
      where
      {
        val rst = jsonize(t2p)
      }

  end
//
| T2Papp(t2p1, t2ps) =>
  jsonify(
    "T2Papp", ("t2p1", "t2ps"),
    (jsonize(t2p1), jsonize_list<t2ype>(t2ps))
  )
| T2Plft(t2p1) =>
  jsonify("T2Plft", "t2p1", jsonize("..."))

| T2Plam(s2vs, t2p1) =>
  jsonify(
    "T2Plam", ("s2vs", "t2p1"),
    (jsonize_list<s2var>(s2vs),jsonize(t2p1))
  )
//
| T2Pfc2(fc2) =>
  jsonify("T2pfc2", "fc2", jstr("..."))
| T2Pfun(fc2, npf, arg, res) =>
  jsonify(
    "T2Pfun", ("fc2", "npf", "arg", "res"),
    (
      jsonize(fc2),
      jsonize(npf),
      jsonize_list<t2ype>(arg),
      jsonize(res)
    )
  )
//
| T2Pexi(s2vs, body) =>
  jsonify(
    "T2Pexi", ("s2vs","body"),
    (jsonize_list<s2var>(s2vs), jsonize(body))
  )

| T2Puni(s2vs, body) =>
  jsonify(
    "T2Puni", ("s2vs","body"),
    (jsonize_list<s2var>(s2vs), jsonize(body))
  )
//
| T2Ptyext(tnm1, t2ps) =>
  jsonify(
    "T2Ptyext", ("tnm1", "t2ps"),
    (jsonize(tnm1), jsonize_list<t2ype>(t2ps))
  )
| T2Ptyrec(knd1, npf2, lt2ps) =>

  jsonify(
    "T2Ptyrec", ("knd1", "npf2", "lt2ps"),
    (
      jsonize((*knd1*)"..."),
      jsonize(npf2),
      jsonize_list<labt2ype>(lt2ps)
    )
  )
//
| T2Pnone0() => //fprint!(out, "T2Pnone0(", ")")
  jsonify("T2Pnone0")
| T2Pnone1(s2e) => //fprint!(out, "T2Pnone1(", s2e, ")")
  jsonify("T2Pnone1", "s2e", jsonize(s2e))

//
)

end


implement
jsonize_labt2ype
  (lt2p) =
(
case+ lt2p of
| TLABELED(l0, t2p) => //fprint!(out, l0, "=", t2p)
  jsonify("TLABELED", ("l0", "t2p"), (jsonize(l0), jsonize(t2p)))
  (* where val _ = $showtype(l0) end *)
) (* end of [fprint_labt2ype] *)
