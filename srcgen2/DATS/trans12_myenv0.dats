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
//
fun
sortenv_insert_any
( tenv: sortenv
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
//
fun
sexpenv_insert_any
( senv: sexpenv
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
//
fun
dexpenv_insert_any
( denv: dexpenv
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

(* end of [ATS3/XATSOPT_trans12_myenv0.dats] *)
