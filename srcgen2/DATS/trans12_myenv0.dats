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
Sun 11 Sep 2022 05:10:48 PM EDT
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = s2tex

in//local

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

fun
sortenv_free_top
(tenv : sortenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~SORTENV(topmap, stkmap) = tenv
} (*where*)//end-of(sortenv_free_top(tenv))

(* ****** ****** *)

fun
sortenv_search_opt
( tenv:
  sortenv, k0: key) = let
//
val+
SORTENV
(topmap, stkmap) = tenv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[sortenv_search_opt(tenv,k0)]

(* ****** ****** *)
//
fun
sortenv_insert_any
( tenv
: sortenv
, k0: key, x0: itm) = let
//
val+
@SORTENV
(topmap, !stkmap) = tenv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(sortenv_insert_any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sortenv) ]

(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = s2itm

in//local

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

fun
sexpenv_free_top
(senv : sexpenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~SEXPENV(topmap, stkmap) = senv
} (*where*)//end-of(sexpenv_free_top(senv))

(* ****** ****** *)

fun
sexpenv_search_opt
( senv:
  sexpenv, k0: key) = let
//
val+
SEXPENV
(topmap, stkmap) = senv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[sexpenv_search_opt(senv,k0)]

(* ****** ****** *)
//
fun
sexpenv_insert_any
( senv
: sexpenv
, k0: key, x0: itm) = let
//
val+
@SEXPENV
(topmap, !stkmap) = senv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(sexpenv_insert_any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(sexpenv) ]

(* ****** ****** *)

local

#typedef key = sym_t
#typedef itm = d2itm

in//local

datavwtp
dexpenv =
DEXPENV of
(topmap(itm), stkmap(itm))

fun
dexpenv_make_nil
  ( (*void*) ): dexpenv =
DEXPENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [dexpenv_make_nil()]

(* ****** ****** *)

fun
dexpenv_free_top
(denv : dexpenv) =
(
stkmap_free_nil(stkmap)) where
{
val+
~DEXPENV(topmap, stkmap) = denv
} (*where*)//end-of(dexpenv_free_top(denv))

(* ****** ****** *)

fun
dexpenv_search_opt
( denv:
  dexpenv, k0: key) = let
//
val+
DEXPENV
(topmap, stkmap) = denv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[dexpenv_search_opt(denv,k0)]

(* ****** ****** *)
//
fun
dexpenv_insert_any
( denv
: dexpenv
, k0: key, x0: itm) = let
//
val+
@DEXPENV
(topmap, !stkmap) = denv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(dexpenv_insert_any(tenv,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [ local(dexpenv) ]

(* ****** ****** *)

local

datavwtp
tr12env =
TR12ENV of
(
sortenv, sexpenv, dexpenv)
#absimpl tr12env_vtbx = tr12env

in//local

(* ****** ****** *)
//
#implfun
tr12env_make_nil() =
TR12ENV(tenv,senv,denv) where
{
  val tenv = sortenv_make_nil()
  val senv = sexpenv_make_nil()
  val denv = dexpenv_make_nil()
} (*where*) // end of [tr12env_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr12env_free_top
  (  env0  ) =
(
sortenv_free_top(tenv);
sexpenv_free_top(senv);
dexpenv_free_top(denv)) where
{
val+
~TR12ENV(tenv, senv, denv) = env0
} (*where*)//end-of(tr12env_free_top(tenv))
//
(* ****** ****** *)

#implfun
tr12env_add0_s2tex
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
sortenv_insert_any(tenv, k0, x0)
//
val () =
the_sortenv_toplst_add0( k0, x0 )
val () =
the_sortenv_toplst_prerr((*void*))
//
in//let
end where
{
  val () =
  prerrln("tr12env_add0_s2tex: k0 = ", k0)
  val () =
  prerrln("tr12env_add0_s2tex: x0 = ", x0)
} (*where*)//end-[tr12env_add0_s2tex(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_add0_s2itm
( env0 , k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
sexpenv_insert_any(senv, k0, x0)
//
in//let
end where
{
val () =
prerrln("tr12env_add0_s2itm: k0 = ", k0)
val () =
prerrln("tr12env_add0_s2itm: x0 = ", x0)
} (*where*)//end-[tr12env_add0_s2itm(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_add0_d2itm
( env0, k0 , x0 ) =
let
//
val+
TR12ENV
(tenv, senv, denv) = env0
//
val () =
dexpenv_insert_any(denv, k0, x0)
//
in//let
end where
{
  val () =
  prerrln("tr12env_add0_d2itm: k0 = ", k0)
  val () =
  prerrln("tr12env_add0_d2itm: x0 = ", x0)
} (*where*)//end-[tr12env_add0_d2itm(env0,k0,x0)]

(* ****** ****** *)

#implfun
tr12env_find_s2tex
  ( env0, k0 ) =
(
sortenv_search_opt(tenv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_s2tex(env0,k0)]

(* ****** ****** *)

#implfun
tr12env_find_s2itm
  ( env0, k0 ) =
(
sexpenv_search_opt(senv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_s2itm(env0,k0)]

(* ****** ****** *)

#implfun
tr12env_find_d2itm
  ( env0, k0 ) =
(
dexpenv_search_opt(denv, k0)) where
{
//
  val+TR12ENV(tenv, senv, denv) = env0
//
} (*where*) // end of [tr12env_find_d2itm(env0,k0)]

(* ****** ****** *)

endloc (*local*) // end of [ local(tr12env) ]

(* ****** ****** *)

#implfun
tr12env_add0_s2cst_all
  (env0, s2c0) =
let
val sym0 = s2c0.name()
val sopt =
tr12env_find_s2itm(env0, sym0)
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
end (*let*)//end[tr12env_add0_s2cst_all(env0,s2c0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_myenv0.dats] *)
