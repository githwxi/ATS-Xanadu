#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/filpath.sats"


#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#staload "./../SATS/filpath.sats"


implement jsonize_filpath
  (x) =
  jsonval_labval1("fpath", jsonize(full1))
where
  val full1 = filpath_get_full1(x)
end
