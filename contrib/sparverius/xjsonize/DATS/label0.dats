#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"

#staload "{$XATS}/SATS/label0.sats"
#staload "{$XATS}/DATS/label0.dats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/label0.sats"
#staload "./../SATS/symbol.sats"


implement
jsonize_label
  (l0) =
node("label", rst) where
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
