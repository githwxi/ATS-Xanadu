#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/symbol.sats"

#staload "./../SATS/symbol.sats"


implement
jsonize_symbol(x0) =
jsonval_labval1("symbol", jsonize(x0.name()))

implement
labify_symbol(x0) = ("symbol", jsonize(x0.name()))
