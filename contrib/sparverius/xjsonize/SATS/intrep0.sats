#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/intrep0.sats"

#staload "./json.sats"

fun
jsonize_ir0pat : jsonize_type(ir0pat)
overload jsonize with jsonize_ir0pat

fun
jsonize_ir0arg : jsonize_type(ir0arg)
overload jsonize with jsonize_ir0arg

fun
jsonize_ir0exp : jsonize_type(ir0exp)
overload jsonize with jsonize_ir0exp

fun
jsonize_ir0gua : jsonize_type(ir0gua)
overload jsonize with jsonize_ir0gua

fun
jsonize_ir0clau : jsonize_type(ir0clau)
overload jsonize with jsonize_ir0clau

fun
jsonize_ir0gpat : jsonize_type(ir0gpat)
overload jsonize with jsonize_ir0gpat

fun
jsonize_ir0valdecl : jsonize_type(ir0valdecl)
overload jsonize with jsonize_ir0valdecl

fun
jsonize_ir0fundecl : jsonize_type(ir0fundecl)
overload jsonize with jsonize_ir0fundecl

fun
jsonize_ir0dcl : jsonize_type(ir0dcl)
overload jsonize with jsonize_ir0dcl
