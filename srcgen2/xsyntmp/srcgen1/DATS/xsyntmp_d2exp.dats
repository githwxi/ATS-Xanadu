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
d2exp$top_work
  (  d2e0  ) =
(
case+
d2e0.node() of
//
| D2Eint _ =>
(
  d2exp$D2Eint_work(d2e0))
| D2Ebtf _ =>
(
  d2exp$D2Ebtf_work(d2e0))
| D2Echr _ =>
(
  d2exp$D2Echr_work(d2e0))
| D2Eflt _ =>
(
  d2exp$D2Eflt_work(d2e0))
| D2Estr _ =>
(
  d2exp$D2Estr_work(d2e0))
//
| D2Evar _ =>
(
  d2exp$D2Evar_work(d2e0))
//
| D2Elet0 _ =>
(
  d2exp$D2Elet0_work(d2e0))
//
(*
| _(*otherwise*) =>
(
  printsln
  ("d2exp$top_work: d2e0 = ", d2e0))
*)
//
)(*case+*)//end-of-[d2exp$top_work(d2e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d2explst_work(d2es) =
(
  list_foritm(d2es))
where{
#impltmp
foritm$work<d2exp> = d2exp_work(*nil*)
}
//
#impltmp
<(*tmp*)>
d2expopt_work(dopt) =
(
  optn_foritm(dopt))
where{
#impltmp
foritm$work<d2exp> = d2exp_work(*nil*)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d2exp$D2Elet0_work
(  d2e0  ) =
let
//
val () =
d2eclist_work(dcls)
//
val () = d2exp_work(d2e1)
//
end where
{
val-
D2Elet0(dcls, d2e1) = d2e0.node()
}(*where*)//end-of-[d2exp$D2Elet0_work(d2e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xsyntmp/srcgen1/xsyntmp_d2exp.dats] *)
(***********************************************************************)
