#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp2.sats"

#staload "./json.sats"


fun
jsonize_sq2arg : jsonize_type(sq2arg)
overload jsonize with jsonize_sq2arg

fun
jsonize_tq2arg : jsonize_type(tq2arg)
overload jsonize with jsonize_tq2arg

fun
jsonize_d2con : jsonize_type(d2con)
overload jsonize with jsonize_d2con

fun
jsonize_d2cst : jsonize_type(d2cst)
overload jsonize with jsonize_d2cst

fun
jsonize_d2var : jsonize_type(d2var)
overload jsonize with jsonize_d2var

fun
jsonize_d2itm : jsonize_type(d2itm)
overload jsonize with jsonize_d2itm

fun
jsonize_d2pitm : jsonize_type(d2pitm)
overload jsonize with jsonize_d2pitm

fun
jsonize_d2pat : jsonize_type(d2pat)
overload jsonize with jsonize_d2pat

fun
jsonize_f2arg : jsonize_type(f2arg)
overload jsonize with jsonize_f2arg

fun
jsonize_ti2arg : jsonize_type(ti2arg)
overload jsonize with jsonize_ti2arg

fun
jsonize_d2gua : jsonize_type(d2gua)
overload jsonize with jsonize_d2gua

fun
jsonize_d2clau : jsonize_type(d2clau)
overload jsonize with jsonize_d2clau

fun
jsonize_d2gpat : jsonize_type(d2gpat)
overload jsonize with jsonize_d2gpat

fun
jsonize_d2exp : jsonize_type(d2exp)
overload jsonize with jsonize_d2exp

fun
jsonize_v2aldecl : jsonize_type(v2aldecl)
overload jsonize with jsonize_v2aldecl

fun
jsonize_v2ardecl : jsonize_type(v2ardecl)
overload jsonize with jsonize_v2ardecl

fun
jsonize_f2undecl : jsonize_type(f2undecl)
overload jsonize with jsonize_f2undecl

fun
jsonize_d2ecl : jsonize_type(d2ecl)
overload jsonize with jsonize_d2ecl

fun
jsonize_impls2cst : jsonize_type(impls2cst)
overload jsonize with jsonize_impls2cst

fun
jsonize_impld2cst : jsonize_type(impld2cst)
overload jsonize with jsonize_impld2cst
