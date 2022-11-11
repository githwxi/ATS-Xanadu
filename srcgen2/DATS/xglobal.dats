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
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)

local

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

#implfun
the_xsymbls_search
  (  key  ) =
let
val map = the_xsymbls
in//let
XATS2JS_jsobjmap_search_opt<key>(map , key)
end (*let*) // end of [the_xsymbls_search(key)]

(* ****** ****** *)

end (*local*) // end of [local(the_xsymbls)]

(* ****** ****** *)

local
//
val
the_times =
a0ref_make_1val(0)
val
the_fxtyenv =
a0ref_make_1val
($UN.cast10{d1topenv}(0))
val
the_fixity0 =
// "{$XATSHOME}/prelude/fixity0.sats"
"/home/hwxi/Research/ATS-Xanadu/prelude/fixity0.sats"
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
val () =
prerrln
("the_fxtyenv_pvsload:")
val () = prerrln(dpar.topenv())
//
in//let
the_fxtyenv[] := dpar.topenv(); (1)
end (*let*) // end of [ f0_pvsload ]
//
} (*where*) // [the_fxtyenv_pvsload]
//
(* ****** ****** *)
//
#implfun
the_fxtyenv_pvsfind
  (   key   ) =
(
  topmap_search_opt(map, key)
) where
{
  val map = the_fxtyenv[(*void*)]
} (*where*) // [the_fxtyenv_pvsfind]
//
end (*local*)
// end of [the_fxtyenv_pvs(load|find)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sortenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sortenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sortenv_toplst_add0]
//
endloc // end of [local(the_sortenv_toplst)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_sexpenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_sexpenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_sexpenv_toplst_add0]
//
endloc // end of [local(the_sexpenv_toplst)]

(* ****** ****** *)

local

val
the_list =
a0ref_make_1val(list_nil())

in//local
//
#implfun
the_dexpenv_toplst
  ((*void*)) = a0ref_get(the_list)
//
#implfun
the_dexpenv_toplst_add0
  ( k0, x0 ) =
let
val kxs = a0ref_get(the_list)
in
a0ref_set
(the_list, list_cons(@(k0, x0), kxs))
end (*let*)//end-[the_dexpenv_toplst_add0]
//
endloc // end of [local(the_dexpenv_toplst)]

(* ****** ****** *)
#implfun
the_sortenv_toplst_print() =
the_sortenv_toplst_fprint(g_stdout())
#implfun
the_sortenv_toplst_prerr() =
the_sortenv_toplst_fprint(g_stderr())
(* ****** ****** *)
#implfun
the_sexpenv_toplst_print() =
the_sexpenv_toplst_fprint(g_stdout())
#implfun
the_sexpenv_toplst_prerr() =
the_sexpenv_toplst_fprint(g_stderr())
(* ****** ****** *)
#implfun
the_dexpenv_toplst_prerr() =
the_dexpenv_toplst_fprint(g_stderr())
#implfun
the_dexpenv_toplst_print() =
the_dexpenv_toplst_fprint(g_stdout())
(* ****** ****** *)
//
#implfun
the_sortenv_toplst_fprint
  (out) =
let
#impltmp
g_print$out<>() = out
val kxs = the_sortenv_toplst()
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
("the_sortenv_toplst:", "(", kx1.0, " -> ", kx1.1, ")")
}
)
} (*where*)//end-[auxloop(kxs)]
end (*let*)//end-[the_sortenv_toplst_fprint]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xglobal.dats] *)
