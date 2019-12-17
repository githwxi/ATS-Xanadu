#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/staexp1.sats"

#staload "./json.sats"


fun
jsonize_g1exp : jsonize_type(g1exp)
overload jsonize with jsonize_g1exp

fun
jsonize_g1marg : jsonize_type(g1marg)
overload jsonize with jsonize_g1marg

fun
jsonize_sort1 : jsonize_type(sort1)
overload jsonize with jsonize_sort1

fun
jsonize_s1rtcon : jsonize_type(s1rtcon)
overload jsonize with jsonize_s1rtcon

fun
jsonize_d1tsort : jsonize_type(d1tsort)
overload jsonize with jsonize_d1tsort

fun
jsonize_s1arg : jsonize_type(s1arg)
overload jsonize with jsonize_s1arg

fun
jsonize_s1rtdef : jsonize_type(s1rtdef)
overload jsonize with jsonize_s1rtdef

fun
jsonize_s1marg : jsonize_type(s1marg)
overload jsonize with jsonize_s1marg

fun
jsonize_t1arg : jsonize_type(t1arg)
overload jsonize with jsonize_t1arg

fun
jsonize_t1marg : jsonize_type(t1marg)
overload jsonize with jsonize_t1marg

fun
jsonize_s1qua : jsonize_type(s1qua)
overload jsonize with jsonize_s1qua

fun
jsonize_s1uni : jsonize_type(s1uni)
overload jsonize with jsonize_s1uni

fun
jsonize_s1exp : jsonize_type(s1exp)
overload jsonize with jsonize_s1exp


fun
jsonize_effs1expopt : jsonize_type(effs1expopt)
overload jsonize with jsonize_effs1expopt

fun
jsonize_d1atcon : jsonize_type(d1atcon)
overload jsonize with jsonize_d1atcon

fun
jsonize_d1atype : jsonize_type(d1atype)
overload jsonize with jsonize_d1atype
