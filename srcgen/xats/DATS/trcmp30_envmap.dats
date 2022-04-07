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
// Author: Hongwei Xi
// Start Time: April, 2022
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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trcmp30.sats"

(* ****** ****** *)

local
//
datavtype compenv =
|
COMPENV of
( List0_vt(d3exp)
, List0_vt(t3sub) )
where
t3sub = (s2varlst, t2ypelst)
//
absimpl compenv_vtype = compenv
//
in(*in-of-local*)

(* ****** ****** *)
//
implement
compenv_make_nil
((*void*)) =
COMPENV
(d3es, subs) where
{
  val d3es = list_vt_nil()
  val subs = list_vt_nil()
}
//
implement
compenv_free_nil
  ( env0 ) =
let
val+
~COMPENV
 (d3es, subs) = env0
val-
~list_vt_nil() = d3es
val-
~list_vt_nil() = subs in (*nothing*)
end (*let*)//end of [compenv_free_nil]
// 
(* ****** ****** *)

implement
compenv_pop0_timp
  (env0) =
(
let
val () =
(ts := ts1)
val () =
(us := us1) in fold@(env0)
end
) where
{
//
val+
@COMPENV(ts, us) = env0
//
val-~list_vt_cons(_, ts1) = ts
val-~list_vt_cons(_, us1) = us
//
} (* end of [compenv_pop0_timp] *)

implement
compenv_push_timp
( env0
, d3e0, s2vs, t2ps) =
(
  fold@(env0)
) where
{
//
val+
@COMPENV(ts, us) = env0
//
val t0 = d3e0
val () =
(ts := list_vt_cons(t0, ts))
//
val u0 = (s2vs, t2ps)
val () =
(us := list_vt_cons(u0, us))
//
} where
{
(*
val () =
println!
("compenv_push_timp: d3e0 = ", d3e0)
*)
}(*where*)//end-of[compenv_push_timp]

(* ****** ****** *)

implement
t2ype_subst_compenv
( t2p0, env0 ) =
let
val+
@COMPENV
(d3es, subs) = env0
//
val t2p0 =
(
case+ subs of
|
list_vt_nil
((*void*)) => t2p0
|
list_vt_cons
(sub0, subs) =>
let
//
val
(s2vs,tsub) = sub0
//
val t2p0 =
t2ype_subst_svarlst
( t2p0, s2vs, tsub ) in t2p0
end // end of [list_vt_cons]
) : t2ype // end of [val t2p0]
//
in
  fold@env0; t2p0
end // end of [t2ype_subst_compenv]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trcmp30_envmap.dats] *)
