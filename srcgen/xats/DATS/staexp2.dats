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
LOC = "./../SATS/locinfo.sats"
//
  typedef loc_t = $LOC.loc_t
  typedef locopt = Option(loc_t)
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/symbol.sats"
//
#staload "./../SATS/lexing.sats"
//
(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)
(*
//
static
fun
staexp2_initize(): void
val () = staexp2_initize()
//
*)
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
sort2_is_fun
  (s2t0) =
(
case+ s2t0 of
| S2Tfun _ => true
| _ (* non-S2Tfun *) => false
) (* end of [sort2_is_fun] *)

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
  val stamp = s2var_stamp_new()
} (* end of [s2var_make_idst] *)

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
s2exp_cast
(loc, s2e, s2t) = let
//
(*
val () =
println!("s2exp_cast: s2e = ", s2e)
val () =
println!("s2exp_cast: s2t = ", s2t)
*)
//
in
  s2exp_make_node(s2t, S2Ecast(loc, s2e, s2t))
end // end of [s2exp_cast]
//
(* ****** ****** *)
//
implement
s2exp_apps
(loc0, s2f0, s2as) = let
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
   s2exp_cast(loc0, s2f0, S2Tfun())
) : s2exp // end of [val]
//
val
s2t_res =
(
case+
s2f0.sort() of
| S2Tfun(_, s2t) => s2t
| _(*non-S2Tfun*) => S2Tnone0()
) : sort2 // end of [val]
//
in
  s2exp_make_node
  (s2t_res, S2Eapp(s2f0, s2as))
end // end of [s2exp_apps]
//
implement
s2exp_app2
(loc0, s2f0, s2a1, s2a2) =
(
  s2exp_apps(loc0, s2f0, list_pair(s2a1, s2a2))
)
//
(* ****** ****** *)
//
implement
s2exp_fun_nil
(npf, arg, res) =
(
s2exp_fun_full
(fc2, lin, npf, arg, res)
) where
{
  val lin = 0
  val fc2 = FC2fun((*void*))
}
//
implement
s2exp_fun_all
(npf, arg, res) =
(
s2exp_fun_full
(fc2, lin, npf, arg, res)
) where
{
  val lin = 0
  val fc2 = FC2fun((*void*))
}
//
implement
s2exp_fun_full
( fc2, lin
, npf, arg, res) =
(
s2exp_make_node
( s2t0
, S2Efun(fc2, lin, npf, arg, res))
) where
{
  val s2t0 =
  (
  if lin = 0
  then the_sort2_tbox else the_sort2_vtbox
  ) : sort2 // end of [val]
} (* end of [s2exp_fun_full] *)
//
(* ****** ****** *)

implement
s2exp_lam
(s2vs, body) =
let
//
val s2ts =
list_vt2t
(
let
implement
list_map$fopr<s2var><sort2>
  (s2v) = s2v.sort()
in
  list_map<s2var><sort2>(s2vs)
end
)
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
//
val
isnil =
(
  list_is_nil(s2vs)
  &&
  list_is_nil(s2ps)
)
//
in
//
if
isnil
then body
else let
  val s2t0 = body.sort()
in
  s2exp_make_node(s2t0, S2Euni(s2vs, s2ps, body))
end // end of [else]
//
end // end of [s2exp_uni]

implement
s2exp_exi
(s2vs, s2ps, body) = let
//
val
isnil =
(
  list_is_nil(s2vs)
  &&
  list_is_nil(s2ps)
)
//
in
//
if
isnil
then body
else let
  val s2t0 = body.sort()
in
  s2exp_make_node(s2t0, S2Eexi(s2vs, s2ps, body))
end // end of [else]
//
end // end of [s2exp_exi]

(* ****** ****** *)

implement
s2exp_list1
  (s2es) = let
//
  val knd = TYRECflt0
  val s2t =
  (
  if
  s2explst_islin(s2es)
  then
  the_sort2_vtype else the_sort2_type(*~lin*)
  ) : sort2 // end of [val]
  val ls2es =
  labs2explst_make_list1(s2es)
//
in
  s2exp_make_node(s2t, S2Etyrec(knd, 0, ls2es))
end // end of [s2exp_list1]

implement
s2exp_list2
  (s2es1, s2es2) = let
//
  val knd = TYRECflt0
  val s2t =
  (
  if
  s2explst_islin(s2es1)
  then
  the_sort2_vtype else
  (
  if
  s2explst_islin(s2es2)
  then
  the_sort2_vtype else the_sort2_type(*~lin*)
  )
  ) : sort2 // end of [val]
  val npf = list_length(s2es1)
  val ls2es =
  labs2explst_make_list2(s2es1, s2es2)
//
in
  s2exp_make_node(s2t, S2Etyrec(knd, npf, ls2es))
end // end of [s2exp_list2]

(* ****** ****** *)

implement
s2exp_tuple1
(knd, s2es) = let
//
val
islin =
s2explst_islin(s2es)
//
val s2t0 =
(
if
islin
then
(
if
knd = 0
then the_sort2_vtype
else the_sort2_vtbox
)
else
(
if
knd = 0
then
the_sort2_type else the_sort2_tbox
)
) : sort2 // end of [val]
//
val knd =
(
if
islin
then
(if knd = 0 then TYRECflt0 else TYRECbox1)
else
(if knd = 0 then TYRECflt0 else TYRECbox0)
) : tyrec // end of [val]
//
val
ls2es = labs2explst_make_list1(s2es)
//
in
  s2exp_make_node(s2t0, S2Etyrec(knd, 0, ls2es))
end // end of [s2exp_tuple1]

(* ****** ****** *)

implement
s2exp_tuple2
(knd, s2es1, s2es2) = let
//
val
islin =
s2explst_islin(s2es1)
val
islin =
(
if islin then islin
else s2explst_islin(s2es2)
) : bool // end of [val]
//
val s2t0 =
(
if
islin
then
(
if
knd = 0
then the_sort2_vtype
else the_sort2_vtbox
)
else
(
if
knd = 0
then
the_sort2_type else the_sort2_tbox
)
) : sort2 // end of [val]
//
val knd =
(
if
islin
then
(if knd = 0 then TYRECflt0 else TYRECbox1)
else
(if knd = 0 then TYRECflt0 else TYRECbox0)
) : tyrec // end of [val]
//
val
npf = list_length(s2es1)
val
ls2es = labs2explst_make_list2(s2es1, s2es2)
//
in
  s2exp_make_node(s2t0, S2Etyrec(knd, npf, ls2es))
end // end of [s2exp_tuple2]

(* ****** ****** *)

implement
s2exp_record1
(knd, ls2es) = let
//
val
islin =
labs2explst_islin(ls2es)
//
val s2t0 =
(
if
islin
then
(
if
knd = 0
then the_sort2_vtype
else the_sort2_vtbox
)
else
(
if
knd = 0
then
the_sort2_type else the_sort2_tbox
)
) : sort2 // end of [val]
//
val knd =
(
if
islin
then
(if knd = 0 then TYRECflt0 else TYRECbox1)
else
(if knd = 0 then TYRECflt0 else TYRECbox0)
) : tyrec // end of [val]
//
in
  s2exp_make_node(s2t0, S2Etyrec(knd, 0, ls2es))
end // end of [s2exp_record1]

(* ****** ****** *)

implement
s2exp_record2
(knd, ls2es1, ls2es2) = let
//
val
islin =
labs2explst_islin(ls2es1)
val
islin =
(
if islin then islin
else labs2explst_islin(ls2es2)
) : bool // end of [val]
//
val s2t0 =
(
if
islin
then
(
if
knd = 0
then the_sort2_vtype
else the_sort2_vtbox
)
else
(
if
knd = 0
then
the_sort2_type else the_sort2_tbox
)
) : sort2 // end of [val]
//
val knd =
(
if
islin
then
(if knd = 0 then TYRECflt0 else TYRECbox1)
else
(if knd = 0 then TYRECflt0 else TYRECbox0)
) : tyrec // end of [val]
//
val npf = list_length(ls2es1)
//
in
  s2exp_make_node
  (s2t0, S2Etyrec(knd, npf, ls2es1 + ls2es2))
end // end of [s2exp_record2]

(* ****** ****** *)
//
implement
s2exp_tyext
  (s2t0, s2es) =
(
  s2exp_make_node
  (s2t0, S2Etyext(s2es))
)
//
(* ****** ****** *)
//
implement
s2exp_none0(loc) =
s2exp_none0_s2t(loc, S2Tnone0())
implement
s2exp_none1(s1e) =
s2exp_none1_s2t(s1e, S2Tnone0())
//
implement
s2exp_none0_s2t(loc, s2t) =
s2exp_make_node(s2t, S2Enone0(loc))
implement
s2exp_none1_s2t(s1e, s2t) =
s2exp_make_node(s2t, S2Enone1(s1e))
//
(* ****** ****** *)

local

fun
auxlst1
( xs
: s2explst
, i0: int
, lxs
: labs2explst_vt
)
: labs2explst_vt =
(
case+ xs of
| list_nil() => lxs
| list_cons(x0, xs) =>
  (
    auxlst1(xs, i0, lxs)
  ) where
  {
    val l0 =
      $LAB.label_make_int(i0)
    // end of [val]
    val i0 = i0 + 1
    val lx = SLABELED(l0, x0)
    val lxs = list_vt_cons(lx, lxs)
  } // end of [list_cons]
) (* end of [auxlst1] *)
fun

auxlst2
( xs
: s2explst
, ys
: s2explst
, i0: int
, lxs
: labs2explst_vt
)
: labs2explst_vt =
(
case+ xs of
| list_nil() =>
  (
    auxlst1(ys, i0, lxs)
  )
| list_cons(x0, xs) =>
  (
    auxlst2(xs, ys, i0, lxs)
  ) where
  {
    val l0 =
      $LAB.label_make_int(i0)
    // end of [val]
    val i0 = i0 + 1
    val lx = SLABELED(l0, x0)
    val lxs = list_vt_cons(lx, lxs)
  } // end of [list_cons]
) (* end of [auxlst] *)

in (* in-of-local *)

implement
labs2explst_make_list1
  (xs) =
list_vt2t
(
list_vt_reverse
(
  auxlst1(xs, 0, list_vt_nil()
)
)
) (* end of [labs2explst_make_list1] *)
implement
labs2explst_make_list2
  (xs1, xs2) =
list_vt2t
(
list_vt_reverse
(
  auxlst2(xs1, xs2, 0, list_vt_nil()
)
)
) (* end of [labs2explst_make_list2] *)

end // end of [local]

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
//
// HX-2019-02-20:
// Please put the code below
// that requires initialization
//
(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
t2abs_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
t2dat_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

(*
local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
t2xtv_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]
*)

(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
s2cst_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
s2var_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
s2xtv_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2.dats] *)
