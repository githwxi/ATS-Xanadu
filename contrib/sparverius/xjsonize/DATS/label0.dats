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
#staload "{$XATS}/SATS/label0.sats"
#staload "{$XATS}/DATS/label0.dats"
(*
#staload _ = "{$XATS}/DATS/label0.dats"
*)
(*
#staload "{$XATS}/SATS/dynexp1.sats"
#staload "{$XATS}/SATS/dynexp2.sats"
#staload "{$XATS}/SATS/dynexp3.sats"
*)

#staload "{$XATS}/SATS/staexp2.sats"

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
#staload "./../SATS/label0.sats"

#staload SYM_J = "./../SATS/symbol.sats"

overload jsonize with $SYM_J.jsonize_symbol

(*
case+ l0 of
| LABint(i0) =>
| LABsym(s0) =>
*)

implement
jsonize_label
  (l0) = //labval2(jsonize("label"), rst) where
  jsonval_labval1("label", rst) where
val rst =
(
  case+ label_get_int(l0) of
  | ~None_vt() => (
      case+ label_get_sym(l0) of
      | ~None_vt() => jsonize("None")
      | ~Some_vt(sym) =>
        jsonify("LABsym", "s0", jsonize(sym))
    )
  | ~Some_vt(int) =>
    jsonify("LABint", "i0", jsonize(int))
)
end
