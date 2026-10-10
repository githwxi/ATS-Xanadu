(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-10-06:
SOOP: Static OOP!!!
Tue Oct  6 07:04:04 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../IFACE/seq.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#absprop ASQ(px:pp)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_length0(xs: ~xs): nint
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_length1(xs: !xs): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_cget$at$raw1(xs: !xs, i0: nint): (x0)
//
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_cget$at$exn1(xs: !xs, i0: nint): (x0)
//
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_cget$at$opt1(xs: !xs, i0: nint): loptn(x0)
//
(* ****** ****** *)
//
#extern
fun
<px:pp>
<xs:vt>
<x0:vt>
f1asq_lget$at$raw1(xs: !xs, i0: nint): (owed(x0) | x0)
//
(***********************************************************************)
(***********************************************************************)
//
#impltmp
{ px:pp }
f0seq_beg<ASQ(px)>() = "ASQ("
//
(***********************************************************************)
(***********************************************************************)
//
#impltmp
{ px:pp }
{ xs:vt,
  x0:vt }
f1seq_forall1
<ASQ(px)><xs><x0>(xs) =
(
  loop(xs, 0(*i0*)))
where 
{
//
val ln =
f1asq_length1
<px><xs><x0>(xs)
//
fun
loop
(xs: !xs, i0: ni): bool =
if
(i0 >= ln)
then true else
let
//
val
(pf|x1) =
f1asq_lget$at$raw1<px>(xs, i0)
//
val btf = forall$test1<x0>(x1)
pvx ( ) = owed_vt_return0{x0}(pf|x1)
//
in//let
(
if btf then loop(xs, i0+1) else false)
end(*let*)//end-of-[loop(xs, i0)]
//
}(*where*)//end-of-[f1seq_forall1<ASQ(px)><xs><x0>(xs)]
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude/almanac/pre2026/SOOP/IFACE/asq.dats] *)
(***********************************************************************)
(***********************************************************************)
