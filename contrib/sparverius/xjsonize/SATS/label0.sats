#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/label0.sats"

#staload "./json.sats"

fun
jsonize_label : jsonize_type(label)
overload jsonize with jsonize_label
