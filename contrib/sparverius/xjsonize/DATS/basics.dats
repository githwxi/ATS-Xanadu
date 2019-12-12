#include "share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/basics.sats"

#staload "./../SATS/basics.sats"


implement
jsonize_valkind
  (vlk) = lab("valkind", res) where
val res =
(
//
case+ vlk of
| VLKval() => jstr("VLKval")
| VLKvalp() => jstr("VLKvalp")
| VLKvaln() => jstr("VLKvaln")
(*
| VLKmcval() => jstr("VLKprval")
*)
| VLKprval() => jstr("VLKprval")
//
) (* end of [jsonize_valkind] *)
end

implement
jsonize_funkind
  (fnk) = lab("funkind", res) where
val res =
(
//
case+ fnk of
| FNKfn0() => jsonize("FNKfn0")
| FNKfnx() => jsonize("FNKfnx")
| FNKfn1() => jsonize("FNKfn1")
| FNKfun() => jsonize("FNKfun")
//
| FNKprfn0() => jsonize("FNKprfn0")
| FNKprfn1() => jsonize("FNKprfn1")
| FNKprfun() => jsonize("FNKprfun")
| FNKpraxi() => jsonize("FNKpraxi")
//
| FNKcastfn() => jsonize("FNKcastfn")
//
) (* end of [jsonize_funkind] *)
end


implement
jsonize_impkind
  (knd) = lab("impkind", res) where
val res =
(
case+ knd of
| IMPprf() => jsonize("IMPprf")
| IMPval() => jsonize("IMPval")
| IMPfun() => jsonize("IMPfun")
| IMPtmp() => jsonize("IMPtmp")
| IMPgen() => jsonize("IMPgen")
) (* end of [jsonize_impkind] *)
end


implement
jsonize_funclo2
  (fc2) = lab("impkind", res) where
val res =
(
case+ fc2 of
| FC2fun() =>
  jsonize("FC2fun()")
| FC2clo(knd) =>
  lab("FC2clo", jsonize(knd))(* jsonize("FC2clo(", knd, ")") *)
)
end
