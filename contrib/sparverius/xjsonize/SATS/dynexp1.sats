#define XATS_targetloc "./../../../../srcgen/xats"
#staload "{$XATS}/SATS/dynexp1.sats"

#staload "./json.sats"

fun
jsonize_q1arg : jsonize_type(q1arg)
overload jsonize with jsonize_q1arg

fun
jsonize_sq1arg : jsonize_type(sq1arg)
overload jsonize with jsonize_sq1arg

fun
jsonize_tq1arg : jsonize_type(tq1arg)
overload jsonize with jsonize_tq1arg

fun
jsonize_ti1arg : jsonize_type(ti1arg)
overload jsonize with jsonize_ti1arg

fun
jsonize_a1typ : jsonize_type(a1typ)
overload jsonize with jsonize_a1typ

fun
jsonize_d1arg : jsonize_type(d1arg)
overload jsonize with jsonize_d1arg

fun
jsonize_f1arg : jsonize_type(f1arg)
overload jsonize with jsonize_f1arg

fun
jsonize_d1pat : jsonize_type(d1pat)
overload jsonize with jsonize_d1pat

fun
jsonize_d1gua : jsonize_type(d1gua)
overload jsonize with jsonize_d1gua

fun
jsonize_d1clau : jsonize_type(d1clau)
overload jsonize with jsonize_d1clau

fun
jsonize_d1gpat : jsonize_type(d1gpat)
overload jsonize with jsonize_d1gpat

fun
jsonize_d1exp : jsonize_type(d1exp)
overload jsonize with jsonize_d1exp

fun
jsonize_f1unarrow : jsonize_type(f1unarrow)
overload jsonize with jsonize_f1unarrow

fun
jsonize_teqd1expopt : jsonize_type(teqd1expopt)
overload jsonize with jsonize_teqd1expopt

fun
jsonize_wths1expopt : jsonize_type(wths1expopt)
overload jsonize with jsonize_wths1expopt

fun
jsonize_v1aldecl : jsonize_type(v1aldecl)
overload jsonize with jsonize_v1aldecl

fun
jsonize_v1ardecl : jsonize_type(v1ardecl)
overload jsonize with jsonize_v1ardecl

fun
jsonize_f1undecl : jsonize_type(f1undecl)
overload jsonize with jsonize_f1undecl

fun
jsonize_d1cstdecl : jsonize_type(d1cstdecl)
overload jsonize with jsonize_d1cstdecl

fun
jsonize_d1ecl : jsonize_type(d1ecl)
overload jsonize with jsonize_d1ecl

fun
jsonize_abstdf1 : jsonize_type(abstdf1)
overload jsonize with jsonize_abstdf1

fun
jsonize_wd1eclseq : jsonize_type(wd1eclseq)
overload jsonize with jsonize_wd1eclseq
