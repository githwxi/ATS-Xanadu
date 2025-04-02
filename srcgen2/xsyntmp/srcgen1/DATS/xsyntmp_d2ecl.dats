(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(* ****** ****** *)
(* ****** ****** *)
(*
Author: Hongwei Xi
Mon Mar 31 05:44:21 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xsyntmp.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d2ecl$top_work(dcl0) =
(
case+
dcl0.node() of
//
| D2Clocal0 _ =>
(
  d2ecl$D2Clocal0_work(dcl0))
//
| _(*otherwise*) =>
(
  printsln
  ("d2ecl$top_work: dcl0 = ", dcl0))
//
)(*case+*)//end-of-[d2ecl$top_work(dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d2ecl$D2Clocal0_work
  (  dcl0  ) =
let
//
val () = d2eclist_work(head)
val () = d2eclist_work(body)
//
end where
{
val-
D2Clocal0(head, body) = dcl0.node()
}(*where*)//end-of-[d2ecl$D2Clocal0_work(dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xsyntmp/srcgen1/xsyntmp_d2ecl.dats] *)
(***********************************************************************)
