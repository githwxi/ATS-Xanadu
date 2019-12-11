#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/locinfo.sats"

#staload "./json.sats"

fun
jsonize_location : jsonize_type(location)
overload jsonize with jsonize_location
