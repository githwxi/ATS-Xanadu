#define XATS_targetloc "./../../../../srcgen/xats"
#staload BAS = "{$XATS}/SATS/basics.sats"

#staload "./json.sats"

fun
jsonize_dctkind : jsonize_type($BAS.dctkind)
overload jsonize with jsonize_dctkind

fun
jsonize_valkind : jsonize_type($BAS.valkind)
overload jsonize with jsonize_valkind

fun
jsonize_funkind : jsonize_type($BAS.funkind)
overload jsonize with jsonize_funkind

fun
jsonize_impkind : jsonize_type($BAS.impkind)
overload jsonize with jsonize_impkind

fun
jsonize_funclo2: jsonize_type($BAS.funclo2)
overload jsonize with jsonize_funclo2
