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
Sun 23 Oct 2022 01:09:31 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
(*
HX-2022-11-11:
Many of the global structures are
for the main purpose of debugging!
*)
(* ****** ****** *)
//
#typedef fxtyenv = topmap(fixty)
//
#typedef gmacenv = topmap(g1mac)
//
#typedef sortenv = topmap(s2tex)
#typedef sexpenv = topmap(s2itm)
#typedef dexpenv = topmap(d2itm)
//
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)

local

(*
HX-2022-11-12:
For getting 'S{XATSHOME}'
*)

in//local
//
#implfun
the_XATSHOME() =
"/home/hwxi/Research/ATS-Xanadu"
//
end (*local*) // end of [local(XATSHOME)]

(* ****** ****** *)

local

(* ****** ****** *)
#typedef key = sint
#typedef itm = sym_t
(* ****** ****** *)
#symload
stmp with symbl_get_stmp
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)
//
val
the_xsymbls =
XATS2JS_jsobjmap_make_nil<key>{itm}()
//
in//local

(* ****** ****** *)

#implfun
the_xsymbls_search
  (  key  ) =
let
val map = the_xsymbls
in//let
XATS2JS_jsobjmap_search_opt<key>(map,key)
end (*let*) // end of [the_xsymbls_search(key)]

(* ****** ****** *)

#implfun
the_xsymbls_insert
  (    sym    ) =
let
//
val k0 =
sym.stmp()
val k0 =
g0u2s(uint(k0))
//
val x0 = sym
//
val map = the_xsymbls
//
in//let
XATS2JS_jsobjmap_insert_any<key>(map,k0,x0)
end (*let*) // end of [the_xsymbls_insert(sym)]

(* ****** ****** *)

end (*local*) // end of [local(the_xsymbls)]

(* ****** ****** *)

local
//
#symload
topenv with
d1parsed_get_topenv
//
val
the_times =
a0ref_make_1val(0)
val
the_fxtyenv =
a0ref_make_1val
($UN.cast10{fxtyenv}(0))
//
val
XATSHOME = the_XATSHOME()
val
the_fixity0 =
strn_append
(XATSHOME, "/prelude/fixity0.sats")
//
in//local
//
#implfun
the_fxtyenv_pvsload
  ((*void*)) =
let
val n0 =
the_times[]
val () =
(the_times[] := n0+1)
in//let
if
(n0 > 0)
then (0) else f0_pvsload()
end where
{
//
fun
f0_pvsload() =
let
//
val
dpar =
d0parsed_from_fpath
(0(*sta*), the_fixity0)
//
val
dpar =
d1parsed_of_trans01(dpar)
//
val
tenv =
d1parsed_get_topenv(dpar)
//
val () =
prerrln
("the_fxtyenv_pvsload:", tenv)
//
in//let
case+ tenv of
| D1TOPENV(topmap) =>
  (the_fxtyenv[] := topmap; (1))
end (*let*) // end of [ f0_pvsload ]
//
} (*where*) // [the_fxtyenv_pvsload()]
//
(* ****** ****** *)
//
#implfun
the_fxtyenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
  val topmap = the_fxtyenv[]
in//let
  topmap_search_opt(topmap, key)
end (*let*) // [the_fxtyenv_pvsfind]
//
end (*local*)
// end of [the_fxtyenv_pvs(load|find)]
//
(* ****** ****** *)

local
//
(* ****** ****** *)
val
the_gmacenv = topmap_make_nil()
(* ****** ****** *)
val
the_sortenv = topmap_make_nil()
val
the_sexpenv = topmap_make_nil()
val
the_dexpenv = topmap_make_nil()
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
the_gmacenv_pvs() = (the_gmacenv)
//
#implfun
the_sortenv_pvs() = (the_sortenv)
#implfun
the_sexpenv_pvs() = (the_sexpenv)
#implfun
the_dexpenv_pvs() = (the_dexpenv)
//
end (*local*) // end of [local(the_(tsd)env_pvs)]

(* ****** ****** *)

local
(*
HX-2022-11-19: nothing
*)
in//local

(* ****** ****** *)

#implfun
the_gmacenv_pvsmrgw(map) =
let
//
#typedef
kxs_t =
@(sint, list(g1mac))
//
val
kxss = topmap_strmize(map)
in//let
//
(
  auxloop(env0, kxss)) where
{
//
val env0 = the_gmacenv_pvs()
//
fun
auxkxs1
( env0
: gmacenv, kxs1: kxs_t): void =
let
val (k1, xs1) = kxs1
val-list_cons(x1, xs1) = xs1
in//let
//
(
case- opt of
| ~
optn_vt_cons(k1) =>
topmap_insert_any(env0, k1, x1))
where
{
  val opt = the_xsymbls_search(k1) }
//
end (*let*) // end of [auxkxs1(env0,kxs1)]
//
fun
auxloop
( env0: gmacenv
, kxss: strm_vt(kxs_t)): void =
(
case+ !kxss of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kxs1, kxss) =>
(
  auxkxs1(env0, kxs1); auxloop(env0, kxss))
)
} (*where*) // end of [auxloop(env0, kxss)]
//
end (*let*) // end of [the_gmacenv_pvsmrgw(map)]

(* ****** ****** *)

#implfun
the_sortenv_pvsmrgw(map) =
let
//
#typedef
kxs_t =
@(sint, list(s2tex))
//
val
kxss = topmap_strmize(map)
in//let
//
(
  auxloop(env0, kxss)) where
{
//
val env0 = the_sortenv_pvs()
//
fun
auxkxs1
( env0
: sortenv, kxs1: kxs_t): void =
let
val (k1, xs1) = kxs1
val-
~optn_vt_cons(k1) =
the_xsymbls_search(k1)
val-list_cons(x1, xs1) = xs1
in//let
  topmap_insert_any(env0, k1, x1)
end (*let*) // end of [auxkxs1(env0,kxs1)]
//
fun
auxloop
( env0: sortenv
, kxss: strm_vt(kxs_t)): void =
(
case+ !kxss of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kxs1, kxss) =>
(
  auxkxs1(env0, kxs1); auxloop(env0, kxss))
)
} (*where*) // end of [auxloop(env0, kxss)]
//
end (*let*) // end of [the_sortenv_pvsmrgw(map)]

(* ****** ****** *)

#implfun
the_sexpenv_pvsmrgw(map) =
let
//
#typedef
kxs_t =
@(sint, list(s2itm))
//
val
kxss = topmap_strmize(map)
in//let
//
(
  auxloop(env0, kxss)) where
{
//
val env0 = the_sexpenv_pvs()
//
fun
auxkxs1
( env0
: sexpenv, kxs1: kxs_t): void =
let
val (k1, xs1) = kxs1
val-list_cons(x1, xs1) = xs1
in//let
(
case+ x1 of
|_(*S2ITM-else*) =>
topmap_insert_any(env0, k1, x1))
where
{
val- ~
optn_vt_cons(k1) = the_xsymbls_search(k1)
}
end (*let*) // end of [auxkxs1(env0,kxs1)]
//
fun
auxloop
( env0: sexpenv
, kxss: strm_vt(kxs_t)): void =
(
case+ !kxss of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kxs1, kxss) =>
(
  auxkxs1(env0, kxs1); auxloop(env0, kxss))
)
} (*where*) // end of [ auxloop(env0, kxss) ]
//
end (*let*) // end of [the_sexpenv_pvsmrgw(map)]

(* ****** ****** *)

#implfun
the_dexpenv_pvsmrgw(map) =
let
//
#typedef
kxs_t =
@(sint, list(d2itm))
//
val
kxss = topmap_strmize(map)
in//let
//
(
  auxloop(env0, kxss)) where
{
//
val env0 = the_dexpenv_pvs()
//
fun
auxkxs1
( env0
: dexpenv, kxs1: kxs_t): void =
let
val (k1, xs1) = kxs1
val-list_cons(x1, xs1) = xs1
in//let
(
case+ x1 of
|_(*D2ITM-else*) =>
topmap_insert_any(env0, k1, x1))
where
{
val- ~
optn_vt_cons(k1) = the_xsymbls_search(k1)
}
end (*let*) // end of [auxkxs1(env0, kxs1)]
//
fun
auxloop
( env0: dexpenv
, kxss: strm_vt(kxs_t)): void =
(
case+ !kxss of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kxs1, kxss) =>
(
  auxkxs1(env0, kxs1); auxloop(env0, kxss))
)
} (*where*) // end of [ auxloop(env0, kxss) ]
//
end (*let*) // end of [the_dexpenv_pvsmrgw(map)]

(* ****** ****** *)

end (*local*) // end of [local(the_(tsd)env_pvsmrgw)]

(* ****** ****** *)

local

(* ****** ****** *)
#symload
t2penv with
d2parsed_get_t2penv
(* ****** ****** *)
val
the_times = a0ref_make_1val(0)
(* ****** ****** *)
//
fun
f0_pvsinit(): void =
let
//
(* ****** ****** *)
val INT = INT_symbl
val BOOL = BOOL_symbl
val ADDR = ADDR_symbl
val CHAR = CHAR_symbl
val STRN = STRN_symbl
val PROP = PROP_symbl
val VIEW = VIEW_symbl
val TYPE = TYPE_symbl
val TBOX = TBOX_symbl
val VTBX = VTBX_symbl
val VWTP = VWTP_symbl
(* ****** ****** *)
//
(* ****** ****** *)
local
val env0 = the_sortenv_pvs()
in//local
//
val () =
topmap_insert_any
( env0
, INT, S2TEXsrt(the_sort2_int))
val () =
topmap_insert_any
( env0
, BOOL, S2TEXsrt(the_sort2_bool))
val () =
topmap_insert_any
( env0
, ADDR, S2TEXsrt(the_sort2_addr))
val () =
topmap_insert_any
( env0
, CHAR, S2TEXsrt(the_sort2_char))
val () =
topmap_insert_any
( env0
, STRN, S2TEXsrt(the_sort2_strn))
//
val () =
topmap_insert_any
( env0
, PROP, S2TEXsrt(the_sort2_prop))
val () =
topmap_insert_any
( env0
, TYPE, S2TEXsrt(the_sort2_type))
val () =
topmap_insert_any
( env0
, TBOX, S2TEXsrt(the_sort2_tbox))
//
val () =
topmap_insert_any
( env0
, VIEW, S2TEXsrt(the_sort2_view))
val () =
topmap_insert_any
( env0
, VWTP, S2TEXsrt(the_sort2_vwtp))
val () =
topmap_insert_any
( env0
, VTBX, S2TEXsrt(the_sort2_vtbx))
end (*loc*) // end-of-[local(sortenv)]
(* ****** ****** *)
//
end (*let*) // end-of-[f0_pvsinit(...)]
//
(* ****** ****** *)

fun
f0_pvsload
( knd0: sint
, fnam: strn): void =
let
//
val
fpth =
let
val
XATSHOME = the_XATSHOME()
in//let
strn_append(XATSHOME, fnam)
end (*let*) // end-of-(fpth)
//
val () =
prerrln
("f0_pvsload: fpth = ", fpth)
//
val
dpar =
d0parsed_from_fpath(knd0, fpth)
val
dpar = d1parsed_of_trans01(dpar)
val
dpar = d2parsed_of_trans12(dpar)
//
in//let
//
let
val+
D2TOPENV
(tr11
,tenv,senv,denv) = dpar.t2penv()
//
// (*
val () =
prerrln("\
the_tr12env_pvsload:tr11=\n", tr11)
val () =
prerrln("\
the_tr12env_pvsload:tenv=\n", tenv)
val () =
prerrln("\
the_tr12env_pvsload:senv=\n", senv)
val () =
prerrln("\
the_tr12env_pvsload:denv=\n", denv)
// *)
in//let
//
(
let
  val () = the_sortenv_pvsmrgw(tenv)
  val () = the_sexpenv_pvsmrgw(senv)
  val () = the_dexpenv_pvsmrgw(denv)
end (*let*)
)
//
end (*let*)
//
end (*let*) // end of [f0_pvsload(knd0,fpth)]

(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
the_tr12env_pvsload
  ((*void*)) =
let
val n0 =
the_times[]
val () =
(the_times[] := n0+1)
in//let
//
if
(n0 > 0)
then (0) else (1) where
{
//
val () = f0_pvsinit((*void*))
//
(* ****** ****** *)
//
val () =
f0_pvsload
(0(*sta*),"/prelude/basics0.sats") 
//
(* ****** ****** *)
//
val () =
f0_pvsload
(0(*sta*),"/prelude/INIT/excptn0.sats")
val () =
f0_pvsload
(0(*sta*),"/prelude/INIT/xsetup0.sats")
//
val () =
f0_pvsload
( 0(*sta*)
, "/prelude/INIT/srcgen2_xsetup0.sats")
//
(* ****** ****** *)
//
val () =
f0_pvsload
(0(*sta*), "/prelude/SATS/bool000.sats")
val () =
f0_pvsload
(0(*sta*), "/prelude/SATS/char000.sats")
val () =
f0_pvsload
(0(*sta*), "/prelude/SATS/gint000.sats") }
//
// end of [if-then-else]
//
end (*let*) // end of [the_tr12env_pvsload(...)]
//
(* ****** ****** *)
//
#implfun
the_gmacenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_gmacenv_pvs()
in//let
  topmap_search_opt(topmap, key)
end (*let*) // [the_gmacenv_pvsfind]
//
(* ****** ****** *)
//
#implfun
the_sortenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_sortenv_pvs()
in//let
  topmap_search_opt(topmap, key)
end where
{
(*
val () =
prerrln
("the_sortenv_pvsfind: key = ", key)
*)
} (*where*) // [the_sortenv_pvsfind]
//
(* ****** ****** *)
//
#implfun
the_sexpenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_sexpenv_pvs()
in//let
  topmap_search_opt(topmap, key)
end where
{
(*
val () =
prerrln
("the_sexpenv_pvsfind: key = ", key)
*)
} (*where*) // [the_sexpenv_pvsfind]
//
(* ****** ****** *)
//
#implfun
the_dexpenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_dexpenv_pvs()
in//let
  topmap_search_opt(topmap, key)
end where
{
(*
val () =
prerrln
("the_dexpenv_pvsfind: key = ", key)
*)
} (*where*) // [the_dexpenv_pvsfind]
//
(* ****** ****** *)
//
end (*local*) // end of [the_tr12env_pvs(load|find)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sortenv_allist
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sortenv_allist_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sortenv_allist_add0]
//
end (*local*) // end of [local(the_sortenv_allist)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sexpenv_allist
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sexpenv_allist_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sexpenv_allist_add0]
//
end (*local*) // end of [local(the_sexpenv_allist)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_dexpenv_allist
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_dexpenv_allist_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_dexpenv_allist_add0]
//
end (*local*) // end of [local(the_dexpenv_allist)]

(* ****** ****** *)
#implfun
the_sortenv_allist_print
  ((*void*)) =
the_sortenv_allist_fprint(g_stdout())
#implfun
the_sexpenv_allist_print
  ((*void*)) =
the_sexpenv_allist_fprint(g_stdout())
#implfun
the_dexpenv_allist_print
  ((*void*)) =
the_dexpenv_allist_fprint(g_stdout())
(* ****** ****** *)
#implfun
the_sortenv_allist_prerr
  ((*void*)) =
the_sortenv_allist_fprint(g_stderr())
#implfun
the_sexpenv_allist_prerr
  ((*void*)) =
the_sexpenv_allist_fprint(g_stderr())
#implfun
the_dexpenv_allist_prerr
  ((*void*)) =
the_dexpenv_allist_fprint(g_stderr())
(* ****** ****** *)
//
#implfun
the_sortenv_allist_fprint
  (   out   ) =
let
//
#impltmp
g_print$out<>() = out
val kxs = the_sortenv_allist()
//
in//let
(
auxloop(kxs)) where
{
fun
auxloop
(kxs: list@(sym_t, s2tex)): void =
(
case+ kxs of
|
list_nil() => ()
|
list_cons(kx1, kxs) =>
(
auxloop(kxs)) where
{
val () = println
("the_sortenv_allist:", "(", kx1.0, " -> ", kx1.1, ")")
}
)
} (*where*)//end-[auxloop(kxs)]
end (*let*)//end-[the_sortenv_allist_fprint]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xglobal.dats] *)
