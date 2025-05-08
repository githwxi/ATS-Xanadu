(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 07 Aug 2024 02:18:49 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
strn_forall<> =
gasz_forall<strn><cgtz>
*)
//
#impltmp
<>(*tmp*)
strn_forall(cs) =
(
  nint_forall<>(n0))
where
{
//
val n0 =
(
  strn_length<>(cs))
//
#impltmp
forall$test<ni>(i0) =
(
  forall$test<cgtz>(c0))
where
{
val c0 =
  $UN.strn_get$at$raw<>(cs, i0)
}
}(*where*)//end-of-[strn_forall(cs)]
//
#impltmp
<>(*tmp*)
strn_forall$f1un
  (cs, test) =
(
  strn_forall<>(cs)) where
{
#impltmp
forall$test<cgtz>(ch) = test(ch)
}(*where*)//end-of-[strn_forall$f1un]
//
#impltmp
gseq_forall
<strn><cgtz> = strn_forall<>(*void*)
//
#impltmp
gasz_forall
<strn><cgtz>(cs) =
(
strn_forall<>(cs)) where
{
#impltmp
forall$test<cgtz> = forall$test1<cgtz>
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rforall(cs) =
(
  nint_rforall<>(n0))
where
{
//
val n0 = strn_length<>(cs)
//
#impltmp
rforall$test<ni>(i0) =
(
  rforall$test<cgtz>(c0)) where
{
val c0 =
  $UN.strn_get$at$raw<>(cs, i0)
}
}(*where*)//end-of-[strn_rforall(cs)]
//
#impltmp
<>(*tmp*)
strn_rforall$f1un
  (cs, test) =
(
  strn_rforall<>(cs)) where
{
#impltmp
rforall$test<cgtz>(ch) = test(ch)
}(*where*)//end-of-[strn_rforall$f1un]
//
#impltmp
gseq_rforall
<strn><cgtz> = strn_rforall<>(*void*)
//
#impltmp
gasz_rforall
<strn><cgtz>(cs) =
(
strn_rforall<>(cs)) where
{
#impltmp
rforall$test<cgtz> = rforall$test1<cgtz>
}
//
(* ****** ****** *)
//
(*
HX-2024-08-07:
The following code simply
indicate no need for these
special function interfaces!
The code is kept as a referece.
Wed 07 Aug 2024 02:22:37 PM EDT
*)
//
(*
#impltmp
<>(*tmp*)
strn_iforall =
gseq_iforall<strn><cgtz>
*)
//
#impltmp
<>(*tmp*)
strn_iforall(cs) =
(
  nint_forall<>(n0))
where
{
//
val n0 =
(
  strn_length<>(cs))
//
#impltmp
forall$test<ni>(i0) =
(
iforall$test<cgtz>(i0, c0))
where
{
val c0 =
  $UN.strn_get$at$raw<>(cs, i0)
}
}(*where*)//end-of-[strn_iforall(cs)]
//
#impltmp
<>(*tmp*)
strn_iforall$f2un
  (cs, test) =
(
  strn_iforall<>(cs)) where
{
#impltmp
iforall$test<cgtz>(i0,ch) = test(i0,ch)
}
//
#impltmp
gseq_iforall
<strn><cgtz> = strn_iforall<>(*void*)
//
#impltmp
gasz_iforall
<strn><cgtz>(cs) =
(
strn_iforall<>(cs)) where
{
#impltmp
iforall$test<cgtz> = iforall$test1<cgtz>
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_irforall =
gseq_irforall<strn><cgtz>
//
#impltmp
<>(*tmp*)
strn_irforall$f2un
  (cs, test) =
(
  strn_irforall<>(cs)) where
{
#impltmp
irforall$test<cgtz>(i0,ch) = test(i0,ch)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_foritm =
gseq_foritm<strn><cgtz>
#impltmp
<>(*tmp*)
strn_foritm$f1un
  (cs, work) =
(
  strn_foritm<>(cs)) where
{
#impltmp
foritm$work<cgtz>(ch) = work(ch)
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rforitm =
gseq_rforitm<strn><cgtz>
#impltmp
<>(*tmp*)
strn_rforitm$f1un
  (cs, work) =
(
  strn_rforitm<>(cs)) where
{
#impltmp
rforitm$work<cgtz>(ch) = work(ch)
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_iforitm =
gseq_iforitm<strn><cgtz>
#impltmp
<>(*tmp*)
strn_iforitm$f2un
  (cs, work) =
(
  strn_iforitm<>(cs)) where
{
#impltmp
iforitm$work<cgtz>(i0,ch) = work(i0,ch)
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_irforitm =
gseq_irforitm<strn><cgtz>
#impltmp
<>(*tmp*)
strn_irforitm$f2un
  (cs, work) =
(
  strn_irforitm<>(cs)) where
{
#impltmp
irforitm$work<cgtz>(i0,ch) = work(i0,ch)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
<>(*tmp*)
strn_listize = gasz_listize<strn><cgtz>
#impltmp
<>(*tmp*)
strn_strmize = gasz_strmize<strn><cgtz>
#impltmp
<>(*tmp*)
strn_strqize = gasz_strqize<strn><cgtz>
//
#impltmp
<>(*tmp*)
strn_rlistize = gasz_rlistize<strn><cgtz>
#impltmp
<>(*tmp*)
strn_rstrmize = gasz_rstrmize<strn><cgtz>
#impltmp
<>(*tmp*)
strn_rstrqize = gasz_rstrqize<strn><cgtz>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
gseq_strn$concat
  ( xs ) = let
//
#typedef x0 = strn
//
in//let
strn_fmake_fwork<>
(
lam(work) =>
gseq_foritm$f1un<xs><x0>(xs,
lam(cs) => strn_foritm$f1un<>(cs, work)))
end(*let*)//end-of-[gseq_strn$concat( xs )]
//
#impltmp
< xs:t0 >
gseq_strn$rconcat
  ( xs ) = let
//
#typedef x0 = strn
//
in//let
strn_fmake_fwork<>
(
lam(work) =>
gseq_rforitm$f1un<xs><x0>(xs,
lam(cs) => strn_rforitm$f1un<>(cs, work)))
end(*let*)//end-of-[gseq_strn$rconcat( xs )]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-08:
Thu May  8 02:19:19 PM EDT 2025
*)
#impltmp
<(*tmp*)>
strm_vt_strn$concat0
  ( xs ) =
let
//
#vwtpdef
xs = strm_vt(strn)
//
in//let
//
strn_fmake0_env$fwork<xs>
(
xs,
lam(xs, work) =>
strm_vt_foritm0$f1un<strn>(xs,
lam(cs) => strn_foritm$f1un(cs, work)))
//
end(*let*)//end-of-[strm_vt_strn$concat0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_strn001.dats] *)
(***********************************************************************)
