#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/symbol.sats"

#staload "./json.sats"

fun
jsonize_symbol : jsonize_type(symbol)
overload jsonize with jsonize_symbol

fun
labify_symbol : labify_type(symbol)
overload labify with labify_symbol
