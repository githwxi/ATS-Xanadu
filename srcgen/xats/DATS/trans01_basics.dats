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
#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)

local

fun
aux1
(rep: string): int =
auxmain
(10, string2ptr(rep), 0)
and
aux2
( bas: int
, rep: string): int =
auxmain
(bas, string2ptr(rep), 0)
and
auxmain
( b0: int
, p0: ptr
, r0: int): int =
(
let
val c0 =
$UN.ptr0_get<char>(p0)
in(* in-of-let *)
//
if
isdigit(c0)
then
(
  auxmain(b0, p0, r0)
) where
{
  val p0 = ptr_succ<char>(p0)
  val r0 = b0 * r0 + (c0 - '0')
}
else (r0) // end of [if]
//
end
) (* end of [auxmain] *)

in (* in-of-local *)

implement
token2sint(tok) =
(
case-
tok.node() of
//
| T_INT1(rep) => aux1(rep)
| T_INT2(bas, rep) => aux2(bas, rep)
| T_INT3(bas, rep, _) => aux2(bas, rep)
//
) (* end of [token2sint] *)

implement
token2dint(tok) =
(
case-
tok.node() of
//
| T_INT1(rep) => aux1(rep)
| T_INT2(bas, rep) => aux2(bas, rep)
| T_INT3(bas, rep, _) => aux2(bas, rep)
//
) (* end of [token2dint] *)

end // end of [local]

(* ****** ****** *)

local

(*
T_CHAR_nil of (string) // ''
T_CHAR_char of (string) // '?'
T_CHAR_slash of (string) // '\...'
*)

in (* in-of-local *)

implement
token2schr(tok) =
(
case-
tok.node() of
| T_CHAR_nil(rep) =>
  (
    int2char0(0)
  )
| T_CHAR_char(rep) =>
  (
    $UN.ptr0_get_at<char>(string2ptr(rep), 1)
  )
| T_CHAR_slash(rep) =>
  let
    val p0 =
      string2ptr(rep)
    val p2 =
      ptr_add<char>(p0, 2)
    val c2 =
      $UN.ptr0_get<char>(p2)
  in
    if
    isdigit(c2)
    then
    (
      loop(c2 - '0', p2)
    ) where
    {
//
// HX-2018-12-23:
// char-code is octal
// for instance, '\177' is 127
// for instance, '\377' is 255
//
      val
      BASE = 8
      fun
      loop
      ( i2: int
      , p2: ptr): char =
      let
        val p2 =
          ptr_succ<char>(p2)
        val c2 =
          $UN.ptr0_get<char>(p2)
      in
        if
        isdigit(c2)
        then
        loop(i2*BASE+(c2-'0'), p2)
        else int2char0(i2)
      end // end of [let]
    } else (c2) // end of [if]
  end // end of [let]
) (* end of [token2schr] *)

implement
token2dchr(tok) =
(
case-
tok.node() of
| T_CHAR_nil(rep) => int2char0(0)
| T_CHAR_char(rep) =>
  $UN.ptr0_get_at<char>(string2ptr(rep), 1)
| T_CHAR_slash(rep) => int2char0(0)
)

end // end of [local]

(* ****** ****** *)

local

(*
//
// utf-8 // for text
//
| T_STRING_quote of (string)
*)

in (* in-of-local *)

implement
token2sstr(tok) =
(
case-
tok.node() of T_STRING_closed(rep) => rep
)

implement
token2dstr(tok) =
(
case-
tok.node() of T_STRING_closed(rep) => rep
)

end // end of [local]

(* ****** ****** *)

implement
sortid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [sortid_sym] *)

(* ****** ****** *)

implement
gexpid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [gexpid_sym] *)

(* ****** ****** *)

implement
sargid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
//
) (* end of [sargid_sym] *)

(* ****** ****** *)

implement
sexpid_sym(tok) = let
//
(*
val () =
println!
("sexpid_sym: tok = ", tok)
*)
//
in
//
case-
tok.node() of
//
| T_OP_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
end (* end of [sexpid_sym] *)

(* ****** ****** *)

implement
dexpid_sym(tok) =
(
case-
tok.node() of
//
| T_OP_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_srp(nm) => $SYM.symbol_make(nm)
| T_IDENT_dlr(nm) => $SYM.symbol_make(nm)
//
) (* end of [dexpid_sym] *)

(* ****** ****** *)

implement
strnormize(cs) = let
//
vtypedef
charlst = List0_vt(char)
//
fun
isnm
(p0: ptr): bool =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
if
iseqz(c0)
then true
else
(
ifcase
| c0 = '\\' =>
  let
  val p0 =
  ptr_succ<char>(p0)
  val c1 =
  $UN.ptr0_get<char>(p0)
  in
    if
    (
    c1 = '\n'
    )
    then false
    else
    (
    if
    iseqz(c1)
    then true
    else isnm(ptr_succ<char>(p0))
    )
  end
| _ (* else *) => isnm(ptr_succ<char>(p0))
)
end
//
fun
norm
(
cs: string
) : string =
(
strnptr2string
(
string_make_rlist_vt
(
$UN.castvwtp0
{List0_vt(charNZ)}
(loop1(p0, list_vt_nil()))
)
)
) where
{
//
val p0 = string2ptr(cs)
//
fnx
loop1
( p0: ptr
, r0: charlst): charlst =
let
  val c0 = $UN.ptr0_get<char>(p0)
in
if
iseqz(c0)
then (r0)
else
loop2(ptr_succ<char>(p0), c0, r0)
end
and
loop2
( p0: ptr
, c0: char
, r0: charlst): charlst =
(
if
(c0 = '\\')
then
let
val c1 =
$UN.ptr0_get<char>(p0)
in
if
iseqz(c1)
then list_vt_cons(c0, r0)
else
(
  if
  (c1 = '\n')
  then
  (
  loop1(ptr_succ<char>(p0), r0)
  )
  else
  let
  val r0 = list_vt_cons(c0, r0)
  val r0 = list_vt_cons(c1, r0)
  in
  loop1(ptr_succ<char>(p0), r0)
  end
) (* end of [else] *)
end // end of [then]
else
(
  loop1(p0, list_vt_cons(c0, r0))
) (* end of [else] *)
)
} (* end of [norm] *)
//
in
(
if isnm(string2ptr(cs)) then cs else norm(cs)
)
end // end of [string_normlize]

(* ****** ****** *)

(* end of [xats_trans01_basics.dats] *)
