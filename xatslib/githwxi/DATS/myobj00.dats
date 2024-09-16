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
#abstbox
hmap_tbox(a:t0)
#typedef
hmap(a:t0) = hmap_tbox(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
hmap_strmize
( map
: hmap(a)): strm_vt@(strn,a)
//
#symload
strmize with hmap_strmize of 1000
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
hmap_make_nil((*0*)): hmap(a)
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
hmap_search$opt
( map
: hmap(a), k0: strn): optn_vt(a)
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
hmap_insert$opt
( map
: hmap(a)
, k0: strn, x0: a): optn_vt(a)
#extern
fun
<a:t0>
hmap_insert$new
( map
: hmap(a), k0: strn, x0: a): void
//
#impltmp
< a: t0 >
hmap_insert$new
 (map, k0, x0) =
(
case+ opt of
| ~optn_vt_nil() => ()
) where
{
val opt =
(
  hmap_insert$opt<a>(map, k0, x0))
}
//
(* ****** ****** *)
//
#impltmp
{ a: t0 }
g_ptype
<hmap(a)>() =
(
strn_print"hmap(";
g_ptype<a>();strn_print")")
//
#impltmp
{ a: t0 }
g_print
<hmap(a)>(map) =
(
gseq_print0
<strm_vt(kx)><kx>
(hmap_strmize<a>(map)))
where
{
#typedef kx = (strn, a)
#vwtpdef kxs = strm_vt(kx)
#impltmp
gseq_beg<kxs><kx>() = "hmap(" }
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
//
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
(* ****** ****** *)
//
#impltmp
g_ptype
< dtval >
( (*0*) ) = strn_print<>("dtval")
//
(* ****** ****** *)
//
#impltmp
g_print
< dtval >
(  dtv  ) =
(
auxpr(dtv)) where
{
//
fun
auxpr
(dtv: dtval): void =
let
//
#impltmp
g_print<dtval> = auxpr
//
in//let
//
case+ dtv of
//
|DTVunit(ut) =>
(
 prints("DTVunit(", ")"))
//
|DTVsint(i0) =>
(
 prints("DTVsint(", i0, ")"))
|DTVbool(b0) =>
(
 prints("DTVbool(", b0, ")"))
|DTVchar(c0) =>
(
 prints("DTVchar(", c0, ")"))
|DTVdflt(f0) =>
(
 prints("DTVdflt(", f0, ")"))
|DTVstrn(s0) =>
(
 prints("DTVstrn(", s0, ")"))
//
|DTVa1sz(a0) =>
(
 prints("DTVa1sz(", a0, ")"))
//
|DTVhmap(hm) =>
(*
HX-2024-09-16:
Handling recursion is tricky!
*)
(*
(
HX-2024-09-16: BUGGY!!!
 prints("DTVhmap(", hm, ")"))
*)
(prints
 ("DTVhmap(", type(hm), ")"))
//
|DTVf1un(f1) =>
(
 prints("DTVf1un(", f1, ")"))
|DTVf2un(f2) =>
(
 prints("DTVf2un(", f2, ")"))
|DTVf3un(f3) =>
(
 prints("DTVf3un(", f3, ")"))
|DTVfxun(fx) =>
(
 prints("DTVfxun(", fx, ")"))
//
end//let//end-of-[ auxpr(dtv) ]
//
}//where//end(g_print<dtval>(dtv)]
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
#typedef
myobj(*void*) = hmap(dtval)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
myobj_get$at
(obj
:myobj, k0: strn): dtval
#extern
fun<>
myobj_get$at$opt
(obj
:myobj, k0: strn): optn_vt(dtval)
//
#impltmp
<(*tmp*)>
myobj_get$at
 (obj, k0) =
(
case+ opt of
| ~optn_vt_cons(dtv) => dtv
) where
{
val opt =
myobj_get$at$opt<>(obj, k0) }
//
#impltmp
<(*tmp*)>
myobj_get$at$opt
 (obj, k0) =
(
  hmap_search$opt<>(obj, k0))
//
#symload [] with myobj_get$at of 1000
//
(* ****** ****** *)
//
#extern
fun<>
myobj_make_nil(): myobj
//
#impltmp
<(*tmp*)>
myobj_make_nil
 ( (*void*) ) = hmap_make_nil<>()
//
(* ****** ****** *)
//
#extern
fun<>
myobj_fmake_fwork
( fwork
: ((strn, dtval)->void)->void): myobj
//
#impltmp
<(*tmp*)>
myobj_fmake_fwork
  (fwork) =
let
val obj =
myobj_make_nil<>((*0*))
in//let
fwork(
lam(k0, x0) =>
  hmap_insert$new(obj, k0, x0)); (obj)
end//let//end-of-[myobj_fmake_fwork(fwork)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_myobj00.dats] *)
