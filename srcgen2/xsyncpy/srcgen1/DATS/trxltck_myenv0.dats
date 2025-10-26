(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Jul  1 05:34:24 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/xsyncpy.sats"
#staload
"./../SATS/trxltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ1_linq
(t2q0: s2typ1): bool =
(
  sort2_linq(t2q0.sort()))
#symload linq with s2typ1_linq
//
fun
d3typ1_linq
(t3q0: d3typ1): bool =
(
case+
t3q0.node() of
|T3P1none() => false
|T3P1styp(t2q1) => linq(t2q1)
|_(*otherwise*) => (  false  )
)(*case+*)//endof(d3typ1_linq)
#symload linq with d3typ1_linq
//
(* ****** ****** *)
//
fun
d3typ1_delin
(t3q0: d3typ1): d3typ1 =
(
case+
t3q0.node() of
//
|
T3P1none() => (t3q0)
//
|
T3P1styp(t2q1) =>
let
val
t2q0 = t3q0.styp()
val
t2q2 =
s2typ1_t1pize(t2q1)
in//let
//
d3typ1(t2q0, T3P1styp(t2q2))
//
end//let//end-of-(T3P1styp())
//
|_(*otherwise*) => (   t3q0   )
//
) where
{
//
#symload
d3typ1 with d3typ1_make_styp$node
//
}(*where+*)//end-of-[d3typ1_delin]
//
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp dtpstk =
//
|dtpstk_nil of ()
//
|dtpstk_lam0 of (dtpstk)
|dtpstk_let0 of (dtpstk)
//
|dtpstk_ift0 of (dtpstk)
|dtpstk_cas0 of (dtpstk)
//
|dtpstk_cons of
( d2var, d3typ1, dtpstk )
|dtpstk_updt of
( d2var, d3typ1, dtpstk )
//
(* ****** ****** *)
//
#typedef s2cs = s2cstlst
//
datavwtp
envltck =
ENVLTCK of(dtpstk, stkmap(s2cs))
//
#absimpl envltck_vtbx = envltck
//
(* ****** ****** *)
//
fun
dtpstk_make_nil
(
(* nil *)
): dtpstk = dtpstk_nil(*void*)
//
fun
dtpstk_free_top
(stk0: ~dtpstk): void =
(
case-
stk0 of
//
| ~
dtpstk_nil
((*void*)) => ((*0*))
//
| ~
dtpstk_cons
(d2v1
,t3q1,stk1) => dtpstk_free_top(stk1)
| ~
dtpstk_updt
(d2v1
,t3q1,stk1) => dtpstk_free_top(stk1)
//
)(*case+*)//end-of-[dtpstk_free_top]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_make_nil
  ( (*void*) ) =
(
ENVLTCK(dtpstk, stkmap))
where{
//
val dtpstk = dtpstk_make_nil()
val stkmap = stkmap_make_nil()
}(*where*)//end-of-[envltck_make_nil()]
//
(* ****** ****** *)
//
#implfun
envltck_free_top
  (   env0   ) =
(
case+ env0 of
| ~
ENVLTCK
(dtpstk, stkmap) =>
let
//
var
stkmap = stkmap
val nerr =
stkmap_poptop0(stkmap)
//
val (  ) =
dtpstk_free_top(dtpstk)
val (  ) =
stkmap_free_nil(stkmap) in () end//let
)(*case+*)//end-of-(envltck_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshlam0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_lam0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshlam0( env0 ))  
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshlet0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_let0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshlet0( env0 ))  
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshift0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_ift0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshift0( env0 ))  
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_poplam0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_lam0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_poplam0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplam0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_poplam0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplam0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_let0 _ => ( err := 1; kxs )
|dtpstk_ift0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_poplam0(kxs)]
//
#implfun
envltck_poplam0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_poplam0(dtpstk)
val nerr =
stkmap_poplam0(stkmap) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_poplam0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_poplet0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_let0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_poplet0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplet0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_poplet0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplet0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_lam0 _ => ( err := 1; kxs )
|dtpstk_ift0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_poplet0(kxs)]
//
#implfun
envltck_poplet0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_poplet0(dtpstk)
val nerr =
stkmap_poplet0(stkmap) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_poplet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_popift0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_ift0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_popift0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popift0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
val () =
prerrsln("\
dtpstk_popift0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popift0: loop: x1 = ", x1)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_lam0 _ => ( err := 1; kxs )
|dtpstk_let0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_popift0(kxs)]
//
#implfun
envltck_popift0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_popift0(dtpstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_popift0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3typ1_none0
( (*void*) ) =
d3typ1_none$make
(s2typ1_none0((*0*)))
//
fun
dtpstk_dvar$find
( stk0:
! dtpstk
, d2v0: d2var): d3typ1 =
(
case+ stk0 of
|dtpstk_nil
((*void*)) =>
d3typ1_none0((*0*))
//
|dtpstk_lam0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_let0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_ift0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_cas0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
//
|dtpstk_cons
(d2v1, t3q1, stk1) =>
(
if
(d2v0 = d2v1)
then ( t3q1 )
else dtpstk_dvar$find(stk1, d2v0))
//
|dtpstk_updt
(d2v1, t3q1, stk1) =>
(
if
(d2v0 = d2v1)
then ( t3q1 )
else dtpstk_dvar$find(stk1, d2v0))
//
)(*case+*)//end-of-(dtpstk_dvar$find(...))
//
(* ****** ****** *)
//
#implfun
envltck_dvar$find
  (env0, dvar) =
let
val+
ENVLTCK
(dtpstk, stkmap) = env0
in//let
(
  dtpstk_dvar$find(dtpstk, dvar))
end where
{
//
val () =
prerrsln("envltck_dvar$find: dvar = ", dvar)
//
}(*where*)//end-of-[envltck_dvar$find(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$take
  (env0, dvar) =
let
//
val t3q0 =
envltck_dvar$find(env0, dvar)
//
in//let
//
if
not(
linq(t3q0))
then t3q0 else
let
//
(*
val t3q1 = t3q0
*)
val t3q1 = d3typ1_delin(t3q0)
//
in//let
//
t3q0 where
{
val () =
envltck_dvar$updt(env0, dvar, t3q1)
}
end//let
//
end where
{
//
val () =
prerrsln("envltck_dvar$take: dvar = ", dvar)
//
}(*where*)//end-of-(envltck_dvar$take(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$updt
(env0, d2v0, t3q1) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_updt(d2v0, t3q1, dtpstk))
) where
{
//
val () =
prerrsln("envltck_dvar$updt: d2v0 = ", d2v0)
val () =
prerrsln("envltck_dvar$updt: t3q1 = ", t3q1)
//
}(*where*)//end-of-(envltck_dvar$updt(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dtyp$eval
  (env0, t3q0) =
(
case+
t3q0.node() of
//
|T3P1none() =>
(
s2typ1_none0((*void*)))
|T3P1styp(t2q0) => (t2q0)
//
) where
{
//
val () =
prerrsln("envltck_dtyp$eval: t3q0 = ", t3q0)
//
}(*where*)//end-of-[envltck_dtyp$eval(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dtyplst$eval
  (env0, t3qs) =
(
case+ t3qs of
|
list_nil() =>
list_nil()
|
list_cons(t3q1, t3qs) =>
(
list_cons(t2q1, t2qs))
where{
val t2q1 = envltck_dtyp$eval(env0, t3q1)
val t2qs = envltck_dtyplst$eval(env0, t3qs)}
)(*case+*)//end-of-[envltck_dtyplst$eval(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$push
  (env0, dvar, t2q1) =
let
//
val
t3q1 = d3typ1_styp$make(t2q1)
//
in//let
//
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_cons(dvar, t3q1, dtpstk))
//
end(*let*)//end-of-(envltck_dvar$push(env0,...))
//
(* ****** ****** *)
//
#implfun
envltck_dpat$push
  (env0, dpat) =
(
  f0_dpat(env0, dpat))
where
{
//
fun
f0_dpat
( env0:
! envltck
, d3p0: d3pat1): void =
(
case+
d3p0.node() of
//
|D3P1var
(   d2v1   ) =>
let
val t2q0 = d3p0.styp()
in//let
envltck_dvar$push(env0,d2v1,t2q0)
end//let//end-of-[ D3P1var(d2v1) ]
//
|D3P1dapp
(d3f0
,npf1, d3ps) => f0_d3ps(env0, d3ps)
//
|D3P1annot
(d3p1, _, _) => f0_dpat(env0, d3p1)
//
|_(* otherwise *) => (   (*void*)   )
)(*case+*)//end-of-[f0_dpat(env0,dpat)]
//
and
f0_d3ps
( env0:
! envltck
, d3ps: d3pat1lst): void =
(
case+ d3ps of
|list_nil() => ()
|list_cons(d3p1, d3ps) =>
(f0_dpat(env0, d3p1); f0_d3ps(env0, d3ps)))
//
(* ****** ****** *)
//
val ((*void*)) =
prerrsln("envltck_dpat$push: dpat = ", dpat)
//
(* ****** ****** *)
//
}(*where*)//end-of-(envltck_dpat$push(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_farg$push
  (env0, f3a0) =
(
case+
f3a0.node() of
//
|F3ARG1dapp
(npf1, d3ps) =>
(
  envltck_d3ps$push(env0, d3ps))
//
|F3ARG1sapp _ => () |F3ARG1mets _ => ()
//
)(*case+*)//end-of-[envltck_farg$push(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_d3ps$push
  (env0, d3ps) =
(
case+ d3ps of
|
list_nil() => ()
|
list_cons(d3p1, d3ps) =>
let
val () = envltck_dpat$push(env0, d3p1)
val () = envltck_d3ps$push(env0, d3ps)
end//let//end-of-[list_cons(d3p1,d3ps)]
//
)(*case+*)//end-of-[envltck_d3ps$push(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_f3as$push
  (env0, f3as) =
(
case+ f3as of
|
list_nil() => ()
|
list_cons(f3a1, f3as) =>
let
val () = envltck_farg$push(env0, f3a1)
val () = envltck_f3as$push(env0, f3as)
end//let//end-of-[list_cons(f3a1,f3as)]
//
)(*case+*)//end-of-[envltck_f3as$push(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvts$updt
  (env0, vts0) =
(
case+ vts0 of
| list_nil() => ()
| list_cons(dvtp, vts1) =>
(
  envltck_dvts$updt(env0, vts1))
where
{
val () =
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_cons(dvtp.0, dvtp.1, dtpstk)) }
)(*case+*)//end-of-[envltck_dvts$updt(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvslet0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_let0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvslet0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvslet0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvslet0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_dvslet0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvsift0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_ift0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvsift0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvsift0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvsift0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_dvsift0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtslam0
( stk0: 
! dtpstk): dvdtplst =
(
list_vt2t{dvdtp}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtplst_vt_sort0(vtps)
val vtps =
dvdtplst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
dvdtplst = dvdtplst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtplst): dvdtplst =
(
case+ stk0 of
|dtpstk_nil
((*void*)) => vtps
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_lam0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps    )
)
//
}(*where*)//end-of-[dtpstk_vtslam0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtslam0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtslam0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtslam0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtslet0
( stk0: 
! dtpstk): dvdtplst =
(
list_vt2t{dvdtp}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtplst_vt_sort0(vtps)
val vtps =
dvdtplst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
dvdtplst = dvdtplst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtplst): dvdtplst =
(
case+ stk0 of
//
|dtpstk_nil
((*void*)) => vtps
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_lam0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps   )
)
//
}(*where*)//end-of-[dtpstk_vtslet0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtslet0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtslet0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtslet0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtsift0
( stk0: 
! dtpstk): dvdtplst =
(
list_vt2t{dvdtp}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtplst_vt_sort0(vtps)
val vtps =
dvdtplst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
dvdtplst = dvdtplst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtplst): dvdtplst =
(
case+ stk0 of
//
|dtpstk_nil
((*void*)) => vtps
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_ift0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps   )
)
//
}(*where*)//end-of-[dtpstk_vtsift0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtsift0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtsift0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtsift0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_myenv0.dats] *)
(***********************************************************************)
