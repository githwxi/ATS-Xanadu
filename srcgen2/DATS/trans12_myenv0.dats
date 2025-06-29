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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 11 Sep 2022 05:10:48 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload name with symbl_get_name
(* ****** ****** *)
#symload name with s2cst_get_name
#symload name with s2var_get_name
(* ****** ****** *)
//
#symload name with d2var_get_name
//
#symload name with d2con_get_name
#symload name with d2cst_get_name
//
(* ****** ****** *)
#symload node with d2pat_get_node
(* ****** ****** *)
#symload node with f2arg_get_node
#symload node with d2gpt_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#typedef sortmap = topmap(s2tex)
#typedef sexpmap = topmap(s2itm)
#typedef dexpmap = topmap(d2itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload _ = "./xsymmap_stkmap.dats"
#staload _ = "./staexp2_print0.dats"
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-04-21:
Note that gmacenv is handled in tr11env!
*)
(* ****** ****** *)
(* ****** ****** *)

local
//
#typedef key = sym_t
#typedef itm = s2tex
//
(* ****** ****** *)
in//local
(* ****** ****** *)

datavwtp
sortenv =
SORTENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
sortenv_make_nil
  ( (*void*) ): sortenv =
SORTENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [sortenv_make_nil()]

(* ****** ****** *)
//
fun
sortenv_free_top
( tenv
: sortenv): sortmap =
(
topmap where
{
val () =
stkmap_free_nil(stkmap)}
) where
{
val+
~SORTENV(topmap, stkmap) = tenv
} (*where*)//end-of(sortenv_free_top(tenv))
//
(* ****** ****** *)
//
fun
sortenv_pshlam0
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshlam0(tenv))
//
fun
sortenv_poplam0
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_poplam0(tenv))
//
(* ****** ****** *)
//
fun
sortenv_pshlet0
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshlet0(tenv))
//
fun
sortenv_poplet0
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_poplet0(tenv))
//
(* ****** ****** *)
//
fun
sortenv_pshloc1
(tenv: !sortenv) = let
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshloc1(tenv))
//
fun
sortenv_pshloc2
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(sortenv_pshloc2(tenv))
//
(* ****** ****** *)
//
fun
sortenv_locjoin
(tenv: !sortenv) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
$fold(tenv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrsln1
("sortenv_locjoin:nerr=", nerr)
val () =
prerrsln1(
"sortenv_locjoin:stkmap(aft)=\n", stkmap
)(*prerrsln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert$kxs(topmap, kxs)
else stkmap_insert$kxs(stkmap, kxs) }
//
end (*let*)//end-of-(sortenv_locjoin(tenv))
//
(* ****** ****** *)

fun
sortenv_search$opt
( tenv:
  sortenv, k0: key) =
let
//
val+
SORTENV
(topmap, stkmap) = tenv
//
val opt =
stkmap_search$opt(stkmap, k0)
//
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil( ) =>
let
val opt =
topmap_search$opt(topmap, k0)
in//let
(
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_sortenv_pvsfind(k0)
)
endlet//end-of-[opt_vt_nil()]
//
endlet//end-of-[sortenv_search$opt(tenv,k0)]

(* ****** ****** *)
//
fun
sortenv_insert$any
( tenv
: sortenv
, k0: key, x0: itm) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
(*
val () =
prerrsln
("sortenv_insert$any: k0 = ", k0)
val () =
prerrsln
("sortenv_insert$any: x0 = ", x0)
*)
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert$any(topmap, k0, x0)//top
else
stkmap_insert$any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(sortenv_insert$any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sortenv) ]

(* ****** ****** *)

local
//
#typedef key = sym_t
#typedef itm = s2itm
//
(* ****** ****** *)
in//local
(* ****** ****** *)

datavwtp
sexpenv =
SEXPENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
sexpenv_make_nil
  ( (*void*) ): sexpenv =
SEXPENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [sexpenv_make_nil()]

(* ****** ****** *)
//
fun
sexpenv_free_top
( senv
: sexpenv): sexpmap =
(
topmap where
{
val () =
stkmap_free_nil(stkmap)}
) where
{
val+
~SEXPENV(topmap, stkmap) = senv
} (*where*)//end-of(sexpenv_free_top(senv))
//
(* ****** ****** *)
//
fun
sexpenv_pshlam0
(senv: !sexpenv) = let
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshlam0(senv))
//
fun
sexpenv_poplam0
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_poplam0(senv))
//
(* ****** ****** *)
//
fun
sexpenv_pshlet0
(senv: !sexpenv) = let
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshlet0(senv))
//
fun
sexpenv_poplet0
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_poplet0(senv))
//
(* ****** ****** *)
//
fun
sexpenv_pshloc1
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshloc1(senv))
//
fun
sexpenv_pshloc2
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(senv)
end (*let*)
//
end (*let*)//end-of-(sexpenv_pshloc2(senv))
//
(* ****** ****** *)
//
fun
sexpenv_locjoin
(senv: !sexpenv) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
$fold(senv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrsln1
("sexpenv_locjoin:nerr=", nerr)
val () =
prerrsln1(
"sexpenv_locjoin:stkmap(aft)=\n", stkmap
)(*prerrsln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert$kxs(topmap, kxs)
else stkmap_insert$kxs(stkmap, kxs) }
//
end (*let*)//end-of-(sexpenv_locjoin(senv))
//
(* ****** ****** *)

fun
sexpenv_search$opt
( senv:
  sexpenv, k0: key) = let
//
val+
SEXPENV
(topmap, stkmap) = senv
//
val opt =
stkmap_search$opt(stkmap, k0)
//
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil( ) =>
let
val opt =
topmap_search$opt(topmap, k0)
in//let
(
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_sexpenv_pvsfind(k0)
)
endlet//end-of-[opt_vt_nil()]
//
endlet//end-of-[sexpenv_search$opt(senv,k0)]

(* ****** ****** *)
//
fun
sexpenv_insert$any
( senv
: sexpenv
, k0: key, x0: itm) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
(*
val () =
prerrsln
("sexpenv_insert$any: k0 = ", k0)
val () =
prerrsln
("sexpenv_insert$any: x0 = ", x0)
*)
//
in//let
//
if
stkmap_nilq(stkmap)
then
(
//prerrsln
//("sexpenv_insert$any: topmap");
topmap_insert$any(topmap, k0, x0)//top
)
else
(
//prerrsln
//("sexpenv_insert$any: stkmap");
stkmap_insert$any(stkmap, k0, x0)//inner
)
//
end (*let*)//end-of(sexpenv_insert$any(senv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sexpenv) ]

(* ****** ****** *)

local
//
#typedef key = sym_t
#typedef itm = d2itm
//
(* ****** ****** *)
in//local
(* ****** ****** *)

datavwtp
dexpenv =
DEXPENV of
(topmap(itm), stkmap(itm))

(* ****** ****** *)

fun
dexpenv_make_nil
  ( (*void*) ): dexpenv =
DEXPENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [dexpenv_make_nil()]

(* ****** ****** *)
//
fun
dexpenv_free_top
( denv
: dexpenv): dexpmap =
(
topmap where
{
val () =
stkmap_free_nil(stkmap)}
) where
{
val+
~DEXPENV(topmap, stkmap) = denv
} (*where*)//end-of(dexpenv_free_top(denv))
//
(* ****** ****** *)
//
fun
dexpenv_pshlam0
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshlam0(denv))
//
fun
dexpenv_poplam0
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_poplam0(denv))
//
(* ****** ****** *)
//
fun
dexpenv_pshlet0
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshlet0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshlet0(denv))
//
fun
dexpenv_poplet0
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_poplet0(denv))
//
(* ****** ****** *)
//
fun
dexpenv_pshloc1
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshloc1(denv))
//
fun
dexpenv_pshloc2
(denv: !dexpenv) = let
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(denv)
end (*let*)
//
end (*let*)//end-of-(dexpenv_pshloc2(denv))
//
(* ****** ****** *)
//
fun
dexpenv_locjoin
(denv: !dexpenv) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
$fold(denv) where
{
//
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
//
(*
val () =
prerrsln1
("dexpenv_locjoin:nerr=", nerr)
val () =
prerrsln1 (
"dexpenv_locjoin:stkmap(aft)=\n", stkmap
) (*prerrsln1*)
*)
//
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert$kxs(topmap, kxs)
else stkmap_insert$kxs(stkmap, kxs) }
//
endlet//end-of-(dexpenv_locjoin(denv))
//
(* ****** ****** *)

fun
dexpenv_search$opt
( denv:
  dexpenv, k0: key) = let
//
val+
DEXPENV
(topmap, stkmap) = denv
//
val opt =
stkmap_search$opt(stkmap, k0)
//
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil( ) =>
(
  topmap_search$opt(topmap, k0))
//
endlet
//end-of-[dexpenv_search$opt(denv,k0)]

(* ****** ****** *)
//
fun
dexpenv_insert$any
( denv
: dexpenv
, k0: key, x0: itm) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
(*
val () =
prerrsln
("dexpenv_insert$any: k0 = ", k0)
val () =
prerrsln
("dexpenv_insert$any: x0 = ", x0)
*)
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert$any(topmap, k0, x0)//top
else
stkmap_insert$any(stkmap, k0, x0)//inner
//
endlet
//end-of(dexpenv_insert$any(denv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(dexpenv) ]

(* ****** ****** *)

local

datavwtp
tr12env =
TR12ENV of
(
tr11env,
sortenv, sexpenv, dexpenv)
#absimpl tr12env_vtbx = tr12env

in//local

(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-06-29:
With [absopen],
these implementations can be
moved to [trans12_gmacro.dats]
*)
//
#implfun
trans12_g1mac
( env0,g1m0 ) =
(
trans11_g1mac
(tr11 , g1m0)) where
{
val+
TR12ENV
(tr11, tenv, senv, denv) = env0
}(*where*)//end-of-[trans12_g1mac]
//
#implfun
trans12_g1mac_apps
(env0, g1f0, g1ms) =
let
val+
TR12ENV
(tr11, tenv, senv, denv) = env0
in//let
trans11_g1mac_apps(tr11, g1f0, g1ms)
end(*let*)//end-[trans12_g1mac_apps]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_make_nil
  ( (*void*) ) =
(
TR12ENV
(tr11
,tenv,senv,denv)) where
{
  val tr11 = tr11env_make_nil()
  val tenv = sortenv_make_nil()
  val senv = sexpenv_make_nil()
  val denv = dexpenv_make_nil()
} (*where*) // end of [tr12env_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr12env_free_top
  (  env0  ) = let
//
val tr11 =
tr11env_free_top(tr11)
//
val tmap =
sortenv_free_top(tenv)
val smap =
sexpenv_free_top(senv)
val dmap =
dexpenv_free_top(denv)
//
in//let
D2TOPENV
(tr11, tmap, smap, dmap) end where
{
val+
~TR12ENV(tr11, tenv, senv, denv) = env0
} (*where*)//end-of(tr12env_free_top(tenv))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_pshlam0
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_pshlam0(tr11)
val () = sortenv_pshlam0(tenv)
val () = sexpenv_pshlam0(senv)
val () = dexpenv_pshlam0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshlam0(env0)]
//
#implfun
tr12env_poplam0
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_poplam0(tr11)
val () = sortenv_poplam0(tenv)
val () = sexpenv_poplam0(senv)
val () = dexpenv_poplam0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_poplam0(env0)]
//
(* ****** ****** *)
//
#implfun
tr12env_pshlet0
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_pshlet0(tr11)
val () = sortenv_pshlet0(tenv)
val () = sexpenv_pshlet0(senv)
val () = dexpenv_pshlet0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshlet0(env0)]
//
#implfun
tr12env_poplet0
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_poplet0(tr11)
val () = sortenv_poplet0(tenv)
val () = sexpenv_poplet0(senv)
val () = dexpenv_poplet0(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_poplet0(env0)]
//
(* ****** ****** *)
//
#implfun
tr12env_pshloc1
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_pshloc1(tr11)
val () = sortenv_pshloc1(tenv)
val () = sexpenv_pshloc1(senv)
val () = dexpenv_pshloc1(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshloc1(env0)]
//
#implfun
tr12env_pshloc2
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_pshloc2(tr11)
val () = sortenv_pshloc2(tenv)
val () = sexpenv_pshloc2(senv)
val () = dexpenv_pshloc2(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_pshloc2(env0)]
//
(* ****** ****** *)
//
#implfun
tr12env_locjoin
  ( env0 ) = let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () = tr11env_locjoin(tr11)
val () = sortenv_locjoin(tenv)
val () = sexpenv_locjoin(senv)
val () = dexpenv_locjoin(denv)
//
in//let
  // HX-2022-10-23: nothing
end (*let*)//end-of-[tr12env_locjoin(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_add0_g1mac
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () =
tr11env_insert$any(tr11, k0, x0)
//
// (*
val () =
the_gmacenv_allist_add0( k0, x0 )
// *)
(*
val () =
the_gmacenv_allist_prerr((*void*))
*)
//
in//let
end where
{
(*
  val () =
  prerrsln("tr12env_add0_g1mac: k0 = ", k0)
  val () =
  prerrsln("tr12env_add0_g1mac: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_g1mac(env0,...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_s2tex
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () =
sortenv_insert$any(tenv, k0, x0)
//
(*
val () =
the_sortenv_allist_add0( k0, x0 )
*)
(*
val () =
the_sortenv_allist_prerr((*void*))
*)
//
in//let
end where
{
(*
  val () =
  prerrsln("tr12env_add0_s2tex: k0 = ", k0)
  val () =
  prerrsln("tr12env_add0_s2tex: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_s2tex(env0,...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_s2itm
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () =
sexpenv_insert$any(senv, k0, x0)
//
(*
val () =
the_sexpenv_allist_add0( k0, x0 )
*)
(*
val () =
the_sexpenv_allist_prerr((*void*))
*)
//
in//let
end where
{
(*
val () =
prerrsln("tr12env_add0_s2itm: k0 = ", k0)
val () =
prerrsln("tr12env_add0_s2itm: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_s2itm(env0,...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2itm
( env0, k0 , x0 ) =
let
//
val+
TR12ENV
( tr11
, tenv, senv, denv) = env0
//
val () =
dexpenv_insert$any(denv, k0, x0)
//
(*
val () =
the_dexpenv_allist_add0( k0, x0 )
*)
(*
val () =
the_dexpenv_allist_prerr((*void*))
*)
//
in//let
end where
{
(*
val () =
prerrsln("tr12env_add0_d2itm: k0 = ", k0)
val () =
prerrsln("tr12env_add0_d2itm: x0 = ", x0)
*)
} (*where*)//end-[tr12env_add0_d2itm(env0,...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add1_f2env
  (env0, k0, x0) =
let
//
val gsym = k0
val fenv = x0
//
val sopt =
tr12env_find_s2itm(env0, gsym)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
tr12env_add0_s2itm
(env0, gsym, sitm) where
{
val
sitm = S2ITMenv(list_sing(fenv))
}
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
|
S2ITMenv(envs) =>
let
val
sitm =
S2ITMenv
(list_cons(fenv, envs)) in
tr12env_add0_s2itm(env0, gsym, sitm)
end//let
| _(*non-S2ITMcst*) =>
let
val
sitm =
S2ITMenv(list_sing(fenv)) in
tr12env_add0_s2itm(env0, gsym, sitm)
end//let
) (*case+*)//end-of-[optn_vt_cons(...)]
//
end where
{
(*
val () =
prerrsln("tr12env_add1_f2env: gsym = ", k0)
*)
(*
val () =
prerrsln("tr12env_add1_f2env: fenv = ", x0)
*)
} (*where*)//end[tr12env_add1_f2env(env0,...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f2envlst_find_g1mac
  (envs, k0) =
(
case+ envs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(fenv, envs) =>
(
case+
topt of
|
~ // free
optn_vt_nil() =>
f2envlst_find_g1mac
( envs(*rest*), k0 )
| // keep
optn_vt_cons _ => topt) where
{
val topt =
topmap_search$opt(fenv.g1macenv(), k0) }
) (*case+*)//end-[f2envlst_find_g1mac(env0,k0)]
//
(* ****** ****** *)
//
(*
#implfun
tr12env_find_g1mac
  ( env0, k0 ) =
(
tr11env_search$opt(tr11, k0)) where
{
//
  val+
  TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_g1mac(env0,k0)]
*)
//
#implfun
tr12env_find_g1mac
  ( env0, k0 ) =
let
//
val opt =
tr11env_search$opt(tr11, k0)
//
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*)) =>
let
val opt =
tr12env_ofind_g1mac(env0, k0)
in//let
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_gmacenv_pvsfind(k0)
end // let
//
end where // end-of-[let-val(opt)]
{
//
  val+TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_g1mac(env0,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f2envlst_find_s2tex
  (envs, k0) =
(
case+ envs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(fenv, envs) =>
(
case+
topt of
|
~ // free
optn_vt_nil() =>
f2envlst_find_s2tex
( envs(*rest*), k0 )
| // keep
optn_vt_cons _ => topt) where
{
val topt =
topmap_search$opt(fenv.sort2env(), k0) }
) (*case+*)//end-[f2envlst_find_s2tex(env0,k0)]
//
(* ****** ****** *)
//
#implfun
f2envlst_find_s2itm
  (envs, k0) =
(
case+ envs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(fenv, envs) =>
(
case+
sopt of
|
~ // free
optn_vt_nil() =>
f2envlst_find_s2itm
( envs(*rest*), k0 )
| // keep
optn_vt_cons _ => sopt) where
{
val sopt =
topmap_search$opt(fenv.s2expenv(), k0) }
) (*case+*)//end-[f2envlst_find_s2itm(env0,k0)]
//
(* ****** ****** *)
//
#implfun
f2envlst_find_d2itm
  (envs, k0) =
(
case+ envs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(fenv, envs) =>
(
case+
dopt of
|
~ // free
optn_vt_nil() =>
f2envlst_find_d2itm
( envs(*rest*), k0 )
| // keep
optn_vt_cons _ => dopt) where
{
val dopt =
topmap_search$opt(fenv.d2expenv(), k0) }
) (*case+*)//end-[f2envlst_find_d2itm(env0,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_find_s2tex
  ( env0, k0 ) =
let
val opt =
sortenv_search$opt(tenv, k0)
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*)) =>
let
val opt =
tr12env_ofind_s2tex(env0, k0)
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_sortenv_pvsfind(k0)
//
end
//
end where // end-of-[let-val(opt)]
{
//
  val+TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_s2tex(env0,k0)]
//
(* ****** ****** *)
//
#implfun
tr12env_find_s2env
  ( env0, k0 ) =
(
sexpenv_search$opt(senv, k0)
) where
{
//
  val+TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_s2env(env0,k0)]
//
(* ****** ****** *)
//
#implfun
tr12env_find_s2qua
  ( env0, k0 ) =
let
val opt0 =
tr12env_find_s2itm(env0, k0)
in//let
//
case+ opt0 of
| ~
optn_vt_nil() =>
f0_main(env0, k0.name()) | _ => opt0
//
end where
{
fun
f0_main
( env0:
! tr12env
, name: strn): s2itmopt_vt =
let
val n0 =
strn_length(name)
//
fun
f1_next
(i1: sint): sint =
if
i1 >= n0
then i1 else
(
if
name[i1] = '$'
then i1
else f1_next(i1+1))
//
fun
f1_sub0
( i0: sint
, i1: sint): strn =
let
val df = i1-i0
in//let
strn_tabulate$f1un
( df
, lam j => name[i0+j])
end//let//f1_sub0(i0, i1)
fun
f1_sub1
( i0: sint
, i1: sint): strn =
let
val df = i1-i0
in//let
strn_tabulate$f1un
( df+1
, lam j =>
  if j < df then
  name[i0+j] else '.')
end//let//f1_sub1(i0, i1)
//
fun
f1_envs
(
envs:
f2envlst,
i0: sint): s2itmopt_vt =
let
val i1 = f1_next(i0 + 1)
val k1 =
(
if i1 >= n0
then
symbl
(f1_sub0(i0, i1))
else
symbl
(f1_sub1(i0, i1))): sym_t
val opt1 =
f2envlst_find_s2itm(envs, k1)
in//let
case+ opt1 of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMenv(envs) =>
(
if
i1 < n0
then f1_envs(envs, i1)
else optn_vt_cons(s2i1))
| _
(*non-S2ITMenv*)=>optn_vt_nil)
end//let//end of [f1_env1(...)]
//
val i0 = 0
val i1 = f1_next(i0 + 1)
//
in//let
if
i1 >= n0
then
optn_vt_nil() else
let
val k1 =
symbl(f1_sub1(i0, i1))
val opt1 =
tr12env_find_s2itm(env0,k1)
in//let
case+ opt1 of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(s2i1) => 
(
case+ s2i1 of
|
S2ITMenv(envs) => f1_envs(envs, i1)
|
_(*non-S2ITMenv*) => optn_vt_nil((*0*))
)
end//let
end(*let*)//end-of-[ f0_main(env0,name) ]
}(*where*)//end-of-[tr12env_find_s2qua(env0,k0)]
//
(* ****** ****** *)
//
#implfun
tr12env_find_s2itm
  ( env0, k0 ) =
let
//
val opt =
sexpenv_search$opt(senv, k0)
//
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*)) =>
let
val opt =
tr12env_ofind_s2itm(env0, k0)
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_sexpenv_pvsfind(k0)
//
end
//
end where // end-of-[let-val(opt)]
{
//
  val+TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_s2itm(env0,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_find_d2itm
  ( env0, k0 ) =
let
val opt =
dexpenv_search$opt(denv, k0)
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*)) =>
let
val opt =
tr12env_ofind_d2itm(env0, k0)
in//let
//
case+ opt of
| // keep
optn_vt_cons _ => opt
| ~ // free
optn_vt_nil((*0*))=>the_dexpenv_pvsfind(k0)
//
end
//
end where // end-of-[let-val(opt)]
{
//
  val+TR12ENV(tr11, tenv, senv, denv) = env0
//
}(*where*)//end-of-[tr12env_find_d2itm(env0,k0)]
//
(* ****** ****** *)
(* ****** ****** *)

endloc (*local*) // end of [ local(tr12env) ]

(* ****** ****** *)
//
#implfun
tr12env_add1_s2cst
  (env0, s2c0) =
let
val sym0 = s2c0.name()
val sopt =
tr12env_find_s2itm(env0, sym0)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
tr12env_add0_s2itm
(env0, sym0, sitm) where
{
val
sitm = S2ITMcst(list_sing(s2c0))
}
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
|
S2ITMcst(s2cs) =>
let
val
sitm =
S2ITMcst
(list_cons(s2c0, s2cs)) in
tr12env_add0_s2itm(env0, sym0, sitm)
end//let
| _(*non-S2ITMcst*) =>
let
val
sitm =
S2ITMcst(list_sing(s2c0)) in
tr12env_add0_s2itm(env0, sym0, sitm)
end//let
) (*case+*)//end-of-[optn_vt_cons(...)]
//
end (*let*)//end[tr12env_add0_s2cst(env0,s2c0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_s2var
  (env0, s2v0) =
let
//
val
sym0 =
s2var_get_name(s2v0)
val
sitm = S2ITMvar(s2v0)
//
in//let
tr12env_add0_s2itm(env0, sym0, sitm)
end where
{
(*
val () = prerrsln
("tr12env_add0_s2var: s2v0 = ", s2v0)
*)
} (*where*)//end[tr12env_add0_s2var(env0,s2v0)]
//
#implfun
tr12env_add0_s2varlst
  (env0, s2vs) =
(
case+ s2vs of
|
list_nil((*void*)) => ()
|
list_cons(s2v1, s2vs) =>
let
  val () =
  tr12env_add0_s2var(env0, s2v1)
in//let
  tr12env_add0_s2varlst( env0 , s2vs )
end (*let*)//end-of-[list_cons]
) (*case+*)//end-of-[tr12env_add0_s2varlst(...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_s2qag
  (env0, sqa0) =
let
val s2vs = sqa0.s2vs()
in//let
tr12env_add0_s2varlst(env0, s2vs)
end (*let*) // end of [tr12env_add0_s2qag(...)]
#implfun
tr12env_add0_t2qag
  (env0, tqa0) =
let
val s2vs = tqa0.s2vs()
in//let
tr12env_add0_s2varlst(env0, s2vs)
end (*let*) // end of [tr12env_add0_t2qag(...)]
//
#implfun
tr12env_add0_s2qaglst
  (env0, sqas) =
(
case+ sqas of
|
list_nil((*void*)) => ()
|
list_cons(sqa1, sqas) =>
let
val () =
tr12env_add0_s2qag(env0, sqa1)
in//let
  tr12env_add0_s2qaglst(env0, sqas)
end (*let*)//end-of-[list_cons]
) (*case+*)//end-of-[tr12env_add0_s2qaglst(...)]
#implfun
tr12env_add0_t2qaglst
  (env0, tqas) =
(
case+ tqas of
|
list_nil((*void*)) => ()
|
list_cons(tqa1, tqas) =>
let
val () =
tr12env_add0_t2qag(env0, tqa1)
in//let
  tr12env_add0_t2qaglst(env0, tqas)
end (*let*)//end-of-[list_cons]
) (*case+*)//end-of-[tr12env_add0_t2qaglst(...)]
//
(* ****** ****** *)
//
#implfun
tr12env_add1_d2con
  (env0, d2c0) =
let
val sym0 = d2c0.name()
val dopt =
tr12env_find_d2itm(env0, sym0)
in//let
//
case+ dopt of
| ~
optn_vt_nil() =>
tr12env_add0_d2itm
(env0, sym0, ditm) where
{
val
ditm = D2ITMcon(list_sing(d2c0))}
| ~
optn_vt_cons(ditm) =>
(
case+ ditm of
|
D2ITMcon(d2cs) =>
let
val
ditm =
D2ITMcon
(list_cons(d2c0, d2cs)) in
tr12env_add0_d2itm(env0, sym0, ditm)
end//let
| _(*non-D2ITMcon*) =>
let
val
ditm =
D2ITMcon(list_sing(d2c0)) in
tr12env_add0_d2itm(env0, sym0, ditm)
end//let
) (*case+*)//end-of-[optn_vt_cons(...)]
//
end where
{
//
(*
  val () =
  prerrsln
  ("tr12env_add1_d2con: d2c0 = ", d2c0)
*)
//
} (*where*)//end[tr12env_add1_d2con(env0,d2c0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add1_d2cst
  (env0, d2c0) =
let
//
val sym0 = d2c0.name()
val dopt =
tr12env_find_d2itm(env0, sym0)
//
in//let
//
case+ dopt of
| ~
optn_vt_nil() =>
tr12env_add0_d2itm
(env0, sym0, ditm) where
{
val
ditm = D2ITMcst(list_sing(d2c0)) }
| ~
optn_vt_cons(ditm) =>
(
case+ ditm of
|
D2ITMcst(d2cs) =>
let
val
ditm =
D2ITMcst
(list_cons(d2c0, d2cs)) in
tr12env_add0_d2itm(env0, sym0, ditm)
end//let
| _(*non-D2ITMcon*) =>
let
val
ditm =
D2ITMcst(list_sing(d2c0)) in
tr12env_add0_d2itm(env0, sym0, ditm)
end//let
) (*case+*)//end-of-[optn_vt_cons(...)]
//
end where
{
//
(*
  val () =
  prerrsln
  ("tr12env_add1_d2cst: d2c0 = ", d2c0)
*)
//
} (*where*)//end[tr12env_add1_d2cst(env0,d2c0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2var
  (env0, d2v0) =
let
val sym0 =
d2var_get_name(d2v0)
val ditm = D2ITMvar(d2v0)
in//let
tr12env_add0_d2itm(env0, sym0, ditm)
end (*let*)//end[tr12env_add0_d2var(env0,d2v0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2pat
  (env0, d2p0) =
(
case+
d2p0.node() of
//
|D2Pnil() => ((*void*))
|D2Pany() => ((*void*))
|D2Parg() => ((*void*))
//
|
D2Pvar(d2v1) =>
tr12env_add0_d2var(env0, d2v1)
//
|D2Pint _ => ((*void*))
|D2Pbtf _ => ((*void*))
|D2Pchr _ => ((*void*))
|D2Pflt _ => ((*void*))
|D2Pstr _ => ((*void*))
//
|
D2Pbang(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pflat(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pfree(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Psapp
(d2p1, s2vs) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Pdap0(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2Pdap1(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
//
|
D2Pdapp
(d2f0,npf1,d2ps) =>
(
tr12env_add0_d2pat(env0, d2f0);
tr12env_add0_d2patlst(env0, d2ps)
)
//
|
D2Prfpt
(d2p1,tkas,d2p2) =>
let
val () =
(
 tr12env_add0_d2pat(env0, d2p2))
val () =
(
 tr12env_add0_d2pat(env0, d2p1))
end(*let*)//end-of-[D2Prfpt(...)]
//
|
D2Ptup0
( npf1, d2ps ) =>
tr12env_add0_d2patlst(env0, d2ps)
|
D2Ptup1
(tknd, npf1, d2ps) =>
tr12env_add0_d2patlst(env0, d2ps)
|
D2Prcd2
(tknd, npf1, ldps) =>
tr12env_add0_l2d2plst(env0, ldps)
//
|
D2Pannot
(d2p1, s1e2, s2e2) =>
(
  tr12env_add0_d2pat(env0, d2p1) )
//
| _(* rest-of-d2pat *) => ( (*skipped*) )
//
) (*case+*)//end[tr12env_add0_d2var(env0,d2p0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_f2arg
  (env0, f2a0) =
(
case+
f2a0.node() of
|
F2ARGdapp
(npf1, d2ps) =>
tr12env_add0_d2patlst(env0, d2ps)
|F2ARGsapp _ => () |F2ARGmets _ => () )
//(*case+*)//end[tr12env_add0_f2arg(env0,f2a0)]
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2gpt
  (env0, dgpt) =
(
case+
dgpt.node() of
|
D2GPTpat(d2p1) =>
tr12env_add0_d2pat(env0, d2p1)
|
D2GPTgua(d2p1, d2gs) =>
tr12env_add0_d2pat(env0, d2p1)
) (*case+*)//end[tr12env_add0_d2gpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
tr12env_add1_d2conlst
  (env0, d2cs) =
(
list_foritm_e1nv
<   x0  ><  e1   >(d2cs, env0)) where
{
#typedef x0 = d2con
#vwtpdef e1 = tr12env
#impltmp
foritm$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add1_d2con(e1, x0)
} (*where*)//end(tr12env_add0_d2conlst(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add1_d2cstlst
  (env0, d2cs) =
(
list_foritm_e1nv
<   x0  ><  e1   >(d2cs, env0)) where
{
#typedef x0 = d2cst
#vwtpdef e1 = tr12env
#impltmp
foritm$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add1_d2cst(e1, x0)
} (*where*)//end(tr12env_add0_d2cstlst(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2varlst
  (env0, d2vs) =
(
list_foritm_e1nv
<   x0  ><  e1   >(d2vs, env0)) where
{
#typedef x0 = d2var
#vwtpdef e1 = tr12env
#impltmp
foritm$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add0_d2var(e1, x0)
} (*where*)//end(tr12env_add0_d2varlst(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2varopt
  (env0, dopt) =
(
case+ dopt of
//
|optn_nil() => ((*void*))
|optn_cons(d2v) => tr12env_add0_d2var(env0, d2v)
//
) (*case+*)//end(tr12env_add0_d2varopt(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add0_d2patlst
  (env0, d2ps) =
(
list_foritm_e1nv
<   x0  ><  e1   >(d2ps, env0)) where
{
#typedef x0 = d2pat
#vwtpdef e1 = tr12env
#impltmp
foritm$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add0_d2pat(e1, x0)
} (*where*)//end(tr12env_add0_d2patlst(env0,...))
//
(* ****** ****** *)
//
#implfun
tr12env_add0_f2arglst
  (env0, f2as) =
(
list_foritm_e1nv
<   x0  ><  e1   >(f2as, env0)) where
{
#typedef x0 = f2arg
#vwtpdef e1 = tr12env
#impltmp
foritm$work_e1nv
< x0 ><e1>(x0, e1) = tr12env_add0_f2arg(e1, x0)
} (*where*)//end(tr12env_add0_f2arglst(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
tr12env_ofind_g1mac
  ( env0, key0 ) =
let
//
val sopt =
tr12env_find_s2env
(env0, $SYM.DLRDT_symbl)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_g1mac(envs, key0)
| _(*non-S2ITMenv*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_ofind_g1mac(env0,key0)]

(* ****** ****** *)

#implfun
tr12env_ofind_s2tex
  ( env0, key0 ) =
let
//
val sopt =
tr12env_find_s2env
(env0, $SYM.DLRDT_symbl)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_s2tex(envs, key0)
| _(*non-S2ITMenv*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_ofind_s2tex(env0,key0)]

(* ****** ****** *)

#implfun
tr12env_ofind_s2itm
  ( env0, key0 ) =
let
//
val sopt =
tr12env_find_s2env
(env0, $SYM.DLRDT_symbl)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_s2itm(envs, key0)
| _(*non-S2ITMenv*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_ofind_s2itm(env0,key0)]

(* ****** ****** *)

#implfun
tr12env_ofind_d2itm
  ( env0, key0 ) =
let
//
val sopt =
tr12env_find_s2env
(env0, $SYM.DLRDT_symbl)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_d2itm(envs, key0)
| _(*non-S2ITMenv*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_ofind_d2itm(env0,key0)]

(* ****** ****** *)

#implfun
tr12env_qfind_s2itm
 (env0, qua1, key2) =
let
//
val sopt =
(
case+
qua1.node() of
|
T_IDQUA(name) =>
(
tr12env_find_s2env
  ( env0 , sym1 )
) where
{ val sym1 =
  symbl_make_name(name) }
|
_(*else*) => optn_vt_nil())
: optn_vt(s2itm) // end(sopt)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_s2itm(envs, key2)
| _(*otherwise*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_qfind_s2itm(env0,key0)]

(* ****** ****** *)

#implfun
tr12env_qfind_d2itm
 (env0, qua1, key2) =
let
//
val sopt =
(
case+
qua1.node() of
|
T_IDQUA(name) =>
(
tr12env_find_s2env
  ( env0 , sym1 )
) where
{ val sym1 =
  symbl_make_name(name) }
|
_(*else*) => optn_vt_nil())
: optn_vt(s2itm) // end(sopt)
//
in//let
//
case+ sopt of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
| S2ITMenv(envs) =>
  f2envlst_find_d2itm(envs, key2)
| _(*otherwise*) => optn_vt_nil((*void*))
)
//
end (*let*)//end of [tr12env_qfind_d2itm(env0,key0)]

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_trans12_myenv0.dats] *)
(***********************************************************************)
