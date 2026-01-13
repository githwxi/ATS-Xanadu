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
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN = 
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_unmk0
(  gseq  ) = $UN.castxy0(gseq)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_unmk1
(  gseq  ) = $UN.castxy1(gseq)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:03:35 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall0
  (gseq) =
(
gseq_forall0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_forall1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_forall1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall0$f1un
  (gseq, test) =
(
GLSEQ_forall0<xs><x0>(gseq))
where
{
#impltmp forall$test0<x0>(*x0*) = test(*x0*)
}(*where*)//end-of-[GLSEQ_forall0$f1un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall1$f1un
  (gseq, test) =
(
GLSEQ_forall1<xs><x0>(gseq))
where
{
#impltmp forall$test1<x0>(*x0*) = test(*x0*)
}(*where*)//end-of-[GLSEQ_forall1$f1un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:03:35 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforall0
  (gseq) =
(
gseq_rforall0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforall1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_rforall1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_rforall1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforall0$f1un
  (gseq, test) =
(
GLSEQ_rforall0<xs><x0>(gseq))
where
{
#impltmp rforall$test0<x0>(*x0*) = test(*x0*)
}(*where*)//end-of-[GLSEQ_rforall0$f1un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforall1$f1un
  (gseq, test) =
(
GLSEQ_rforall1<xs><x0>(gseq))
where
{
#impltmp rforall$test1<x0>(*x0*) = test(*x0*)
}(*where*)//end-of-[GLSEQ_rforall1$f1un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:03:35 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforall0
  (gseq) =
(
gseq_iforall0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforall1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_iforall1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_iforall1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforall0$f2un
  (gseq, test) =
(
GLSEQ_iforall0<xs><x0>(gseq))
where
{
#impltmp iforall$test0<x0>(*i0,x0*) = test(*i0,x0*)
}(*where*)//end-of-[GLSEQ_iforall0$f2un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforall1$f2un
  (gseq, test) =
(
GLSEQ_iforall1<xs><x0>(gseq))
where
{
#impltmp iforall$test1<x0>(*i0,x0*) = test(*i0,x0*)
}(*where*)//end-of-[GLSEQ_iforall1$f2un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:03:35 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforall0
  (gseq) =
(
gseq_irforall0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforall1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_irforall1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_irforall1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforall0$f2un
  (gseq, test) =
(
GLSEQ_irforall0<xs><x0>(gseq))
where
{
#impltmp irforall$test0<x0>(*i0,x0*) = test(*i0,x0*)
}(*where*)//end-of-[GLSEQ_irforall0$f2un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforall1$f2un
  (gseq, test) =
(
GLSEQ_irforall1<xs><x0>(gseq))
where
{
#impltmp irforall$test1<x0>(*i0,x0*) = test(*i0,x0*)
}(*where*)//end-of-[GLSEQ_irforall1$f2un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:16:55 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_foritm0
  (gseq) =
(
gseq_foritm0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_foritm1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val emp = gseq_foritm1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in emp
end(*let*)//end-of-[GLSEQ_foritm1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_foritm0$f1un
  (gseq, work) =
(
GLSEQ_foritm0<xs><x0>(gseq))
where
{
#impltmp foritm$work0<x0>(*x0*) = work(*x0*)
}(*where*)//end-of-[GLSEQ_foritm0$f1un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_foritm1$f1un
  (gseq, work) =
(
GLSEQ_foritm1<xs><x0>(gseq))
where
{
#impltmp foritm$work1<x0>(*x0*) = work(*x0*)
}(*where*)//end-of-[GLSEQ_foritm1$f1un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:16:55 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforitm0
  (gseq) =
(
gseq_rforitm0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforitm1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val emp = gseq_rforitm1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in emp
end(*let*)//end-of-[GLSEQ_rforitm1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforitm0$f1un
  (gseq, work) =
(
GLSEQ_rforitm0<xs><x0>(gseq))
where
{
#impltmp rforitm$work0<x0>(*x0*) = work(*x0*)
}(*where*)//end-of-[GLSEQ_rforitm0$f1un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_rforitm1$f1un
  (gseq, work) =
(
GLSEQ_rforitm1<xs><x0>(gseq))
where
{
#impltmp rforitm$work1<x0>(*x0*) = work(*x0*)
}(*where*)//end-of-[GLSEQ_rforitm1$f1un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:16:55 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforitm0
  (gseq) =
(
gseq_iforitm0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforitm1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_iforitm1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_iforitm1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforitm0$f2un
  (gseq, work) =
(
GLSEQ_iforitm0<xs><x0>(gseq))
where
{
#impltmp iforitm$work0<x0>(*i0,x0*) = work(*i0,x0*)
}(*where*)//end-of-[GLSEQ_iforitm0$f2un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_iforitm1$f2un
  (gseq, work) =
(
GLSEQ_iforitm1<xs><x0>(gseq))
where
{
#impltmp iforitm$work1<x0>(*i0,x0*) = work(*i0,x0*)
}(*where*)//end-of-[GLSEQ_iforitm1$f2un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 12:16:55 AM EST 2026
*)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforitm0
  (gseq) =
(
gseq_irforitm0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforitm1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_irforitm1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end(*let*)//end-of-[GLSEQ_irforitm1<xs><x0>(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforitm0$f2un
  (gseq, work) =
(
GLSEQ_irforitm0<xs><x0>(gseq))
where
{
#impltmp irforitm$work0<x0>(*i0,x0*) = work(*i0,x0*)
}(*where*)//end-of-[GLSEQ_irforitm0$f2un<xs><x0>(...)]
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_irforitm1$f2un
  (gseq, work) =
(
GLSEQ_irforitm1<xs><x0>(gseq))
where
{
#impltmp irforitm$work1<x0>(*i0,x0*) = work(*i0,x0*)
}(*where*)//end-of-[GLSEQ_irforitm1$f2un<xs><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_gcls000_vt.dats] *)
(***********************************************************************)
