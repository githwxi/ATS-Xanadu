(* ****** ****** *)
(*
** HX: For
** linear g-sequences
*)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_copy(xs) =
gseq_make0_llist<xs><x0>
(gseq_copy_llist<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_free(xs) =
(
gseq_foreach0<xs><x0>(xs)
) where
{
#impltmp
foreach0$work<x0> = g_free<x0>
}
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_uncons0_exn
  (xs) =
(
if
gseq_nilq1<xs><x0>(xs)
then
let
val () = g_free<xs>(xs)
in//let
(
  $raise SubscriptExn())
end // end of [then]
else
gseq_uncons0_raw<xs><x0>(xs))
//
#impltmp
<xs><x0>
gseq_uncons0_opt
  (xs) =
(
if
gseq_nilq1<xs><x0>(xs)
then
(
  optn_vt_nil((*void*)))
else
optn_vt_cons
(gseq_uncons0_raw<xs><x0>(xs)))
//
(* ****** ****** *)

#impltmp
<xs><x0>
gseq_cmp11
(xs1, xs2) =
let
val xs1 = g_copy<xs>(xs1)
and xs2 = g_copy<xs>(xs2)
in
  gseq_cmp00<xs><x0>(xs1, xs2)
endlet // end of [gseq_cmp11/cmp00]
#impltmp
<xs><x0>
gseq_cmp00
(xs1, xs2) =
(
gseq_z2forcmp0
<xs,xs><x0,x0>(xs1, xs2)
) where
{
#impltmp
z2forcmp0$fcmp<x0,x0> = g_cmp00<x0>
}(*where*) // [gseq_cmp00/z2forcmp0]

(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_print0(xs) =
let
//
val () =
gseq_print0$beg
<xs><x0>((*void*))
//
val () =
(
gseq_iforeach0<xs><x0>(xs)
) where
{
//
#impltmp
iforeach0$work<x0>
  (i0, x0) =
(
  g_print0<x0>(x0)
) where
{
val () =
  if
  (i0 > 0)
  then
  gseq_print0$sep<xs><x0>() }
//
} (* where *)
//
val () =
gseq_print0$end<xs><x0>((*0*))
//
endlet // end of [gseq_print0(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_print1(xs) =
let
//
val () =
gseq_print1$beg
<xs><x0>((*void*))
//
val () =
(
gseq_iforeach1<xs><x0>(xs)
) where
{
//
#impltmp
iforeach1$work<x0>
  (i0, x0) =
(
  g_print1<x0>(x0)
) where
{
val () =
  if
  (i0 > 0)
  then
  gseq_print1$sep<xs><x0>() }
//
} (* where *)
//
val () =
gseq_print1$end<xs><x0>((*0*))
//
endlet // end of [gseq_print1(xs)]
//
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_print0$beg() = strn_print("(")
#impltmp
<xs><x0>
gseq_print0$end() = strn_print(")")
#impltmp
<xs><x0>
gseq_print0$sep() = strn_print(";")
(* ****** ****** *)
#impltmp
<xs><x0>
gseq_print1$beg() = strn_print("(")
#impltmp
<xs><x0>
gseq_print1$end() = strn_print(")")
#impltmp
<xs><x0>
gseq_print1$sep() = strn_print(";")
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_length0(xs) =
(
gseq_foldl0
<xs><x0><r0>(xs, 0)
) where
{
//
#typedef r0 = nint
//
#impltmp
foldl0$fopr
<x0><r0>(r0, x0) =
let
val () =
g_free<x0>(x0) in succ(r0)
end
//
} (*whr*)//gseq_length0/foldl0
//
#impltmp
<xs><x0>
gseq_length1(xs) =
(
gseq_foldl1
<xs><x0><r0>(xs, 0)
) where
{
//
#typedef r0 = nint
//
#impltmp
foldl1$fopr
<x0><r0>(r0, x0) = succ(r0)
//
} (*whr*)//gseq_length1/foldl1
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
gseq_listize0(xs) =
(
  gseq_listize<xs><x0>(xs))
#impltmp
<xs: t0>
<x0: t0>
gseq_listize1(xs) =
(
  gseq_listize<xs><x0>(xs))
//
(*
#impltmp
<xs><x0>
gseq_listize0(xs) =
strm_vt_listize0
  (gseq_strmize0<xs><x0>(xs))
*)
#impltmp
<xs><x0>
gseq_listize0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
gseq_map0_llist<xs><x0><x0>(xs)
end(*let*)//end(gseq_listize0(xs))
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
gseq_rlistize0(xs) =
(
  gseq_rlistize<xs><x0>(xs))
#impltmp
<xs: t0>
<x0: t0>
gseq_rlistize1(xs) =
(
  gseq_rlistize<xs><x0>(xs))
//
(*
#impltmp
<xs><x0>
gseq_rlistize0(xs) =
strm_vt_rlistize0
  (gseq_strmize0<xs><x0>(xs))
*)
#impltmp
<xs><x0>
gseq_rlistize0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
gseq_map0_rllist<xs><x0><x0>(xs)
end(*let*)//end(gseql_rlistize0(xs))
//
(* ****** ****** *)

#impltmp
<xs>
<x0><r0>
gseq_foldl0
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_foreach0<xs><x0>(xs)
) where
{
#impltmp
foreach0$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
(p0, foldl0$fopr<x0><r0>(r0, x0))
//
end // end of [foreach0$work]
}
//
}(*where*)//end-[gseq_foldl0/foreach0]

(* ****** ****** *)

#impltmp
<xs>
<x0><r0>
gseq_foldl1
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_foreach1<xs><x0>(xs)
) where
{
#impltmp
foreach1$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl1$fopr<x0><r0>(r0, x0))
//
end // end of [foreach1$work]
}
//
}(*where*)//end-[gseq_foldl1/foreach1]

(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map0_llist
  (xs) = let
//
#vwtpdef
yy =
list_vt(y0)
#typedef
r0 = p2tr(yy)
//
#impltmp
foldl0$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map0$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons( y0, _ )
val p1 = $addr( r1.1 )
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl0$fopr
//
var r0: yy
//
val p0 = $addr(r0)
val pz =
gseq_foldl0<xs><x0><r0>(xs, p0)
//
in//let
$UN.p2tr_set<yy>
(pz,list_vt_nil()); $UN.castlin01(r0)
end(*let*)//end-[gseq_map0_llist/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map0_rllist
  (xs) = let
//
#vwtpdef r0 = list_vt(y0)
//
in//let
//
gseq_foldl0
<xs><x0>< r0 >
(xs, list_vt_nil()) where
{
#impltmp
foldl0$fopr
< x0 >< r0 >
(r0, x0) =
list_vt_cons(map0$fopr<x0><y0>(x0), r0)
}
//
end(*let*)//end-[gseq_map0_rllist/foldl0]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map1_llist
  (xs) = let
//
#vwtpdef
yy =
list_vt(y0)
#typedef
r0 = p2tr(yy)
//
#impltmp
foldl1$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map1$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons( y0, _ )
val p1 = $addr( r1.1 )
//
in//let
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl1$fopr
//
var r0: yy
//
val p0 = $addr(r0)
val pz =
gseq_foldl1<xs><x0><r0>(xs, p0)
//
in
$UN.p2tr_set<yy>
(pz,list_vt_nil()); $UN.castlin01(r0)
end(*let*)//end-[gseq_map1_llist/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_copy_llist
  (xs) =
let
  #impltmp
  map1$fopr<x0><x0>(x0) = x0
in
(
  gseq_map1_llist<xs><x0><x0>( xs ))
end(*let*)//end-of-[gseq_copy_llist/map1]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map0_lstrm(xs) =
(
  strm_vt_map0<x0><y0>(xs) ) where
{
  val xs = gseq_strmize0<xs><x0>(xs)
}(*where*)//end-[gseq_map0_lstrm/strmize0]
//
#impltmp
<xs>
<x0><y0>
gseq_map1_lstrm(xs) =
let
  val xs = g_copy<xs>(xs)
in//let
(
  gseq_map0_lstrm<xs><x0><y0>(xs)
) where
{
  #impltmp
  map0$fopr<x0><y0>(x0) =
  ( g_free(x0); y0 ) where
  { val y0 = map1$fopr<x0><y0>(x0) } }
end(*let*)//end-[gseq_map1_lstrm/strmize0]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_copy_lstrm
  (xs) =
let
  #impltmp
  map1$fopr<x0><x0>(x0) = x0
in//let
  gseq_map1_lstrm<xs><x0><x0>(xs)
end(*let*)//end-of-[gseq_copy_lstrm/map1]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map1_rllist
  (xs) = let
//
#vwtpdef r0 = list_vt(y0)
//
in//let
//
gseq_foldl1
<xs><x0>< r0 >
(xs, list_vt_nil()) where
{
#impltmp
foldl1$fopr
< x0 >< r0 >(r0, x0) =
list_vt_cons(map1$fopr<x0><y0>(x0), r0)
}
//
end(*let*)//end-of(gseq_map0_rllist/foldl0)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter0
  (  xs  ) =
gseq_make0_lstrm<xs><x0>
(gseq_filter0_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter0_llist
  (  xs  ) =
(
strm_vt_listize0
(
gseq_filter0_lstrm<xs><x0>(xs)))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter0_lstrm
  (  xs  ) =
(
  strm_vt_filter0
  (gseq_strmize0<xs><x0>(xs)) )
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_forall0
  (  xs  ) =
(
  strm_vt_forall0
  (gseq_strmize0<xs><x0>(xs)) )
//
#impltmp
<xs><x0>
gseq_forall1
  (  xs  ) =
let
#impltmp
forall0$test<x0>(x0) =
(g_free<x0>(x0); res) where
{
val res = forall1$test<x0>(x0) }
in//let
(
  strm_vt_forall0
  (gseq_strmize1<xs><x0>(xs)) )
end//let//end-of-[gseq_forall1(...)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_exists0
  (  xs  ) = let
//
  #impltmp
  forall0$test<x0>(x0) =
  not(exists0$test<x0>(x0))
//
in//let
if // if
gseq_forall0
<xs><x0>( xs ) then false else true
end(*let*)//end-of(gseq_exists0/forall0)
//
#impltmp
<xs><x0>
gseq_exists1
  (  xs  ) = let
//
  #impltmp
  forall1$test<x0>(x0) =
  not(exists1$test<x0>(x0))
//
in//let
if // if
gseq_forall1
<xs><x0>( xs ) then false else true
end(*let*)//end-of(gseq_exists1/forall1)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_foreach0(xs) =
let
val
test =
gseq_forall0<xs><x0>(xs) where
{
#impltmp
forall0$test<x0>(x0) =
let
val () = foreach0$work<x0>(x0) in true
end
}
in
  // nothing
end(*let*)//end-of(gseq_foreach0/forall0)
//
#impltmp
<xs><x0>
gseq_foreach1(xs) =
let
val
test =
gseq_forall1<xs><x0>(xs) where
{
#impltmp
forall1$test<x0>(x0) =
let
val () = foreach1$work<x0>(x0) in true
end
}
in
  // nothing
end(*let*)//end-of(gseq_foreach1/forall1)
//
#impltmp
<xs><x0>
gseq_foreach2(xs) =
let
val
test =
gseq_forall2<xs><x0>(xs) where
{
#impltmp
forall2$test<x0>(x0) =
let
val () = foreach2$work<x0>(x0) in true
end
}
in
  // nothing
end(*let*)//end-of(gseq_foreach2/forall2)
//
(* ****** ****** *)

(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_append0
  (xs1, xs2) =
(
gseq_foldr0
<xs><x0>< xs >(xs1, xs2)
) where
{
#impltmp
foldr0$fopr
< x0><xs >
( x0, r0 )=
gseq_cons<xs><x0>(x0, r0)
} (* end of [gseq_append0/foldr0] *)
*)
#impltmp
<xs><x0>
gseq_append0
  (xs1, xs2) =
let
val
xs1 =
gseq_strmize0<xs><x0>(xs1)
val
xs2 =
gseq_strmize0<xs><x0>(xs2)
in//let
(
  gseq_make0_lstrm<xs><x0>
  (strm_vt_append0<x0>(xs1, xs2)) )
end (*let*)//end-[gseq_append0(xs,ys)]
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gseq_reverse0
  ( xs ) =
gseq_rappend0
(xs, gseq_nil<xs><x0>())
*)
#impltmp
<xs><x0>
gseq_reverse0(xs) =
let
val xs =
gseq_rstrmize0<xs><x0>(xs)
in//let
(
  gseq_make0_lstrm<xs><x0>(xs) )
end(*let*)// end-of(gseq_reverse0(xs))
//
(* ****** ****** *)
//
(*
(*
HX-2022-06-15:
Using [gseq_cons] should
be avoided as it enforces
the list-like sequentiality!
*)
#impltmp
<xs><x0>
gseq_rappend0
  (xs1, xs2) =
(
gseq_foldl0
<xs><x0>< xs >(xs1, xs2)
) where
{
#impltmp
foldl0$fopr
< x0><xs >
( r0, x0 ) =
gseq_cons<xs><x0>(x0, r0)
} (*where*) // (gseq_rappend0/foldl0)
*)
//
#impltmp
<xs><x0>
gseq_rappend0
  (xs1, xs2) =
let
val
xs2 =
gseq_strmize0<xs><x0>(xs2)
val
xs1 =
gseq_rstrmize0<xs><x0>(xs1)
in//let
(
  gseq_make0_lstrm<xs><x0>
  (strm_vt_append0<x0>(xs1, xs2)) )
end(*let*)//end(gseq_rappend0(xs1,xs2))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_add0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
gseq_map0_add0<xs><x0><x0>(xs)
end (*let*) // end-of-[ gseq_add0(xs) ]
//
#impltmp
<xs><x0>
gseq_mul0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
gseq_map0_mul0<xs><x0><x0>(xs)
end (*let*) // end-of-[ gseq_mul0(xs) ]
//
(* ****** ****** *)
#impltmp
<x0>
gseq_add0$nil = g_0<x0> // add-unit
#impltmp
<x0>
gseq_mul0$nil = g_1<x0> // mul-unit
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
gseq_map0_add0(xs) =
let
//
#impltmp
foldl0$fopr
<x0><y0>
(r0, x0) =
g_add00<y0>
(r0, map0$fopr<x0><y0>(x0))
//
in//let
(
gseq_foldl0
<xs>
<x0><y0>(xs, gseq_add0$nil<y0>()))
endlet//end-of-[gseq_map0_add0(xs)/foldl]
//
#impltmp
<xs>
<x0><y0>
gseq_map0_mul0(xs) =
let
//
#impltmp
foldl0$fopr
<x0><y0>
(r0, x0) =
g_mul00<y0>
(r0, map0$fopr<x0><y0>(x0))
//
in//let
(
gseq_foldl0
<xs>
<x0><y0>(xs, gseq_mul0$nil<y0>()))
endlet//end-of-[gseq_map0_mul0(xs)/foldl]
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_iexists0
  (xs) = let
//
  #impltmp
  iforall0$test<x0>(i0, x0) =
  not(iexists0$test<x0>(i0, x0))
//
in//let
if // if
gseq_iforall0
<xs><x0>( xs ) then false else true
end // end of [gseq_iexists0/iforall0]
//
#impltmp
<xs><x0>
gseq_iexists1
  (xs) = let
//
  #impltmp
  iforall1$test<x0>(i0, x0) =
  not(iexists1$test<x0>(i0, x0))
//
in//let
if // if
gseq_iforall1
<xs><x0>( xs ) then false else true
end // end of [gseq_iexists1/iforall1]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_iforall0(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in//let
//
let
#impltmp
forall0$test<x0>(x0) =
(
iforall0$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0,succ(i0))
}
in//let
(
  gseq_forall0< xs >< x0 >(xs))
end (* end of [gseq_forall0(xs)] *)
//
end(*let*)//end(gseq_iforall0/forall0)
//
#impltmp
<xs><x0>
gseq_iforall1(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
#impltmp
forall1$test<x0>(x0) =
(
iforall1$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0,succ(i0))
}
in
(
  gseq_forall1< xs >< x0 >(xs))
end (* end of [gseq_forall1(xs)] *)
//
end(*let*)//end(gseq_iforall1/forall1)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_iforeach0(xs) =
let
val
test =
gseq_iforall0<xs><x0>(xs) where
{
#impltmp
iforall0$test<x0>(i0, x0) =
let
val () =
iforeach0$work<x0>(i0, x0) in true
end//let
}
in
  // nothing
end // end of [gseq_iforeach0/iforall0]
//
#impltmp
<xs><x0>
gseq_iforeach1(xs) =
let
val
test =
gseq_iforall1<xs><x0>(xs) where
{
#impltmp
iforall1$test<x0>(i0, x0) =
let
val () =
iforeach1$work<x0>(i0, x0) in true
end//let
}
in
  // nothing
end // end of [gseq_iforeach1/iforall1]
//
(* ****** ****** *)
//
// HX-2022-06-09:
// For z2-gseq-operations
//
(* ****** ****** *)

#impltmp
<xs
,ys><x0>
gseq_z2cmp00
  (xs, ys) =
(
gseq_z2forcmp0
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp0$fcmp<x0,x0> = g_cmp00<x0>
} (* end of [gseq_z2cmp00/z2forcmp0] *)

#impltmp
<xs
,ys><x0>
gseq_z2cmp11
  (xs, ys) =
(
gseq_z2forcmp1
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp1$fcmp<x0,x0> = g_cmp11<x0>
} (* end of [gseq_z2cmp11/z2forcmp1] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
gseq_z2forall0
  (xs, ys) =
(
strm_vt_z2forall0<x0,y0>
(
  gseq_strmize0<xs><x0>(xs)
,
  gseq_strmize0<ys><y0>(ys))
) (*where*)//end-of-[gseq_z2forall0]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2forcmp0
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  gseq_strmize0<xs><x0>(xs)
,
  gseq_strmize0<ys><y0>(ys))
) (*where*)//end-of-[gseq_z2forcmp0]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
gseq_z2forcmp1
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  gseq_copy_lstrm<xs><x0>(xs)
,
  gseq_copy_lstrm<ys><y0>(ys))
) where
{
#impltmp
z2forcmp0$fcmp<x0,y0>
  (x0, y0) =
(
g_free(x0); g_free(y0); sgn) where
{
val
sgn = z2forcmp1$fcmp<x0,y0>(x0, y0)}
} (*where*)//end-of-[gseq_z2forcmp1]
//
(* ****** ****** *)
//
(*
HX:
For non-linear gseq-ops
*)
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0> //HX-2022-06-10: there is no
gseq_copy = g_copy<xs> //[gseq_copy]
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
gseq_strmize0 = gseq_strmize<xs><x0>
#impltmp
<xs: t0>
<x0: t0>
gseq_strmize1 = gseq_strmize<xs><x0>
//
#impltmp
<xs: t0>
<x0: t0>
gseq_rstrmize0 = gseq_rstrmize<xs><x0>
#impltmp
<xs: t0>
<x0: t0>
gseq_rstrmize1 = gseq_rstrmize<xs><x0>
//
(* ****** ****** *)
//
(*
HX-2023-08-14:
Higher-order gseq-functions
Mon Aug 14 13:42:54 EDT 2023
*)
//
(* ****** ****** *)
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
gseq_foldl0_c2fr
( xs, r0, f0 ) =
(
gseq_foldl0
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl0$fopr<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[gseq_foldl0_c2fr(xs,r0,f0)]
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
gseq_foldl1_c2fr
( xs, r0, f0 ) =
(
gseq_foldl1
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl1$fopr<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[gseq_foldl1_c2fr(xs,r0,f0)]
//
(* ****** ****** *)
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
gseq_foldr0_c2fr
( xs, r0, f0 ) =
(
gseq_foldr0
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr0$fopr<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//end-of[gseq_foldr0_c2fr(xs,r0,f0)]
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
gseq_foldr1_c2fr
( xs, r0, f0 ) =
(
gseq_foldr1
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr1$fopr<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//end-of[gseq_foldr1_c2fr(xs,r0,f0)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_forall0_c1fr
(    xs, f0    ) =
(
gseq_forall0<xs><x0>(xs)) where
{
#impltmp forall0$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-of[gseq_forall0_c1fr(xs,f0)]
//
#impltmp
<xs><x0>
gseq_forall1_c1fr
(    xs, f0    ) =
(
gseq_forall0<xs><x0>(xs)) where
{
#impltmp forall1$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-of[gseq_forall0xb_c1fr(xs,f0)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_filter0_c1fr_lstrm
(    xs, f0    ) =
(
gseq_filter0_lstrm<xs><x0>(xs)
) where
{
  #impltmp filter0$test<x0>( x0 ) = f0(x0) }
//(*where*)//end-of[gseq_filter0_c1fr_lstrm(xs,f0)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq000_vt.dats] *)
