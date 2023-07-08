(* ****** ****** *)

fun
proj0(ci: @(char, sint)) = ci.0
fun
proj1(ci: @(char, sint)) = ci.1

(* ****** ****** *)

fun
proj2(ci: @(char, sint)) = ci.2

(* ****** ****** *)

fun
proj3 // fi.0(123) -> (fi.0)(123)
(fi: @((sint) -> sint, sint)) = fi.0(123)

(* ****** ****** *)

#typedef point = @{x=dflt, y=dflt}
#typedef point = $rec{x=dflt, y=dflt}

(* ****** ****** *)

fun
point_get_x(p0: point): dflt = p0.x(*prj*)
fun
point_get_y(p0: point): dflt = p0.y(*prj*)
fun
point_get_z(p0: point): dflt = p0.z(*prj*)

(* ****** ****** *)

(* end of [DATA/myt1up.dats] *)
