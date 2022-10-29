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
"./../HATS/xatsopt.hats"
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN="prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
STM = "./../SATS/xstamp0.sats"
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
#staload "./../SATS/xbasics.sats"
//
#staload "./../SATS/xsymbol.sats"
//
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
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
//
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
//
(* ****** ****** *)
//
(*
implement
sort2_is_xflt
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = XFLT_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_xflt] *)
*)
(*
implement
sort2_is_xstr
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASpre(pre) =>
  (pre = XSTR_symbol) | _ => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_xstr] *)
*)
//
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
//
implement
sort2_is_proof
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASimp
  (k0, _) => sortprf(k0) <= 1
| _ => false
)
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_proof] *)
implement
sort2_is_tcode
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
(
case+ s2tb of
| T2BASimp
  (k0, _) => sortprf(k0) <= 0
| _ => false
)
| _ (* non-S2Tbas *) => false
) (* end of [sort2_is_tcode] *)
//
(* ****** ****** *)
//
implement
sort2_is_impred
  (s2t0) =
(
case+ s2t0 of
//
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp _ => true
  | _ (* else *) => false
  )
//
| S2Tfun(_, s2t1) =>
  sort2_is_impred(s2t1)
//
| _ (*rest-of-sort2*) => false
//
) (* end of [sort2_is_impred] *)
//
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
//
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

(* ****** ****** *)
//
implement
t2abs_get_sym
  (s2ta) = s2ta->t2abs_sym
implement
t2abs_get_stamp
  (s2ta) = s2ta->t2abs_stamp
//
(* ****** ****** *)

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
//
implement
t2dat_get_sym
  (s2td) = s2td->t2dat_sym
implement
t2dat_get_stamp
  (s2td) = s2td->t2dat_stamp
implement
t2dat_get_sconlst
  (s2td) = s2td->t2dat_sconlst
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
s2var_copy(s2v) =
s2var_make_idst
(s2v.sym(), s2v.sort())
//
implement
s2varlst_copy(s2vs) =
(
case+ s2vs of
|
list_nil() =>
list_nil()
|
list_cons(s2v1, s2vs) =>
list_cons(s2v1, s2vs) where
{
val s2v1 = s2var_copy(s2v1)
val s2vs = s2varlst_copy(s2vs)
}
) (* end of [s2varlst_copy] *)
//
(* ****** ****** *)
//
implement
s2var_new(s2t) =
let
  val id0 = SRP_symbol
in
  s2var_make_idst(id0, s2t)
end
//
(* ****** ****** *)

local

typedef
s2var_struct = @{
//
  s2var_sym= sym_t // name
, s2var_sort= sort2  // sort
, s2var_stamp= stamp // unicity
//
} (* end of [s2var_tbox] *)

absimpl
s2var_tbox = ref(s2var_struct)

in (* in-of-local *)

implement
s2var_make_idst
  (sid, s2t) =
(
ref<s2var_struct>
@{
  s2var_sym= sid
, s2var_sort= s2t
, s2var_stamp= stamp
}
) where
{
  val stamp = s2var_stamp_new()
} (* end of [s2var_make_idst] *)

(* ****** ****** *)
//
implement
s2var_get_sym(x0) = x0->s2var_sym
//
implement
s2var_get_sort(x0) = x0->s2var_sort
implement
s2var_set_sort
  (x0, s2t) = (x0->s2var_sort := s2t)
//
implement
s2var_get_stamp(x0) = x0->s2var_stamp
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
typedef
s2xtv_struct =
@{
  s2xtv_loc= loc_t
,
  s2xtv_kind= k2xtv
,
  s2xtv_sort= sort2
,
  s2xtv_sexp= s2exp
,
  s2xtv_stamp= stamp
}
//
absimpl
s2xtv_tbox=ref(s2xtv_struct)
//
in (* in-of-local *)
//
implement
s2xtv_new_srt
( loc0, s2t0 ) =
(
ref<s2xtv_struct>
@{
  s2xtv_loc= loc0
,
  s2xtv_kind= knd0
,
  s2xtv_sort= s2t0
,
  s2xtv_sexp= s2e0
,
  s2xtv_stamp= stamp
}
) where
{
val knd0 = K2XTVnon()
val s2e0 = the_s2exp_none0
val stamp = s2xtv_stamp_new()
} (* end of [s2xtv_new_srt] *)
//
(* ****** ****** *)
//
implement
s2xtv_get_loc
  (xtv0) = xtv0->s2xtv_loc
//
implement
s2xtv_get_sort
  (xtv0) = xtv0->s2xtv_sort
//
implement
s2xtv_get_kind
  (xtv0) = xtv0->s2xtv_kind
implement
s2xtv_set_kind
  (xtv0, knd0) =
  (xtv0->s2xtv_kind := knd0)
//
implement
s2xtv_get_sexp
  (xtv0) = xtv0->s2xtv_sexp
implement
s2xtv_set_sexp
  (xtv0, s2e0) =
  (xtv0->s2xtv_sexp := s2e0)
//
implement
s2xtv_get_stamp
  (xtv0) = xtv0->s2xtv_stamp
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
eq_tyrec_tyrec
(x1, x2) =
(
case+
(x1, x2) of
|
(
TYRECbox0()
,
TYRECbox0()) => true
//
|
(
TYRECbox1()
,
TYRECbox1()) => true
//
|
(
TYRECflt0()
,
TYRECflt0()) => true
//
|
(
TYRECflt2(nm1)
,
TYRECflt2(nm2)) => (nm1 = nm2)
//
|
(_(*else*), _(*else*)) => false
) (* eq_tyrec_tyrec *)

(* ****** ****** *)
//
implement
s2exp_int(i0) = let
  val
  s2t = the_sort2_int
in
  s2exp_make_node(s2t, S2Eint(i0))
end // end of [s2exp_int]
//
(*
implement
s2exp_irp(rep) = let
  val
  s2t = the_sort2_int
in
  s2exp_make_node(s2t, S2Eirp(rep))
end // end of [s2exp_irp]
*)
//
(* ****** ****** *)

implement
s2exp_btf(b0) = let
  val
  s2t = the_sort2_bool
in
  s2exp_make_node(s2t, S2Ebtf(b0))
end // end of [s2exp_btf]

implement
s2exp_chr(c0) = let
  val
  s2t = the_sort2_char
in
  s2exp_make_node(s2t, S2Echr(c0))
end // end of [s2exp_chr]

(* ****** ****** *)

implement
s2exp_str(str) = let
  val
  s2t = the_sort2_cstr
in
  s2exp_make_node(s2t, S2Estr(str))
end // end of [s2exp_str]

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

implement
s2exp_xtv(xtv) = let
  val s2t = xtv.sort()
in
  s2exp_make_node(s2t, S2Extv(xtv))
end // end of [s2exp_xtv]

(* ****** ****** *)
//
implement
s2exp_cprf
(loc, s2e) = let
//
(*
val () =
println!("s2exp_cprf: s2e = ", s2e)
*)
//
val s2t = the_sort2_prop
//
in
  s2exp_make_node(s2t, S2Ecprf(loc, s2e))
end // end of [s2exp_cprf]
//
implement
s2exp_ctcd
(loc, s2e) = let
//
(*
val () =
println!("s2exp_ctcd: s2e = ", s2e)
*)
//
val s2t = the_sort2_type
//
in
  s2exp_make_node(s2t, S2Ectcd(loc, s2e))
end // end of [s2exp_ctcd]
//
implement
s2exp_cimp
(loc, s2e) = let
//
(*
val () =
println!("s2exp_cimp: s2e = ", s2e)
*)
//
val s2t = the_sort2_type
//
in
  s2exp_make_node(s2t, S2Ecimp(loc, s2e))
end // end of [s2exp_cimp]
//
implement
s2exp_cast
(loc, s2e, s2t) = let
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!("s2exp_cast: s2e = ", s2e)
val () =
println!("s2exp_cast: s2t = ", s2t)
*)
#endif//__XATSOPT_DEBUG__
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
(* ****** ****** *)
//
implement
s2exp_app1
(loc0, s2f0, s2a1) =
(
s2exp_apps
( loc0, s2f0, list_sing(s2a1) )
)
implement
s2exp_app2
(loc0, s2f0, s2a1, s2a2) =
(
s2exp_apps
(loc0, s2f0, list_pair(s2a1, s2a2))
)
//
(* ****** ****** *)
//
implement
s2exp_any(knd) =
(
s2exp_make_node
(s2t, S2Eany(knd))
) where
{
 val s2t = the_sort2_none
}
//
(* ****** ****** *)
//
implement
s2exp_at0
(s2e(*elt*), s2l) =
(
s2exp_make_node
(s2t, S2Eapp(s2f, arg))
) where
{
val s2t =
the_sort2_view
val s2f = 
s2cstref_get_sexp
( the_a0p1tr_cview )
val arg = list_pair(s2e, s2l)
}
//
(* ****** ****** *)
//
implement
s2exp_top(s2e) =
(
s2exp_make_node
(s2t, S2Etop(s2e))
) where
{
val s2t =
sort2_topize(s2e.sort())
}
//
implement
s2exp_tpz(s2e) =
let
val
s2t = s2e.sort()
in
if
sort2_islin(s2t)
then
let
val s2t =
sort2_topize(s2t)
in
s2exp_make_node
(s2t, S2Etpz(s2e)) end else s2e
end // end of [s2exp_tpz]
//
(* ****** ****** *)
//
implement
s2exp_arg
(knd, s2e) =
(
s2exp_make_node
(s2t, S2Earg(knd, s2e))
) where
{
val
s2t =
(
ifcase
| // ~
knd = 0 =>
sort2_topize
(s2e.sort((*void*)))
| // !
knd = 1 => s2e.sort()
|
_(*else*) => // &
the_sort2_tbox(*void*)): sort2
} (*where*) // end of [s2exp_arg]
//
implement
s2exp_atx
(bef, aft) =
(
s2exp_make_node
(s2t, S2Eatx(bef, aft))
) where
{
  val s2t = bef.sort((*void*))
} (*where*) // end of [s2exp_atx]
//
(* ****** ****** *)
//
implement
s2exp_fun_nil
(npf, arg, res) =
(
s2exp_fun_full
(fc2, npf, arg, res)
) where
{
  val fc2 = FC2fun((*void*))
}
//
implement
s2exp_fun_all
(npf, arg, res) =
(
s2exp_fun_full
(fc2, npf, arg, res)
) where
{
  val fc2 = FC2fun((*void*))
}
//
implement
s2exp_fun_full
( fc2
, npf, arg, res) =
(
s2exp_make_node
( s2t0
, S2Efun(fc2, npf, arg, res))
) where
{
val s2t0 =
(
if
funclo2_islin(fc2)
then the_sort2_vtbx
else the_sort2_tbox ) : sort2
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
s2exp_met
(s2es, body) = let
  val s2t0 = body.sort()
in
  s2exp_make_node(s2t0, S2Emet(s2es, body))
end // end of [s2exp_met]

(* ****** ****** *)

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

(* ****** ****** *)
//
implement
s2exp_type_void() =
let
val
s2cr =
the_void_ctype in
s2cstref_get_sexp(s2cr) end
//
(* ****** ****** *)

implement
s2exp_type_sint
  (s2i1) = let
//
val
s2t0 =
the_sort2_type
//
val
s2f0 =
s2cstref_get_sexp
( the_sint_ctype )
val node =
S2Eapp(s2f0, list_sing(s2i1))
//
in
s2exp_whnfize
(
  s2exp_make_node(s2t0, node)
)
end // end of [s2exp_type_sint]

implement
s2exp_type_uint
  (s2i1) = let
//
val
s2t0 =
the_sort2_type
//
val
s2f0 =
s2cstref_get_sexp
( the_uint_ctype )
val node =
S2Eapp(s2f0, list_sing(s2i1))
//
in
s2exp_whnfize
(
  s2exp_make_node(s2t0, node)
)
end // end of [s2exp_type_uint]

(* ****** ****** *)

implement
s2exp_type_bool
  (s2i1) = let
//
val
s2t0 =
the_sort2_type
//
val
s2f0 =
s2cstref_get_sexp
( the_bool_ctype )
val node =
S2Eapp(s2f0, list_sing(s2i1))
//
in
s2exp_whnfize
(
  s2exp_make_node(s2t0, node)
)
end // end of [s2exp_type_bool]

(* ****** ****** *)

implement
s2exp_type_char
  (s2i1) = let
//
val
s2t0 =
the_sort2_type
//
val
s2f0 =
s2cstref_get_sexp
( the_char_ctype )
val node =
S2Eapp(s2f0, list_sing(s2i1))
//
in
s2exp_whnfize
(
  s2exp_make_node(s2t0, node)
)
end // end of [s2exp_type_char]

(* ****** ****** *)

implement
s2exp_type_strlen
  (s2i1) = let
//
val
s2t0 =
the_sort2_type
//
val
s2f0 =
s2cstref_get_sexp
( the_string_ctype )
val node =
S2Eapp(s2f0, list_sing(s2i1))
//
in
s2exp_whnfize
(
  s2exp_make_node(s2t0, node)
)
end // end of [s2exp_type_strlen]

(* ****** ****** *)

implement
s2exp_list1
  (s2es) = let
//
  val knd =
  TYRECflt0(*void*)
  val lin =
  s2explst_islin(s2es)
  val s2t =
  (
  if
  lin
  then
    the_sort2_vwtp
  else
    the_sort2_type(*~lin*)
  // end of [if]
  ) : sort2 // end of [val]
  val ls2es =
  labs2explst_make_list1(s2es)
//
in
s2exp_make_node
(s2t, S2Etyrec(knd, ~1(*npf*), ls2es))
end // end of [s2exp_list1]

(* ****** ****** *)

implement
s2exp_list2
  (s2es1, s2es2) = let
//
  val knd =
  TYRECflt0(*void*)
  val islin =
  s2explst_islin(s2es1)
  val s2t =
  (
  if
  islin
  then
  the_sort2_vwtp else
  (
  if
  s2explst_islin(s2es2)
  then
  the_sort2_vwtp else the_sort2_type
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
//
(*
HX-2020-07:
boxed
tuples are linear
*)
//
implement
s2exp_trcd11
(knd, s2es) = let
//
val s2t0 =
(
if
(knd = 0)
then
(
let
val
islin =
s2explst_islin(s2es)
in
if
islin
then (the_sort2_vwtp)
else (the_sort2_type)
end
)
else (the_sort2_vtbx) // linear
) : sort2 // end of [val]
//
val knd =
(
if
(knd = 0)
then TYRECflt0 else TYRECbox1
) : tyrec // end of [val]
//
val
ls2es = labs2explst_make_list1(s2es)
//
in
s2exp_make_node
(s2t0, S2Etyrec(knd, ~1(*npf*), ls2es))
end // end of [s2exp_trcd11]

(* ****** ****** *)

implement
s2exp_trcd12
( knd
, s2es1, s2es2) = let
//
//
val s2t0 =
(
if
(knd = 0)
then
let
val
islin =
s2explst_islin(s2es1)
val
islin =
(
if
islin
then islin else
s2explst_islin(s2es2)
) : bool // end of [val]
in
if
islin
then (the_sort2_vwtp)
else (the_sort2_type)
end
else (the_sort2_vtbx) // linear
) : sort2 // end of [val]
//
val knd =
(
if knd = 0 then TYRECflt0 else TYRECbox1
) : tyrec // end of [val]
//
val
npf = list_length(s2es1)
val
ls2es = labs2explst_make_list2(s2es1, s2es2)
//
in
s2exp_make_node(s2t0, S2Etyrec(knd, npf, ls2es))
end // end of [s2exp_trcd12]

(* ****** ****** *)

implement
s2exp_trcd21
(knd, ls2es) = let
//
val s2t0 =
(
if
knd = 0
then
let
val
islin =
labs2explst_islin(ls2es)
in
if
islin
then (  the_sort2_vwtp  )
else (  the_sort2_type  )
end
else (  the_sort2_vtbx  ) // linear
) : sort2 // end of [val]
//
val knd =
(
if knd = 0 then TYRECflt0 else TYRECbox1
) : tyrec // end of [val]
//
in
  s2exp_make_node
  (s2t0, S2Etyrec(knd, ~1(*npf*), ls2es))
end // end of [s2exp_trcd21]

(* ****** ****** *)

implement
s2exp_trcd22
( knd
, ls2es1, ls2es2) = let
//
val s2t0 =
(
if
(knd = 0)
then
let
val
islin =
labs2explst_islin(ls2es1)
val
islin =
(
if
islin
then islin else
labs2explst_islin(ls2es2)
) : bool // end of [val]
in
if
islin
then (  the_sort2_vwtp  )
else (  the_sort2_type  )
end
else (  the_sort2_vtbx  ) // linear
) : sort2 // end of [val]
//
val knd =
(
if knd = 0 then TYRECflt0 else TYRECbox1
) : tyrec // end of [val]
//
val npf = list_length(ls2es1)
//
in
s2exp_make_node
(s2t0, S2Etyrec(knd, npf, ls2es1 + ls2es2))
end // end of [s2exp_trcd22]

(* ****** ****** *)
//
implement
s2exp_t2ype
  (t2p0) =
(
case+
t2p0.node() of
|
T2Pvar(s2v0) =>
s2exp_var(s2v0)
|
T2Pcst(s2c0) =>
s2exp_cst(s2c0)
|
_ (*else-of-t2ype*) =>
s2exp_make_node
(t2p0.sort(), S2Et2ype(t2p0))
) (* end of [s2exp_t2ype] *)
//
(* ****** ****** *)
//
implement
s2exp_tyext
  (s2t0, tnm1, s2es) =
(
s2exp_make_node
(s2t0, S2Etyext(tnm1, s2es))
)
//
(* ****** ****** *)
//
implement
the_s2exp_none0 =
  s2exp_none0((*void*))
//
implement
s2exp_none0() =
s2exp_none0_s2t(S2Tnone0())
//
implement
s2exp_none1(s1e) =
s2exp_none1_s2t(s1e, S2Tnone0())
//
implement
s2exp_none2(loc, s2e) =
let
  val s2t = s2e.sort()
in
s2exp_make_node(s2t, S2Enone2(loc, s2e))
end
//
implement
s2exp_none0_s2t(s2t) =
s2exp_make_node(s2t, S2Enone0())
implement
s2exp_none1_s2t(s1e, s2t) =
let
val loc = s1e.loc()
in
s2exp_make_node(s2t, S2Enone1(loc, s1e))
end
//
(* ****** ****** *)
//
(*
HX-2020-07-01:
the following 3 sort-cast
functions are the same for now
*)
//
implement
s2exp_abscast
(loc0, s2e1, s2t2) =
(
case+
s2e1.node() of
|
S2Eany(k0) => s2e1
|
_ (* non-S2Eany *) =>
let
val s2t1 = s2e1.sort()
in
if
(
s2t1 <= s2t2
) then (s2e1)
  else s2exp_cast(loc0, s2e1, s2t2)
// end of [if]
end
) (* end of [s2exp_abscast] *)
//
(*
implement
s2exp_sqacast
(loc0, s2e1, s2t2) =
(
case+
s2e1.node() of
|
S2Eany(k0) => s2e1
|
_ (* non-S2Eany *) =>
let
val s2t1 = s2e1.sort()
in
if
(
s2t1 <= s2t2
) then (s2e1)
  else s2exp_cast(loc0, s2e1, s2t2)
// end of [if]
end
) (* end of [s2exp_sqacast] *)
*)
//
implement
s2exp_tqacast
(loc0, s2e1, s2t2) =
(
case+
s2e1.node() of
|
S2Eany(k0) => s2e1
|
_ (* non-S2Eany *) =>
let
val s2t1 = s2e1.sort()
in
if
(
s2t1 <= s2t2
) then (s2e1)
  else s2exp_cast(loc0, s2e1, s2t2)
// end of [if]
end
) (* end of [s2exp_tqacast] *)
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

(* ****** ****** *)

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
//
typedef
s2exp_struct =
@{
  s2exp_sort= sort2
, s2exp_node= s2exp_node
}
absimpl
s2exp_tbox = ref(s2exp_struct)
//
in (* in-of-local *)
//
implement
s2exp_make_node
  (s0t0, node) =
(
ref<s2exp_struct>
@{
  s2exp_sort= s0t0
, s2exp_node= node }
) (* end of [s2exp_make_node] *)
//
implement
s2exp_get_sort
  (s2e0) = s2e0->s2exp_sort
implement
s2exp_get_node
  (s2e0) = s2e0->s2exp_node
//
(*
implement
s2exp_set_sort
  ( s2e0, s2t0 ) =
  ( s2e0->s2exp_sort := s2t0 )
*)
//
end (*local*) // end of [local(s2exp_tbox)]

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
