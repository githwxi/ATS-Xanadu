#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"


#define XATS_targetloc "./../../../../srcgen/xats"


#staload "{$XATS}/SATS/locinfo.sats"


#staload "./../SATS/locinfo.sats"


implement labify_loc_t(loc) = @("loc", jsonize_loc_t(loc))

implement
jsonize_loc_t(loc) =
(
  JSONlablist($list{labjsonval}(
    ("path",
      jsonize($FIL.filpath_get_full1(loc.filpath()))
    ),
    ("beg", jsonize(loc.beg_ntot()+1))
      (* JSONlablist($list{labjsonval}( *)
      (*   ("chrs", jsonize(loc.beg_ntot()+1)), *)
      (*   ("line", jsonize(loc.beg_nrow()+1)), *)
      (*   ("offs", jsonize(loc.beg_ncol())) *)
      (* )) *)
    (* ) *)
    ,
    ("end", jsonize(loc.end_ntot()+1))
      (* JSONlablist($list{labjsonval}( *)
      (*   ("chrs", jsonize(loc.end_ntot()+1)), *)
      (*   ("line", jsonize(loc.end_nrow()+1)), *)
      (*   ("offs", jsonize(loc.end_ncol())) *)
      (* )) *)
    (* ) *)
  ))
)


implement
jsonize_locrange(loc) =
(
  (* jsonval_labval1("pos", *)
(*
    JSONlablist($list{labjsonval}(
      ("beg",
        JSONlablist($list{labjsonval}(
          ("chrs", jsonize(loc.beg_ntot()+1)),
          ("line", jsonize(loc.beg_nrow()+1)),
          ("offs", jsonize(loc.beg_ncol()))
        ))
      ),
      ("end",
        JSONlablist($list{labjsonval}(
          ("chrs", jsonize(loc.end_ntot()+1)),
          ("line", jsonize(loc.end_nrow()+1)),
          ("offs", jsonize(loc.end_ncol()))
        ))
      )
    ))
*)
  JSONlablist($list{labjsonval}(
    ("path", jsonize($FIL.filpath_get_full1(loc.filpath()))),
    ("beg", jsonize(loc.beg_ntot()+1)),
    ("end", jsonize(loc.end_ntot()+1))
  ))

  (* ) *)
)

(*
implement
jsonize_location(loc) = res where
  val fp0 = location_filpath(loc)
  val jfil = jsonize($FIL.filpath_get_full1(fp0))
  val res = jsonval_labval1("loc", jfil)
end
*)

(*
implement
jsonize_location(loc) = res where
  val fp0 = location_filpath(loc)
  val jfil = jsonize($FIL.filpath_get_full1(fp0))
  val res = jsonval_labval1("loc", jfil)

  val res = node("loc", rst) where
    val fst = ("path", jfil)
    val snd = ("pos", jsonize_locrange(loc))
    val rst = JSONlablist($list{labjsonval}(fst, snd))
  end
end
*)

implement
jsonize_location(loc) = res where
  val fp0 = location_filpath(loc)
  val jfil = jsonize($FIL.filpath_get_full1(fp0))
  (* val res = jsonval_labval1("loc", jfil) *)

  (* val fst = ("path", jfil) *)
  (* val snd = ("pos", jsonize_locrange(loc)) *)
  (* val res = JSONlablist($list{labjsonval}(fst, snd)) *)

  val res = jsonize_locrange(loc)
end
