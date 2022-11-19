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
#typedef
fxtyenv = topmap(fixty)
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
d1parsed_from_trans(dpar)
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
#symload
t2penv with
d2parsed_get_t2penv
//
#typedef
sortenv = topmap(s2tex)
#typedef
sexpenv = topmap(s2itm)
#typedef
dexpenv = topmap(d2itm)
//
val
the_times = a0ref_make_1val(0)
//
val
the_sortenv = topmap_make_nil()
val
the_sexpenv = topmap_make_nil()
val
the_dexpenv = topmap_make_nil()
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
val
dpar =
d0parsed_from_fpath(knd0, fpth)
val
dpar = d1parsed_from_trans(dpar)
val
dpar = d2parsed_from_trans(dpar)
//
in//let
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
val () =
f0_pvsload(0(*sta*), "/prelude/basics0.sats") 
val () =
f0_pvsload(0(*sta*), "/prelude/excptn0.sats") }
// end of [if]
end (*let*) // end of [the_tr12env_pvsload(...)]
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
val topmap = the_sortenv(*[]*)
in//let
  topmap_search_opt(topmap, key)
end (*let*) // [the_sortenv_pvsfind]
//
#implfun
the_sexpenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_sexpenv(*[]*)
in//let
  topmap_search_opt(topmap, key)
end (*let*) // [the_sexpenv_pvsfind]
//
#implfun
the_dexpenv_pvsfind
  (   key   ) =
if
(the_times[] = 0)
then
optn_vt_nil(*void*) else
let
val topmap = the_dexpenv(*[]*)
in//let
  topmap_search_opt(topmap, key)
end (*let*) // [the_dexpenv_pvsfind]
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
