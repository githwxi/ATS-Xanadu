(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: August, 2019
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
//
#staload
LAB = "./../SATS/xlabel0.sats"
#staload
STM = "./../SATS/xstamp0.sats"
#staload
SYM = "./../SATS/xsymbol.sats"
//
overload
= with $LAB.eq_label_label
overload
= with $STM.eq_stamp_stamp
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
#symload = with eq_htvar_htvar
//
(* ****** ****** *)
//
implement
fprint_val<htvar> = fprint_htvar
implement
fprint_val<htcst> = fprint_htcst
//
implement
fprint_val<h0typ> = fprint_h0typ
//
(* ****** ****** *)

implement
{}(*tmp*)
h0typ_subst(t2p0) =
(
let
  var flag: int = 0
in
  auxh0t0(t2p0, flag)
end
) where
{
//
fun
auxh0t0
( h0t0
: h0typ
, flag
: &int >> int
) : h0typ = let
//
val fini = flag
val hst0 = h0t0.sort()
//
in(*in-of-let*)
case+
h0t0.node() of
//
| H0Tbas _ => h0t0
//
| H0Tcst _ => h0t0
//
|
H0Tvar _ =>
h0typ_subst$var<>(h0t0, flag)
//
|
H0Tlft(h0t1) =>
let
val fini = flag
val h0t1 = auxh0t0(h0t1, flag)
in
if
flag=fini
then t2p0
else
h0typ_make_node(hst0, H0Tlft(h0t1))
end
//
|
H0Tapp
(h0t1, h0ts) => let
val
h0t1 = auxh0t0(h0t1, flag)
val
h0ts = auxh0ts(h0ts, flag)
in
if
flag=fini
then h0t0
else
h0typ_make_node(hst0,H0Tapp(h0t1, h0ts))
end // end of [H0Tapp]
//
|
H0Tlam(htvs, h0t1) => let
val
  h0t1 = auxh0t0(h0t1, flag)
in
if
flag=fini
then h0t0
else
h0typ_make_node(hst0,H0Tlam(htvs, h0t1))
end // end of [H0Tlam]
//
|
H0Tfun
(npf, h0ts, h0t1) =>
let
  val
  h0t1 = auxh0t0(h0t1, flag)
  val
  h0ts = auxh0ts(h0ts, flag)
in
  if
  flag=fini
  then h0t0
  else h0typ_make_node
       ( hst0, H0Tfun(npf, h0ts, h0t1) )
end
//
|
H0Ttyext(name, h0ts) =>
let
  val
  h0ts = auxh0ts(h0ts, flag)
in
if
flag=fini
then h0t0
else
h0typ_make_node(hst0, H0Ttyext(name, h0ts))
end // end of [H0Ttyext]
//
|
H0Ttyrec(knd, npf, ltps) =>
let
  val
  ltps = auxlhts(ltps, flag)
in
if
flag=fini
then h0t0
else
h0typ_make_node(hst0,H0Ttyrec(knd,npf,ltps))
end // end of [H0Ttyrec]
//
| _(*rest-of-h0typ*) => h0t0 // for H0Tnone0/1
end (*let*) // end of [auxh0t0]
//
and
auxh0ts
( h0ts
: h0typlst
, flag
: &int >> int
) : h0typlst =
(
case+ h0ts of
|
list_nil() =>
list_nil()
|
list_cons
(h0t1, h0ts1) =>
let
  val fini = flag
  val
  h0t1 = auxh0t0(h0t1, flag)
  val
  h0ts1 = auxh0ts(h0ts1, flag)
in
if
flag = fini
then h0ts else list_cons(h0t1, h0ts1)
end
)
//
and
auxlhts
( lhts
: labh0typlst
, flag
: &int >> int
) : labh0typlst =
(
case+ lhts of
|
list_nil() =>
list_nil()
|
list_cons
(lh0t1, lhts1) =>
let
//
val fini = flag
//
val+
SLABELED
(l1, h0t1) = lh0t1
val h0t1 = auxh0t0(h0t1, flag)
//
val lh0t1 =
(
if
flag = fini
then lh0t1 else SLABELED(l1,h0t1)
) : labh0typ // end of [val]
//
val lhts1 = auxlhts( lhts1, flag )
//
in
if
flag = fini
then lhts else list_cons(lh0t1, lhts1)
end
)
//
} (*where*) // end of [type_subst]
(* ****** ****** *)
//
implement
h0typ_subst_tvar
(h0t0, htv1, tsub) =
(
h0typ_subst<>(h0t0)
) where
{
//
implement
h0typ_subst$var<>
  (h0t0, flag) =
let
val-
H0Tvar
(htv0) = h0t0.node()
in
  if
  htv0=htv1
  then h0t0
  else (flag := flag+1; tsub)
end // [h0typ_subst$var]
//
} (* end of [h0typ_subst_svar] *)
//
(* ****** ****** *)
//
implement
h0typ_subst_tvarlst
(h0t0, htvs, tsub) =
(
h0typ_subst<>(h0t0)
) where
{
//
implement
h0typ_subst$var<>
  (h0t0, flag) =
let
//
val-
H0Tvar
(htv0) = h0t0.node()
//
fun
auxlst
( htvs
: htvarlst
, h0ts
: h0typlst
, flag
: &int >> int
): h0typ =
(
case+ htvs of
| list_nil() => h0t0
| list_cons
  (htv1, htvs) =>
  let
    val-
    list_cons
    (h0t1, h0ts) = h0ts
  in
    if
    htv0 = htv1
    then (flag := flag+1; h0t1)
    else auxlst(htvs, h0ts, flag)
  end
)
//
in
  auxlst(htvs, tsub, flag)
end
//
} (* end of [h0typ_subst_svarlst] *)
//
(* ****** ****** *)
//
implement
h0typlst_subst_tvarlst
  (h0ts, htvs, tsub) =
list_vt2t
(
list_map<h0typ><h0typ>(h0ts)
) where
{
//
implement
list_map$fopr<h0typ><h0typ>
  (h0t) =
(
h0typ_subst_tvarlst(h0t, htvs, tsub)
)
//
} (* end of [h0typlst_subst_svarlst] *)
//
(* ****** ****** *)

(* end of [xats_intrep0_util0.dats] *)
