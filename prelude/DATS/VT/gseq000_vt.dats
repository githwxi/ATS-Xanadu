(* ****** ****** *)
(*
** for gl-sequences
*)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_copy(xs) =
glseq_make0_llist<xs><x0>
(glseq_copy_llist<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_free(xs) =
(
glseq_foreach0<xs><x0>(xs)
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
glseq_uncons_exn
  (xs) =
(
if
glseq_nilq1<xs><x0>(xs)
then let
val () = g_free<xs>(xs)
in
(
  $raise SubscriptExn())
end // end of [then]
else
glseq_uncons_raw<xs><x0>(xs))
//
#impltmp
<xs><x0>
glseq_uncons_opt
  (xs) =
(
if
glseq_nilq1<xs><x0>(xs)
then
(
  optn_vt_nil((*void*)))
else
optn_vt_cons
(glseq_uncons_raw<xs><x0>(xs)))
//
(* ****** ****** *)

#impltmp
<xs><x0>
glseq_cmp11
(xs1, xs2) =
let
val xs1 = g_copy<xs>(xs1)
and xs2 = g_copy<xs>(xs2)
in
  glseq_cmp00<xs><x0>(xs1, xs2)
endlet // end of [glseq_cmp11/cmp00]
#impltmp
<xs><x0>
glseq_cmp00
(xs1, xs2) =
(
glseq_z2forcmp0
<xs,xs><x0,x0>(xs1, xs2)
) where
{
#impltmp
z2forcmp0$fcmp<x0,x0> = gl_cmp00<x0>
}(*where*) // [glseq_cmp00/z2forcmp0]

(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_print0(xs) =
let
//
val () =
glseq_print0$beg
<xs><x0>((*void*))
//
val () =
(
glseq_iforeach0<xs><x0>(xs)
) where
{
//
#impltmp
iforeach0$work<x0>
  (i0, x0) =
(
  gl_print0<x0>(x0)
) where
{
val () =
  if
  (i0 > 0)
  then
  glseq_print0$sep<xs><x0>() }
//
} (* where *)
//
val () =
glseq_print0$end<xs><x0>((*0*))
//
endlet // end of [glseq_print0(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_print1(xs) =
let
//
val () =
glseq_print1$beg
<xs><x0>((*void*))
//
val () =
(
glseq_iforeach1<xs><x0>(xs)
) where
{
//
#impltmp
iforeach1$work<x0>
  (i0, x0) =
(
  gl_print1<x0>(x0)
) where
{
val () =
  if
  (i0 > 0)
  then
  glseq_print1$sep<xs><x0>() }
//
} (* where *)
//
val () =
glseq_print1$end<xs><x0>((*0*))
//
endlet // end of [glseq_print1(xs)]
//
(* ****** ****** *)
#impltmp
<xs><x0>
glseq_print0$beg() = strn_print("(")
#impltmp
<xs><x0>
glseq_print0$end() = strn_print(")")
#impltmp
<xs><x0>
glseq_print0$sep() = strn_print(";")
(* ****** ****** *)
#impltmp
<xs><x0>
glseq_print1$beg() = strn_print("(")
#impltmp
<xs><x0>
glseq_print1$end() = strn_print(")")
#impltmp
<xs><x0>
glseq_print1$sep() = strn_print(";")
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_length0(xs) =
(
glseq_foldl0
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
} (*whr*)//glseq_length0/foldl0
//
#impltmp
<xs><x0>
glseq_length1(xs) =
(
glseq_foldl1
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
} (*whr*)//glseq_length1/foldl1
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
glseq_listize0(xs) =
(gseq_listize<xs><x0>(xs))
#impltmp
<xs: t0>
<x0: t0>
glseq_listize1(xs) =
(gseq_listize<xs><x0>(xs))
//
(*
#impltmp
<xs><x0>
glseq_listize0(xs) =
strm_vt_listize0
  (glseq_strmize0<xs><x0>(xs))
*)
#impltmp
<xs><x0>
glseq_listize0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
glseq_map0_llist<xs><x0><x0>(xs)
end(*let*)//end(glseq_listize0(xs))
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
glseq_rlistize0(xs) =
(gseq_rlistize<xs><x0>(xs))
#impltmp
<xs: t0>
<x0: t0>
glseq_rlistize1(xs) =
(gseq_rlistize<xs><x0>(xs))
//
(*
#impltmp
<xs><x0>
glseq_rlistize0(xs) =
strm_vt_rlistize0
  (glseq_strmize0<xs><x0>(xs))
*)
#impltmp
<xs><x0>
glseq_rlistize0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
glseq_map0_rllist<xs><x0><x0>(xs)
end(*let*)//end(glseql_rlistize0(xs))
//
(* ****** ****** *)

#impltmp
<xs><x0><r0>
glseq_foldl0
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  glseq_foreach0<xs><x0>(xs)
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
}(*where*)//end-[glseq_foldl0/foreach0]

(* ****** ****** *)

#impltmp
<xs><x0><r0>
glseq_foldl1
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  glseq_foreach1<xs><x0>(xs)
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
}(*where*)//end-[glseq_foldl1/foreach1]

(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
glseq_map0_llist
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
end // foldl$fopr
//
var r0: yy
//
val p0 = $addr(r0)
val pz =
glseq_foldl0<xs><x0><r0>(xs, p0)
//
in//let
$UN.p2tr_set<yy>
(pz,list_vt_nil()); $UN.castlin01(r0)
end(*let*)//end-[glseq_map0_llist/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
glseq_map0_rllist
  (xs) = let
//
#vwtpdef r0 = list_vt(y0)
//
in//let
//
glseq_foldl0
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
end(*let*)//end-[glseq_map0_rllist/foldl0]
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
glseq_map1_llist
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
end // foldl$fopr
//
var r0: yy
//
val p0 = $addr(r0)
val pz =
glseq_foldl1<xs><x0><r0>(xs, p0)
//
in
$UN.p2tr_set<yy>
(pz,list_vt_nil()); $UN.castlin01(r0)
end(*let*)//end-[glseq_map1_llist/foldl]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_copy_llist
  (xs) =
let
  #impltmp
  map1$fopr<x0><x0>(x0) = x0
in
(
  glseq_map1_llist<xs><x0><x0>( xs ))
end(*let*)//end-of-[glseq_copy_llist/map1]
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
glseq_map0_lstrm(xs) =
(
  strm_vt_map0<x0><y0>(xs) ) where
{
  val xs = glseq_strmize0<xs><x0>(xs)
}(*where*)//end-[glseq_map0_lstrm/strmize0]
//
#impltmp
<xs><x0><y0>
glseq_map1_lstrm(xs) =
let
  val xs = g_copy<xs>(xs)
in//let
(
  glseq_map0_lstrm<xs><x0><y0>(xs)
) where
{
  #impltmp
  map0$fopr<x0><y0>(x0) =
  ( g_free(x0); y0 ) where
  { val y0 = map1$fopr<x0><y0>(x0) } }
end(*let*)//end-[glseq_map1_lstrm/strmize0]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_copy_lstrm
  (xs) =
let
  #impltmp
  map1$fopr<x0><x0>(x0) = x0
in//let
  glseq_map1_lstrm<xs><x0><x0>(xs)
end(*let*)//end-of-[glseq_copy_lstrm/map1]
//
(* ****** ****** *)
//
#impltmp
<xs><x0><y0>
glseq_map1_rllist
  (xs) = let
//
#vwtpdef r0 = list_vt(y0)
//
in//let
//
glseq_foldl1
<xs><x0>< r0 >
(xs, list_vt_nil()) where
{
#impltmp
foldl1$fopr
< x0 >< r0 >(r0, x0) =
list_vt_cons(map1$fopr<x0><y0>(x0), r0)
}
//
end(*let*)//end-of(glseq_map0_rllist/foldl0)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_filter0
  (  xs  ) =
glseq_make0_lstrm<xs><x0>
(glseq_filter0_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_filter0_llist
  (  xs  ) =
(
strm_vt_listize0
(
glseq_filter0_lstrm<xs><x0>(xs)))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_filter0_lstrm
  (  xs  ) =
(
  strm_vt_filter0
  (glseq_strmize0<xs><x0>(xs)) )
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_forall0
  (  xs  ) =
(
  strm_vt_forall0
  (glseq_strmize0<xs><x0>(xs)) )
//
#impltmp
<xs><x0>
glseq_forall1
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
  (glseq_strmize1<xs><x0>(xs)) )
end//let//end-of-[glseq_forall1(...)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_exists0
  (  xs  ) = let
//
  #impltmp
  forall0$test<x0>(x0) =
  not(exists0$test<x0>(x0))
//
in//let
if // if
glseq_forall0
<xs><x0>( xs ) then false else true
end(*let*)//end-of(glseq_exists0/forall0)
//
#impltmp
<xs><x0>
glseq_exists1
  (  xs  ) = let
//
  #impltmp
  forall1$test<x0>(x0) =
  not(exists1$test<x0>(x0))
//
in//let
if // if
glseq_forall1
<xs><x0>( xs ) then false else true
end(*let*)//end-of(glseq_exists1/forall1)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_foreach0(xs) =
let
val
test =
glseq_forall0<xs><x0>(xs) where
{
#impltmp
forall0$test<x0>(x0) =
let
val () = foreach0$work<x0>(x0) in true
end
}
in
  // nothing
end(*let*)//end-of(glseq_foreach0/forall0)
//
#impltmp
<xs><x0>
glseq_foreach1(xs) =
let
val
test =
glseq_forall1<xs><x0>(xs) where
{
#impltmp
forall1$test<x0>(x0) =
let
val () = foreach1$work<x0>(x0) in true
end
}
in
  // nothing
end(*let*)//end-of(glseq_foreach1/forall1)
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
glseq_append0
  (xs1, xs2) =
(
glseq_foldr0
<xs><x0>< xs >(xs1, xs2)
) where
{
#impltmp
foldr0$fopr
< x0><xs >
( x0, r0 )=
glseq_cons<xs><x0>(x0, r0)
} (* end of [glseq_append0/foldr0] *)
*)
#impltmp
<xs><x0>
glseq_append0
  (xs1, xs2) =
let
val
xs1 =
glseq_strmize0<xs><x0>(xs1)
val
xs2 =
glseq_strmize0<xs><x0>(xs2)
in//let
(
  glseq_make0_lstrm<xs><x0>
  (strm_vt_append0<x0>(xs1, xs2)) )
end (*let*)//end-[glseq_append0(xs,ys)]
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
glseq_reverse0
  ( xs ) =
glseq_rappend0
(xs, glseq_nil<xs><x0>())
*)
#impltmp
<xs><x0>
glseq_reverse0(xs) =
let
val xs =
glseq_rstrmize0<xs><x0>(xs)
in//let
(
  glseq_make0_lstrm<xs><x0>(xs) )
end(*let*)// end-of(glseq_reverse0(xs))
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
glseq_rappend0
  (xs1, xs2) =
(
glseq_foldl0
<xs><x0>< xs >(xs1, xs2)
) where
{
#impltmp
foldl0$fopr
< x0><xs >
( r0, x0 ) =
glseq_cons<xs><x0>(x0, r0)
} (*where*) // (glseq_rappend0/foldl0)
*)
//
#impltmp
<xs><x0>
glseq_rappend0
  (xs1, xs2) =
let
val
xs2 =
glseq_strmize0<xs><x0>(xs2)
val
xs1 =
glseq_rstrmize0<xs><x0>(xs1)
in//let
(
  glseq_make0_lstrm<xs><x0>
  (strm_vt_append0<x0>(xs1, xs2)) )
end(*let*)//end(glseq_rappend0(xs1,xs2))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_add0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
glseq_map0_add0<xs><x0><x0>(xs)
end (*let*) // end-of-[ glseq_add0(xs) ]
//
#impltmp
<xs><x0>
glseq_mul0(xs) =
let
#impltmp
map0$fopr<x0><x0>(x0) = x0
in//let
glseq_map0_mul0<xs><x0><x0>(xs)
end (*let*) // end-of-[ glseq_mul0(xs) ]
//
(* ****** ****** *)
#impltmp
<x0>
glseq_add0$nil = gl_0<x0> // add-unit
#impltmp
<x0>
glseq_mul0$nil = gl_1<x0> // mul-unit
(* ****** ****** *)
//
#impltmp
<xs>
<x0><y0>
glseq_map0_add0(xs) =
let
//
#impltmp
foldl0$fopr
<x0><y0>
(r0, x0) =
gl_add00<y0>
(r0, map0$fopr<x0><y0>(x0))
//
in//let
glseq_foldl0
<xs><x0><y0>(xs, glseq_add0$nil<y0>())
endlet//end-of-[glseq_map0_add0(xs)/foldl]
//
#impltmp
<xs>
<x0><y0>
glseq_map0_mul0(xs) =
let
//
#impltmp
foldl0$fopr
<x0><y0>
(r0, x0) =
gl_mul00<y0>
(r0, map0$fopr<x0><y0>(x0))
//
in//let
glseq_foldl0
<xs><x0><y0>(xs, glseq_mul0$nil<y0>())
endlet//end-of-[glseq_map0_mul0(xs)/foldl]
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_iexists0
  (xs) = let
//
  #impltmp
  iforall0$test<x0>(i0, x0) =
  not(iexists0$test<x0>(i0, x0))
//
in
  if
  glseq_iforall0
  <xs><x0>(xs) then false else true
end // end of [glseq_iexists0/iforall0]
//
#impltmp
<xs><x0>
glseq_iexists1
  (xs) = let
//
  #impltmp
  iforall1$test<x0>(i0, x0) =
  not(iexists1$test<x0>(i0, x0))
//
in
  if
  glseq_iforall1
  <xs><x0>(xs) then false else true
end // end of [glseq_iexists1/iforall1]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_iforall0(xs) =
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
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  glseq_forall0<xs><x0>(xs)
end (* end of [glseq_forall0] *)
//
end(*let*)//end(glseq_iforall0/forall0)
//
#impltmp
<xs><x0>
glseq_iforall1(xs) =
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
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  glseq_forall1<xs><x0>(xs)
end (* end of [glseq_forall1] *)
//
end(*let*)//end(glseq_iforall1/forall1)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
glseq_iforeach0(xs) =
let
val
test =
glseq_iforall0<xs><x0>(xs) where
{
#impltmp
iforall0$test<x0>(i0, x0) =
let
  val () =
  iforeach0$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [glseq_iforeach0/iforall0]
//
#impltmp
<xs><x0>
glseq_iforeach1(xs) =
let
val
test =
glseq_iforall1<xs><x0>(xs) where
{
#impltmp
iforall1$test<x0>(i0, x0) =
let
  val () =
  iforeach1$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [glseq_iforeach1/iforall1]
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
glseq_z2cmp00
  (xs, ys) =
(
glseq_z2forcmp0
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp0$fcmp<x0,x0> = gl_cmp00<x0>
} (* end of [gseq_z2cmp00/z2forcmp0] *)

#impltmp
<xs
,ys><x0>
glseq_z2cmp11
  (xs, ys) =
(
glseq_z2forcmp1
<xs,ys><x0,x0>(xs, ys)
) where
{
#impltmp
z2forcmp1$fcmp<x0,x0> = gl_cmp11<x0>
} (* end of [gseq_z2cmp11/z2forcmp1] *)

(* ****** ****** *)

#impltmp
<xs,ys>
<x0,y0>
glseq_z2forall0
  (xs, ys) =
(
strm_vt_z2forall0<x0,y0>
(
  glseq_strmize0<xs><x0>(xs)
,
  glseq_strmize0<ys><y0>(ys))
) (*where*)//end-of-[glseq_z2forall0]

(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
glseq_z2forcmp0
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  glseq_strmize0<xs><x0>(xs)
,
  glseq_strmize0<ys><y0>(ys))
) (*where*)//end-of-[glseq_z2forcmp0]
//
(* ****** ****** *)
//
#impltmp
<xs,ys>
<x0,y0>
glseq_z2forcmp1
  (xs, ys) =
(
strm_vt_z2forcmp0<x0,y0>
(
  glseq_copy_lstrm<xs><x0>(xs)
,
  glseq_copy_lstrm<ys><y0>(ys))
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
} (*where*)//end-of-[glseq_z2forcmp1]
//
(* ****** ****** *)
//
(*
HX:
For non-linear glseq-ops
*)
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0> //HX-2022-06-10: there is no
glseq_copy = g_copy<xs> //[gseq_copy]
//
(* ****** ****** *)
//
#impltmp
<xs: t0>
<x0: t0>
glseq_strmize0 = gseq_strmize<xs><x0>
#impltmp
<xs: t0>
<x0: t0>
glseq_strmize1 = gseq_strmize<xs><x0>
//
#impltmp
<xs: t0>
<x0: t0>
glseq_rstrmize0 = gseq_rstrmize<xs><x0>
#impltmp
<xs: t0>
<x0: t0>
glseq_rstrmize1 = gseq_rstrmize<xs><x0>
//
(* ****** ****** *)
//
(*
HX-2023-08-14:
Higher-order glseq-functions
Mon Aug 14 13:42:54 EDT 2023
*)
//
(* ****** ****** *)
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
glseq_foldl0_c2fr
( xs, r0, f0 ) =
(
glseq_foldl0
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl0$fopr<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[glseq_foldl0_c2fr(xs,r0,f0)]
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
glseq_foldl1_c2fr
( xs, r0, f0 ) =
(
glseq_foldl1
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldl1$fopr<x0><r0>(r0, x0) = f0(r0, x0)
}(*where*)//end-of[glseq_foldl1_c2fr(xs,r0,f0)]
//
(* ****** ****** *)
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
glseq_foldr0_c2fr
( xs, r0, f0 ) =
(
glseq_foldr0
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr0$fopr<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//end-of[glseq_foldr0_c2fr(xs,r0,f0)]
//
#impltmp
<xs: vt>
<x0: vt>
<r0: vt>
glseq_foldr1_c2fr
( xs, r0, f0 ) =
(
glseq_foldr1
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldr1$fopr<x0><r0>(x0, r0) = f0(x0, r0)
}(*where*)//end-of[glseq_foldr1_c2fr(xs,r0,f0)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq000_vt.dats] *)
