(* ****** ****** *)
//
// For ordering
//
(* ****** ****** *)

fun
<a:vtflt>
g_eq(!a, !a): bool
fun
<a:vtflt>
g_neq(!a, !a): bool

(* ****** ****** *)

fun
<a:vtflt>
g_lt(!a, !a): bool
fun
<a:vtflt>
g_gt(!a, !a): bool
fun
<a:vtflt>
g_lte(!a, !a): bool
fun
<a:vtflt>
g_gte(!a, !a): bool

(* ****** ****** *)

fun
<a:vtflt>
g_cmp(!a, !a): sint

(* ****** ****** *)
//
fun
<a:vtflt>
g_eqz(x: !a): bool
fun
<a:vtflt>
g_ltz(x: !a): bool
fun
<a:vtflt>
g_gtz(x: !a): bool
//
fun
<a:vtflt>
g_ltez(x: !a): bool
fun
<a:vtflt>
g_gtez(x: !a): bool
fun
<a:vtflt>
g_neqz(x: !a): bool
//
(* ****** ****** *)

fun
<a:vtflt>
g_max(x: !a, y: !a): (a)
fun
<a:vtflt>
g_min(x: !a, y: !a): (a)

(* ****** ****** *)

(* end of [gord.sats] *)
