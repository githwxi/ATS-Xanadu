(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 01 Oct 2022 01:51:01 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)

#implfun
sort2_intq
(  s2t0  ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = INT_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_intq]

(* ****** ****** *)
//
#implfun
sort2_funq
(  s2t0  ) =
let
(*
val () =
prerrln
("sort2_funq: s2t0 = ", s2t0)
*)
in//let
(
case+ s2t0 of
| S2Tfun0 _ => true
| S2Tfun1 _ => true | _ => false )
end (*let*) // end of [ sort2_funq ]
//
(* ****** ****** *)
//
#implfun
sort2_boxq
  (s2t0) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
 case+ s2tb of
 |
 T2Bimpr
 (knd, _) =>
 (sortbox(knd) > 0)
 |
 _(*non-T2Bimpr*) => false
)
| _(*non-S2Tbas*) => false
) (* case+ *) // end of [sort2_boxq]
//
(* ****** ****** *)
//
#implfun
sort2_linq
  (s2t0) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
 case+ s2tb of
 |
 T2Bimpr
 (knd, _) =>
 (sortlin(knd) > 0)
 |
 _(*non-T2Bimpr*) => false
)
| _(*non-S2Tbas*) => false
) (* case+ *) // end of [sort2_linq]
//
(* ****** ****** *)
//
#implfun
sort2_prfq
  (s2t0) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
 case+ s2tb of
 |
 T2Bimpr
 (knd, _) =>
 (sortprf(knd) > 0)
 |
 _(*non-T2Bimpr*) => false
)
| _(*non-S2Tbas*) => false
) (* case+ *) // end of [sort2_prfq]
//
(* ****** ****** *)

#implfun
sort2_addrq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = ADDR_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_addrq]

(* ****** ****** *)

#implfun
sort2_boolq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = BOOL_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_boolq]

(* ****** ****** *)

#implfun
sort2_charq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = CHAR_symbl)
| _ (* non-T2Bpred *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_charq]

(* ****** ****** *)
//
#implfun
sort2_imprq
(   s2t0   ) =
(
case+ s2t0 of
//
|
S2Tbas(tbas) =>
(
case+ tbas of
|
T2Bimpr _ => true
|
_(*non-T2Bimpr*) => false
)
//
|
S2Tfun1
(targ, tres) => sort2_imprq(tres)
//
| _(* rest-of-sort2 *) => ( false )
//
) (* case+ *) // end of [sort2_imprq]
//
(* ****** ****** *)
//
#implfun
sort2_prgmq
(   s2t0   ) =
(
case+ s2t0 of
|
S2Tbas(tbas) =>
(
case+ tbas of
|
T2Bimpr(knd, _) =>
(sortprf(knd) <= 0) | _(*else*) => false
)
|
_ (* non-S2Tbas *) => false) // sort2_prgmq
//
(* ****** ****** *)
//
#implfun
sort2_polpos(s2t0) =
(
//
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|
T2Bimpr(knd0, sym0) =>
(
S2Tbas(T2Bimpr(knd1, sym0))
) where
{
  val knd1 = sortpolpos(knd0)
} (*end-of-T2Bimpr*)
|
_ (*non-T2Bimpr(...)*) => s2t0
)
| _(* non-S2Tbas(...) *) => s2t0
//
) (*case+*) // end of [sort2_polpos(s2t0)]
//
(* ****** ****** *)
//
#implfun
sort2_polneg(s2t0) =
(
//
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|
T2Bimpr(knd0, sym0) =>
(
S2Tbas(T2Bimpr(knd1, sym0))
) where
{
  val knd1 = sortpolneg(knd0)
} (*end-of-T2Bimpr*)
|
_ (*non-T2Bimpr(...)*) => s2t0
)
| _(* non-S2Tbas(...) *) => s2t0
//
) (*case+*) // end of [sort2_polneg(s2t0)]
//
(* ****** ****** *)
#implfun
t2abs_equal
(x1, x2) =
(x1.stmp() = x2.stmp())
(* ****** ****** *)
#implfun
t2dat_equal
(x1, x2) =
(x1.stmp() = x2.stmp())
(* ****** ****** *)
#impltmp
g_lte<t2bas> = lte_t2bas_t2bas
(* ****** ****** *)
(* ****** ****** *)

local
//
(*
HX: For
debugging [subsort_test]
*)
//
(*
fun
subsort_test
( t1: sint
, t2: sint): bool =
(
if
( sortbox(t1)
< sortbox(t2) ) then false
else
(
if
( sortlin(t1)
> sortlin(t2) ) then false
else
( sortprf(t1) <= sortprf(t2) )
)
) where
{
//
(*
val () =
prerrln("subsort_test: t1 = ", t1)
val () =
prerrln("subsort_test: t2 = ", t2)
//
val b1 = sortbox(t1)
val b2 = sortbox(t2)
val () =
prerrln("subsort_test:sortbox(t1) = ", b1)
val () =
prerrln("subsort_test:sortbox(t2) = ", b2)
//
val b1 = sortlin(t1)
val b2 = sortlin(t2)
val () =
prerrln("subsort_test:sortlin(t1) = ", b1)
val () =
prerrln("subsort_test:sortlin(t2) = ", b2)
//
val b1 = sortprf(t1)
val b2 = sortprf(t2)
val () =
prerrln("subsort_test:sortprf(t1) = ", b1)
val () =
prerrln("subsort_test:sortprf(t2) = ", b2)
*)
//
}(*where*) // end-of-[subsort_test(t1, t2)]
*)
//
in(*local*)
//
#implfun
lte_t2bas_t2bas
  ( x1 , x2 ) =
(
case+
(x1, x2) of
|
( T2Bpred(nm1)
, T2Bpred(nm2)) => (nm1 = nm2)
|
( T2Btabs(ta1)
, T2Btabs(ta2)) => t2abs_equal(ta1, ta2)
|
( T2Btdat(td1)
, T2Btdat(td2)) => t2dat_equal(td1, td2)
|
( T2Bimpr(kx1, _)
, T2Bimpr(kx2, _)) => subsort_test(kx1, kx2)
//
| (_(*rest*) , _(*rest*)) => (    false    )
//
) (*case+*) // end of [lte_t2bas_t2bas(x1,x2)]
//
end (*local*) // end of [local(lte_t2bas_t2bas)]

(* ****** ****** *)
#impltmp
g_lte // <=
<sort2> = lte_sort2_sort2
#impltmp
g_lte // <=
<sort2lst> = lte_sort2lst_sort2lst
(* ****** ****** *)
//
#implfun
lte_sort2_sort2
  ( x1 , x2 ) =
(
case+ x1 of
//
|
S2Tid0
(tid1) =>
(
case+ x2 of
|
S2Tid0
(tid2) => (tid1 = tid2) | _ => false
)
//
|
S2Tint
(int1) =>
(
case+ x2 of
|
S2Tint
(int2) => (int1 = int2) | _ => false
)
//
|
S2Tbas
(stb1) =>
(
case+ x2 of
|
S2Tbas
(stb2) => (stb1 <= stb2) | _ => false
)
//
|
S2Ttup
(sts1) =>
(
case+ x2 of
|
S2Ttup
(sts2) => (sts1 <= sts2) | _ => false
)
//
|
S2Tfun1
(arg1, res1) =>
(
case+ x2 of
|
S2Tfun1
(arg2, res2) =>
if
(arg2 <= arg1)then(res1 <= res2)else(false)
| _ (* non-S2Tfun1 *) => false
)
//
|
S2Tapps
(s2f1, arg1) =>
(
case+ x2 of
|
S2Tapps
(s2f2, arg2) =>
if
(s2f1 <= s2f2)then(arg1 <= arg2)else(false)
| _ (* non-S2Tapps *) => false
)
//
| _ (* rest-of-sort2 *) => false
(*
|S2Tfun0() => false
|S2Tnone0() => false |S2Tnone(s1t1) => false 
*)
//
) where
{
(*
  val () =
  prerrln("lte_sort2_sort2: x1 = ", x1)
  val () =
  prerrln("lte_sort2_sort2: x2 = ", x2)
*)
} (*where*) // end of [lte_sort2_sort2(x1,x2)]

(* ****** ****** *)
//
#implfun
lte_sort2lst_sort2lst
   (  xs1 , xs2  ) =
(
case+ xs1 of
|
list_nil() =>
(
case+ xs2 of
|list_nil() => true
|list_cons _ => false)
|
list_cons(x1, xs1) =>
(
case+ xs2 of
|list_nil() => false
|list_cons(x2, xs2) =>
 (if x1 <= x2 then xs1 <= xs2 else false))
) (*case+*) // end of [lte_sort2lst_sort2lst(...)]
//
(* ****** ****** *)
#implfun
s2cst_linq(s2c0) =
sort2_linq(s2c0.sort())
#implfun
s2cst_prfq(s2c0) =
sort2_prfq(s2c0.sort())
#implfun
s2cst_imprq(s2c0) =
sort2_imprq(s2c0.sort())
#implfun
s2cst_prgmq(s2c0) =
sort2_prgmq(s2c0.sort())
(* ****** ****** *)
//
#implfun
s2exp_linq(s2e0) =
(
sort2_linq(s2e0.sort()))
#implfun
s2exp_prfq(s2e0) =
(
sort2_prfq(s2e0.sort()))
#implfun
s2exp_imprq(s2e0) =
(
sort2_imprq(s2e0.sort()))
#implfun
s2exp_prgmq(s2e0) =
(
sort2_prgmq(s2e0.sort()))
//
(* ****** ****** *)
//
#implfun
s2exp_cbrfq(s2e0) =
(
case+
s2e0.node() of
|S2Earg1
(knd0, _) => (knd0 < 0)
|S2Eatx2
(s2e1, _) => s2exp_cbrfq(s2e1)
|_(* otherwise *) => ( false ))
//
(* ****** ****** *)
//
#implfun
s2explst_linq(s2es) =
(
  list_exists(s2es)) where
{
#impltmp
exists$test<s2exp> = s2exp_linq }
#implfun
s2explst_prfq(s2es) =
(
  list_forall(s2es)) where
{
#impltmp
forall$test<s2exp> = s2exp_prfq }
//
#implfun
s2explst_imprq(s2es) =
(
  list_exists(s2es)) where
{
#impltmp
exists$test<s2exp> = s2exp_imprq }
#implfun
s2explst_prgmq(s2es) =
(
  list_exists(s2es)) where
{
#impltmp
exists$test<s2exp> = s2exp_prgmq }
//
(* ****** ****** *)
//
#implfun
l2s2elst_linq(lses) =
(
  list_exists(lses)) where
{
#impltmp
exists$test
<l2s2e>(ls2e) = s2exp_linq(ls2e.itm())
}
//
#implfun
l2s2elst_prfq(lses) =
(
  list_forall(lses)) where
{
#impltmp
forall$test
<l2s2e>(ls2e) = s2exp_prfq(ls2e.itm())
}
//
#implfun
l2s2elst_imprq(lses) =
(
  list_exists(lses)) where
{
#impltmp
exists$test
<l2s2e>(ls2e) = s2exp_imprq(ls2e.itm())
}
//
#implfun
l2s2elst_prgmq(lses) =
(
  list_exists(lses)) where
{
#impltmp
exists$test
<l2s2e>(ls2e) = s2exp_prgmq(ls2e.itm())
}
//
(* ****** ****** *)
//
#implfun
s2exp_stck
( loc0
, s2e1, s2t2) =
let
val
s2t1 = s2e1.sort()
in//let
if
(s2t1 <= s2t2)
then s2e1 else
s2exp_cast(loc0,s2e1,s2t2)
end (*let*) // end of [s2exp_stck(loc0,...)]
//
#implfun
l2s2e_stck
( loc0
, ls2e, s2t2) =
let
val+
S2LAB
(l1, s2e1) = ls2e
val
s2t1 = s2e1.sort()
//
in//let
if
(s2t1 <= s2t2)
then ls2e else
S2LAB(l1, s2exp_cast(loc0,s2e1,s2t2))
end (*let*) // end of [l2s2e_stck(loc0,...)]
//
(* ****** ****** *)
//
#implfun
s2explst_stck
( loc0
, s2es, s2t2 ) =
let
val test =
list_forall
<x0>( s2es ) where
{
#typedef x0 = s2exp
#impltmp
forall$test
< x0 >( x0 ) = x0.sort() <= s2t2
}
in//let
if test
then s2es else
list_map
<x0><y0>(s2es) where
{
 #typedef x0 = s2exp
 #typedef y0 = s2exp
 #impltmp
 map$fopr
 <x0><y0>(x0) = s2exp_stck(loc0,x0,s2t2)
}
end (*let*) // end of [s2explst_stck(...)]
//
(* ****** ****** *)
//
#implfun
l2s2elst_stck
( loc0
, lses, s2t2 ) =
let
val test =
list_forall
<x0>( lses ) where
{
#typedef x0 = l2s2e
#impltmp
forall$test
< x0 >( x0 ) = x0.sort() <= s2t2
}
in//let
if test
then lses else
list_map
<x0><y0>(lses) where
{
 #typedef x0 = l2s2e
 #typedef y0 = l2s2e
 #impltmp
 map$fopr
 <x0><y0>(x0) = l2s2e_stck(loc0,x0,s2t2)
}
end (*let*) // end of [l2s2elst_stck(...)]
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
f0_l1st
( s2es
: s2explst
, i0: sint
, lses
: l2s2elst_vt): l2s2elst_vt =
(
case+ s2es of
|
list_nil() => lses
|
list_cons
(s2e1, s2es) =>
(
f0_l1st(s2es, i0+1, lses)
) where
{
val l0 = LABint(i0)
val lse1 = S2LAB(l0, s2e1)
val lses = list_vt_cons(lse1, lses)
} // end of [list_cons]
) (*case+*) // end of [f0_l1st(...)]

(* ****** ****** *)

fun
f0_l2st
( ses1
: s2explst
, ses2
: s2explst
, i0: int
, lses
: l2s2elst_vt): l2s2elst_vt =
(
case+ ses1 of
|
list_nil() =>
f0_l1st(ses2, i0, lses)
|
list_cons(s2e1, ses1) =>
(
f0_l2st
(ses1, ses2, i0+1, lses)
) where
{
val l0 = LABint(i0)
val lse1 = S2LAB(l0, s2e1)
val lses = list_vt_cons(lse1, lses)
} // end of [list_cons]
) (*case+*) // end of [f0_l2st(...)]

(* ****** ****** *)

in//local

(* ****** ****** *)

#implfun
l2s2elst_make_l1st
      (s2es) =
let
val i0 = 0
val lses = list_vt_nil()
val lses = f0_l1st(s2es,i0,lses)
in//let
  list_vt2t(list_vt_reverse0(lses))
end (*let*) // end of [l2s2elst_make_l1st]

(* ****** ****** *)

#implfun
l2s2elst_make_l2st
  ( ses1, ses2 ) =
let
  val i0 = 0
  val lses = list_vt_nil()
  val lses =
  f0_l2st( ses1, ses2, i0, lses )
in//let
  list_vt2t(list_vt_reverse0(lses))
end (*let*) // end of [l2s2elst_make_l2st]

(* ****** ****** *)

end (*local*) // end of [local(l2s2elst_make)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp2_utils1.dats] *)
