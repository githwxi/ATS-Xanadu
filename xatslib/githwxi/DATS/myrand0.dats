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
// HX-2020-11-03
// For generating random values
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#extern
fun
<a0:vt>
g_rand((*void*)): a0

(* ****** ****** *)
//
#extern
fun<>
rand_seed
((*void*)): uint
#extern
fun<>
rand_set_nil
((*void*)): void
#extern
fun<>
rand_set_seed
( seed : uint ) : void
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
rand_set_nil() =
let
val
seed = rand_seed<>()
in
  rand_set_seed<>(seed)
end
//
(* ****** ****** *)
//
#extern
fun<>
nint_rand(): nint
#extern
fun<>
nint_rand$limit(): sintgt(0)
//
#extern
fun<>
nint_rand_limit
{n:pos}(l0: int(n)): nintlt(n)
//
(* ****** ****** *)
//
#extern
fun
<a:vt>
list_rand(): list_vt(a)
#extern
fun<>
list_rand$length(): nint
//
#extern
fun
<a:vt>
list_rand_length
{n:nat}(ln: int(n)): list_vt(a,n)
//
(* ****** ****** *)
//
#extern
fun<>
strn_rand(): strn_vt
#extern
fun<>
strn_rand$length(): nint
//
#extern
fun<>
strn_rand_length
{n:nat}(ln: int(n)): strn_vt(n)
//
(* ****** ****** *)

(*
#impltmp
<>(*tmp*)
rand_seed() = 0u
*)

(* ****** ****** *)

#impltmp
g_rand<bool>() =
let
val tf =
nint_rand_limit(2)
in
if
(tf > 0)
then true else false
end

(* ****** ****** *)

#impltmp
g_rand<char>() =
let
val n0 =
nint_rand_limit(256)
in
char_make_sint
( if
  (n0<128)
  then n0 else n0-256 )
end

(* ****** ****** *)
(*
HX-2020-06-22:
the default [1024]
is randomly chosen
*)
#impltmp
<>(*tmp*)
nint_rand$limit() = 1024
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
nint_rand() =
nint_rand_limit<>
(nint_rand$limit<>((*void*)))
//
(* ****** ****** *)

#impltmp
g_rand<sint>() =
let
val
limit =
nint_rand$limit<>()
in
nint_rand_limit<>(2*limit)-limit
end // end of [g_rand<sint>]

(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt}
g_rand<(a0,a1)>() =
let
val x0 =
g_rand<a0>()
val x1 =
g_rand<a1>() in @(x0, x1)
end
#impltmp
{a0:vt
,a1:vt}
g_rand<$(a0,a1)>() =
let
val x0 =
g_rand<a0>()
val x1 =
g_rand<a1>() in $(x0, x1)
end
//
#impltmp
{a0:vt
,a1:vt
,a2:vt}
g_rand<(a0,a1,a2)>() =
let
val x0 =
g_rand<a0>()
val x1 =
g_rand<a1>()
val x2 =
g_rand<a2>() in @(x0, x1, x2)
end
#impltmp
{a0:vt
,a1:vt
,a2:vt}
g_rand<$(a0,a1,a2)>() =
let
val x0 =
g_rand<a0>()
val x1 =
g_rand<a1>()
val x2 =
g_rand<a2>() in $(x0, x1, x2)
end
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rand() =
list_rand_length<a>
(list_rand$length<>())
//
#impltmp
{a:t0}
g_rand<list(a)>() =
list_vt2t(list_rand<a>())
#impltmp
{a:vt}
g_rand<list_vt(a)> = list_rand<a>
//
(* ****** ****** *)
//
(*
HX-2020-06-22:
the default [16]
is randomly chosen
*)
//
#impltmp
<>(*tmp*)
list_rand$length() =
(nint_rand_limit<>(16))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rand_length
( ln ) =
(
gint_map_list_nint<a>(ln)
) where
{
#impltmp
map$fopr<int><a>(_) = g_rand<a>()
}
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rand() =
strn_rand_length<>
(strn_rand$length<>())
//
#impltmp
g_rand<strn>() =
strn_vt2t(strn_rand<>())
#impltmp
g_rand<strn_vt> = strn_rand<>(*void*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_myrand0.dats] *)
