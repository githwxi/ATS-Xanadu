
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

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

#staload "./../SATS/statyp2.sats"

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

#staload "./../SATS/dynexp3.sats"


local

implement jsonize_val<t2ype> = jsonize_t2ype

in

implement
jsonize_ti3arg
  (x0) =
(
case+ x0 of
| TI3ARGnone() =>
  jsonify("TI3ARGnone")
| TI3ARGsome(t2ps) =>
  jsonify("TI3ARGnone", "t2ps", jsonize_list<t2ype>(t2ps))
)

end
