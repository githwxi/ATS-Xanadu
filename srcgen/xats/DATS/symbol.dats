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
// Start Time: May, 2018
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

#staload "./../SATS/symbol.sats"

(* ****** ****** *)

local

#staload "libats/SATS/dynarray.sats"
#staload _ = "libats/DATS/dynarray.dats"

typedef itm = symbol
vtypedef
dynarray = dynarray(itm)

val
theCap = 1024
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(theCap))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)

in (* in-of-local *)

static
fun
stamp_insert(symbol): void

implement
stamp_insert
  (sym) = let
  val i0 =
  u2sz(g1ofg0(sym.stamp()))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, sym)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_insert]

implement
stamp_to_symbol
  (stamp) = let
  val i0 = u2sz(g1ofg0(stamp))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
in
  if
  isneqz(cp)
  then Some_vt($UN.cptr_get(cp)) else None_vt()
end // end of [stamp_to_symbol]

end // end of [local]

(* ****** ****** *)

extern
fun
symbol_insert(symbol): void
extern
fun
symbol_search
( key: string
, res: &symbol? >> opt(symbol, b)): #[b:bool] bool(b)

(* ****** ****** *)

local

(* ****** ****** *)

absimpl
symbol_tbox = $rec{
  name= string, stamp= uint
} (* end of [symbol_tbox] *)

(* ****** ****** *)

val
theStamp = ref<uint>(0u)

fun
theStamp_getinc() = let
  val stamp = theStamp[]
in
  theStamp[] := succ(stamp); stamp
end // end of [theStamp_getinc]

(* ****** ****** *)

in (* in-of-local *)

implement
symbol_make(name) = let
//
var res: symbol?
val ans = symbol_search(name, res)
//
in
//
case+ ans of
| true =>
  opt_unsome_get(res)
| false => let
    val stm =
    theStamp_getinc()
    val sym =
    $rec{name=name,stamp=stm}
    prval ((*void*)) = opt_unnone(res)
  in
    let
      val () = stamp_insert(sym)
      val () = symbol_insert(sym) in sym
    end
  end (* end of [false] *)
//
end // end of [symbol_make]

(* ****** ****** *)

implement
symbol_get_name(x) = x.name
implement
symbol_get_stamp(x) = x.stamp

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
eq_symbol_symbol(x, y) =
  (x.stamp() = y.stamp())
implement
neq_symbol_symbol(x, y) =
  (x.stamp() != y.stamp())
//
implement
compare_symbol_symbol(x, y) =
  compare(x.stamp(), y.stamp())
//
(* ****** ****** *)
//
implement
symbol_is_nil(x) = (x = symbol_nil)
implement
symbol_isnot_nil(x) = (x != symbol_nil)
//
(* ****** ****** *)

local
//
#staload "libats/SATS/hashtbl_chain.sats"
//
#staload _(*anon*) = "libats/DATS/qlist.dats"
//
#staload _(*anon*) = "libats/DATS/hashfun.dats"
#staload _(*anon*) = "libats/DATS/linmap_list.dats"
#staload _(*anon*) = "libats/DATS/hashtbl_chain.dats"
//
typedef key = string
typedef itm = symbol
//
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 1024
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in of local *)

implement
symbol_insert
  (sym) = let
//
val key = sym.name()
//
val tbl =
  $UN.castvwtp0{hashtbl}(theHashtbl)
//
var res: itm?
val ans =
  hashtbl_insert<key,itm>(tbl, key, sym, res)
//
prval ((*void*)) = opt_clear(res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  // nothing
end // end of [symbol_insert]

(* ****** ****** *)

implement
symbol_search
  (name, res) = let
//
val tbl =
  $UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
  hashtbl_search<key,itm>(tbl, name, res)
//
in
  let prval ((*void*)) = $UN.cast2void(tbl) in ans end
end // end of [symbol_search]

end // end of [local]

(* ****** ****** *)
//
implement
print_symbol
  (x) = fprint_symbol(stdout_ref, x)
implement
prerr_symbol
  (x) = fprint_symbol(stderr_ref, x)
//
implement
fprint_symbol
  (out, x) =
  fprint!(out, x.name(), "(", x.stamp(), ")")
//
(* ****** ****** *)

implement
symbol_nil = symbol_make("")

(* ****** ****** *)

implement
ADD_symbol = symbol_make("+")
implement
SUB_symbol = symbol_make("-")
implement
MUL_symbol = symbol_make("*")
implement
DIV_symbol = symbol_make("/")

(* ****** ****** *)

implement
LT_symbol = symbol_make("<")
implement
GT_symbol = symbol_make(">")
implement
LTEQ_symbol = symbol_make("<=")
implement
GTEQ_symbol = symbol_make(">=")

(* ****** ****** *)

implement
EQ_symbol = symbol_make("=")
implement
EQEQ_symbol = symbol_make("==")
implement
LTGT_symbol = symbol_make("<>")
implement
BANGEQ_symbol = symbol_make("!=")

(* ****** ****** *)
//
implement
MSGT_symbol = symbol_make("->")
//
implement
BSLASH_symbol = symbol_make("\\")
//
(* ****** ****** *)

implement
INT_symbol = symbol_make("int")
implement
ADDR_symbol = symbol_make("addr")
implement
BOOL_symbol = symbol_make("bool")
implement
CHAR_symbol = symbol_make("char")

implement
REAL_symbol = symbol_make("real")

implement
FLOAT_symbol = symbol_make("float")
implement
STRING_symbol = symbol_make("string")

(* ****** ****** *)
//
implement
PROP_symbol = symbol_make("prop")
implement
VIEW_symbol = symbol_make("view")
//
implement
TBOX_symbol = symbol_make("tbox")
implement
TYPE_symbol = symbol_make("type")
implement
VTBOX_symbol = symbol_make("vtbox")
implement
VTYPE_symbol = symbol_make("Vtype")
//
(* ****** ****** *)

implement
STDIN_fp_symbol = symbol_make("__STDIN__")
implement
STRING_fp_symbol = symbol_make("__STRING__")

(* ****** ****** *)

(* end of [xats_symbol.dats] *)
