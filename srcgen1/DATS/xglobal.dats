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
// Start Time: July, 2019
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
"./../UTIL/SATS/mylibc0.sats"
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/xsymbol.sats"
//
(* ****** ****** *)

#staload "./../SATS/xglobal.sats"

(* ****** ****** *)
(*
//
// HX-2020-11-20:
// For debugging purpose
//
val () =
println!
("XATSOPT\
: dynloading(xglobal.dats)")
*)
(* ****** ****** *)
//
implement
the_XATSHOME_get() =
let
val
XATSHOME =
xatsopt_getenv_gc("XATSHOME")
in
//
if
isneqz(XATSHOME)
then
strptr2string(XATSHOME)
else let
//
// XATSHOME is undefined!
//
prval () =
strptr_free_null(XATSHOME) in ""
end (*let*) // end of [else]
//
end (* end of [the_XATSHOME_get *)
//
(* ****** ****** *)

extern
fun
fpathenv_new() : fpathenv

(* ****** ****** *)

local

typedef
fpathenv_struct =
@{
fpathenv_level = int
} (* fpathenv_struct *)

absimpl
fpathenv_tbox = ref(fpathenv_struct)

in (*in-of-local*)

(* ****** ****** *)

implement
fpathenv_new() =
ref<fpathenv_struct>
(
@{
  fpathenv_level = 0
}(* @{ *)
) (* end of [fpathenv_new()] *)

(* ****** ****** *)
//
implement
fpathenv_inc_level
  (env) = let
//
val l0 =
(env->fpathenv_level)
//
in
(env->fpathenv_level := l0+1)
end
implement
fpathenv_dec_level
  (env) = let
//
val l0 =
(env->fpathenv_level)
//
in
(env->fpathenv_level := l0+1)
end // end of [fpathenv_dec_level]
//
(* ****** ****** *)
//
implement
fpathenv_get_level
  (env) =
  (env->fpathenv_level)
//
(*
implement
fpathenv_set_level
  (env, level) =
  (env->fpathenv_level := level)
*)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
implement
the_global_level
((*current*)) =
let
val opt =
the_global_fpsrch0()
in
//
case+ opt of
| ~
None_vt() =>
  (~1) //HX:error!
| ~
Some_vt(env) =>
  fpathenv_get_level(env)
//
end // end of [the_global_level]
(* ****** ****** *)
//
implement
the_global_fpsrch0
  ((*current*)) =
(
the_global_fpsrch1
($FP0.the_filpath_get((*void*)))
)
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
typedef key = filpath
typedef itm = fpathenv
//
vtypedef
hashtbl = hashtbl(key, itm)
//
(* ****** ****** *)
//
implement
hash_key<key>(key) =
let
val
sym =
$FP0.filpath_get_full2(key)
in
let
  val
  nam =
  $SYM.symbol_get_name(sym)
in
//
(*
HX-2020-11-20:
For circumventing tailrecopt
*)
gidentity(hash_key<string>(nam))
//
end
end (*let*) // end of [hash_key<key>]

(* ****** ****** *)
//
implement
gequal_val_val<key>
  (key1, key2) = let
//
val sym1 = 
$FP0.filpath_get_full2(key1)
val sym2 = 
$FP0.filpath_get_full2(key2)
//
in
$effmask_all
($SYM.eq_symbol_symbol(sym1, sym2))
end // en dof [gequal_val_val<key>]
//
(* ****** ****** *)
abstbox fpenvtbl = ptr
(* ****** ****** *)
val
the_global_fpenvtbl =
let
val mycap = i2sz(1*1024)
in
(
$UN.castvwtp0{fpenvtbl}(mytbl)
) where
{
val
mytbl =
hashtbl_make_nil<key,itm>(mycap)
(*
val () =
println!
( "the_global_fpenvtbl: created!" )
*)
} (*where*) // end of [mytbl]
end // end of [the_global_fpenvtbl]
(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

implement
the_global_fpiadd1
  (key) = let
//
  val
  mytbl =
  $UN.castvwtp0
  {hashtbl}
  (the_global_fpenvtbl)
//
  val env =
  fpathenv_new()
  val opt =
  hashtbl_insert_opt
  ( mytbl, key, env )
  val () =
  (
    case- opt of ~None_vt() => ()
  ) : void // end of [val]
//
in
let
prval() = $UN.cast2void(mytbl) in ()
end
end where
{ overload
  print with $FP0.print_filpath_full2
(*
  val () =
  println!
  ( "the_global_fpiadd1: key = ", key )
*)
} (*where*) // end of [the_global_fpiadd1]

(* ****** ****** *)

implement
the_global_fpsrch1
  (key) = let
//
  val
  mytbl =
  $UN.castvwtp0
  {hashtbl}
  (the_global_fpenvtbl)
//
  val opt =
  hashtbl_search_opt(mytbl, key)
//
in
let
prval() = $UN.cast2void(mytbl) in opt
end
end where
{ overload
  print with $FP0.print_filpath_full2
(*
  val () =
  println!
  ( "the_global_fpsrch1: key = ", key )
*)
} (*where*) // end of [the_global_fpsrch1]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_xglobal.dats] *)
