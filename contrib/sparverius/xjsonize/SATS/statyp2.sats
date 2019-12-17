#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/statyp2.sats"

#staload "./json.sats"

fun
jsonize_labt2ype: jsonize_type(labt2ype)
overload jsonize with jsonize_labt2ype

fun
jsonize_t2ype: jsonize_type(t2ype)
overload jsonize with jsonize_t2ype
