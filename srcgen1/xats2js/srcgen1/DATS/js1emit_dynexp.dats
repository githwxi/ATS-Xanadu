(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
HX: Implementation in ATS2
Sun Nov 12 12:16:50 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
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
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload $LEX(* open *)
(* ****** ****** *)
#staload $S1E(* open *)
#staload $S2E(* open *)
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
overload
fprint with $TMP.fprint_stamp
overload
fprint with $SYM.fprint_symbol
overload
fprint with $LOC.fprint_location
(* ****** ****** *)
overload
fprint
with $FP0.fprint_filpath_full2
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
#staload "./../SATS/js1emit.sats"
(* ****** ****** *)
(* ****** ****** *)
implement
fprint_val<l1tmp> =
fprint_l1tmp(*out,ltmp*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
chrunq
( rep
: string): char =
xatsopt_chrunq(rep) where
{
extern
fun
xatsopt_chrunq
( rep
: string
) : char = "ext#xatsopt_chrunq"
}
fun
strunq
( rep
: string): char =
xatsopt_strunq(rep) where
{
extern
fun
xatsopt_strunq
( rep
: string
) : char = "ext#xatsopt_strunq"
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprint_xstamp
(out: FILEref): void =
(
  loop(0, time) ) where
{
val time =
$GLO.the_XATSTIME_get()
//
fun
loop
( i0: int
, time: int): void =
if i0 < 6 then
(
loop
(i0+1, time/10)) where
{ val () =
  fprint(out, time%10) } }
// end of [fprint_xstamp(out)]
//
(* ****** ****** *)
(* ****** ****** *)
//
implement
js1emit_int00
  (out, int) =
(
  fprint(out, int) )
implement
js1emit_btf00
  (out, btf) =
(
  fprint(out, btf) )
//
(* ****** ****** *)
//
implement
js1emit_txt00
  (out, txt) =
(
  fprint(out, txt) )
implement
js1emit_txtln
  (out, txt) =
  fprint!(out, txt, '\n')
//
(* ****** ****** *)
//
implement
js1emit_newln
  ( out ) =
(
  fprint_char(out, '\n') )
//
(* ****** ****** *)
//
implement
js1emit_blnk1
  ( out ) =
(
  fprint_char( out, ' ' ) )
//
(* ****** ****** *)

implement
js1emit_nblnk
( out, n0) =
( loop(n0) ) where
{
fun
loop(n0: int): void =
if n0 > 0
then
loop(n0-1) where
{
val () = js1emit_blnk1(out)
}
} (* end of [js1emit_nblnk] *)

(* ****** ****** *)

implement
js1emit_indnt
(out, nind) =
(
  loop(nind)) where
{
fun
loop(n0: int): void =
if n0 > 0
then
loop(n0-1) where
{
val () = js1emit_blnk1(out)
}
} (* end of [js1emit_indnt] *)

(* ****** ****** *)
implement
js1emit_h0var
(out, hdv) =
fprint(out, hdv.sym())
(* ****** ****** *)
implement
js1emit_h0con
(out, hdc) =
let
val
tag = hdc.ctag()
in
if
(tag > 0)
// tag >= 0
// HX: tag starts from 1
then
fprint(out, tag)
else
fprint(out, hdc.sym())
end // end of [js1emit_h0con]
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxnone
( out
: FILEref
, hdc: h0cst): void =
{
//
val
sym = hdc.sym()
val
loc = hdc.loc()
//
val () =
fprint(out, sym)
//
val () =
(
case+
hdc.tqas() of
|
list_nil() => ()
|
list_cons _ =>
{
val () =
fprint(out, "_")
val () =
fprint_xstamp(out) }
)
//
val () =
let
val
ntot = loc.beg_ntot()
in//let
fprint!(out, "_", ntot, "_")
end // end of [let]
//
} (* end of [auxnone] *)

(* ****** ****** *)

fun
auxsome
( out
: FILEref
, gnm: g1nam
, hdc: h0cst): void =
(
case+ gnm of
| G1Nnil() =>
  auxsome_nil(out, hdc, gnm)
| G1Nid0(id0) =>
  auxsome_id0(out, hdc, gnm)
| G1Nnone0() =>
  auxsome_none(out, hdc, gnm)
| _(*rest-of-g1nam*) =>
  auxsome_rest(out, hdc, gnm)
)

and
auxsome_nil
( out
: FILEref
, hdc: h0cst
, gnm: g1nam): void =
let
val
sym = hdc.sym()
in
  fprint!(out, sym)
end // end of [auxsome_nil]

and
auxsome_id0
( out
: FILEref
, hdc: h0cst
, gnm: g1nam): void =
let
val-
G1Nid0(sym) = gnm
in
  fprint!(out, sym)
end // end of [auxsome_nil]

and
auxsome_none
( out
: FILEref
, hdc: h0cst
, gnm: g1nam): void =
(
  auxsome_nil(out, hdc, gnm)
)

and
auxsome_rest
( out
: FILEref
, hdc: h0cst
, gnm: g1nam): void =
let
val
sym = hdc.sym()
in
  fprint!
  (out, sym, "_**EXNAME**_")
end // end of [auxsome_rest]

(* ****** ****** *)

in(*in-of-local*)
//
implement
js1emit_h0cst
(out, hdc) =
let
val
xnm = hdc.xnam()
in
//
case+ xnm of
|
X2NAMnone() =>
(
  auxnone(out, hdc)
)
|
X2NAMsome(gnm) =>
(
  auxsome(out, gnm, hdc)
)
//
end // end of [js1emit_h0cst]
//
end // end of [local]

(* ****** ****** *)
//
(*
implement
js1emit_l1cst
(out, l1c) =
{
//
val () =
js1emit_h0cst
(out, l1c.hdc())
//
val () =
fprint!
(out, "_", stmp, "_")
//
} where
{
  val stmp = l1c.stamp()
} (*where*) // [js1emit_l1cst]
*)
//
implement
js1emit_l1cst
(out, l1c) =
let
val
hdc = l1c.h0cst()
in
js1emit_h0cst(out, hdc)
end (*let*) // [js1emit_l1cst]
//
(* ****** ****** *)
implement
js1emit_l1con
(out, l1c) =
(
case+ l1c of
| L1CONcon(hdc) =>
  js1emit_h0con(out, hdc)
| L1CONval(l1v) =>
  js1emit_l1val(out, l1v)
) (* end of [js1emit_l1con] *)
(* ****** ****** *)

implement
js1emit_h0fag
( out
, lev
, hfg, i0) =
(
case+
hfg.node() of
|
H0FAGnpats
(npf1, h0ps) => i1 where
{
val () = js1emit_txt00(out, "(")
val i1 = auxlst(npf1, i0, i0, h0ps)
val () = js1emit_txt00(out, ")")
}
|
H0FAGnone0 _ => i0 where
{
val () = js1emit_txt00(out, "(")
val () = js1emit_txt00(out, ")")
}
|
H0FAGnone1 _ => i0 // skipped
(*
let
val () = fprint(out, "(*ERROR*)") in i0
end
*)
) where
{
//
fun
auxlst
( npf1: int
, i0: int
, i1: int
, h0ps: h0patlst): int =
(
case+ h0ps of
|
list_nil() => i1
|
list_cons
(h0p1, h0ps) =>
if
npf1 > 0
then
let
val npf1 = npf1-1
in
auxlst(npf1, i0, i1, h0ps)
end
else
let
//
val () =
if
(i1 > i0)
then
js1emit_txt00(out, ", ")
//
val i1 = i1 + 1
//
val () =
fprint!
(out, "a", lev, "x", i1)
in
auxlst(npf1, i0, i1, h0ps)
end
) (* end of [auxlst] *)
//
} (* end of [js1emit_h0fag] *)

(* ****** ****** *)

implement
js1emit_h0faglst
( out
, lev
, hfgs, i0) =
(
case+ hfgs of
|
list_nil() => i0
|
list_cons(hfg1, hfgs) =>
let
val i1 =
js1emit_h0fag(out, lev, hfg1, i0)
in
js1emit_h0faglst(out, lev, hfgs, i1)
end
) (* end of [js1emit_h0faglst] *)

(* ****** ****** *)
//
implement
js1emit_lvnam
(out, nam) =
fprint(out, nam)
//
(* ****** ****** *)
//
implement
js1emit_lvtop
(out, tok) =
fprint(out, "XATS2JS_top")
//
(* ****** ****** *)
//
implement
js1emit_lvi00
( out
, int) = fprint(out, int)
//
implement
js1emit_lvb00
( out
, btf) = fprint(out, btf)
//
implement
js1emit_lvc00
( out
, chr) =
(
 fprint(out, chr) ) where
{
  val chr = char2uint0(chr)
} // end of [js1emit_lvc00]
//
(* ****** ****** *)
//
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
$UN.ptr0_get<char>(p0)
in(* in-of-let *)
//
if
isdigit(c0)
then
(
auxrep(b0, p0, r0)) where
{
val p0 = ptr_succ<char>(p0)
val r0 = b0 * r0 + (c0 - '0')
}
else (r0) //else//end-of(if)
//
end (*let*) // end of [auxrep]

in//local

implement
js1emit_lvint
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_INT1
( rep ) =>
fprint(out, rep)
|
T_INT2
(bas, rep) =>
fprint(out, aux2(bas, rep))
|
T_INT3
(bas, rep, _) =>
fprint(out, aux2(bas, rep))
//
end // end of [js1emit_lvint]
//
end (*local*) // end of [local]
//
(* ****** ****** *)
//
implement
js1emit_lvbtf
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_IDENT_alp
( rep ) => fprint(out, rep)
//
end // end of [js1emit_lvbtf]
//
(* ****** ****** *)
//
implement
js1emit_lvchr
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_CHAR_char
( rep ) => // FIXME?
(
fprint!
( out
, "XATS2JS_char(", rep, ")")
)
|
T_CHAR_slash // FIXME?
( rep ) =>
(
fprint!
( out
, "XATS2JS_char(", rep, ")")
)
//
end // end of [js1emit_lvchr(...)]
(* ****** ****** *)
//
implement
js1emit_lvflt
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_FLT1(rep) =>
(
  fprint(out, rep)) // HX: FIXME!!!
//
end // end of [js1emit_lvflt(...)]
//
(* ****** ****** *)
//
implement
js1emit_lvstr
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_STRING_closed
  (rep) =>
  fprint(out, rep) // HX: FIXME!!!
//
end // end of [js1emit_lvstr(...)]
//
(* ****** ****** *)
//
implement
js1emit_l1exn
(out, exn0) =
let
val
stm = exn0.stamp()
in
  fprint!(out, "exn", stm)
end // end of [js1emit_l1exn(...)]
//
(* ****** ****** *)
//
implement
js1emit_l1tmp
(out, tmp0) =
let
val arg = tmp0.arg()
in
//
if
(arg > 0)
then
let
val lev = tmp0.lev()
in
fprint!
(out, "a", lev, "x", arg)
end // end of [then]
else
let
//
val lev = tmp0.lev()
val stm = tmp0.stamp()
//
in//let
//
if
(lev > 0)
then
(
fprint
(out, "xtmp");
fprint(out, stm))
else
(
fprint
(out, "xtop");
fprint(out, stm);
fprint(out, "_"); fprint_xstamp(out))
//
end // end of [else]
//
end // end of [js1emit_l1tmp(...)]
//
(* ****** ****** *)

implement
js1emit_l1val
(out, l1v0) =
(
case+
l1v0.node() of
//
|
L1VALi00(int) =>
js1emit_lvi00(out, int)
|
L1VALb00(btf) =>
js1emit_lvb00(out, btf)
|
L1VALc00(chr) =>
js1emit_lvc00(out, chr)
(*
|
L1VALs00(str) =>
js1emit_lvs00(out, str)
*)
//
|
L1VALint(tok) =>
js1emit_lvint(out, tok)
|
L1VALbtf(tok) =>
js1emit_lvbtf(out, tok)
|
L1VALchr(tok) =>
js1emit_lvchr(out, tok)
|
L1VALstr(tok) =>
js1emit_lvstr(out, tok)
|
L1VALflt(tok) =>
js1emit_lvflt(out, tok)
//
|
L1VALtop(tok) =>
js1emit_lvtop(out, tok)
//
|
L1VALnam(nam) =>
js1emit_lvnam(out, nam)
//
|
L1VALexn(exn1) =>
js1emit_l1exn(out, exn1)
|
L1VALtmp(tmp1) =>
js1emit_l1tmp(out, tmp1)
//
|
L1VALcon(l1c1) =>
js1emit_l1con(out, l1c1)
//
|
L1VALcfun(hdc1) =>
js1emit_h0cst(out, hdc1)
|
L1VALctmp
( l1c1, ldcl) =>
(
// HX-2022-01-23:
// Simplifying the handling of
// argless template implementations
  aux_l1cst( out, l1v0 )
) // end of [L1VALctmp]
//
|
L1VALvfix(hdv1) =>
js1emit_h0var(out, hdv1)
//
|
L1VALflat(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lval_get(")
  val () =
  js1emit_l1val(out, l1v1)
  val () = fprint(out, ")")
}
(*
|
L1VALtalf(l1v1) =>
{
  val () =
  js1emit_l1val(out, l1v1)
}
*)
//
|
L1VALctag(l1v1) =>
{
  val () =
  fprint
  ( out, "XATS2JS_ctag(" )
  val () =
  js1emit_l1val(out, l1v1)
  val () = fprint(out, ")")
}
|
L1VALcarg(l1v1, argi) =>
{
val () =
fprint
(out, "XATS2JS_carg(")
val () =
js1emit_l1val(out, l1v1)
val () =
fprint!(out, ", ", argi+1, ")")
}
|
L1VALcofs(l1v1, idx2) =>
{
val () =
fprint
( out
, "XATS2JS_new_cofs(")
val () =
js1emit_l1val(out, l1v1)
val () =
fprint!(out, ",", idx2+1, ")")
}
//
|
L1VALtarg(l1v1, argi) =>
{
val () =
fprint
(out, "XATS2JS_targ(")
val () =
js1emit_l1val(out, l1v1)
val () =
fprint!(out, ", ", argi+1, ")")
}
|
L1VALtptr(l1v1, argi) =>
{
val () =
fprint!
( out
, "XATS2JS_new_tptr(")
val () =
js1emit_l1val(out, l1v1)
val () =
fprint!(out, ",", argi+1, ")")
}
//
|
L1VALeval1(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lval_get(")
  val () =
  js1emit_l1val(out, l1v1)
  val () =
  js1emit_txt00( out, ")" )
}
//
|
L1VALeval2(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lazy_eval(")
  val () =
  js1emit_l1val(out, l1v1)
  val () =
  js1emit_txt00( out, ")" )
}
//
|
L1VALeval3(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_llazy_eval(")
  val () =
  js1emit_l1val(out, l1v1)
  val () =
  js1emit_txt00( out, ")" )
}
//
|
L1VALfree3(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_llazy_free(")
  val () =
  js1emit_l1val(out, l1v1)
  val () =
  js1emit_txt00( out, ")" )
}
//
| L1VALnone0() =>
{
  val () = fprint( out, "null" )
}
//
| _ (* else *) => fprint(out, l1v0)
//
) where
{
(*
val () =
fprintln!
(out, "js1emit_l1val: l1v0 = ", l1v0)
*)
//
fun
fdef
( limp
: l1implmnt): l1valopt =
let
val+
L1IMPLMNT(rcd) = limp
in
case+
rcd.hfg of
| list_nil() => rcd.def | _ => None()
end
//
fun
aux_l1cst
( out
: FILEref
, l1v0: l1val): void =
let
//
val-
L1VALctmp
(l1c1, ldcl) = l1v0.node()
val-
L1DCLtimpcst0
( l1c1, ldcl ) = ldcl.node()
//
in//
//
case+
ldcl.node() of
|
L1DCLimplmnt3
( _, _, limp ) =>
let
val opt = fdef(limp)
in
case+ opt of
| None() =>
  js1emit_l1cst(out, l1c1)
| Some(l1v1) =>
  js1emit_l1val(out, l1v1)
end
|
_(*otherwise*) =>
(
  js1emit_l1cst(out, l1c1))
//
end // end of [aux_l1cst(...)]
//
} (*where*) // end of [js1emit_l1val]

(* ****** ****** *)
(* ****** ****** *)
//
implement
js1emit_l1pck
( fout, nind, pck1 ) =
{
//
  val () =
  js1emit_indnt(fout, nind)
  val () = fprintln!(fout, pck1)
//
} (* end of [js1emit_l1pck(...)] *)
//
(* ****** ****** *)
//
fun
js1emit_l1pcklst
( fout
: FILEref
, nind: int
, icas: int
, tcas: l1tmp
, pcks: l1pcklst): void =
let
//
fun
auxpck0
( nind: int
, pck0: l1pck) : void =
(
case+ pck0 of
//
|L1PCKany() =>
(
fprintln!
(fout, "//", pck0, ";")
) where
{
val () =
js1emit_indnt(fout, nind)
}
//
|L1PCKi00(int1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_int00(fout, int1)
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
//
}
//
|L1PCKb00(btf1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_btf00(fout, btf1)
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKint(int1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_lvint( fout, int1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKbtf(btf1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_lvbtf( fout, btf1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKchr(chr1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_lvchr( fout, chr1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKstr(str1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_lvstr( fout, str1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKcon
(l1c1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_l1con( fout, l1c1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKapp
(pck1, pcks) =>
(
auxpcks(nind, pcks)) where
{
 val () = auxpck0(nind, pck1) }
//
|
L1PCKtup
(knd0, pcks) =>
{
 val () = auxpcks(nind, pcks) }
//
|L1PCKgexp(l1v1, blk1) =>
{
val () =
js1emit_l1blk
(fout, nind, blk1)//val
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_l1val(fout, l1v1)
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_txt00(fout, "true")
val () =
js1emit_txtln(fout, ") break;")
}
//
|L1PCKgpat
(pck1, pcks) =>
(
  auxpcks(nind, pcks)) where
{
  val () = auxpck0(nind, pck1) }
//
| _ (* otherwise *) =>
let
val () =
js1emit_indnt(fout, nind)
in//let
fprintln!(fout, "//", pck0, ";")
end//let
//
)
//
and
auxpcks
( nind: int
, pcks: l1pcklst): void =
(
case+ pcks of
|
list_nil() => ()
|
list_cons(pck1, pcks) =>
let
val () =
auxpck0
(nind, pck1) in auxpcks(nind, pcks)
end//let
)
//
in//let
//
case+ pcks of
|
list_nil() => ()
|
list_cons
(pck1, pcks) =>
let
//
val () =
js1emit_indnt
( fout, nind )
val () =
js1emit_txtln
( fout, "do {" )
//
val () =
auxpck0(nind+2, pck1)
//
val () =
js1emit_indnt
(fout, nind+2)
val () =
js1emit_l1tmp(fout, tcas)
val () =
fprintln!(fout, " = ", icas, ";")
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln
( fout, "} while(false);")
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_l1tmp( fout, tcas )
val () =
js1emit_txt00(fout, " > 0) break;\n")
//
in
(
  js1emit_l1pcklst
  (fout, nind, icas+1, tcas, pcks))
end (*let*)
//
end (*let*) // end of [js1emit_pcklst(...)]

(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emitln_l1tmp
( fout
: FILEref
, ltmp: l1tmp): void =
(
  fprintln!(fout)) where
{
  val () = js1emit_l1tmp(fout, ltmp)
}
//
fun
js1emitln_l1val
( fout
: FILEref
, lval: l1val): void =
(
  fprintln!(fout)) where
{
  val () = js1emit_l1val(fout, lval)
}
//
(* ****** ****** *)
(* ****** ****** *)

local
//
fun
aux_mov
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
//
val () =
js1emit_l1tmp(fout, tres)
val () =
js1emit_txt00(fout, " = ")
val () =
js1emitln_l1val(fout, l1v1)
//
} where
{
val-
L1CMDmov(tres, l1v1) = lcmd.node()
}
//
fun
aux_con
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
//
val () =
js1emit_l1tmp(fout, tres)
val () =
js1emit_txt00(fout, " = ")
//
val () =
(
  js1emit_txt00(fout, "["))
//
local
fun
loop
( n0: int
, xs
: l1valist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  loop(n0+1, xs)
) where
{
val () =
if
(n0 > 0)
then
js1emit_txt00(fout, ", ")
val () = js1emit_l1val(fout, x0)
} (* list_cons *)
)
in (*in-of-local*)
//
val () =
let
val-
L1VALcon
( l1c0 ) = l1f0.node()
in
js1emit_l1con(fout, l1c0)
end
val () = loop( 1, l1vs )
val () = js1emit_txtln(fout, "]")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDapp
( tres
, l1f0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_con]
//
fun
aux_tup
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
//
val () =
js1emit_l1tmp(fout, tres)
val () =
js1emit_txt00(fout, " = ")
//
local
fun
loop
( n0: int
, xs
: l1valist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  loop(n0+1, xs)
) where
{
val () =
if
(n0 > 0)
then
js1emit_txt00(fout, ", ")
//
val () =
(
  js1emit_l1val(fout, x0))
//
} (* list_cons *)
)
in(* in-of-local *)
//
val () =
if
knd0 <= 0
then // flat
fprint!(fout, "[", ~1)
else // boxed
fprint!(fout, "[",  0)
//
val () = loop( 1, l1vs )
val () = js1emit_txtln(fout, "]")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDtup
( tres
, knd0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_tup]
//
fun
aux_app
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
//
val () =
js1emit_l1tmp(fout, tres)
val () =
js1emit_txt00(fout, " = ")
//
val () =
(
  js1emit_l1val(fout, l1f0))
//
local
fun
loop
( n0: int
, xs
: l1valist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  loop(n0+1, xs)
) where
{
//
val () =
if
(n0 > 0)
then
js1emit_txt00(fout, ", ")
//
val () =
(
  js1emit_l1val(fout, x0))
//
} (* list_cons *)
)
in(* in-of-local *)
//
val () =
js1emit_txt00(fout, "(")
val () = loop( 0, l1vs )
val () = fprintln!(fout, ")")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDapp
( tres
, l1f0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_app]
//
fun
aux_lam
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val+
L1LAMEXP(rcd) = l1am
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
val () =
js1emit_txt00
(fout, " = function ")
val
narg =
js1emit_h0faglst
( fout
, rcd.lev
, rcd.hfg, 0(*base*))
val () =
js1emit_txtln( fout, " {" )
//
val () =
js1emit_ftmpdecs
(fout, nind+2, rcd.lts(*ltmps*))
//
val () =
js1emit_l1blk(fout, nind+2, rcd.hfg_blk)
val () =
js1emit_l1blk(fout, nind+2, rcd.def_blk)
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txt00(fout, "return ")
//
val () =
js1emit_l1val(fout, res)
val () =
fprintln!(fout, " // lam-fun")
//
}
) : void // end-of-val
//
val () =
js1emit_indnt(fout, nind+0)
val () =
fprintln!(fout, "} // lam-function")
//
} where
{
//
val-L1CMDlam(tres, l1am) = lcmd.node()
//
} (* where *) // end of [aux_lam(...)]
//
fun
aux_fix
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val+
L1FIXEXP(rcd) = lfix
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
val () =
js1emit_txt00
(fout, " = function " )
val () =
js1emit_h0var
(fout, rcd.nam(*recursive*))
//
val
narg =
js1emit_h0faglst
( fout
, rcd.lev
, rcd.hfg, 0(*base*))
val () =
(
  js1emit_txtln( fout, " {" ))
//
val () =
js1emit_ftmpdecs
(fout, nind+2, rcd.lts(*ltmps*))
//
val () =
js1emit_l1blk(fout, nind+2, rcd.hfg_blk)
val () =
js1emit_l1blk(fout, nind+2, rcd.def_blk)
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txt00(fout, "return ")
//
val () =
js1emit_l1val(fout, res)
val () =
fprintln!(fout, " // fix-fun")
//
}
) : void // end-of-val
//
val () =
js1emit_indnt(fout, nind+0)
val () =
fprintln!(fout, "} // fix-function")
//
} where
{
//
val-L1CMDfix(tres, lfix) = lcmd.node()
//
} (* where *) // end of [aux_fix(...)]
//
(* ****** ****** *)
//
fun
aux_blk
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
(
case+ blk1 of
|
L1BLKnone() => ()
|
L1BLKsome(cmds) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_l1cmdlst(fout, nind+2, cmds)
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln( fout, "}" )
//
}
) where
{
  val-L1CMDblk(blk1) = lcmd.node() }
//
fun
aux_dcl
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
(
  js1emit_l1dcl(fout, nind, ldcl)
) where
{
  val-L1CMDdcl(ldcl) = lcmd.node() }
//
(* ****** ****** *)

fun
aux_ift1
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if ")
//
val () = js1emit_txt00(fout, "(")
val () = js1emit_l1val(fout, l1v1)
val () = js1emit_txtln( fout, ")" )
//
(*
val () = js1emit_txtln(fout, "then")
*)
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "{ // then")
//
val () = js1emit_l1blk(fout, nind+2, blk2)
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "} // if-then")
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "else")
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "{ // else")
//
val () = js1emit_l1blk(fout, nind+2, blk3)
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "} // if-else")
//
} where
{
val-L1CMDift1(l1v1, blk2, blk3) = lcmd.node()
} (* where *) // end of [aux_ift1(...)]

(* ****** ****** *)

local

(* ****** ****** *)

#define
auxpcklst
js1emit_l1pcklst

(* ****** ****** *)

fun
auxblklst
( fout
: FILEref
, nind: int
, icas: int
, tcas: l1tmp
, blks: l1blklst): void =
let
//
fun
auxblk0
( fout
: FILEref
, nind: int
, blk1: l1blk ) : void =
js1emit_l1blk(fout, nind, blk1)
//
in
case+ blks of
|
list_nil() => ()
|
list_cons(blk1, blks) =>
let
//
val () =
js1emit_indnt(fout, nind)
val () =
fprint!
(fout, "case ", icas, ":\n")
//
val () =
(
  auxblk0(fout, nind, blk1))
//
val () =
(
  js1emit_indnt(fout, nind))
val () =
(
  js1emit_txtln(fout, "break;"))
//
in//let
(
  auxblklst
  (fout, nind, icas+1, tcas, blks))
end (* end-of-let *)
end (* end-of-let *) // end of [auxblklst]

(* ****** ****** *)

in(* in-of-local*)

(* ****** ****** *)

fun
aux_case
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_l1tmp( fout, tcas )
val () =
js1emit_txtln(fout, " = 0;")
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txtln( fout, "do {" )
//
val () =
auxpcklst
(fout, nind+2, 1(*i*), tcas, pcks)
//
val () =
js1emit_indnt(fout, nind+2)
val () =
fprintln!(fout, "} while(false);")
//
val () =
let
val () =
js1emit_indnt(fout, nind+0)
in//let
fprintln!(fout, "} // case-patck0")
end//let
//
val () =
js1emit_indnt(fout, nind+0)
val () = fprint(fout, "switch(")
val () = js1emit_l1tmp(fout, tcas)
val () = js1emit_txtln(fout, ") {")
//
val () =
auxblklst(fout, nind+2, 1(*i*), tcas, blks)
//
val () =
let
val () =
js1emit_indnt(fout, nind+2)
in//let
fprint!
( fout
, "default: XATS2JS_matcherr0();\n")
end//let
//
val () =
let
val () =
js1emit_indnt(fout, nind+0)
in//let
js1emit_txtln(fout, "} // case-switch")
end//let
//
} where
{
//
val-
L1CMDcase
( knd0
, l1v1
, tcas, pcks, blks) = lcmd.node((*nil*))
//
} (* where *) // end- of-[aux_case(...)]

(* ****** ****** *)

fun
aux_try0
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
{
//
val () =
fprint!(fout, "try\n{\n")
val () =
js1emit_l1blk(fout, nind, blk1)
val () =
fprint!(fout, "}//try\n")
val () =
fprint!(fout, "catch\n(")
val () =
js1emit_l1exn(fout, texn)
val () =
js1emit_txt00(fout, ") {\n")
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tcas)
val () =
js1emit_txtln(fout, " = 0;")
//
val () =
js1emit_indnt(fout, nind+0)
val () =
js1emit_txtln( fout, "do {" )
//
val () =
auxpcklst
(fout, nind+2, 1(*i*), tcas, pcks)
//
val () =
js1emit_indnt(fout, nind+0)
val () =
fprintln!(fout, "} while(false);")
//
val () =
js1emit_indnt(fout, nind+0)
val () = fprint(fout, "switch(")
val () = js1emit_l1tmp(fout, tcas)
val () = js1emit_txtln(fout, ") {")
//
val () =
auxblklst(fout, nind+2, 1(*i*), tcas, blks)
//
val () =
js1emit_indnt
(fout, nind+2)
val () =
fprint!
(fout, "default: ")
val () =
fprint!
(fout, "XATS2JS_reraise(")
val () =
js1emit_l1exn( fout, texn )
val () = fprintln!(fout, ")")
//
val () =
js1emit_txtln(fout, "} // with-switch")
val () =
js1emit_txtln(fout, "} // try0-with-catch")
//
} where
{
//
  val-
  L1CMDtry0
  ( blk1
  , texn
  , tcas
  , pcks
  , blks) = lcmd.node((*void*))
//
} (* where *) // end of [aux_try0]

(* ****** ****** *)

end (* end-of-local *) 

(* ****** ****** *)
//
fun
aux_patck
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
(
  auxpck0
  (nind, pck0)) where
{
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDpatck
  (pck0) = lcmd.node()
} where
{
fun
auxpck0
(nind: int
,pck0: l1pck): void =
(
case+ pck0 of
|
L1PCKany() => ()
|
L1PCKcon(l1c1, l1v2) =>
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "if(")
//
val () =
js1emit_l1con( fout, l1c1 )
val () =
js1emit_txt00(fout, "!==")
val () =
js1emit_l1val( fout, l1v2 )
val () =
js1emit_txtln
(fout, ") XATS2JS_patckerr0();")
}
|
L1PCKapp(pck1, pcks) =>
(
  auxpcks(nind, pcks)) where
{
  val () = auxpck0(nind, pck1) }
| _ (* else *) =>
let
val () =
js1emit_indnt(fout, nind)
in//let
fprintln!(fout, "//", pck0, ";")
end//let
)
//
and
auxpcks
( nind: int
, pcks: l1pcklst): void =
(
case+ pcks of
|
list_nil() => ()
|
list_cons(pck1, pcks) =>
(
  auxpcks(nind, pcks)) where
{
  val () = auxpck0(nind, pck1) }
) (* end of [auxpcks(...)] *)
} (* where *) // end of [aux_patck]
//
(* ****** ****** *)

fun
aux_flat
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDflat
( tres
, l1v1) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_lval_get(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
//
}
end // end of [aux_flat(...)]

(* ****** ****** *)

fun
aux_carg
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDcarg
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
js1emit_l1val(fout, l1v1)
val () =
fprintln!(fout, "[", idx2+1, "]")
//
}
end // let // end-of-[aux_carg(...)]

(* ****** ****** *)

fun
aux_cofs
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDcofs
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_new_cofs(")
val () =
js1emit_l1val(fout, l1v1)
val () =
fprintln!(fout, ",", idx2+1, ")")
//
}
end // end of [aux_cofs]

(* ****** ****** *)

fun
aux_targ
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDtarg
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
js1emit_l1val(fout, l1v1)
val () =
fprintln!(fout, "[", idx2+1, "]")
//
}
end // let // end of [aux_targ(...)]

(* ****** ****** *)

fun
aux_tofs
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDtofs
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_new_tofs(")
val () =
js1emit_l1val(fout, l1v1)
val () =
fprintln!(fout, ",", idx2+1, ")")
//
}
end // end of [aux_tofs(...)]

(* ****** ****** *)

fun
aux_lazy
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDlazy
( tres
, l1v1) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_new_lazy(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
//
}
end // end of [aux_lazy(...)]

(* ****** ****** *)

fun
aux_llazy
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDllazy
( tres
, l1v1
, l1v2) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_new_llazy(")
val () =
js1emit_l1val(fout, l1v1)
val () =
js1emit_txt00( fout, "," )
val () =
js1emit_l1val(fout, l1v2)
val () = fprintln!(fout, ")")
//
}
end // end of [aux_llazy]

(* ****** ****** *)

fun
aux_excon
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val loc0 = lcmd.loc()
*)
val-
L1CMDexcon
( tmp1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tmp1)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprintln!
( fout
, "XATS2JS_new_exctag()")
}
end // end of [aux_excon(...)]

(* ****** ****** *)

fun
aux_raise
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDraise
( l1v1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
//
in//let
{
val () =
fprint
(fout, "XATS2JS_raise(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
}
end // end of [aux_raise(...)]

(* ****** ****** *)

fun
aux_assgn
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDassgn
( l1v1
, l1v2 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
//
in
{
val () =
fprint
( fout
, "XATS2JS_lval_set(")
val () =
js1emit_l1val(fout, l1v1)
val () =
js1emit_txt00(fout, ", ")  
val () =
js1emit_l1val(fout, l1v2)
val () = fprintln!(fout, ")")
}
end // end of [aux_assgn(...)]

(* ****** ****** *)

fun
aux_eval1
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval1
( tres
, l1v1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_lval_get(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
}
end // end of [aux_eval1(...)]

(* ****** ****** *)

fun
aux_eval2
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval2
( tres
, l1v1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_lazy_eval(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
}
end // end of [aux_eval2(...)]

(* ****** ****** *)

fun
aux_eval3
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval3
( tres
, l1v1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_llazy_eval(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
}
end // end of [aux_eval3(...)]

(* ****** ****** *)

fun
aux_free3
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDfree3
( tres
, l1v1 ) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_l1tmp(fout, tres)
//
in
{
//
val () =
fprint( fout, " = " )
//
val () =
fprint
( fout
, "XATS2JS_llazy_free(")
val () =
js1emit_l1val(fout, l1v1)
val () = fprintln!(fout, ")")
}
end // end of [aux_free3(...)]

(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

implement
js1emit_l1cmd
( fout
, nind, lcmd) =
(
case+
lcmd.node() of
|
L1CMDmov _ =>
aux_mov(fout, nind, lcmd)
|
L1CMDapp
(_, l1f0, _) =>
(
case+
l1f0.node() of
|
L1VALcon _ =>
aux_con(fout, nind, lcmd)
|
_ (*else*) =>
aux_app(fout, nind, lcmd)
)
//
|
L1CMDtup _ =>
aux_tup(fout, nind, lcmd)
//
|
L1CMDlam _ =>
aux_lam(fout, nind, lcmd)
|
L1CMDfix _ =>
aux_fix(fout, nind, lcmd)
//
|
L1CMDblk _ =>
aux_blk(fout, nind, lcmd)
//
|
L1CMDdcl _ =>
aux_dcl(fout, nind, lcmd)
//
|
L1CMDift1 _ =>
aux_ift1(fout, nind, lcmd)
//
|
L1CMDcase _ =>
aux_case(fout, nind, lcmd)
|
L1CMDtry0 _ =>
aux_try0(fout, nind, lcmd)
//
|
L1CMDpatck _ =>
(
aux_patck(fout, nind, lcmd))
//
|
L1CMDflat _ =>
(
  aux_flat(fout, nind, lcmd))
//
|
L1CMDcarg _ =>
(
  aux_carg(fout, nind, lcmd))
|
L1CMDcofs _ =>
(
  aux_cofs(fout, nind, lcmd))
//
|
L1CMDtarg _ =>
(
  aux_targ(fout, nind, lcmd))
|
L1CMDtofs _ =>
(
  aux_tofs(fout, nind, lcmd))
//
(*
|
L1CMDpofs _ =>
(
  aux_pofs(fout, nind, lcmd))
*)
//
|
L1CMDlazy _ =>
(
  aux_lazy(fout, nind, lcmd))
|
L1CMDllazy _ =>
(
  aux_llazy(fout, nind, lcmd))
//
|
L1CMDexcon _ =>
(
  aux_excon(fout, nind, lcmd))
|
L1CMDraise _ =>
(
  aux_raise(fout, nind, lcmd))
//
|
L1CMDassgn _ =>
(
  aux_assgn(fout, nind, lcmd))
//
|
L1CMDeval1 _ =>
(
  aux_eval1(fout, nind, lcmd))
|
L1CMDeval2 _ =>
(
  aux_eval2(fout, nind, lcmd))
|
L1CMDeval3 _ =>
(
  aux_eval3(fout, nind, lcmd))
//
|
L1CMDfree3 _ =>
(
  aux_free3(fout, nind, lcmd))
//
|
_(*otherwise *) =>
let
val () =
js1emit_indnt(fout, nind)
in//let
fprintln!(fout, "//", lcmd, ";")
end//let
//
) (*js1emit_l1cmd(...)*) end // end of [local]

(* ****** ****** *)
//
implement
js1emit_l1blk
( fout
, nind, blk0) =
(
case+ blk0 of
|
L1BLKnone() => ()
|
L1BLKsome(cmds) =>
{
val () =
js1emit_l1cmdlst(fout, nind, cmds)
}
)(*case+*)//end-of-[js1emit_l1blk(...)]
//
(* ****** ****** *)
//
implement
js1emit_l1cmdlst
( fout
, nind, cmds) =
(
  loop( cmds )) where
{
fun
loop
( cmds
: l1cmdlst): void =
(
case+ cmds of
|
list_nil() => ()
|
list_cons
(cmd1, cmds) =>
(
  loop(cmds)) where
{
val () =
js1emit_l1cmd(fout, nind, cmd1)})
} (*end*) // js1emit_l1cmdlst(...)
//
(* ****** ****** *)

implement
js1emit_fargdecs
( fout
, nind
, narg, flev) =
(
  loop(0(*i0*))
) where
{
fun
loop(i0: int): void =
if
(i0 < narg)
then
(
  loop(i1) // end-of-then
) where
{
//
val i1 = i0+1
//
val () =
js1emit_indnt(fout, nind)
//
val () =
fprint!
( fout
, "let", " "
, "a", flev, "y", i1, ";\n")
}
// else () // end-of-else
} (* end of [js1emit_fargdecs] *)

(* ****** ****** *)

implement
js1emit_ftmpdecs
( fout
, nind, tmps) =
(
case+ tmps of
|
list_nil() => ()
|
list_cons
(tmp1, tmps) =>
let
//
val i1 = tmp1.arg()
//
in//let
//
if
(i1 > 0)
then
(
js1emit_ftmpdecs
(fout, nind, tmps))
else
(
js1emit_ftmpdecs
(fout, nind, tmps)) where
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "let ")
//
val () = js1emitln_l1tmp(fout, tmp1)
//
} (* end of [else] *)
//
end // end of [let]
) (* end of [js1emit_ftmpdecs(...)] *)

(* ****** ****** *)

local

(* ****** ****** *)
//
fun
fdcl2
( dcl0
: l1dcl): l1dcl =
(
case+
dcl0.node() of
|
L1DCLtimpcst0
( l1c1, dcl2 ) => dcl2
| _(*  else  *) => dcl0
)
//
(* ****** ****** *)
//
fun
nindent
( fout
: FILEref, nind: int) =
js1emit_indnt(fout, nind)
//
(* ****** ****** *)
//
fun
aux_h0cst
( fout
: FILEref
, dcl0: l1dcl
, hdc1: h0cst): void =
js1emit_h0cst(fout, hdc1)
//
(* ****** ****** *)

fun
aux_fundclst
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
val
dcl2 = fdcl2(dcl0)
//
val-
L1DCLfundclst
( knd0
, mopt
, lfds) =
dcl2.node((*void*))
//
fun
isfnx
(knd0: token): bool =
(
case-
knd0.node() of
|
T_FUN(fnk) =>
(
  case+ fnk of
  | FNKfn2() => true
  | FNKfnx() => true
  | _(*else*) => false
)
) (* end of [isfnx] *)
//
in
ifcase
|
isfnx(knd0) =>
js1emit_l1dcl_fnx(fout, nind, dcl0)
|
_(* else *) =>
js1emit_l1dcl_fun(fout, nind, dcl0)
end // end of [aux_fundclst(...)]

(* ****** ****** *)

fun
aux_valdclst
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
fun
auxlvd0
( lvd0
: l1valdecl): void =
{
//
val+
L1VALDECL(rcd) = lvd0
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_l1blk(fout, nind+2, rcd.def_blk)
//
val () =
js1emit_indnt( fout, nind )
val () =
fprintln!(fout, "} // val(", rcd.pat, ")")
//
} (* end of [auxlvd0(...)] *)

(* ****** ****** *)
//
and
auxlvds
( lvds
: l1valdeclist): void =
(
case lvds of
|
list_nil() => ()
|
list_cons
(lvd0, lvds) =>
{
  val () = auxlvd0(lvd0)
  val () = auxlvds(lvds)
}
) (* end of [auxlvds] *)
//
in
//
let
val-
L1DCLvaldclst
( knd0
, mopt
, lvds) =
  dcl0.node() in auxlvds(lvds)
end
//
end // end of [aux_valdclst(...)]

(* ****** ****** *)

fun
aux_vardclst
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
fun
auxlvd0
( lvd0
: l1vardecl): void =
{
//
val+
L1VARDECL(rcd) = lvd0
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln(fout,  "{" )
//
val () =
js1emit_l1blk(fout, nind+2, rcd.ini_blk)
//
val () =
let
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_l1tmp(fout, rcd.hdv_tmp)
in(*in-of-let*)
//
case+
rcd.ini of
|
None() =>
{
  val () =
  fprint!
  ( fout
  , " = XATS2JS_new_var0(")
  val () = fprintln!(fout, ")")
}
|
Some(ini) =>
{
  val () =
  fprint!
  ( fout
  , " = XATS2JS_new_var1(")
  val () =
  js1emit_l1val( fout, ini )
//
  val () = fprintln!(fout, ")")
//
}
//
end // end of [val]
//
val () =
js1emit_indnt(fout, nind)
val () =
fprintln!( fout, "} // var(", rcd.hdv, ")" )
//
} (* end of [auxlvd0(lvd0:l1vardecl)] *)

(* ****** ****** *)
//
and
auxlvds
( lvds
: l1vardeclist): void =
(
case lvds of
|
list_nil() => ()
|
list_cons
(lvd0, lvds) =>
{
  val () = auxlvd0(lvd0)
  val () = auxlvds(lvds)
}
) (* end of [auxlvds] *)
//
in
let
val-
L1DCLvardclst
( knd0
, mopt
, lvds) =
  dcl0.node() in auxlvds(lvds)
end
end // end of [aux_vardclst(lvds:l1vardeclist)]

(* ****** ****** *)

fun
aux_implmnt3
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
val
dcl2 = fdcl2(dcl0)
//
val-
L1DCLimplmnt3
( knd0
, mopt
, limp) =
dcl2.node((*void*))
//
val+
L1IMPLMNT(rcd) = limp
//
in
//
case+
rcd.hfg of
|
list_nil _ =>
aux_implmnt30(fout, nind, dcl2)
|
list_cons _ =>
aux_implmnt31(fout, nind, dcl2)
//
end
// end of [aux_implmnt(...)]
//
and
aux_implmnt30
( fout
: FILEref
, nind: int
, dcl2: l1dcl): void =
let
//
(*
HX-2020-11-18:
argless implementation
*)
//
val-
L1DCLimplmnt3
( knd0
, mopt
, limp) =
dcl2.node((*void*))
//
val+
L1IMPLMNT(rcd) = limp
//
val () =
js1emit_indnt(fout, nind+0)
val () =
js1emit_txtln(fout, "// { // val-implmnt")
//
val () =
js1emit_ftmpdecs
(fout, nind+0, rcd.lts(*ltmps*))
//
val () =
js1emit_l1blk(fout, nind+0, rcd.def_blk)
//
val () =
js1emit_indnt(fout, nind+0)
val () =
js1emit_txtln(fout, "// } // val-implmnt")
//
val () =
js1emit_indnt(fout, nind+0)
val () =
js1emit_txtln(fout, "var // const // implval/fun")
//
val () =
js1emit_indnt(fout, nind+0)
val () =
(
  aux_h0cst(fout, dcl2, rcd.hdc))
(*
val () =
js1emit_h0cst(fout, rcd.hdc(*name*))
*)
//
in
//
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () = js1emit_txt00(fout, " = ")
val () = js1emitln_l1val(fout, res)
//
} (* end of [Some] *)
end (*let*) // end of [aux_implmnt30]
//
and
aux_implmnt31
( fout
: FILEref
, nind: int
, dcl2: l1dcl): void =
let
//
val-
L1DCLimplmnt3
( knd0
, mopt
, limp) =
  dcl2.node((*void*))
//
val+
L1IMPLMNT(rcd) = limp
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln(fout, "function")
//
val () =
(
  js1emit_indnt(fout, nind);
  aux_h0cst(fout, dcl2, rcd.hdc))
(*
val () =
js1emit_h0cst(fout, hdc1(*name*))
*)
//
val
narg =
js1emit_h0faglst
( fout
, rcd.lev
, rcd.hfg, 0(*base*))
val () =
(
  js1emit_newln(fout))
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_ftmpdecs
( fout, nind+2, rcd.lts(*ltmps*) )
//
val () =
js1emit_l1blk(fout, nind+2, rcd.hfg_blk)
val () =
js1emit_l1blk(fout, nind+2, rcd.def_blk)
//
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txt00(fout, "return ")
//
val () = js1emitln_l1val(fout, res)
//
}
) : void // end-of-val
in
js1emit_indnt(fout, nind);
fprintln!(fout, "} // function // ", rcd.hdc)
end (*let*) // end of [aux_implmnt31]

(* ****** ****** *)

fun
aux_timpcst0
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
val-
L1DCLtimpcst0
( l1c1, dcl2 ) = dcl0.node()
//
in
//
case+
dcl2.node() of
//
| 
L1DCLfundclst _ =>
{
val () =
aux_fundclst(fout, nind, dcl0)
}
//
|
L1DCLimplmnt3 _ =>
{
val () =
aux_implmnt3(fout, nind, dcl0)
}
//
| _ (* else *) =>
{
val () =
let
  val () =
  js1emit_indnt(fout, nind)
in//let
  fprintln!(fout, "//", dcl0, ";")
end//let
}
//
end (*let*) // end of [aux_timpcst0]

(* ****** ****** *)

fun
aux_excptcon
( fout
: FILEref
, nind: int
, dcl0: l1dcl): void =
let
//
val-
L1DCLexcptcon
(hdcs, blk0) = dcl0.node()
//
in
(
  js1emit_l1blk
  (fout, nind, blk0(*init*)))
end (*let*) // end of [aux_excptcon]

(* ****** ****** *)

in(*in-of-local*)
//
implement
js1emit_l1dcl
(fout, nind, dcl0) =
let
//
val
loc0 = dcl0.loc((*void*))
//
(*
val () = nindent(fout, nind)
*)
val () = fprint!(fout, "// ")
val () = fprintln!(fout, loc0)
//
in(*in-of-let*)
//
case+
dcl0.node() of
//
|
L1DCLlocal
(head, body) =>
{
val () =
fprint(fout, "// { // local\n")
val () =
js1emit_l1dclist(fout, nind, head)
val () =
fprint(fout, "// in-of-local\n")
val () =
js1emit_l1dclist(fout, nind, body)
val () =
fprint(fout, "// } // end-of-local\n")
}
//
|
L1DCLinclude
( tok0
, src1, knd2
, opt1, opt2) =>
{
val () =
fprint
(fout, "// { // include\n")
val () =
(
case+ opt1 of
|
None() => ((*void*))
|
Some(path) =>
fprintln!(fout, "// ", path)
)
val () =
(
case+ opt2 of
|
None() => ((*void*))
|
Some(body) =>
js1emit_l1dclist(fout, nind, body)
)
val () =
fprint!
(fout, "// } // end-of-include\n")
}
//
|
L1DCLfundclst _ =>
{
  val () =
  aux_fundclst(fout, nind, dcl0) }
//
|
L1DCLvaldclst _ =>
{
  val () =
  aux_valdclst(fout, nind, dcl0) }
//
|
L1DCLvardclst _ =>
{
  val () =
  aux_vardclst(fout, nind, dcl0) }
//
|
L1DCLimplmnt3 _ =>
{
  val () =
  aux_implmnt3(fout, nind, dcl0) }
//
|
L1DCLtimpcst0 _ =>
{
  val () =
  aux_timpcst0(fout, nind, dcl0) }
//
|
L1DCLexcptcon _ =>
{
  val () =
  aux_excptcon(fout, nind, dcl0) }
//
| _ (* else *) =>
{
val () = fprintln!(fout, "// ", dcl0) }
//
end (*js1emit_l1dcl*) end // end-of-local

(* ****** ****** *)

implement
js1emit_l1dclist
(fout, nind, dcls) =
(
  auxlst(dcls)) where
{
fun
auxlst
( dcls
: l1dclist): void =
(
case+ dcls of
|
list_nil
((*void*)) => ( (*void*) )
|
list_cons
(dcl1, dcls) =>
let
val () =
js1emit_l1dcl
(fout, nind, dcl1)
val () =
js1emit_newln(fout) in auxlst(dcls)
end // list_cons]
) (* end of [auxlst] *)
} (*where*) // end of [js1emit_l1dclist]

(* ****** ****** *)

implement
js1emit_package
  (fout, lpkg) =
{
val () = auxtmps(tmps)
val () = auxdcls(dcls) 
} where
{
//
val+
L1PKG
(tmps, dcls) = lpkg
//
fun
auxtmps
( tmps
: l1tmplst): void =
(
//
case+ tmps of
|
list_nil() => ()
|
list_cons
(tmp1, tmps) =>
(
  auxtmps(tmps)) where
{
val () =
js1emit_txt00(fout, "var ")
val () =
js1emitln_l1tmp(fout, tmp1) }
//
) (* end of [auxtmps(...)] *)
//
fun
auxdcls
( xs
: l1dclist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
let
//
val () =
js1emit_l1dcl
(fout, nind, x0) where
{
  val nind = 0(*init*) }
//
val () = js1emit_newln(fout)
val () = js1emit_newln(fout) in auxdcls(xs)
//
end // list_cons
) (* end of [auxdcls] *)
//
} (*where*) // end of [js1emit_program]

(* ****** ****** *)
//
// HX-2020-11-16:
// For handling tail-recursion
//
(* ****** ****** *)
//
extern
fun
fundecl_get_tmprets
( lfd0
: l1fundecl): l1tmplst
extern
fun
funbody_get_tmprets
( tres: l1tmp
, body: l1blk): l1tmplst
//
(* ****** ****** *)

implement
fundecl_get_tmprets
  (lfd0) =
let
val+
L1FUNDECL(rcd) = lfd0
in
//
case+ rcd.def of
|
None() => list_nil()
|
Some(l1v1) =>
(
case+ l1v1.node() of
| L1VALtmp(tmp1) =>
  funbody_get_tmprets
  (tmp1, rcd.def_blk)
| _(* non-L1VALtmp *) => list_nil()
)
//
end where
{
(*
val () =
println!
(
"fundecl_get_tmprets: lfd0 = ", lfd0
)
*)
} (* end of [fundecl_get_tmprets] *)

(* ****** ****** *)

implement
funbody_get_tmprets
(tres, body) = let
//
vtypedef
l1cmdlst_vt = List0_vt(l1cmd)
//
(*
val () =
println!
("funbody_get_tmprets: tres = ", tres)
val () =
println!
("funbody_get_tmprets: body = ", body)
*)
//
fun
ismem
( xs
: l1tmplst
, x0: l1tmp): bool =
(
case+ xs of
|
list_nil() => false
|
list_cons(x1, xs) =>
if (x0 = x1)
then true else ismem(xs, x0)
)
//
fun
auxlval
( l1v0: l1val
, tmps: l1tmplst): l1tmplst =
(
case+
l1v0.node() of
|
L1VALtmp(tmp1) =>
list_cons(tmp1, tmps)
|
_(*non-of-L1VALtmp*) => tmps
) (* end of [auxlval] *)
//
and
auxblk0
( blk0: l1blk
, tmps: l1tmplst): l1tmplst =
(
case+ blk0 of
|
L1BLKnone() => tmps
|
L1BLKsome(cmds) =>
(
  auxcmds
  (list_reverse(cmds), tmps)
)
) (* end of [auxblk0] *)
//
and
auxblks
( blks: l1blklst
, tmps: l1tmplst): l1tmplst =
(
case+ blks of
|
list_nil() => tmps
|
list_cons(blk1, blks) =>
let
  val
  tmps =
  auxblk0(blk1, tmps)
  val
  tmps =
  auxblks(blks, tmps) in tmps
end
) (* end of [auxblks] *)
//
and
auxcmd0
( cmd0: l1cmd
, tmps: l1tmplst): l1tmplst =
(
case+
cmd0.node() of
|
L1CMDmov
(tmp1, l1v2) =>
(
if
ismem
(tmps, tmp1)
then
auxlval(l1v2, tmps) else tmps
)  
//
|
L1CMDblk(blk1) =>
(
  auxblk0(blk1, tmps)
)
//
|
L1CMDift1
(l1v1, blk1, blk2) =>
let
  val
  tmps =
  auxblk0(blk1, tmps)
  val
  tmps =
  auxblk0(blk2, tmps) in tmps
end
|
L1CMDcase
( knd1, l1v1
, tcas, pcks, blks) =>
(
  auxblks(blks, tmps)
) (* end of [L1CMDcase] *)
//
|
_ (* rest-of-l1cmd *) => tmps
)
//
and
auxcmds
( cmds
: l1cmdlst_vt
, tmps: l1tmplst): l1tmplst =
(
case+ cmds of
| ~
list_vt_nil
((*void*)) => tmps
| ~
list_vt_cons
(cmd0, cmds) =>
let
val
tmps =
auxcmd0
(cmd0, tmps) in auxcmds(cmds, tmps)
end // end of [list_cons]
)
//
in
auxcmds
( cmds
, list_sing(tres)) where
{
val cmds =
(
  case+ body of
  | L1BLKnone() => list_vt_nil()
  | L1BLKsome(cmds) => list_reverse(cmds)
) : l1cmdlst_vt // end-of-val
}
end // end of [funbody_get_tmprets]

(* ****** ****** *)

local

fun
fdcl2
( dcl0
: l1dcl): l1dcl =
(
case+
dcl0.node() of
|
L1DCLtimpcst0
( l1c1, dcl2 ) => dcl2
| _(*  else  *) => dcl0
)

fun
aux_h0cst
( fout
: FILEref
, dcl0: l1dcl
, hdc1: h0cst): void =
js1emit_h0cst(fout, hdc1)

in (*in-of-local*)

(* ****** ****** *)

implement
js1emit_l1dcl_fun
(fout, nind, dcl0) =
let
//
fun
auxlfd0
( nind: int
, lfd0
: l1fundecl): void =
let
//
val+
L1FUNDECL(rcd) = lfd0
//
in
case+
rcd.def_blk of
|
L1BLKnone _ => ()
|
L1BLKsome _ =>
auxlfd0_some(nind, lfd0)
end // end of [auxlfd0(...)]
//
and
auxlfd0_some
( nind: int
, lfd0
: l1fundecl): void =
let
//
val+
L1FUNDECL(rcd) = lfd0
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln(fout, "function")
//
val () =
(
  js1emit_indnt(fout, nind);
  aux_h0cst(fout, dcl0, rcd.hdc))
(*
val () =
js1emit_h0cst(fout, rcd.hdc(*name*))
*)
//
val narg =
(
case+
rcd.hfg of
|
None() => 0
|
Some
(rcd_hfg) => narg where
{
val
narg =
js1emit_h0faglst
( fout
, rcd.lev
, rcd_hfg, 0(*base*) )
val () = js1emit_newln(fout)
}
)
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_ftmpdecs
(fout, nind+2, rcd.lts(*ltmps*))
//
val () =
js1emit_l1blk(fout, nind+2, rcd.hfg_blk)
val () =
js1emit_l1blk(fout, nind+2, rcd.def_blk)
//
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txt00(fout, "return ")
//
val () = js1emitln_l1val(fout, res)
//
}
) : void // end-of-val
in//let
//
let
val () = js1emit_indnt(fout, nind)
in//let
fprintln!(fout, "} // function // ", rcd.hdc)
end//let
//
end (* end of [auxlfd0_some(...)] *)
//
(* ****** ****** *)
//
and
auxlfds
( nind: int
, lfds
: l1fundeclist): void =
(
case lfds of
|
list_nil() => ()
|
list_cons
(lfd0, lfds) =>
(
  auxlfds(nind, lfds)) where
{
  val () = auxlfd0(nind, lfd0)
}
)
//
in
//
let
//
val
dcl2 = fdcl2(dcl0)
//
val-
L1DCLfundclst
( knd0
, mopt
, lfds) =
  dcl2.node() in auxlfds(nind, lfds)
end//let
//
end where
{
(*
  val () =
  println!
  ("js1emit_l1dcl_fun: dcl0 = ", dcl0)
*)
} (*where*) // end of [js1emit_l1dcl_fun]

(* ****** ****** *)

implement
js1emit_l1dcl_fnx
(fout, nind, dcl0) =
let

(* ****** ****** *)
//
static
fun{}
mylev(): int
//
static
fun{}
isrec
(l1f0: l1val): bool
static
fun{}
isret
(tres: l1tmp): bool
//
(* ****** ****** *)

fun{}
myjs1emit_l1blk
( fout
: FILEref
, nind: int
, blk0: l1blk): void =
( a1ux_l1blk
  (fout, nind, blk0)) where
{
(* ****** ****** *)
//
fun
a1ux_l1blk
( fout
: FILEref
, nind: int
, blk0: l1blk): void =
let
(*
val () =
println!
(
"a1ux_l1blk: blk0 = ", blk0
)
*)
in
//
case+ blk0 of
|L1BLKnone() => ()
|L1BLKsome(cmds) =>
(
a1ux_l1cmdlst(fout,nind,cmds))
//
end // end of [a1ux_l1blk(...)]
//
and
a1ux_l1cmd
( fout
: FILEref
, nind: int
, cmd0: l1cmd): void =
let
//
fun
a2ux_app
( fout
: FILEref
, nind: int
, cmd0: l1cmd): void =
let
val
isret = isret<>(tres)
in
//
if
isret
then
let
//
val
isrec = isrec<>(l1f0)
//
in//let
//
if
isrec
then
a2ux_trc(fout, nind, cmd0)
else
js1emit_l1cmd(fout, nind, cmd0)
//
end // end of [then]
else
js1emit_l1cmd(fout, nind, cmd0)
//
end where
{
val-
L1CMDapp
( tres
, l1f0, l1vs) = cmd0.node()
} (*where*) // end of [a2ux_app]
//
and
a2ux_trc
( fout
: FILEref
, nind: int
, cmd0: l1cmd): void =
let
val
lev = mylev()
//
fun
loop1
( i0: int
, l1vs
: l1valist): void =
(
case+ l1vs of
|
list_nil() => ()
|
list_cons
(l1v1, l1vs) =>
(
loop1(i1, l1vs)) where
{
val i1 = i0 + 1
//
val () =
fprint!
(fout, "a", lev, "y", i1)
val () =
js1emit_txt00(fout, " = ")
val () =
js1emit_l1val( fout, l1v1 )
val () =
js1emit_txt00( fout, "; " )
} (* where *)
) (* end of [loop1] *)
//
fun
loop2
( i0: int
, l1vs
: l1valist): void =
(
case+ l1vs of
|
list_nil() =>
fprintln!
(fout, "continue")
|
list_cons
(l1v1, l1vs) =>
(
loop2(i1, l1vs)) where
{
//
val i1 = i0 + 1
//
val () =
fprint!
(fout
, "a", lev, "x", i1
, " = "
, "a", lev, "y", i1, "; ")
}
) (* end of [loop2] *)
//
in//let
//
let
val () =
js1emit_indnt(fout, nind+0)
in//let
loop1(0, l1vs); loop2(0, l1vs)
//
end where // end of [let]
{
//
val () =
(
  js1emit_indnt(fout, nind+0))
val () =
fprint!
(fout, "// tail-recursion:\n")
//
val () =
(
  js1emit_indnt(fout, nind+0))
val () =
fprintln!(fout, "// ", cmd0, ";")
//
}
end where
{
val-
L1CMDapp
(tres, l1f0, l1vs) = cmd0.node()
} (*where*) // end of [a2ux_trc(...)]
(* ****** ****** *)
//
fun
a2ux_blk
( fout
: FILEref
, nind: int
, cmd0: l1cmd): void =
{
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
a1ux_l1blk(fout, nind+2, blk1)
//
val () =
(
  js1emit_indnt(fout, nind))
val () =
(
  js1emit_txtln( fout, "}" ))
//
} where
{
val-L1CMDblk(blk1) = cmd0.node()
} (*where*) // end of [a2ux_blk]
//
(* ****** ****** *)
//
fun
a2ux_ift1
( fout
: FILEref
, nind: int
, cmd0: l1cmd): void =
{
//
val-
L1CMDift1
( l1v1
, blk2, blk3) = cmd0.node()
//
val () =
js1emit_indnt(fout, nind)
val() =
js1emit_txt00(fout, "if ")
//
val() = js1emit_txt00(fout, "(")
val() = js1emit_l1val(fout, l1v1)
val() = js1emit_txtln( fout, ")" )
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "{ // then")

val () =
a1ux_l1blk(fout, nind+2, blk2)//if-then
//
val () = js1emit_txtln(fout, "} // if-then")
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "else")
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "{ // else")
//
val () =
a1ux_l1blk(fout, nind+2, blk3)//if-else
//
val () = js1emit_indnt(fout, nind)
val () = js1emit_txtln(fout, "} // if-else")
//
} (* where *) // end of [a2ux_ift1]
//
(* ****** ****** *)
//
fun
a2ux_case
( fout
: FILEref
, nind: int
, lcmd: l1cmd): void =
let
(* ****** ****** *)
//
#define
auxpcklst
js1emit_l1pcklst
//
(* ****** ****** *)
//
fun
auxblklst
( fout
: FILEref
, nind: int
, icas: int
, tcas: l1tmp
, blks: l1blklst): void =
let
//
fun
auxblk0
( fout
: FILEref
, nind: int
, blk1: l1blk) : void =
a1ux_l1blk(fout, nind, blk1)
//
in
case+ blks of
|
list_nil() => ()
|
list_cons(blk1, blks) =>
let
//
val () =
js1emit_indnt(fout, nind)
val () =
fprintln!
(fout, "case ", icas, ":")
//
val () =
(
  auxblk0(fout, nind, blk1))
//
val () =
(
  js1emit_indnt(fout, nind))
val () =
(
  js1emit_txtln(fout, "break;"))
//
in//let
auxblklst(fout, nind, icas+1, tcas, blks)
end (* end-of-let *)
end (* end-of-let *) // end of [auxblklst]
//
(* ****** ****** *)
in(*  in-of-let  *)
(* ****** ****** *)
{
//
val-
L1CMDcase
( knd0
, l1v1
, tcas
, pcks
, blks) = lcmd.node()
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txt00(fout, "{\n")
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_l1tmp( fout, tcas )
val () =
js1emit_txtln(fout, " = 0;")
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txtln( fout, "do {" )
//
val () =
auxpcklst
(fout, nind+2, 1(*i*), tcas, pcks)
//
val () =
js1emit_indnt(fout, nind+2)
val () =
fprint!(fout, "} while(false);\n" )
//
val () =
js1emit_indnt(fout, nind+0)
val () =
fprintln!(fout, "} // case-patck0" )
//
val () =
js1emit_indnt(fout, nind+0)
val () = fprint(fout, "switch(")
val () = js1emit_l1tmp(fout, tcas)
val () = js1emit_txtln(fout, ") {")
//
val () =
auxblklst(fout, nind+2, 1(*i*), tcas, blks)
//
val () =
let
val () =
js1emit_indnt(fout, nind+2)
in//let
fprint!
( fout
, "default: XATS2JS_matcherr0();\n")
end//let
//
val () =
let
val () =
js1emit_indnt(fout, nind+0)
in//let
js1emit_txtln(fout, "} // case-switch")
end//let
//
} end (*let*) // end of [a2ux_case]

(* ****** ****** *)
//
// HX-2020-11-18:
// There is no need for [a2ux_try]!
//
(* ****** ****** *)
in(*  in-of-let  *)
(* ****** ****** *)
//
case+
cmd0.node() of
//
| L1CMDapp _ =>
  a2ux_app(fout, nind, cmd0)
//
| L1CMDblk _ =>
  a2ux_blk(fout, nind, cmd0)
//
| L1CMDift1 _ =>
  a2ux_ift1(fout, nind, cmd0)
//
| L1CMDcase _ =>
  a2ux_case(fout, nind, cmd0)
//
| _(* else *) =>
  js1emit_l1cmd(fout, nind, cmd0)
//
end // end of [a1ux_l1cmd]
//
and
a1ux_l1cmdlst
( fout
: FILEref
, nind: int
, cmds: l1cmdlst): void =
(
case+ cmds of
|
list_nil
((*void*)) => ()
|
list_cons
(cmd1, cmds) =>
(
a1ux_l1cmdlst
(fout, nind, cmds)) where
{
//
val () =
(
a1ux_l1cmd(fout, nind, cmd1))
//
}(*where*)//end-[a1ux_l1cmdlst(...)]
)
//
(* ****** ****** *)

} (* where *) // end of [a1ux_l1blk]

(* ****** ****** *)

fun
auxlfd0
( nind: int
, lfd0
: l1fundecl): void =
let
//
val+
L1FUNDECL(rcd) = lfd0
//
in
case+
rcd.def_blk of
|
L1BLKnone _ => ()
|
L1BLKsome _ =>
auxlfd0_some(nind, lfd0)
end // end of [auxlfd0(...)]
//
and
auxlfd0_some
( nind: int
, lfd0
: l1fundecl): void =
let
//
val+
L1FUNDECL(rcd) = lfd0
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln(fout, "function")
//
val () =
(
  js1emit_indnt(fout, nind);
  aux_h0cst(fout, dcl0, rcd.hdc))
(*
val () =
js1emit_h0cst(out, rcd.hdc(*name*))
*)
//
val narg =
(
case+
rcd.hfg of
|
None() => 0
|
Some(rcd_hfg) => narg where
{
//
val
narg =
js1emit_h0faglst
( fout
, rcd.lev
, rcd_hfg, 0(*base*) )
//
val () = js1emit_newln(fout)
//
} (* Some *)
) (* end of [val] *)
//
val () =
js1emit_indnt(fout, nind)
val () =
js1emit_txtln( fout, "{" )
//
val () =
js1emit_fargdecs
(fout
,nind+2, narg, rcd.lev(*flev*))
val () =
js1emit_ftmpdecs
(fout, nind+2, rcd.lts(*ltmps*))
//
val () =
(
  js1emit_indnt(fout, nind+2))
val () =
(
  js1emit_txtln(fout, "do {"))
//
val () =
js1emit_l1blk(fout, nind+2, rcd.hfg_blk)
//
local
//
implement
mylev<>() = rcd.lev
//
val trts =
fundecl_get_tmprets(lfd0)
//
(*
val () =
println!("auxlfd0_some: trts = ", trts)
*)
//
implement
isret<>(x0) =
auxlst(trts) where
{
fun
auxlst
(xs: l1tmplst): bool =
(
case+ xs of
| list_nil() => false
| list_cons(x1, xs) =>
  if (x0 = x1)
  then true else auxlst(xs)
)
}
//
implement
isrec<>(l1f0) =
(
case+
l1f0.node() of
| L1VALcfun(hdc) =>
  (hdc = rcd.hdc)
| _ (*non-L1VALcfun*) => false
)
//
in(*in-of-local*)
val () =
myjs1emit_l1blk<>
(fout,nind+2,rcd.def_blk) end//local
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txtln(fout, "break;//return")
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txtln(fout, "} while( true );")
//
val () =
(
case+
rcd.def of
|None() => ()
|Some(res) =>
{
//
val () =
js1emit_indnt(fout, nind+2)
val () =
js1emit_txt00(fout, "return ")
//
val () = js1emitln_l1val(fout, res)
//
}
) : void // end-of-val
in
let
val () = js1emit_indnt(fout, nind)
in//let
fprintln!(fout, "} // function // ", rcd.hdc)
end//let
end (* end of [auxlfd0_some(...)] *)
//
(* ****** ****** *)
//
and
auxlfds
( nind: int
, lfds
: l1fundeclist): void =
(
case lfds of
|
list_nil() => ()
|
list_cons
(lfd0, lfds) =>
(
auxlfds(nind, lfds)) where
{
  val () = auxlfd0(nind, lfd0)
}
)
//
in
//
let
//
val
dcl2 = fdcl2(dcl0)
//
val-
L1DCLfundclst
( knd0
, mopt
, lfds) =
  dcl2.node() in auxlfds(nind, lfds)
end // end of [let]
//
end where
{
(*
  val () =
  println!
  ("js1emit_l1dcl_fnx: dcl0 = ", dcl0)
*)
} (*where*) // end of [js1emit_l1dcl_fnx]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_js1emit_dynexp.dats] *)
