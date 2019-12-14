#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/locinfo.sats"

#staload "./json.sats"



fun
jsonize_location : jsonize_type(location)
overload jsonize with jsonize_location

fun
jsonize_loc_t : jsonize_type(loc_t)
overload jsonize with jsonize_loc_t of 1

fun
labify_loc_t : labify_type(loc_t)
overload labify with labify_loc_t

fun
jsonize_locrange : jsonize_type(location)
(* overload jsonize with jsonize_locrange *)
