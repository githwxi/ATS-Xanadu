(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July 02, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload
"./../../../SATS/label0.sats"
#staload
"./../../../SATS/locinfo.sats"
(* ****** ****** *)
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
#staload
"./../../../SATS/tread33.sats"
(* ****** ****** *)
//
extern
fun{}
my_tread33_prerr_t2ypedfflst
( dffs: t2ypedfflst ) : void
//
implement
{}(*tmp*)
my_tread33_prerr_t2ypedfflst
  (dffs) =
(
  auxlst(dffs)
) where
{
//
fun
auxpth
( ps
: synpth): void =
(
ignoret(auxpth2(ps))
)
and
auxpth2
(ps: synpth): int =
(
case+ ps of
|
list_nil() => 0
|
list_cons(p0, ps) =>
let
  val n0 = auxpth2(ps)
in
  if
  (n0 > 0)
  then
  prerr('.'); prerr(p0); n0+1
end // end of [list_cons]
)
//
fun
auxnil() =
prerr("*NONE*")
//
fun
auxone
( dff0
: t2ypedff): void =
(
case+ dff0 of
|
T2Pdff01(ps, t2p2) =>
(
prerr
("root@");
auxpth(ps);
prerr(": ");
auxnil(   ); prerrln!();
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(t2p2); prerrln!();
)
|
T2Pdff10(ps, t2p1) =>
(
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(t2p1); prerrln!();
prerr
("root@");
auxpth(ps);
prerr(": ");
auxnil(   ); prerrln!();
)
|
T2Pdff11(ps, t2p1, t2p2) =>
(
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(t2p1); prerrln!();
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(t2p2); prerrln!();
)
|
T2Pdff11_npf(ps, npf1, npf2) =>
(
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(npf1); prerrln!();
prerr
("root@");
auxpth(ps);
prerr(": ");
prerr(npf2); prerrln!();
)
) (* end of [auxone] *)
//
and
auxlst
( dffs
: t2ypedfflst): void =
(
case+ dffs of
|
list_nil() => ()
|
list_cons
(dff0, dffs) =>
{
  val () = auxone(dff0)
  val () = auxlst(dffs)
}
) (* end of [auxlst] *)
//
} (* my_tread33_prerr_t2ypedfflst *)
//
(* ****** ****** *)
//
extern
fun{}
my_tread33_d3exp_D3Elcast: treader33(d3exp)
extern
fun{}
my_tread33_d3exp_D3Etcast: treader33(d3exp)
//
(* ****** ****** *)

implement
{}(*tmp*)
my_tread33_d3exp_D3Elcast
  (d3e0) = let
//
val
loc0 = d3e0.loc()
val-
D3Elcast
(d3e1, lab2) = d3e0.node()
//
val
t2p1 = d3e1.type()
val
t2p1 = whnfize(t2p1)
//
val () =
tread33_d3exp(d3e1)
val () =
trerr33_add(TRERR33d3exp(d3e0))
//
in
prerrln!
(loc0, ": ***TRERR33***");
prerrln!
( loc0
, ": TRERR33(D3Elcast): the d3exp: ", d3e1);
prerrln!
( loc0
, ": TRERR33(D3Elcast): the missing label: ", lab2);
prerrln!
( loc0
, ": TRERR33(D3Elcast): the inferred type = ", t2p1);
end // end of [my_tread33_d3exp_D3Elcast]

(* ****** ****** *)
  
implement
{}(*tmp*)
my_tread33_d3exp_D3Etcast
  (d3e0) = let
//
val
loc0 = d3e0.loc()
val-
D3Etcast
(d3e1, t2p2) = d3e0.node()
//
val
t2p1 = d3e1.type()
val
t2p1 = whnfize(t2p1)
//
val () =
tread33_d3exp(d3e1)
val () =
trerr33_add(TRERR33d3exp(d3e0))
//
val () =
prerrln!
(loc0, ": ***TRERR33***");
val () =
prerrln!
( loc0
, ": TRERR33(D3Etcast): type-mismatch");
val () =
prerrln!
( loc0
, ": TRERR33(D3Etcast): the d3exp: ", d3e1);
val () =
prerrln!
( loc0
, ": TRERR33(D3Etcast): the inferred type: ", t2p1);
val () =
prerrln!
( loc0
, ": TRERR33(D3Etcast): the expected type: ", t2p2);
in
let
val dffs =
t2ype_diffize
(t2p1, t2p2) in my_tread33_prerr_t2ypedfflst<>(dffs)
end
end // end of [my_tread33_d3exp_D3Etcast]

(* ****** ****** *)

(* end of [tread33_dynexp.dats] *)
