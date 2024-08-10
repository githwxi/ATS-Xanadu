(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/Hsmap.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsm(k:t0,x:vt) = jshsmap(k,x)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0 }
{ x: vt }
g_ptype
< jsm(k,x) >
( (*void*) ) =
(
pstrn"jshsmap(";
g_ptype<k>();pstrn",";
g_ptype<x>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0 }
{ x: vt }
g_print<jsm(k,x)>
  ( map ) =
let
//
#vwtpdef x0 = @(k,x)
#typedef xs = jsm(k,x)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jshsmap("
//
in//let
(
  gseq_print1<xs><x0>(map) )
end//end-of-[g_print<jsm(k,x)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0 }
{ x: vt }
g_forall<jsm(k,x)> =
gseq_forall1<jsm(k,x)><(k,x)>
//
#impltmp
{ k: t0 }
{ x: vt }
g_foritm<jsm(k,x)> =
gseq_foritm1<jsm(k,x)><(k,x)>
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Hsmaph0.dats] *)
