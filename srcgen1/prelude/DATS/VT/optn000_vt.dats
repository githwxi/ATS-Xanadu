(* ****** ****** *)
(*
** For optn_vt
*)
(* ****** ****** *)
(*
#staload
"./../SATS/optn.sats"
*)
(* ****** ****** *)
//
#impltmp
{a:vt}
g_free
<optn_vt(a)> = optn_vt_free<a>
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_free(xs) =
(
case+ xs of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(x0) => g_free<a>(x0)
) (*case+*) // end of [optn_vt_free]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_copy(xs) =
(
case+ xs of
| // !
optn_vt_nil() =>
optn_vt_nil()
| // !
optn_vt_cons(x0) =>
let
val x0 =
g_copy<a>(x0) in optn_vt_cons(x0)
endlet // end of [optn_vt_cons(x0)]
) (*case+*) // end of [optn_vt_copy]
//
#impltmp
<a>(*tmp*)
optn_vt_rcopy = optn_vt_copy<a>(*xs*)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
optn_vt_nilq1(xs) =
(
case+ xs of
| // !
optn_vt_nil() => true
| // !
optn_vt_cons(x0) => false)
//
#impltmp
<>(*tmp*)
optn_vt_consq1(xs) =
(
case+ xs of
| // !
optn_vt_nil() => false
| // !
optn_vt_cons(x0) => (true))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_length0(xs) =
(
case+ xs of
| ~
optn_vt_nil() => ( 0 )
| ~
optn_vt_cons(x0) =>
let
val () =
g_free<a>(x0) in 1 end )
//
#impltmp
<a>(*tmp*)
optn_vt_length1(xs) =
(
case+ xs of
| optn_vt_nil() => 0
| optn_vt_cons(x0) => 1 )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_listize0(xs) =
(
case+ xs of
| ~
optn_vt_nil
( (*void*) ) => list_vt_nil()
| ~
optn_vt_cons
(    x0    ) => list_vt_sing(x0))
//
#impltmp
<a>(*tmp*)
optn_vt_rlistize0(xs) =
(
case+ xs of
| ~
optn_vt_nil
( (*void*) ) => list_vt_nil()
| ~
optn_vt_cons
(    x0    ) => list_vt_sing(x0))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_strmize0(xs) =
$llazy
(
g_free(xs);
case+ xs of
| ~
optn_vt_nil() =>
strmcon_vt_nil()
| ~
optn_vt_cons(x0) =>
strmcon_vt_sing(x0))//optn_vt_strmize0
//
#impltmp
<a>(*tmp*)
optn_vt_rstrmize0(xs) =
$llazy
(
g_free(xs);
case+ xs of
| ~
optn_vt_nil() =>
strmcon_vt_nil()
| ~
optn_vt_cons(x0) =>
strmcon_vt_sing(x0))//optn_vt_strmize0
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_forall0(xs) =
(
case+ xs of
| ~
optn_vt_nil() => (true)
| ~
optn_vt_cons(x0) => forall$test0<a>(x0)
) (*case+*)//end of [optn_vt_forall0(xs)]
//
#impltmp
<a>(*tmp*)
optn_vt_forall1(xs) =
(
case+ xs of
| // !
optn_vt_nil() => (true)
| // !
optn_vt_cons(x0) => forall$test1<a>(x0)
) (*case+*)//end of [optn_vt_forall1(xs)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_foreach0(xs) =
(
case+ xs of
| ~
optn_vt_nil() => ((*void*))
| ~
optn_vt_cons(x0) => foreach$work0<a>(x0)
) (*case+*)//end-of-[optn_vt_foreach0(xs)]
//
#impltmp
<a>(*tmp*)
optn_vt_foreach1(xs) =
(
case+ xs of
| // !
optn_vt_nil() => ((*void*))
| // !
optn_vt_cons(x0) => foreach$work1<a>(x0)
) (*case+*)//end-of-[optn_vt_foreach1(xs)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
<b>(*tmp*)
optn_vt_map0(xs) =
(
case+ xs of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(x0) =>
let
val y0 =
map$fopr0<a><b>(x0) in optn_vt_cons(y0)
end//let
) (*case+*) // end-of-[ optn_vt_map0(xs) ]
//
#impltmp
<a>(*tmp*)
<b>(*tmp*)
optn_vt_map1(xs) =
(
case+ xs of
| // !
optn_vt_nil() =>
optn_vt_nil((*0*))
| // !
optn_vt_cons(x0) =>
let
val y0 =
map$fopr1<a><b>(x0) in optn_vt_cons(y0)
end//let
) (*case+*) // end-of-[ optn_vt_map1(xs) ]
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_copy
<optn_vt(a)><a> = optn_vt_copy<a>
//
#impltmp
{a:vt}
gseq_free
<optn_vt(a)><a> = optn_vt_free<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_forall0
<optn_vt(a)><a> = optn_vt_forall0<a>
#impltmp
{a:vt}
gseq_forall1
<optn_vt(a)><a> = optn_vt_forall1<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_listize0
<optn_vt(a)><a> = optn_vt_listize0<a>
#impltmp
{a:vt}
gseq_strmize0
<optn_vt(a)><a> = optn_vt_strmize0<a>
//
#impltmp
{a:vt}
gseq_rlistize0
<optn_vt(a)><a> = optn_vt_rlistize0<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
{b:vt}
gseq_map0
<optn_vt(a)><a>
<optn_vt(b)><b> = optn_vt_map0<a><b>(*xs*)
#impltmp
{a:vt}
{b:vt}
gseq_map1
<optn_vt(a)><a>
<optn_vt(b)><b> = optn_vt_map1<a><b>(*xs*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_optn000_vt.dats] *)
