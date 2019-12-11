#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp2.sats"

#staload "./json.sats"

fun
jsonize_sort2: jsonize_type(sort2)
overload jsonize with jsonize_sort2

fun
jsonize_t2bas: jsonize_type(t2bas)
overload jsonize with jsonize_t2bas

fun
jsonize_t2abs: jsonize_type(t2abs)
overload jsonize with jsonize_t2abs

fun
jsonize_t2dat: jsonize_type(t2dat)
overload jsonize with jsonize_t2dat

fun
jsonize_s2cst: jsonize_type(s2cst)
overload jsonize with jsonize_s2cst

fun
jsonize_s2var: jsonize_type(s2var)
overload jsonize with jsonize_s2var

fun
jsonize_tyrec: jsonize_type(tyrec)
overload jsonize with jsonize_tyrec

fun
jsonize_s2txt: jsonize_type(s2txt)
overload jsonize with jsonize_s2txt

fun
jsonize_s2exp: jsonize_type(s2exp)
overload jsonize with jsonize_s2exp

fun
jsonize_s2hnf: jsonize_type(s2hnf)
overload jsonize with jsonize_s2hnf

fun
jsonize_labs2exp: jsonize_type(labs2exp)
overload jsonize with jsonize_labs2exp

fun
jsonize_abstdf2: jsonize_type(abstdf2)
overload jsonize with jsonize_abstdf2

fun
jsonize_effs2expopt: jsonize_type(effs2expopt)
overload jsonize with jsonize_effs2expopt

fun
jsonize_s2itm: jsonize_type(s2itm)
overload jsonize with jsonize_s2itm
