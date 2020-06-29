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
// For random values
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

(*
impltmp
<>(*tmp*)
rand_seed() = 0u
*)

(* ****** ****** *)

impltmp
<>(*tmp*)
rand_set_nil() =
let
val
seed = rand_seed<>()
in
rand_set_seed<>(seed)
end

(* ****** ****** *)

impltmp
rand<bool>() =
let
val tf =
rand_nint_limit(2)
in
if
(tf > 0)
then true else false
end

(* ****** ****** *)

impltmp
rand<char>() =
let
val n0 =
rand_nint_limit(256)
in
char_make_sint
( if
  (n0<128)
  then n0 else n0-256 )
end

(* ****** ****** *)
//
impltmp
<>(*tmp*)
rand_nint() =
rand_nint_limit<>
(rand_nint$limit<>())
//
(*
HX-2020-06-22:
the default [1024]
is randomly chosen
*)
impltmp
<>(*tmp*)
rand_nint$limit() = 1024
//
(* ****** ****** *)

impltmp
rand<sint>() =
let
val
limit =
rand_nint$limit<>()
in
rand_nint_limit<>(2*limit)-limit
end // end of [rand<sint>]

(* ****** ****** *)
//
impltmp
{a0:vt
,a1:vt}
rand<(a0,a1)>() =
let
val x0 =
rand<a0>()
val x1 =
rand<a1>() in @(x0, x1)
end
impltmp
{a0:vt
,a1:vt}
rand<$(a0,a1)>() =
let
val x0 =
rand<a0>()
val x1 =
rand<a1>() in $(x0, x1)
end
//
impltmp
{a0:vt
,a1:vt
,a2:vt}
rand<(a0,a1,a2)>() =
let
val x0 =
rand<a0>()
val x1 =
rand<a1>()
val x2 =
rand<a2>() in @(x0, x1, x2)
end
impltmp
{a0:vt
,a1:vt
,a2:vt}
rand<$(a0,a1,a2)>() =
let
val x0 =
rand<a0>()
val x1 =
rand<a1>()
val x2 =
rand<a2>() in $(x0, x1, x2)
end
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
rand_list() =
rand_list_length<a>
(rand_list$length<>())
//
impltmp
{a:t0}
rand<list(a)>() =
list_vt2t(rand_list<a>())
impltmp
{a:vt}
rand<list_vt(a)> = rand_list<a>
//
(* ****** ****** *)
//
(*
HX-2020-06-22:
the default [16]
is randomly chosen
*)
//
impltmp
<>(*tmp*)
rand_list$length() =
(rand_nint_limit<>(16))
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
rand_list_length
( ln ) =
(
gint_map_list_nint<a>(ln)
) where
{
impltmp
map$fopr<int><a>(_) = rand<a>()
}
//
(* ****** ****** *)
//
impltmp
<>(*tmp*)
rand_string() =
rand_string_length<>
(rand_string$length<>())
//
impltmp
rand<string>() =
string_vt2t(rand_string<>())
impltmp
rand<string_vt> = rand_string<>
//
(* ****** ****** *)

(* end of [rand.dats] *)
