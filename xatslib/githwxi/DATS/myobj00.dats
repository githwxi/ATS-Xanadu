(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For dynamically typed values
Sat 07 Sep 2024 08:37:22 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"xatslib\
/DATS/CATS/JS/Hsmap00.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
hmap_tbox(a:t0)
#typedef
hmap(a:t0) = hmap_tbox(a)
//
#extern
fun
<a:t0>
hmap_nil((*0*)): hmap(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype dtval =
//
| DTVunit of unit
//
| DTVsint of sint
| DTVbool of bool
| DTVchar of char
| DTVdflt of dflt
| DTVstrn of strn
//
| DTVa1sz of a1sz(dtval)
//
| DTVhmap of hmap(dtval)
//
| DTVf1un of
  (dtval) -> dtval
| DTVf2un of
  (dtval, dtval) -> dtval
| DTVf3un of
  (dtval, dtval, dtval) -> dtval
| DTVfxun of (a1sz(dtval)) -> dtval
//
(* ****** ****** *)
(* ****** ****** *)

#extern
fun<>
dtval_un_sint
(dtv: dtval): sint//fun
#extern
fun<>
dtval_un_bool
(dtv: dtval): bool//fun
#extern
fun<>
dtval_un_char
(dtv: dtval): char//fun
#extern
fun<>
dtval_un_dflt
(dtv: dtval): dflt//fun
#extern
fun<>
dtval_un_strn
(dtv: dtval): strn//fun
//
#extern
fun<>
dtval_un_a1sz
(dtv: dtval): a1sz(dtval)//fun
#extern
fun<>
dtval_un_hmap
(dtv: dtval): hmap(dtval)//fun
//
#extern
fun<>
dtval_un_f1un
(dtv: dtval): (dtval)->dtval//fun
#extern
fun<>
dtval_un_f2un
(dtv: dtval): (dtval,dtval)->dtval
#extern
fun<>
dtval_un_fxun
(dtv: dtval): (a1sz(dtval))->dtval
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dtval_un_sint
  ( dtv ) =
let val-DTVsint(i0) = dtv in i0 end
#impltmp
<(*tmp*)>
dtval_un_bool
  ( dtv ) =
let val-DTVbool(b0) = dtv in b0 end
#impltmp
<(*tmp*)>
dtval_un_char
  ( dtv ) =
let val-DTVchar(c0) = dtv in c0 end
#impltmp
<(*tmp*)>
dtval_un_dflt
  ( dtv ) =
let val-DTVdflt(x0) = dtv in x0 end
#impltmp
<(*tmp*)>
dtval_un_strn
  ( dtv ) =
let val-DTVstrn(s0) = dtv in s0 end
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dtval_un_a1sz
  ( dtv ) =
let val-DTVa1sz(a0) = dtv in a0 end
#impltmp
<(*tmp*)>
dtval_un_hmap
  ( dtv ) =
let val-DTVhmap(m0) = dtv in m0 end
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dtval_un_f1un
  ( dtv ) =
let val-DTVf1un(f1) = dtv in f1 end
#impltmp
<(*tmp*)>
dtval_un_f2un
  ( dtv ) =
let val-DTVf2un(f2) = dtv in f2 end
#impltmp
<(*tmp*)>
dtval_un_fxun
  ( dtv ) =
let val-DTVfxun(fx) = dtv in fx end
//
(* ****** ****** *)
//
#symload sint with dtval_un_sint of 1000
#symload bool with dtval_un_bool of 1000
#symload char with dtval_un_char of 1000
#symload dflt with dtval_un_dflt of 1000
#symload strn with dtval_un_strn of 1000
//
#symload a1sz with dtval_un_a1sz of 1000
#symload hmap with dtval_un_hmap of 1000
//
#symload f1un with dtval_un_f1un of 1000
#symload f2un with dtval_un_f2un of 1000
#symload fxun with dtval_un_fxun of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef myobj(*void*) = hmap(dtval)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
myobj_fmake_fwork
( fwork
: ((strn, dtval)->void)->void): myobj
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_myobj00.dats] *)
