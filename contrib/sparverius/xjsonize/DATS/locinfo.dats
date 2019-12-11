#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#define XATS_targetloc "./../../../../srcgen/xats"


#staload "{$XATS}/SATS/locinfo.sats"


#staload "./../SATS/locinfo.sats"


implement
jsonize_location(loc) = res where
  val fp0 = location_filpath(loc)
  val jfil = jsonize($FIL.filpath_get_full1(fp0))
  val res = jsonval_labval1("loc", jfil)
end
