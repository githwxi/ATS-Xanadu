#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp3.sats"

#staload "./json.sats"

fun
jsonize_ti3arg : jsonize_type(ti3arg)
overload jsonize with jsonize_ti3arg

(*
fun
jsonize_f3arg : jsonize_type(f3arg)
overload jsonize with jsonize_f3arg

fun
jsonize_d3gua : jsonize_type(d3gua)
overload jsonize with jsonize_d3gua

fun
jsonize_d3clau : jsonize_type(d3clau)
overload jsonize with jsonize_d3clau

fun
jsonize_d3gpat : jsonize_type(d3gpat)
overload jsonize with jsonize_d3gpat

fun
jsonize_d3exp : jsonize_type(d3exp)
overload jsonize with jsonize_d3exp

fun
jsonize_t2pcast : jsonize_type(t2pcast)
overload jsonize with jsonize_t2pcast

fun
jsonize_v3aldecl : jsonize_type(v3aldecl)
overload jsonize with jsonize_v3aldecl

fun
jsonize_v3ardecl : jsonize_type(v3ardecl)
overload jsonize with jsonize_v3ardecl

fun
jsonize_f3undecl : jsonize_type(f3undecl)
overload jsonize with jsonize_f3undecl

fun
jsonize_d3ecl : jsonize_type(d3ecl)
overload jsonize with jsonize_d3ecl
*)
