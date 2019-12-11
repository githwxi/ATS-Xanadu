#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#include
"./../HATS/libxatsopt.hats"

#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp0.sats"
#staload "{$XATS}/SATS/staexp0.sats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/lexing.sats"


implement jsonize_val<i0dnt>(x) = jsonize_i0dnt(x)

implement
jsonize_decmodopt
  (x0) =
(
case+ x0 of
//
| DECMODnone() =>
  jsonify("DECMODnone")
//
| DECMODsing(tok, id0) =>
  (* fprint!(out, "DECMODsing(", tok, "; ", id0, ")") *)
  jsonify("DECMODsing", ("tok", "id0"), rst) where
    (* val _ = $showtype(id0) *)
    val rst = (jsonize(tok), jsonize(id0))
  end
| DECMODlist(tok, tbeg, ids, tend) =>
  (* fprint!( out, "DECMODlist(", tok, "; ", tbeg, "; ", ids, "; ", tend, ")") *)
  jsonify("DECMODsing", ("tok", "tbeg", "ids", "tend"), rst) where
    (* val _ = $showtype(ids) *)
    val xys = jsonize_list<i0dnt>(ids)
    val rst = (jsonize(tok), jsonize(tbeg), xys, jsonize(tend))
  end
)
