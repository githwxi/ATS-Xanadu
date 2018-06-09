(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)
//
extern
fun
kword_insert
(name: string, kwd: kword): void
//
(* ****** ****** *)

local
//
#staload
"libats/SATS/hashtbl_linprb.sats"
//
#staload
_(*anon*) = "libats/DATS/hashfun.dats"
#staload
_(*anon*) = "libats/DATS/hashtbl_linprb.dats"
//
typedef key = string and itm = kword
vtypedef hashtbl = hashtbl(key, itm)
//
val
theCap = 229
val
theHashtbl = 
hashtbl_make_nil<key,itm>(i2sz(theCap))
val
theHashtbl = $UN.castvwtp0{ptr}(theHashtbl)
//
in (* in-of-local *)

implement
kword_search(name) = let
//
var res: itm?
//
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_search<key,itm>(tbl, name, res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  if (ans)
  then opt_unsome_get(res)
  else let
    prval () = opt_unnone(res) in symbol_nil
  end // end of [else]
end // end of [kword_search]

(* ****** ****** *)

implement
kword_insert
(name, node) = let
//
var res: itm?
val tbl =
$UN.castvwtp0{hashtbl}(theHashtbl)
val ans =
hashtbl_insert<key,itm>(tbl, name, node, res)
//
val ((*void*)) = assertloc(ans = false)
//
prval ((*void*)) = opt_clear(res)
prval ((*void*)) = $UN.cast2void(tbl)
//
in
  // nothing
end // end of [kword_insert]

end // end of [local]

(* ****** ****** *)

val () =
kword_initize() where
{
//
fun
myins
(kwd: string): void =
{
val () =
kword_insert
(kwd, symbol_make(kwd))
}
//
fun
kword_initize(): void =
{
//
val () = myins("as")
val () = myins("of")
//
val () = myins("abstype")
val () = myins("absvtype")
//
val () = myins("abstbox")
val () = myins("abstflat")
//
val () = myins("absvtbox")
val () = myins("absvtflat")
//
val () = myins("dataprop")
val () = myins("dataview")
val () = myins("datatype")
val () = myins("datavtype")
//
val () = myins("fn")
val () = myins("fn0")
val () = myins("fn1")
val () = myins("fun")
val () = myins("fnx")
//
val () = myins("prfn")
val () = myins("prfn0")
val () = myins("prfn1")
val () = myins("prfun")
//
val () = myins("lam")
val () = myins("fix")
//
val () = myins("if")
val () = myins("sif")
val () = myins("then")
val () = myins("else")
val () = myins("case")
val () = myins("scase")
val () = myins("ifcase")
//
val () = myins("macdef")
val () = myins("macrodef")
//
val () = myins("sexpdef")
val () = myins("typedef")
val () = myins("vtypedef")
//
val () = myins("with")
//
val () = myins("withtype")
val () = myins("withprop")
val () = myins("withview")
val () = myins("withvtype")
//
val () = myins("$tup")
val () = myins("$tup_t")
val () = myins("$tup_vt")
val () = myins("$rec")
val () = myins("$rec_t")
val () = myins("$rec_vt")
//
val () = myins("$list")
val () = myins("$list_t")
val () = myins("$list_vt")
//
val () = myins("$raise")
//
val () = myins("$delay")
val () = myins("$delay_t")
val () = myins("$delay_vt")
//
val () = myins("#if")
val () = myins("#ifdef")
val () = myins("#ifundef")
//
val () = myins("#define")
//
val () = myins("#include")
//
val () = myins("#staload")
val () = myins("#dynload")
//
} (* end of [kword_initize] *)
//
} (* end of [kword_initize()] *)

(* ****** ****** *)

(* end of [xats_lexing_kword.dats] *)
