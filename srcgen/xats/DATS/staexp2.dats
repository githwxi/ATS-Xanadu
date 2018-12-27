(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: October, 2018
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
STM = "./../SATS/stamp0.sats"
//
  typedef stamp = $STM.stamp
//
(* ****** ****** *)
//
#staload
LOC = "./../SATS/location.sats"
//
  typedef loc_t = $LOC.loc_t
  typedef locopt = Option(loc_t)
//
(* ****** ****** *)
//
#staload "./../SATS/symbol.sats"
//
#staload "./../SATS/lexing.sats"
//
(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
t2abs_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
t2dat_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

(*
local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
t2xtv_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]
*)

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
s2var_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
s2xtv_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
s2cst_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

implement
sort2_is_int
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = INT_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_int] *)
implement
sort2_is_addr
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = ADDR_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_addr] *)
implement
sort2_is_bool
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = BOOL_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_bool] *)
implement
sort2_is_char
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = CHAR_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_char] *)

(* ****** ****** *)

implement
sort2_is_real
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = REAL_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_real] *)
implement
sort2_is_float
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = FLOAT_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_float] *)
implement
sort2_is_string
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = STRING_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_string] *)

(* ****** ****** *)

implement
sort2_is_impred
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
  case+ s2tb of
  | T2BASimp(_, _) => true | _ => false
)
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_impred] *)

(* ****** ****** *)
//
(*
implement
sort2_apps
  (f0, xs) =
(
case+ xs of
| list_nil() => f0
| list_cons(x1, xs2) =>
  (
  case+ x1 of
  | S2Ttup(xs1) =>
    (
      sort2_apps(S2Tapp(f0, xs1), xs2)
    )
  | _(*non-S2Ttup*) =>
    let
      val xs1 = list_sing(x1)
    in
      sort2_apps(S2Tapp(f0, xs1), xs2)
    end
  )
) (* end of [sort2_apps] *)
*)
//
(* ****** ****** *)

local
//
typedef
t2abs_struct = @{
  t2abs_sym= sym_t // name
, t2abs_stamp= stamp // unicity
}
//
absimpl
t2abs_tbox = ref(t2abs_struct)
//
in (* in-of-local *)

implement
t2abs_new(sym) =
(
ref<t2abs_struct>
@{
  t2abs_sym=sym
,
  t2abs_stamp=stamp
}
) where
{
val stamp = t2abs_stamp_new()
} (* end of [t2abs_new] *)

implement
t2abs_get_sym(s2ta) = s2ta->t2abs_sym
implement
t2abs_get_stamp(s2ta) = s2ta->t2abs_stamp

end // end of [local]

(* ****** ****** *)

local
//
typedef
t2dat_struct = @{
  t2dat_sym= sym_t // name
, t2dat_stamp= stamp // unicity
, t2dat_sconlst= s2cstlst
}
//
absimpl
t2dat_tbox = ref(t2dat_struct)
//
in (* in-of-local *)

implement
t2dat_new(sym) =
(
ref<t2dat_struct>
@{
  t2dat_sym=sym
,
  t2dat_stamp=stamp
,
  t2dat_sconlst= list_nil()
}
) where
{
val stamp = t2dat_stamp_new()
} (* end of [t2dat_new] *)

(* ****** ****** *)

implement
t2dat_get_sym(s2td) = s2td->t2dat_sym
implement
t2dat_get_stamp(s2td) = s2td->t2dat_stamp
implement
t2dat_get_sconlst(s2td) = s2td->t2dat_sconlst

end // end of [local]

(* ****** ****** *)

(*
local
//
typedef
t2xtv_struct = $rec
{
  t2xtv_stamp= stamp
,
  t2xtv_locopt= locopt
,
  t2xtv_sortopt= ref(sort2opt)
}
//
absimpl
t2xtv_tbox = ref(t2xtv_struct)
//
in (* in-of-local *)
//
implement
t2xtv_new0() =
ref<t2xtv_struct>
(
$rec
{
t2xtv_stamp=stamp
,
t2xtv_locopt=None(*void*)
,
t2xtv_sortopt=
ref<sort2opt>(None(*void*))
}
) where
{
val stamp = t2xtv_stamp_new()
} (* end of [t2xtv_new0] *)
//
implement
t2xtv_new1
  (loc0) =
ref<t2xtv_struct>
(
$rec
{
t2xtv_stamp=stamp
,
t2xtv_locopt=Some(loc0)
,
t2xtv_sortopt=
ref<sort2opt>(None(*void*))
}
) where
{
val stamp = t2xtv_stamp_new()
} (* end of [t2xtv_new0] *)
//
implement
t2xtv_get_stamp
  (s2tx) = s2tx->t2xtv_stamp
//
implement
t2xtv_get_sort
  (s2tx) =
  (s2t0) where
{
val-
Some(s2t0) = !(s2tx->t2xtv_sortopt)
} (* end of [t2xtv_get_sort] *)
//
implement
t2xtv_set_sort
  (s2tx, s2t0) =
{
val () =
!(s2tx->t2xtv_sortopt) := Some(s2t0)
} (* end of [t2xtv_get_sort] *)
//
implement
t2xtv_get_sortopt
  (s2tx) = !(s2tx->t2xtv_sortopt)
//
end // end of [local]
*)

(* ****** ****** *)

local

absimpl
s2cst_tbox = $rec{
//
  s2cst_loc= loc_t // loc
, s2cst_sym= sym_t // name
, s2cst_sort= sort2 // sort
, s2cst_stamp= stamp // unicity
//
} (* end of [s2cst_tbox] *)

in (* in-of-local *)

implement
s2cst_make_idst
  (tok, s2t) =
(
$rec{
  s2cst_loc= loc
, s2cst_sym= sid
, s2cst_sort= s2t
, s2cst_stamp= stamp
}
) where
{
  val loc = tok.loc()
  val sid = sexpid_sym(tok)
//
  val
  stamp = s2cst_stamp_new((*void*))
//
} (* s2cst_make_idst *)

(* ****** ****** *)

implement
s2cst_get_loc(x0) = x0.s2cst_loc
implement
s2cst_get_sym(x0) = x0.s2cst_sym
implement
s2cst_get_sort(x0) = x0.s2cst_sort
implement
s2cst_get_stamp(x0) = x0.s2cst_stamp

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s2var_tbox = $rec{
//
  s2var_sym= sym_t // name
, s2var_sort= sort2  // sort
, s2var_stamp= stamp // unicity
//
} (* end of [s2var_tbox] *)

in (* in-of-local *)

implement
s2var_make_idst
  (sid, s2t) =
(
$rec{
  s2var_sym= sid
, s2var_sort= s2t
, s2var_stamp= stamp
}
) where
{
  val
  stamp = s2var_stamp_new((*void*))
} (* s2var_make_idst *)

(* ****** ****** *)

implement
s2var_get_sym(x0) = x0.s2var_sym
implement
s2var_get_sort(x0) = x0.s2var_sort
implement
s2var_get_stamp(x0) = x0.s2var_stamp

end // end of [local]

(* ****** ****** *)

implement
s2exp_int(i0) = let
  val
  s2t = the_sort2_int
in
  s2exp_make_node(s2t, S2Eint(i0))
end // end of [s2exp_int]

implement
s2exp_chr(c0) = let
  val
  s2t = the_sort2_int
in
  s2exp_make_node(s2t, S2Echr(c0))
end // end of [s2exp_chr]

(* ****** ****** *)

implement
s2exp_cst(s2c) = let
  val s2t = s2c.sort()
in
  s2exp_make_node(s2t, S2Ecst(s2c))
end // end of [s2exp_cst]

(* ****** ****** *)

implement
s2exp_var(s2v) = let
  val s2t = s2v.sort()
in
  s2exp_make_node(s2t, S2Evar(s2v))
end // end of [s2exp_var]

(* ****** ****** *)
//
implement
s2exp_apps
(s2f0, s2as) = let
//
(*
val () =
println!
("\
s2exp_apps: s2f0 = ", s2f0)
val () =
println!
("\
s2exp_apps:\
s2f0.sort = ", s2f0.sort())
*)
//
val
s2f0 =
(
case+
s2f0.sort() of
| S2Tfun() => s2f0
| S2Tfun(_, s2t) => s2f0
| _(*non-S2Tfun*) =>
   s2exp_cast(s2f0, S2Tfun())
) : s2exp // end of [val]
//
val
s2t_res =
(
case+
s2f0.sort() of
| S2Tfun(_, s2t) => s2t
| _(*non-S2Tfun*) => S2Tnone()
) : sort2 // end of [val]
//
in
  s2exp_make_node
  (s2t_res, S2Eapp(s2f0, s2as))
end // end of [s2exp_app]
//
implement
s2exp_app2
(s2f0, s2a1, s2a2) =
(
  s2exp_apps(s2f0, list_pair(s2a1, s2a2))
)
//
(* ****** ****** *)

implement
s2exp_lam
(s2vs, body) =
let
//
val s2ts =
(
list_map<s2var><sort2>(s2vs)
) where
{
implement
list_map$fopr<s2var><sort2>(x) = x.sort()
}
//
val s2ts =
list_vt2t(s2ts)
//
val s2t0 =
S2Tfun(s2ts, body.sort())
//
in
  s2exp_make_node(s2t0, S2Elam(s2vs, body))
end (* end of [s2exp_lam] *)

(* ****** ****** *)

implement
s2exp_uni
(s2vs, s2ps, body) = let
  val s2t0 = body.sort()
in
  s2exp_make_node(s2t0, S2Euni(s2vs, s2ps, body))
end // end of [s2exp_uni]

implement
s2exp_exi
(s2vs, s2ps, body) = let
  val s2t0 = body.sort()
in
  s2exp_make_node(s2t0, S2Eexi(s2vs, s2ps, body))
end // end of [s2exp_exi]

(* ****** ****** *)

implement
s2exp_list(s2es) = let
//
  val s2t = S2Tnone()
//
in
  s2exp_make_node(s2t, S2Elist(s2es))
end // end of [s2exp_list]

(* ****** ****** *)
//
implement
s2exp_none0() =
s2exp_make_node(S2Tnone(), S2Enone0())
//
implement
s2exp_none1(s1e) =
s2exp_make_node(S2Tnone(), S2Enone1(s1e))
//
(* ****** ****** *)
//
implement
s2exp_cast(s2e, s2t) =
let
//
(*
val () =
println!("s2exp_cast: s2e = ", s2e)
val () =
println!("s2exp_cast: s2t = ", s2t)
*)
//
in
  s2exp_make_node(s2t, S2Ecast(s2e, s2t))
end // end of [s2exp_cast]
//
(* ****** ****** *)

local

absimpl
s2exp_tbox = $rec{
  s2exp_sort= sort2
, s2exp_node= s2exp_node
} (* end of [absimpl] *)

in (* in-of-local *)
//
implement
s2exp_get_sort(x0) = x0.s2exp_sort
implement
s2exp_get_node(x0) = x0.s2exp_node
//
implement
s2exp_make_node
  (s0t0, node) = $rec
{
  s2exp_sort= s0t0, s2exp_node= node
} (* end of [s2exp_make_node] *)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2.dats] *)
