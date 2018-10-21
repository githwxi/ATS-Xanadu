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
    let val () = symbol_insert(sym) in sym end
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
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 1024
val
theHashtbl = 
hashtbl_make_nil(i2sz(theCap))
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
symbol_ADD = symbol_make("+")
implement
symbol_SUB = symbol_make("-")
implement
symbol_MUL = symbol_make("*")
implement
symbol_DIV = symbol_make("/")

(* ****** ****** *)

implement
symbol_LT = symbol_make("<")
implement
symbol_GT = symbol_make(">")
implement
symbol_LTEQ = symbol_make("<=")
implement
symbol_GTEQ = symbol_make(">=")

(* ****** ****** *)

implement
symbol_EQ = symbol_make("=")
implement
symbol_EQEQ = symbol_make("==")
implement
symbol_LTGT = symbol_make("<>")
implement
symbol_BANGEQ = symbol_make("!=")

(* ****** ****** *)

implement
symbol_BACKSLASH = symbol_make("\\")

(* ****** ****** *)

implement
symbol__STDIN__ = symbol_make("__STDIN__")
implement
symbol__STRING__ = symbol_make("__STRING__")

(* ****** ****** *)

(* end of [xats_symbol.dats] *)
