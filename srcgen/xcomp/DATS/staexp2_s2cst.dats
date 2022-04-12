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
// Start Time: December, 2018
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
#staload "./../SATS/xstamp0.sats"
//
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)

#define NS2CST 1*1024

(* ****** ****** *)
//
implement
s2cstnul_none
((*void*)) =
$UN.cast(the_null_ptr)
implement
s2cstnul_some(s2c) = $UN.cast(s2c)
//
(* ****** ****** *)
//
local
//
extern
castfn
_s2c2ptr_
{l:addr}(s2cstnul(l)):<> ptr(l)
//
in (*in-of-local*)
//
implement
s2cstnul_iseqz
  (s2c) =
  (_s2c2ptr_(s2c) = the_null_ptr)
implement
s2cstnul_isneqz
  (s2c) =
  (_s2c2ptr_(s2c) > the_null_ptr)
//
end // end of [local]
//
(* ****** ****** *)

local
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = s2cst
vtypedef dynarray = dynarray(itm)
//
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(NS2CST))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

implement
stamp_s2cst
  (s2c) = let
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, s2c)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_s2cst]

end // end of [local]

(* ****** ****** *)

local
//
absimpl
s2cst_tbox =
$rec{
//
  s2cst_loc= loc_t // loc
, s2cst_sym= sym_t // name
, s2cst_sort= sort2 // sort
//
, s2cst_stamp= stamp // unicity
//
(*
// HX:
// Note that this field
// is already stored externally
//
, s2cst_isabs= abstdf2 // isabs?
*)
//
} (* end of [s2cst_tbox] *)
//
in (* in-of-local *)

implement
s2cst_make_idst
  (tok, s2t) =
(
let
val
s2c0 = 
$rec{
  s2cst_loc= loc
, s2cst_sym= sid
, s2cst_sort= s2t
//
, s2cst_stamp= stamp
//
} (* end-of-val *)
val
abs0 = ABSTDF2none()
val
def1 =
the_s2exp_none0(*void*)
val
def2 =
the_t2ype_none0(*void*)
in
(
  s2c0
) where
{
val () = stamp_s2cst(s2c0)
val () = stamp_s2cst_abst(s2c0, abs0)
val () = stamp_s2cst_sexp(s2c0, def1)
val () = stamp_s2cst_type(s2c0, def2)
}
end
) where
{
//
  val loc = tok.loc()
  val sid = sexpid_sym(tok)
//
  val
  stamp = s2cst_stamp_new((*void*))
//
} (* end of [s2cst_make_idst] *)

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
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = abstdf2
vtypedef dynarray = dynarray(itm)
//
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(NS2CST))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

implement
s2cst_get_abst
  (s2c) = let
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
in
if
isneqz(cp)
then $UN.p2tr_get(cp) else ABSTDF2none()
end // end of [s2cst_get_abst]

(* ****** ****** *)

implement
stamp_s2cst_abst
  (s2c, abs) = let
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, abs)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_s2cst_abst]

end // end of [local]

(* ****** ****** *)

local
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = s2exp
vtypedef dynarray = dynarray(itm)
//
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(NS2CST))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

implement
s2cst_get_sexp
  (s2c) = let
//
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
//
in
//
if isneqz(cp)
  then $UN.p2tr_get(cp) else the_s2exp_none0
//
end // end of [s2cst_get_sexp]

(* ****** ****** *)

implement
stamp_s2cst_sexp
  (s2c, def) = let
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, def)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_s2cst_sexp]

end // end of [local]

(* ****** ****** *)

local
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = t2ype
vtypedef dynarray = dynarray(itm)
//
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(NS2CST))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

implement
s2cst_get_type
  (s2c) = let
//
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
//
in
//
if isneqz(cp)
  then $UN.p2tr_get(cp) else the_t2ype_none0
//
end // end of [s2cst_get_type]

(* ****** ****** *)

implement
stamp_s2cst_type
  (s2c, def) = let
//
(*
val () =
println!
("stamp_s2cst_type: s2c = ", s2c)
val () =
println!
("stamp_s2cst_type: def = ", def)
*)
//
  val s0 =
  s2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, def)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_s2cst_type]

end // end of [local]

(* ****** ****** *)

local
//
typedef
syms2cst_struct =
@{
  syms2cst_sym= symbol
, syms2cst_s2c= s2cstnul
} // end of [syms2cst_struct]
//
absimpl
s2cstref_tbox = ref(syms2cst_struct)
//
in (* in-of-local *)

implement
s2cstref_get_scst
  (r0) = let
//
fun
auxsrch
( sym
: sym_t)
: s2cstopt_vt =
let
val
opt =
the_sexpenv_pfind(sym)
in
//
case+ opt of
|
~None_vt() =>
 None_vt(*void*)
|
~Some_vt(s2i) =>
(
case+ s2i of
| S2ITMcst(s2cs) =>
  (
  case- s2cs of
  | list_cons(s2c, _) => Some_vt(s2c)
  )
| _(* non-S2ITMcst *) => None_vt(*void*)
)
//
end // end of [val]
//
val s2c0 = r0->syms2cst_s2c
//
in
//
if
isneqz(s2c0)
then unsome(s2c0)
else let
  val opt =
  auxsrch(r0->syms2cst_sym)
in
//
case+ opt of
|
~Some_vt(s2c) =>
 let
   val () =
   r0->syms2cst_s2c
   :=
   s2cstnul_some(s2c) in (s2c)
 end
|
~None_vt((*void*)) =>
 let
 val () =
 assertloc(false) in exit(1)
 end where
 {
 val () =
 println!
 ("s2cstref_get_scst: sym = ", r0->syms2cst_sym)
 }
//
end // end of [else]
// end of [ifneqz]
//
end // end of [s2cstref_get_scst]

(* ****** ****** *)

implement
s2cstref_get_sexp
  (r0) = let
//
val s2c0 =
s2cstref_get_scst(r0)
//
in
  s2cst_get_sexp(s2c0)
end // end of [s2cstref_get_sexp]

implement
s2cstref_get_type
  (r0) = let
//
val s2c0 =
s2cstref_get_scst(r0)
//
in
  s2cst_get_type(s2c0)
end // end of [s2cstref_get_type]

(* ****** ****** *)

implement
s2cstref_make_name
  (name) = let
//
  val sym0 =
  $SYM.symbol_make(name)
//
  val s2c0 = s2cstnul_none((*void*))
//
in
  ref<syms2cst_struct>
  (@{syms2cst_sym=sym0,syms2cst_s2c=s2c0})
end  // end of [s2cstref_make_name]

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2_s2cst.dats] *)
