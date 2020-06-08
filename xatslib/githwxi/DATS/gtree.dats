(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
#extern
fun
<nx:vt>
gtree_node_childlst
  (x0: nx): list_vt(nx)
//
(* ****** ****** *)
//
(*
HX-2020-06:
For depth-first search
*)
//
#extern
fun
<nx:vt>
gtree_dfs_streamize
  (x0: nx): stream_vt(nx)
#extern
fun
<nx:vt>
gtree_dfs_streamize_list
  (xs: list_vt(nx)): stream_vt(nx)
//
(* ****** ****** *)
//
impltmp
<nx>(*tmp*)
gtree_dfs_streamize(x0) =
let
val xs =
list_vt_sing(x0) in
gtree_dfs_streamize_list(xs)
end // end of [gtree_dfs_streamize]
//
(* ****** ****** *)

impltmp
<nx>(*tmp*)
gtree_dfs_streamize_list
  (xs) =
( 
  auxmain(list_vt_sing(xs))
) where
{
typedef
nxs = list_vt(nx)
fun
auxmain
( xss
: list_vt(nxs)): stream_vt(nx) =
$llazy
(
g_free(xss);
case+ xss of
| ~
list_vt_nil
( (*void*) ) =>
strmcon_vt_nil()
| @
list_vt_cons
( xs0, xss1 ) =>
(
case+ xs0 of
| ~
list_vt_nil() =>
let
val xss1 = xss1
in
$free(xss); !(auxmain(xss1))
end
| ~
list_vt_cons(x0, xs1) =>
let
val () = (xss.0 := xs1)
val xs0 =
gtree_node_childlst<nx>(x0)
in
$fold(xss);
strmcon_vt_cons
(x0, auxmain(list_vt_cons(xs0, xss)))
end
) (* list_vt_cons *)
) (* list_vt_cons *)
} (* end of [gtree_dfs_streamize_list] *)

(* ****** ****** *)
//
(*
HX-2020-06:
For breadth-first search
*)
//
#extern
fun
<nx:vt>
gtree_bfs_streamize
  (x0: nx): stream_vt(nx)
#extern
fun
<nx:vt>
gtree_bfs_streamize_list
  (xs: list_vt(nx)): stream_vt(nx)
//
(* ****** ****** *)
//
impltmp
<nx>(*tmp*)
gtree_bfs_streamize(x0) =
let
val xs =
list_vt_sing(x0) in
gtree_bfs_streamize_list(xs)
end // end of [gtree_bfs_streamize]
//
(* ****** ****** *)

impltmp
<nx>(*tmp*)
gtree_bfs_streamize_list
  (xs) =
(
let
val xss =
list_vt_sing(xs)
in
auxmain(xss, list_vt_nil())
end
) where
{
typedef
nxs = list_vt(nx)
fun
auxmain
( xss
: list_vt(nxs)
, yss
: list_vt(nxs)
) : stream_vt(nx) =
$llazy
(
g_free(xss);
g_free(yss);
case+ xss of
| ~
list_vt_nil
( (*void*) ) =>
(
case+ yss of
| ~
list_vt_nil() =>
strmcon_vt_nil()
| _ =>
let
val xss =
list_vt_reverse(yss)
in !
(auxmain(xss, list_vt_nil()))
end
)
| @
list_vt_cons
( xs0, xss1 ) =>
(
case+ xs0 of
| ~
list_vt_nil() =>
let
val xss1 = xss1
in
$free(xss); !(auxmain(xss1, yss))
end
| ~
list_vt_cons(x0, xs1) =>
let
val () = (xss.0 := xs1)
val xs0 =
gtree_node_childlst<nx>(x0)
in
$fold(xss);
strmcon_vt_cons
(x0, auxmain(xss, list_vt_cons(xs0, yss)))
end
) (* list_vt_cons *)
) (* list_vt_cons *)
} (* end of [gtree_bfs_streamize_list] *)

(* ****** ****** *)

(* end of [gtree.dats] *)
