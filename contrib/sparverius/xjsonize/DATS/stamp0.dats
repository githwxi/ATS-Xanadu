

#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

(*
#include "./../HATS/libxatsopt.hats"
*)
#staload "./../SATS/stamp0.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/stamp0.sats"
#staload _ = "{$XATS}/DATS/stamp0.dats"




implement
jsonize_stamp(x0) =
(
(*
  jsonval_labval2("node", nd, "val", vl) where
  {
    val nd = jstr("stamp")
    val vl = jsonize(tostring_uint(stamp2uint(x0)))
  }
*)
jsonval_labval1("stamp", jsonize(tostring_uint(stamp2uint(x0))))
)

implement
labify_stamp(x0) = ("stamp", jsonize(tostring_uint(stamp2uint(x0))))
