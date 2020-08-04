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
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = symbol
vtypedef dynarray = dynarray(itm)
//
val
theCap = 4*1024
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(theCap))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

static
fun
stamp_symbol(symbol): void

implement
stamp_symbol
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
end // end of [stamp_symbol]

(* ****** ****** *)

implement
symbol_of_stamp
  (stamp) = let
  val i0 = u2sz(g1ofg0(stamp))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
in
  if
  isneqz(cp)
  then Some_vt($UN.p2tr_get(cp)) else None_vt()
end // end of [symbol_of_stamp]

end // end of [local]

(* ****** ****** *)

extern
fun
symbol_insert
(sym: symbol): void
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

(* ****** ****** *)

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
      val () = stamp_symbol(sym)
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
symbol_is_nil
  (sym) = (sym = symbol_nil)
implement
symbol_isnot_nil
  (sym) = (sym != symbol_nil)
//
(* ****** ****** *)

local
//
#staload
"libats/SATS/hashfun.sats"
#staload
"libats/SATS/hashtbl_chain.sats"
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
theCap = 4*1024
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in of local *)

(* ****** ****** *)

implement
hash_key<key>(key) =
string_hash_multiplier
(31UL, 618033989UL(*seed*), key)

(* ****** ****** *)

implement
symbol_search
  (key, res) = let
//
val tbl =
  $UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
  hashtbl_search<key,itm>(tbl, key, res)
//
in
let prval () = $UN.cast2void(tbl) in ans end
end // end of [symbol_search]

(* ****** ****** *)

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

end // end of [local]

(* ****** ****** *)
//
implement
print_symbol
  (sym) =
fprint_symbol(stdout_ref, sym)
implement
prerr_symbol
  (sym) =
fprint_symbol(stderr_ref, sym)
//
implement
fprint_symbol
  (out, x0) = fprint!(out, x0.name())
(*
implement
fprint_symbol
  (out, x0) =
(
  fprint!
  (out, x0.name(), "(", x0.stamp(), ")")
)
*)
//
(* ****** ****** *)

implement
symbol_nil = symbol_make("")

(* ****** ****** *)
//
implement
AMP_symbol = symbol_make("&")
implement
BAR_symbol = symbol_make("|")
implement
CLN_symbol = symbol_make(":")
implement
DOT_symbol = symbol_make(".")
//
implement
SMCLN_symbol = symbol_make(";")
//
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
//
(*
implement
CLNEQ_symbol = symbol_make(":=")
*)
implement
BANGEQ_symbol = symbol_make("!=")
//
(* ****** ****** *)
//
implement
CBV0_symbol = symbol_make("!")
implement
CBV1_symbol = symbol_make("~")
implement
CBRF_symbol = symbol_make("&")
implement
AXCG_symbol = symbol_make(">>")
//
(* ****** ****** *)
//
implement
EQLT_symbol = symbol_make("=<")
implement
EQGT_symbol = symbol_make("=>")
//
(* ****** ****** *)
//
implement
MSLT_symbol = symbol_make("-<")
implement
MSGT_symbol = symbol_make("->")
//
(* ****** ****** *)
//
implement
DOTLT_symbol = symbol_make(".<")
implement
GTDOT_symbol = symbol_make(">.")
//
(* ****** ****** *)
//
implement
WCARD_symbol = symbol_make("_")
//
implement
QMARK_symbol = symbol_make("?")
//
(*
HX-2020-06-09:
it was QBANG: ?!
*)
implement
QMNEG_symbol = symbol_make("~")
//
(* ****** ****** *)

implement
LPAREN_symbol = symbol_make("(")
implement
RPAREN_symbol = symbol_make(")")

implement
LBRACK_symbol = symbol_make("[")
implement
RBRACK_symbol = symbol_make("]")

implement
LBRACE_symbol = symbol_make("{")
implement
RBRACE_symbol = symbol_make("}")

(* ****** ****** *)
//
implement
BSLASH_symbol = symbol_make("\\")
//
(* ****** ****** *)

implement
LRBRACK_symbol = symbol_make("[]")

(* ****** ****** *)
//
implement
INT_symbol = symbol_make("int")
//
implement
ADDR_symbol = symbol_make("addr")
implement
BOOL_symbol = symbol_make("bool")
implement
CHAR_symbol = symbol_make("char")
implement
CFLT_symbol = symbol_make("cflt")
implement
CSTR_symbol = symbol_make("cstr")
//
implement
REAL_symbol = symbol_make("real")
//
(*
implement
XFLT_symbol = symbol_make("xflt")
implement
XSTR_symbol = symbol_make("xstr")
*)
//
(* ****** ****** *)

implement
TRUE_symbol = symbol_make("true")
implement
FALSE_symbol = symbol_make("false")

(* ****** ****** *)
//
implement
PROP_symbol = symbol_make("prop")
implement
VIEW_symbol = symbol_make("view")
//
implement
TBOX_symbol = symbol_make("tbox")
(*
implement
TFLT_symbol = symbol_make("tflt")
*)
implement
TYPE_symbol = symbol_make("type")
//
implement
VTBX_symbol = symbol_make("vtbx")
implement
VWTP_symbol = symbol_make("vwtp")
(*
implement
VTBOX_symbol = symbol_make("vtbox")
implement
VTFLT_symbol = symbol_make("vtflt")
implement
VTYPE_symbol = symbol_make("vtype")
*)
//
(* ****** ****** *)

implement
LIN_symbol = symbol_make("lin")
(*
implement
LINEAR_symbol = symbol_make("linear")
*)

(* ****** ****** *)
//
implement
CLO_symbol = symbol_make("clo")
implement
FNP_symbol = symbol_make("fnp")
implement
CFP_symbol = symbol_make("cfp")
implement
CFR_symbol = symbol_make("cfr")
implement
LCFP_symbol = symbol_make("lcfp")
//
(*
implement
CFLT_symbol = symbol_make("cflt")
implement
FPTR_symbol = symbol_make("fptr")
implement
CPTR_symbol = symbol_make("cptr")
implement
CREF_symbol = symbol_make("cref")
*)
(*
implement
CLOFLT_symbol = symbol_make("cloflt")
implement
FUNPTR_symbol = symbol_make("funptr")
implement
CLOPTR_symbol = symbol_make("cloptr")
implement
CLOREF_symbol = symbol_make("cloref")
*)
//
(* ****** ****** *)

implement
DLR_EXTYPE_symbol = symbol_make("$extype")

(* ****** ****** *)

implement
STDIN_fp_symbol = symbol_make("__STDIN__")
implement
STRING_fp_symbol = symbol_make("__STRING__")

(* ****** ****** *)

(* end of [xats_symbol.dats] *)
