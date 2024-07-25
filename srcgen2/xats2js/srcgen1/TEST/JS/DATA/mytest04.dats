(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
//
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)

#impltmp<a>
list_btw_vt(s1,f2) =
let
//
#vwtpdef tres = list_vt(a)
//
fnx
loop(i0: sint, r0: tres): tres =
if (i0 = f2)
then
  r0
else
  loop(i0+1, r0) where
  {
    val x0 = g_si<a>(i0)
    val r0 = list_vt_cons(x0, r0) }
endif // if (i0 = f0)
//
in//let
  if s1 > f2
  then
    list_vt_nil()
  else
    list_vt_reverse0<a>(loop(s1,list_vt_nil))
end//let
//
(* ****** ****** *)
val list_btw_vt_sint = list_btw_vt<sint>(*void*)
(* ****** ****** *)

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest04.dats] *)
