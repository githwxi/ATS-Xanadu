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
(*
HX: Implementation in ATS2
Sun Nov 12 12:16:50 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
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
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/js1comp.sats"
(* ****** ****** *)
//
static
fun
the_dvarmap_search_ref
(hdv: h0var): P2tr0(l1valist)
//
static
fun
the_dvarmap_insert_one
(hdv: h0var, l1v1: l1val): void
//
static
fun
the_dvarmap_remove_one(h0var): void
//
(* ****** ****** *)
//
datavtype
h0varstk =
|
h0varstk_nil of
  ((*void*))
//
|
h0varstk_fun0 of
  (h0varstk(*rest*))
//
|
h0varstk_cons of
  (h0var, h0varstk(*rest*))
//
(* ****** ****** *)
//
fun
h0varstk_pop_top
( xs:
& h0varstk >> _): void =
(
  xs := auxstk(xs)
) where
{
fun
auxstk
( xs
: h0varstk): h0varstk =
(
case+ xs of
//
| ~
h0varstk_cons
  (x0, xs) =>
  auxstk(xs) where
{
  val () = 
  the_dvarmap_remove_one(x0)
}
//
| _ (* non-h0varstk *) => (xs)
)
} (* end of [h0varstk_pop_top] *)
//
(* ****** ****** *)
//
datavtype
l1tmpstk =
|
l1tmpstk_nil of
  ((*void*))
|
l1tmpstk_fun0 of
  (l1tmpstk(*rest*))
//
|
l1tmpstk_cons of
  (l1tmp, l1tmpstk(*rest*))
//
(* ****** ****** *)
//
fun
l1tmpstk_pop_top
( xs:
& l1tmpstk >> _): l1tmplst =
let
val
( xs1
, ts1
) = auxstk
(xs, list_nil()) in xs := xs1; ts1
end where
{
fun
auxstk
( xs
: l1tmpstk
, ts
: l1tmplst)
: (l1tmpstk, l1tmplst) =
(
case+ xs of
//
| ~
l1tmpstk_cons
  (t0, xs) =>
  auxstk(xs, ts) where
{
  val ts = list_cons(t0, ts)
}
//
| _ (*non-l1tmpstk*) => (xs, ts)
)
} (* end of [l1tmpstk_pop_top] *)
//
(* ****** ****** *)
//
datavtype
l1cmdstk =
|
l1cmdstk_nil of
  ((*void*))
|
l1cmdstk_push of
  (l1cmdstk(*rest*))
|
l1cmdstk_cons of
  (l1cmd, l1cmdstk(*rest*))
//
(* ****** ****** *)
//
fun
l1cmdstk_pop0_lst
( xs:
& l1cmdstk >> _): l1cmdlst =
let
fun
auxlst
( xs: l1cmdstk
, ys: l1cmdlst )
: (l1cmdstk, l1cmdlst) =
(
case+ xs of
|
l1cmdstk_nil() => (xs, ys)
| ~
l1cmdstk_push(tl) => (tl, ys)
| ~
l1cmdstk_cons(x1, tl) =>
let
  val ys =
  list_cons
  ( x1, ys ) in auxlst(tl, ys)
end
)
in
let
val
( xs1
, xs2
) = auxlst
( xs
, list_nil()) in (xs := xs1; xs2)
end
end // end of [l1cmdstk_pop0_lst]
//
(* ****** ****** *)

local

datavtype
compenv =
COMPENV of @{
  flevel= int
,
  h0varstk= h0varstk
,
  l1tmpstk= l1tmpstk
,
  l1cmdstk= l1cmdstk
}

absimpl
compenv_vtbox = compenv

in(*in-of-local*)

implement
compenv_make_nil
  ((*void*)) =
let
(*
val () =
println!("compenv_make_nil")
*)
in
//
COMPENV@{
  flevel= 0
,
  h0varstk = h0varstk_nil()
,
  l1tmpstk = l1tmpstk_nil()
,
  l1cmdstk = l1cmdstk_nil()
}
//
end // end of [compenv_make_nil]

(* ****** ****** *)

implement
compenv_free_top
  ( env0 ) =
let
val () =
free@(env0) in tmps
end where
{
//
val+
@COMPENV(rcd) = env0
//
val () =
h0varstk_pop_top(rcd.h0varstk)
val tmps =
l1tmpstk_pop_top(rcd.l1tmpstk)
//
val-( 0 ) = rcd.flevel
//
val-~h0varstk_nil() = rcd.h0varstk
val-~l1tmpstk_nil() = rcd.l1tmpstk
val-~l1cmdstk_nil() = rcd.l1cmdstk
//
} (* end of [compenv_free_nil] *)
  
(* ****** ****** *)
//
implement
js1comp_flevget
  (env0) =
(
  rcd.flevel
) where
{
val+
COMPENV(rcd) = env0
}
//
implement
js1comp_flevinc
  (env0) =
  fold@(env0) where
{
val+
@COMPENV(rcd) = env0
val () =
rcd.flevel := rcd.flevel + 1
}
implement
js1comp_flevdec
  (env0) =
  fold@(env0) where
{
val+
@COMPENV(rcd) = env0
val () =
rcd.flevel := rcd.flevel - 1
}
//
(* ****** ****** *)
implement
js1comp_dvarfind
  (env0, k0) =
let
val p2 =
the_dvarmap_search_ref(k0)
in
if
iseqz(p2)
then None_vt()
else let
  val xs = $UN.p2tr_get(p2)
  val-
  list_cons(x0, xs) = xs in Some_vt(x0)
end // end of [if]
end (* end of [js1comp_dvarfind] *)
(* ****** ****** *)
//
implement
js1comp_dvaradd_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.h0varstk
val xs = h0varstk_fun0(xs)
val () = rcd.h0varstk := xs
//
} (* end of [js1comp_dvaradd_fun0] *)
//
implement
js1comp_dvarpop_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val () =
h0varstk_pop_top(rcd.h0varstk)
//
val () =
(
  rcd.h0varstk := xs
) where
{
val-
~h0varstk_fun0(xs) = rcd.h0varstk
}
} (* end of [js1comp_dvarpop_fun0] *)
//
(* ****** ****** *)
//
implement
js1comp_dvaradd_bind
  (env0, x0, v0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.h0varstk
//
val () =
the_dvarmap_insert_one(x0, v0)
//
val () =
rcd.h0varstk := h0varstk_cons(x0, xs)
//
} where
{
val v0 = js1comp_l1valize(env0, v0)
} (* end of [js1comp_dvaradd_bind] *)
//
(* ****** ****** *)
//
implement
js1comp_ltmpnew_tmp0
( env0, loc0 ) =
let
prval () =
fold@(env0) in x0
end where {
//
val x0 =
l1tmp_new_tmp(loc0)
local
val n0 =
js1comp_flevget(env0)
in
val () = x0.lev( n0 )
end // end of [local]
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
//
val () =
rcd.l1tmpstk := l1tmpstk_cons(x0, xs)
//
} (* end of [js1comp_ltmpnew_tmp0] *)
//
implement
js1comp_ltmpnew_arg1
( env0
, loc0, idx1) =
let
prval () =
fold@(env0) in x0
end where {
//
val x0 =
l1tmp_new_arg
( loc0, idx1(*>0*))
local
val n0 =
js1comp_flevget(env0)
in
val () = x0.lev( n0 )
end // end of [local]
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
//
val () =
rcd.l1tmpstk := l1tmpstk_cons(x0, xs)
//
} (* end of [js1comp_ltmpnew_arg1] *)
//
(* ****** ****** *)
//
implement
js1comp_ltmpadd_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
val xs = l1tmpstk_fun0(xs)
val () = rcd.l1tmpstk := xs
//
} (* end of [js1comp_ltmpadd_fun0] *)
//
implement
js1comp_ltmppop_fun0
  (env0) =
(
  fold@(env0); ts
) where
{
//
val+
@COMPENV(rcd) = env0
//
val ts =
l1tmpstk_pop_top(rcd.l1tmpstk)
//
val () =
(
  rcd.l1tmpstk := xs
) where
{
val-
~l1tmpstk_fun0(xs) = rcd.l1tmpstk
}
} (* end of [js1comp_ltmppop_fun0] *)
//
(* ****** ****** *)

implement
js1comp_lcmdadd_lcmd
  (env0, x0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1cmdstk
//
val () =
rcd.l1cmdstk := l1cmdstk_cons(x0, xs)
//
} (* end of [js1comp_lcmdadd_lcmd] *)

(* ****** ****** *)

implement
js1comp_lcmdpush_nil
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1cmdstk
val () =
rcd.l1cmdstk := l1cmdstk_push(xs)
//
} (* end of [js1comp_lcmdadd] *)

(* ****** ****** *)

implement
js1comp_lcmdpop0_lst
  (env0) =
let
val () = fold@(env0) in xs
end where
{
//
val+
@COMPENV(rcd) = env0
//
val xs =
l1cmdstk_pop0_lst(rcd.l1cmdstk)
//
} (* end of [js1comp_lcmdpop0] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
js1comp_lcmdpop0_blk
  (env0) =
(
  l1blk_some
  ( js1comp_lcmdpop0_lst(env0) )
)
//
(* ****** ****** *)

local

(* ****** ****** *)

#staload
"libats/SATS\
/linmap_avltree.sats"
#staload _ =
"libats/DATS\
/linmap_avltree.dats"

(* ****** ****** *)

extern
prfun
lemma_p2tr_param
{a:vt0p}
{l:addr}(cp: p2tr(a, l)): [l >= null] void

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

local

typedef
key = h0var
and
itm = List0(l1val)
vtypedef
dvarmap = map(key, itm)

var
the_dvarmap =
linmap_make_nil<>{key,itm}()
val
the_dvarmap = addr@the_dvarmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in $TMP.cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
the_dvarmap_search_ref
  (k0) = let
//
val
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
val ref =
linmap_search_ref<key,itm>(map, k0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end // end of [the_dvarmap_search_ref]

(* ****** ****** *)

implement
the_dvarmap_insert_one
  (k0, x0) =
let
val p2 =
the_dvarmap_search_ref(k0)
in
if
isneqz(p2)
then
let
  val xs = $UN.p2tr_get(p2)
in
$UN.p2tr_set(p2, list_cons(x0, xs))
end // end of then
else let
  var
  map =
  $UN.ptr0_get<dvarmap>(the_dvarmap)
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val xs = list_sing(x0)
val () =
linmap_insert_any<key,itm>(map, k0, xs)
}
end // end of [else]
end // end of [the_dvarmap_insert_one]

(* ****** ****** *)

implement
the_dvarmap_remove_one
  ( k0 ) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
val
opt =
linmap_takeout_opt<key,itm>(map, k0)
//
in
//
case- opt of
|
~Some_vt(xs) =>
let
val-
list_cons(x0, xs) = xs
in
case+ xs of
|
list_nil _ =>
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
|
list_cons _ =>
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, k0, xs)
}
end // end of [let]
//
end // end of [the_dvarmap_remove_one]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_js1comp_envmap.dats] *)
