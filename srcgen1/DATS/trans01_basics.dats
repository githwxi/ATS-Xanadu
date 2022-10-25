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
overload
ptr_diff with ptr0_diff
overload
UN_ptr_get with $UN.ptr0_get
overload
UN_ptr_set with $UN.ptr0_set
(* ****** ****** *)
//
#staload
"./../UTIL/SATS/mylibc0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
//
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)

local

fun
aux1
(rep: string): int =
aux2(10(*bas*), rep)
and
aux2
( bas: int
, rep: string): int =
auxrep
(bas, string2ptr(rep), 0)
and
auxrep
( b0: int
, p0: ptr
, r0: int): int =
let
val c0 =
UN_ptr_get<char>(p0)
in(* in-of-let *)
//
if
isdigit(c0)
then
(
  auxrep(b0, p0, r0)
) where
{
val p0 = ptr_succ<char>(p0)
val r0 = b0 * r0 + (c0 - '0')
}
else (r0) //else//end-of(if)
//
end (*let*) // end of [auxrep]

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

implement
token2sbtf(tok) =
(
case-
tok.node() of
|
T_IDENT_alp(rep) =>
(
ifval
(c0 = 't', true, false)
) where
{
val p0 = string2ptr(rep)
val c0 = UN_ptr_get<char>(p0)
}
) (* end of [token2sbtf] *)

implement
token2dbtf(tok) = token2sbtf(tok)

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
|
T_CHAR_nil(rep) =>
(
  int2char0(0)
)
|
T_CHAR_char(rep) =>
(
  xatsopt_chrunq(rep)
)
|
T_CHAR_slash(rep) =>
(
  xatsopt_chrunq(rep)
)
) (* end of [token2schr] *)

implement
token2dchr(tok) = token2schr(tok)

end // end of [local]

(* ****** ****** *)
//
implement
token2sflt(tok) =
(
//
case-
tok.node() of
|
T_FLT1(rep) =>
(g0string2float(rep))
//
) (* end of [token2sflt] *)
//
implement
token2dflt(tok) = token2sflt(tok)
//
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
tok.node() of
|
T_STRING_closed
  (rep) => xatsopt_strunq(rep)
)

implement
token2dstr(tok) = token2sstr(tok)

end // end of [local]

(* ****** ****** *)

implement
sortid_sym(tok) =
(
case-
tok.node() of
//
(*
| T_IDENT(nm) => $SYM.symbol_make(nm)
*)
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
(*
| T_IDENT(nm) => $SYM.symbol_make(nm)
*)
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
(*
| T_IDENT(nm) => $SYM.symbol_make(nm)
*)
//
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
| T_IDENT(nm) => $SYM.symbol_make(nm)
//
| T_OP_sym(nm) => $SYM.symbol_make(nm)
//
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
| T_IDENT(nm) => $SYM.symbol_make(nm)
//
| T_OP_sym(nm) => $SYM.symbol_make(nm)
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_srp(nm) => $SYM.symbol_make(nm)
| T_IDENT_dlr(nm) => $SYM.symbol_make(nm)
//
) (* end of [dexpid_sym] *)

(* ****** ****** *)
//
(*
HX-2020-11-21:
Just for removing
each occurrence of
backslash followed by a newline.
This implementation is very messy.
And it may need to be re-implemented.
*)
//
implement
strnormize(cs) = let
//
vtypedef
charlst = List0_vt(char)
//
(*
HX:
isnm: is normal
*)
//
fun
isnm
(p0: ptr): bool =
let
val c0 =
UN_ptr_get<char>(p0)
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
  UN_ptr_get<char>(p0)
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
  val c0 = UN_ptr_get<char>(p0)
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
UN_ptr_get<char>(p0)
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
//
let
val p0 = string2ptr(cs)
in
if
isnm(p0) then cs else norm(cs)
end
//
end // end of [string_normlize]

(* ****** ****** *)
//
(*
HX-2020-11-21:
Just for replacing each
DEFINED name with its definition.
This implementation is very messy.
And it may need to be re-implemented.
*)
//
(*
fun
strevalize(src: string): string
*)
//
(* ****** ****** *)
//
static
fun
trans01_xnam
( key
: string)
: Option_vt(string)
//
(* ****** ****** *)

local

(* ****** ****** *)
#define CNUL '\000'
(* ****** ****** *)
//
datavtype seg =
| SEGsub of
  ( ptr(*p0*)
  , ptr(*p1*))
| SEGdef of
  ( ptr(*p0*)
  , ptr(*p1*), string)
//
where
seglst = List0_vt(seg)
//
(* ****** ****** *)
fun
sublen
( p0: ptr
, p1: ptr): int =
(
g0int2int_ssize_int
(ptr_diff<char>(p1, p0))
)
(* ****** ****** *)
fun
substr
( p0: ptr
, p1: ptr): string =
let
//
fun
loop
( q0: ptr
, p0: ptr
, ln: int): void =
if
(ln <= 0)
then
UN_ptr_set<char>
( q0, CNUL (* 0 *) )
else
loop(q1, p1, ln) where
{
val c0 =
$UN.ptr0_get<char>(p0)
val () =
$UN.ptr0_set<char>(q0, c0)
val ln = ln - 1
val p1 = ptr_succ<char>(p0)
val q1 = ptr_succ<char>(q0)
} (*where*) // end of [loop]
//
val ln =
sublen(p0, p1)
val ln =
$UN.cast{Nat}(ln)
val
( pfat
, pfgc
| qbeg) =
  malloc_gc(i2sz(ln+1))
(*
(*
val () =
$UN.ptr0_set_at<char>
( qbeg, ln, CNUL(*0*) )
*)
*)
//
val q0 = qbeg
val () = loop(q0, p0, ln)
//
in
$UN.castvwtp0
{string}((pfat, pfgc | qbeg))  
end (*let*) // end of [substr]
(* ****** ****** *)
fun
idfstq
(c: char): bool =
(
ifcase
| isalpha(c) => true
| ( c = '_' ) => true
| _ (*rest-of-char*) => false
) (* end of [idfstq] *)
(* ****** ****** *)
fun
idrstq
(c: char): bool =
(
ifcase
| isalnum(c) => true
| ( c = '_' ) => true
| ( c = '$' ) => true
//
// HX: ML-style
//
| ( c = '\'' ) => true
//
| _ (*rest-of-char*) => false
) (* end of [idrstq] *)
(* ****** ****** *)
//
fun
seglen
(x0: !seg): int =
(
case+ x0 of
| SEGsub(p0, p1) =>
  sublen(p0, p1)
| SEGdef
  (p0, p0, cs) =>
  sz2i(string_length(cs))
)
//
fun
seglstlen
(xs: !seglst): int =
(
case+ xs of
|
list_vt_nil() => 0
|
list_vt_cons(x0, xs) =>
(
  seglen(x0)+seglstlen(xs)
)
) (* end of [seglstlen] *)
//
(* ****** ****** *)

fun
auxstrize
( q0: ptr
, xs: seglst): void =
let

(* ****** ****** *)

fun
auxseg
( q0: ptr
, x0: seg): ptr =
(
case+ x0 of
| ~
SEGsub
(p0, p1) =>
let
val n0 =
sublen(p0, p1)
in
  auxsub(q0, p0, n0)
end // end of [SEGsub]
| ~
SEGdef
( p0, p1, cs ) =>
auxdef(q0, string2ptr(cs))
)

(* ****** ****** *)

and
auxsub
( q0: ptr
, p0: ptr
, n0: int): ptr =
if
(n0 <= 0)
then q0 else
(
auxsub(q1, p1, n1) where
{
val c0 =
$UN.ptr0_get<char>(p0)
val () =
$UN.ptr0_set<char>(q0, c0)
val n1 = n0 - 1
val p1 = ptr_succ<char>(p0)
val q1 = ptr_succ<char>(q0)
}
) (* let *) // end of [auxsub]

(* ****** ****** *)

and
auxdef
( q0: ptr
, p0: ptr): ptr =
let
val c0 =
$UN.ptr0_get<char>(p0)
in(*in-of-let*)
//
if
iseqz(c0)
then q0 else
(
auxdef(q1, p1) where
{
val () =
$UN.ptr0_set<char>(q0, c0)
val p1 = ptr_succ<char>(p0)
val q1 = ptr_succ<char>(q0)
}
) (* end of [else] *)
end (*let*) // end of [auxdef]

(* ****** ****** *)

in
//
case+ xs of
| ~
list_vt_nil() =>
{
val () =
$UN.ptr0_set<char>
( q0, CNUL (* 0 *) )
}
| ~
list_vt_cons(x0, xs) =>
(
  auxstrize(q1, xs)) where
{
  val q1 = auxseg( q0, x0 )
}
end (*let*) // end of [auxstrize]

(* ****** ****** *)

fun
auxsegize
( p0: ptr
, rs: seglst): seglst =
let
//
val c0 =
$UN.ptr0_get<char>(p0)
//
in(*in-of-let*)
//
ifcase
|
iseqz(c0) =>
list_vt_reverse(rs)
|
_(*else*) =>
(
ifcase
|
(c0 = '$') => auxname(p0, rs)
|
_(* else *) => auxnone(p0, p0, rs)
) where
{

(* ****** ****** *)

fun
subeval
( k0: int
, p0: ptr
, p1: ptr)
: Option_vt(string) =
let
val pa =
(
ifcase
|
k0 = 1 =>
ptr_add<char>( p0, 2 )
|
k0 = 2 =>
ptr_add<char>( p0, 2 )
|
_(*k0=0*) =>
ptr_add<char>( p0, 1 )
) : ptr // end-of-val]
in
trans01_xnam(substr(pa, p1))
end (*let*) // end of [subeval]

(* ****** ****** *)

fun
auxname
( p0: ptr
, rs: seglst): seglst =
let
val p1 =
ptr_succ<char>(p0)
val c1 =
$UN.ptr0_get<char>(p1)
in(*in-of-let*)
(
ifcase
//
|
idfstq(c1) =>
auxid0(p0, p2, rs) where
{
val p2 = ptr0_succ<char>(p1)
}
//
|
(c1 = '\(') =>
auxid1(p0, p2, rs) where
{
val p2 = ptr0_succ<char>(p1)
}
//
|
(c1 = '\{') =>
auxid2(p0, p2, rs) where
{
val p2 = ptr0_succ<char>(p1)
}
//
|
_(* else *) => auxnone(p0, p1, rs)
) where
{

(* ****** ****** *)

fun
auxid0
( p0: ptr
, p1: ptr
, rs: seglst): seglst =
(
  auxidx(0, p0, p1, rs)
)
and
auxid1
( p0: ptr
, p1: ptr
, rs: seglst): seglst =
(
  auxidx(1, p0, p1, rs)
)
and
auxid2
( p0: ptr
, p1: ptr
, rs: seglst): seglst =
(
  auxidx(2, p0, p1, rs)
)
and
auxidx
( k0: int
, p0: ptr
, p1: ptr
, rs: seglst): seglst =
let
val c1 =
$UN.ptr0_get<char>(p1)
in
ifcase
|
idrstq(c1) =>
auxidx
(k0, p0, p2, rs) where
{
val p2 = ptr0_succ<char>(p1)
}
|
_(* else *) =>
let
//
val p2 =
(
ifcase
|
k0 = 1 =>
(
if
(c1 != ')')
then p1 else
ptr0_succ<char>(p1)
)
|
k0 = 2 =>
(
if
(c1 != '}')
then p1 else
ptr0_succ<char>(p1)
)
| _ (*k0=0*) => p1): ptr
//
val
opt = subeval(k0, p0, p1)
//
in(*in-of-let*)
//
case+ opt of
| ~
None_vt() =>
auxsegize(p2, rs) where
{
val r0 = SEGsub(p0, p2)
val rs = list_vt_cons(r0, rs)
}
| ~
Some_vt(def) =>
auxsegize(p2, rs) where
{
val r0 = SEGdef(p0, p2, def)
val rs = list_vt_cons(r0, rs)
}
end
end // end of [auxid0]
}
//
end (*let*) // end of [auxname]

(* ****** ****** *)

and
auxnone
( p0: ptr
, p1: ptr
, rs: seglst): seglst =
let
//
val c1 =
$UN.ptr0_get<char>(p1)
//
in(*in-of-let*)
//
ifcase
|
iseqz(c1) =>
(
auxsegize(p1, rs) where
{
  val r0 =
  SEGsub(p0, p1)
  val rs =
  list_vt_cons( r0, rs )
}
)
|
(c1 = '$') =>
(
auxsegize(p1, rs) where
{
  val r0 =
  SEGsub(p0, p1)
  val rs =
  list_vt_cons( r0, rs )
}
)
//
|
_(* else *) =>
(
  auxnone(p0, p2, rs)) where
{
  val p2 = ptr0_succ<char>(p1)
}
end (*let*) // end of [auxnone]

(* ****** ****** *)

} (*where*) // end of [ ifcase ]
//
end (*let*) // end of [auxsegize]

(* ****** ****** *)

fun
auxevalize
(src: string): string =
let
val xs =
auxsegize(p0, rs) where
{
val p0 = string2ptr(src)
val rs = list_vt_nil(*void*)
}
//
val ln = seglstlen(xs)
val ln = $UN.cast{Nat}(ln)
//
(*
val () =
println!
("trans01: auxevalize: ln = ", ln)
*)
//
val
( pfat
, pfgc
| qbeg ) = malloc_gc(i2sz(ln+1))
//
(*
val () =
$UN.ptr0_set_at<char>(qbeg, ln, CNUL)
*)
//
in
let
val q0 = qbeg
val () = auxstrize(q0, xs)
in
$UN.castvwtp0{string}((pfat,pfgc|qbeg))
end
end (*let*) // end of [auxevalize]

(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

implement
strevalize
  (src) =
(
let
//
val
res =
auxevalize(src)
//
(*
val ( ) =
println!
("trans01: strevalize: res = ", res)
*)
//
in res end where
{
//
(*
val ( ) =
println!
("trans01: strevalize: src = ", src)
*)
//
} (*where*) ) // end of [strevalize]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxsrch0
( key
: string)
: Option_vt(string) =
let
val
sym = symbol_make(key)
val
opt =
the_xnamenv_search(sym)
in
//
case+ opt of
| ~
None_vt() => auxsrch1(key)
| ~
Some_vt(g1e) =>
(
case+
g1e.node() of
| G1Estr(def) =>
  Some_vt(token2sstr(def))
//
| G1Enone0() => auxsrch1(key)
//
|
_(*non-G1Estr*) => 
  Some_vt("**(NON-STRING)**")
)
//
end (*let*) // end of [auxsrch0]

(* ****** ****** *)

and
auxsrch1
( key
: string)
: Option_vt(string) =
let
val
def =
xatsopt_getenv_gc(key)
in
//
if
isneqz(def)
then
Some_vt(strptr2string(def))
else let
prval () =
strptr_free_null(def) in None_vt()
end (*let*) // end of [else]
//
end (*let*) // end of [auxsrch1]

(* ****** ****** *)

in(* in-of-local *)

implement
trans01_xnam
  (key) = let
//
val
key = g1ofg0(key)
//
in
if
iseqz(key)
then Some_vt("$")
else auxsrch0(key) end where
{
(*
  val () =
  println!
  ("trans01_xnam: key = ", key)
*)
} (*where*) // end of [trans01_xnam]

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_basics.dats] *)
