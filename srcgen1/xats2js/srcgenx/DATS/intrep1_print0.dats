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
#staload $INTREP0(* open *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
//
overload
fprint with $TMP.fprint_stamp
//
overload
fprint with $LAB.fprint_label
//
overload
fprint with $LEX.fprint_token
//
(* ****** ****** *)
//
(*
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full1
*)
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full2
//
(* ****** ****** *)
overload
fprint with $S1E.fprint_g1exp
(* ****** ****** *)
implement
fprint_val<h0var> = fprint_h0var
implement
fprint_val<h0con> = fprint_h0con
implement
fprint_val<h0cst> = fprint_h0cst
(* ****** ****** *)
implement
fprint_val<h0fag> = fprint_h0fag
implement
fprint_val<htqarg> = fprint_htqarg
(* ****** ****** *)
implement
fprint_val<l1exn> = fprint_l1exn
implement
fprint_val<l1tmp> = fprint_l1tmp
(* ****** ****** *)
implement
fprint_val<l1con> = fprint_l1con
implement
fprint_val<l1cst> = fprint_l1cst
(* ****** ****** *)
implement
fprint_val<l1val> = fprint_l1val
(* ****** ****** *)
implement
fprint_val<l1pck> = fprint_l1pck
(* ****** ****** *)
implement
fprint_val<l1cmd> = fprint_l1cmd
implement
fprint_val<l1blk> = fprint_l1blk
(* ****** ****** *)

implement
fprint_val<l1dcl> = fprint_l1dcl

(* ****** ****** *)
//
implement
print_l1exn(x0) =
fprint_l1exn(stdout_ref, x0)
implement
prerr_l1exn(x0) =
fprint_l1exn(stderr_ref, x0)
//
implement
fprint_l1exn(out, x0) =
fprint!
(out, "exn(", x0.stamp(), ")")
//
(* ****** ****** *)
//
implement
print_l1tmp(x0) =
fprint_l1tmp(stdout_ref, x0)
implement
prerr_l1tmp(x0) =
fprint_l1tmp(stderr_ref, x0)
//
implement
fprint_l1tmp(out, x0) =
let
val arg = x0.arg()
in
if
arg <= 0
then
fprint!
(out, "tmp(", x0.stamp(), ")")
else
fprint!
( out
, "arg[", arg, "](", x0.stamp(), ")")
end // end of [fprint_l1tmp]
//
(* ****** ****** *)
//
implement
print_l1cst(x0) =
fprint_l1cst(stdout_ref, x0)
implement
prerr_l1cst(x0) =
fprint_l1cst(stderr_ref, x0)
implement
fprint_l1cst(out, x0) =
fprint!
( out
, x0.h0cst(), "(", x0.stamp(), ")" )
//
(* ****** ****** *)
//
implement
print_l1con(x0) =
fprint_l1con(stdout_ref, x0)
implement
prerr_l1con(x0) =
fprint_l1con(stderr_ref, x0)
implement
fprint_l1con(out, x0) =
(
case+ x0 of
|
L1CONcon(hdc) =>
fprint!(out, "L1CONcon(", hdc, ")")
|
L1CONval(l1v) =>
fprint!(out, "L1CONval(", l1v, ")")
) (*case*) // end of [ fprint_l1con ]
//
(* ****** ****** *)
(*
//
implement
print_l1int(x0) =
fprint_l1int(stdout_ref, x0)
implement
prerr_l1int(x0) =
fprint_l1int(stderr_ref, x0)

implement
fprint_l1int(out, x0) =
(
case+ x0 of
| L1INTint(int) =>
  fprint!(out, "L1INTint(", int, ")")
| L1INTtmp(tmp) =>
  fprint!(out, "L1INTtmp(", tmp, ")")
(*
| L1INTval(l1v) =>
  fprint!(out, "L1INTval(", l1v, ")")
*)
)
//
*)
(* ****** ****** *)
//
implement
print_l1pck(x0) =
fprint_l1pck(stdout_ref, x0)
implement
prerr_l1pck(x0) =
fprint_l1pck(stderr_ref, x0)
//
implement
fprint_l1pck(out, x0) =
(
case+ x0 of
| L1PCKany() =>
  fprint!(out, "L1PCKany(", ")")
//
| L1PCKi00
  (int1, l1v2) =>
  fprint!
  ( out
  , "L1PCKi00(", int1, "; ", l1v2, ")")
| L1PCKb00
  (btf1, l1v2) =>
  fprint!
  ( out
  , "L1PCKb00(", btf1, "; ", l1v2, ")")
| L1PCKc00
  (btf1, l1v2) =>
  fprint!
  ( out
  , "L1PCKc00(", btf1, "; ", l1v2, ")")
| L1PCKs00
  (str1, l1v2) =>
  fprint!
  ( out
  , "L1PCKs00(", str1, "; ", l1v2, ")")
//
| L1PCKint
  (int1, l1v2) =>
  fprint!
  ( out
  , "L1PCKint(", int1, "; ", l1v2, ")")
| L1PCKbtf
  (btf1, l1v2) =>
  fprint!
  ( out
  , "L1PCKbtf(", btf1, "; ", l1v2, ")")
| L1PCKchr
  (chr1, l1v2) =>
  fprint!
  ( out
  , "L1PCKchr(", chr1, "; ", l1v2, ")")
| L1PCKstr
  (str1, l1v2) =>
  fprint!
  ( out
  , "L1PCKstr(", str1, "; ", l1v2, ")")
//
| L1PCKcon
  (hdc1, l1v2) =>
  fprint!
  ( out
  , "L1PCKcon(", hdc1, "; ", l1v2, ")")
//
| L1PCKapp
  (pck1, pcks) =>
  fprint!
  ( out
  , "L1PCKapp(", pck1, "; ", pcks, ")")
//
| L1PCKtup
  (knd0, pcks) =>
  fprint!
  ( out
  , "L1PCKtup(", knd0, "; ", pcks, ")")
//
| L1PCKgpat
  (pck1, pcks) =>
  fprint!
  ( out
  , "L1PCKgpat(", pck1, "; ", pcks, ")")
//
| L1PCKgexp
  (l1v1, blk1) =>
  fprint!
  ( out
  , "L1PCKgexp(", l1v1, "; ", blk1, ")")
| L1PCKgmat
  (h0e1, h0p2) =>
  fprint!
  ( out
  , "L1PCKgmat(", h0e1, "; ", h0p2, ")")
//
| L1PCKxpat
  (h0p1, l1v2) =>
  fprint!
  ( out
  , "L1PCKxpat(", h0p1, "; ", l1v2, ")")
//
) (* end of [fprint_l1pck] *)
//
(* ****** ****** *)
//
implement
print_l1val(x0) =
fprint_l1val(stdout_ref, x0)
implement
prerr_l1val(x0) =
fprint_l1val(stderr_ref, x0)
//
implement
fprint_l1val(out, x0) =
(
case+
x0.node() of
//
|
L1VALi00(int) =>
fprint!(out, "L1VALi00(", int, ")")
|
L1VALb00(btf) =>
fprint!(out, "L1VALb00(", btf, ")")
|
L1VALc00(chr) =>
fprint!(out, "L1VALc00(", chr, ")")
|
L1VALs00(str) =>
fprint!(out, "L1VALs00(", str, ")")
//
|
L1VALint(tok) =>
fprint!(out, "L1VALint(", tok, ")")
|
L1VALbtf(tok) =>
fprint!(out, "L1VALbtf(", tok, ")")
|
L1VALchr(tok) =>
fprint!(out, "L1VALchr(", tok, ")")
//
|
L1VALflt(tok) =>
fprint!(out, "L1VALflt(", tok, ")")
|
L1VALstr(tok) =>
fprint!(out, "L1VALstr(", tok, ")")
//
|
L1VALtop(tok) =>
fprint!(out, "L1VALtop(", tok, ")")
//
|
L1VALnam(nam) =>
fprint!(out, "L1VALnam(", nam, ")")
//
|
L1VALexn(exn) =>
fprint!(out, "L1VALexn(", exn, ")")
|
L1VALtmp(tmp) =>
fprint!(out, "L1VALtmp(", tmp, ")")
//
|
L1VALcon(hdc) =>
fprint!(out, "L1VALcon(", hdc, ")")
//
|
L1VALcfun(hdc) =>
fprint!(out, "L1VALfcst(", hdc, ")")
//
|
L1VALctmp
( ltc1, ldcl ) =>
fprint!(out, "L1VALctmp(", ltc1, ")")
//
|
L1VALvfix(hdv1) =>
fprint!(out, "L1VALvfix(", hdv1, ")")
//
|
L1VALaddr(l1v1) =>
fprint!(out, "L1VALaddr(", l1v1, ")")
//
|
L1VALflat(l1v1) =>
fprint!(out, "L1VALflat(", l1v1, ")")
|
L1VALtalf(l1v1) =>
fprint!(out, "L1VALtalf(", l1v1, ")")
//
|
L1VALctag(l1v1) =>
fprint!(out, "L1VALctag(", l1v1, ")")
|
L1VALcarg(l1v1, idx2) =>
fprint!
( out
, "L1VALcarg(", l1v1, ", ", idx2, ")")
|
L1VALcofs(l1v1, idx2) =>
fprint!
( out
, "L1VALcofs(", l1v1, ", ", idx2, ")")
//
|
L1VALtarg(l1v1, idx2) =>
fprint!
( out
, "L1VALtarg(", l1v1, ", ", idx2, ")")
|
L1VALtptr(l1v1, idx2) =>
fprint!
( out
, "L1VALtptr(", l1v1, ", ", idx2, ")")
//
|
L1VALeval0(l1v1) =>
fprint!(out, "L1VALeval0(", l1v1, ")")
|
L1VALeval1(l1v1) =>
fprint!(out, "L1VALeval1(", l1v1, ")")
|
L1VALeval2(l1v1) =>
fprint!(out, "L1VALeval2(", l1v1, ")")
|
L1VALeval3(l1v1) =>
fprint!(out, "L1VALeval3(", l1v1, ")")
//
|
L1VALfree0(l1v1) =>
fprint!(out, "L1VALfree0(", l1v1, ")")
|
L1VALfree1(l1v1) =>
fprint!(out, "L1VALfree1(", l1v1, ")")
|
L1VALfree2(l1v1) =>
fprint!(out, "L1VALfree2(", l1v1, ")")
|
L1VALfree3(l1v1) =>
fprint!(out, "L1VALfree3(", l1v1, ")")
//
| L1VALnone0() =>
  fprint!(out, "L1VALnone0(", ")")
| L1VALnone1(h0e1) =>
  fprint!(out, "L1VALnone1(", h0e1, ")")
//
(*
| _ (* else *) => fprint!(out, "L1VAL...(...)")
*)
//
) (* end of [fprint_l1val] *)
//
(* ****** ****** *)
//
(*
implement
print_l1lvl(x0) =
fprint_l1lvl(stdout_ref, x0)
implement
prerr_l1lvl(x0) =
fprint_l1lvl(stderr_ref, x0)
*)
//
(*
implement
fprint_l1lvl(out, x0) =
(
case+
x0.node() of
| L1LVLtmp(tmp) =>  
  fprint!
  (out, "L1LVLtmp(", tmp, ")")
| L1LVLpcon(l1v, lab) =>
  fprint!
  ( out
  , "L1LVLpcon(", l1v, "; ", lab, ")")
)
*)
//
(* ****** ****** *)
//
implement
print_l1cmd(x0) =
fprint_l1cmd(stdout_ref, x0)
implement
prerr_l1cmd(x0) =
fprint_l1cmd(stderr_ref, x0)
//
implement
fprint_l1cmd(out, x0) =
(
case+
x0.node() of
//
|
L1CMDmov
(tres, l0v1) =>
fprint!
( out
, "L1CMDmov(", tres, "; ", l0v1, ")")
//
|
L1CMDcon
(tres, hdc1, l0vs) =>
fprint!
( out
, "L1CMDcon("
, tres, "; ", hdc1, "; ", l0vs, ")")
//
|
L1CMDtup
(tres, knd0, l0vs) =>
fprint!
( out
, "L1CMDtup("
, tres, "; ", knd0, "; ", l0vs, ")")
(*
|
L1CMDcst
(tres, hdc1, l0vs) =>
fprint!
( out
, "L1CMDcst("
, tres, "; ", hdc1, "; ", l0vs, ")")
*)
//
|
L1CMDapp
(tres, l0v1, l0vs) =>
fprint!
( out
, "L1CMDapp("
, tres, "; ", l0v1, "; ", l0vs, ")")
//
|
L1CMDlam
(tres, l1am) =>
fprint!
( out,
 "L1CMDlam(", tres, "; ", l1am, ")")
|
L1CMDfix
(tres, lfix) =>
fprint!
( out,
 "L1CMDfix(", tres, "; ", lfix, ")")
//
|
L1CMDlazy
(tres, l1v1) =>
fprint!
( out,
 "L1CMDlazy(", tres, "; ", l1v1, ")"
) (* L1CMDlazy *)
|
L1CMDllazy
(tres, l1v1, l1v2) =>
fprint!
( out,
 "L1CMDllazy("
 , tres, "; ", l1v1, "; ", l1v2, ")"
) (* L1CMDllazy *)
//
|
L1CMDblk(blk1) =>
fprint!(out, "L1CMDblk(", blk1, ")")
//
|
L1CMDdcl(dcl1) =>
fprint!(out, "L1CMDdcl(", dcl1, ")")
//
|
L1CMDift1
(l1v1, blk2, blk3) =>
fprint!
( out
, "L1CMDift1("
, l1v1, "; ", blk2, "; ", blk3, ")")
//
|
L1CMDcase
( knd0
, l1v1, tcas, pcks, blks) =>
fprint!
( out
, "L1CMDcase("
, knd0, "; ", l1v1, "; "
, tcas, "; ", pcks, "; ", blks, ")")
//
|
L1CMDtry0
( blk1
, texn, tcas, pcks, blks) =>
fprint!
( out
, "L1CMDtry0("
, blk1, "; ", texn, "; "
, tcas, "; ", pcks, "; ", blks, ")")
//
|
L1CMDpatck
( lpck ) =>
fprint!(out, "L1CMDpatck(", lpck, ")")
|
L1CMDmatch
(h0p1, l1v2) =>
fprint!
( out
, "L1CMDmatch(", h0p1, "; ", l1v2, ")")
//
|
L1CMDflat
(tres, l1v1) =>
fprint!
( out
, "L1CMDflat(", tres, "; ", l1v1, ")")
|
L1CMDcarg
(tres, l1v1, idx2) =>
(
  fprint!
  ( out
  , "L1CMDcarg("
  , tres, "; ", l1v1, "; ", idx2, ")" )
)
|
L1CMDcofs
(tres, l1v1, idx2) =>
(
  fprint!
  ( out
  , "L1CMDcofs("
  , tres, "; ", l1v1, "; ", idx2, ")" )
)
//
|
L1CMDtarg
(tres, l1v1, idx2) =>
(
  fprint!
  ( out
  , "L1CMDtarg("
  , tres, "; ", l1v1, "; ", idx2, ")" )
)
|
L1CMDtofs
(tres, l1v1, idx2) =>
(
  fprint!
  ( out
  , "L1CMDtofs("
  , tres, "; ", l1v1, "; ", idx2, ")" )
)
//
|
L1CMDexcon
(  tmp1  ) =>
(
 fprint!
 (out, "L1CMDexcon(", tmp1(*tag*), ")")
)
|
L1CMDraise
(  exn1  ) =>
(
 fprint!
 (out, "L1CMDraise(", exn1(*lin*), ")")
)
//
|
L1CMDassgn
(l1v1, l1v2) =>
fprint!
( out
, "L1CMDassgn(", l1v1, "; ", l1v2, ")")
//
|
L1CMDeval0
(tres, l1v1) =>
fprint!
( out
, "L1CMDeval0(", tres, "; ", l1v1, ")")
|
L1CMDeval1
(tres, l1v1) =>
fprint!
( out
, "L1CMDeval1(", tres, "; ", l1v1, ")")
|
L1CMDeval2
(tres, l1v1) =>
fprint!
( out
, "L1CMDeval2(", tres, "; ", l1v1, ")")
|
L1CMDeval3
(tres, l1v1) =>
fprint!
( out
, "L1CMDeval3(", tres, "; ", l1v1, ")")
//
|
L1CMDfree0
(tres, l1v1) =>
fprint!
( out
, "L1CMDfree0(", tres, "; ", l1v1, ")")
|
L1CMDfree1
(tres, l1v1) =>
fprint!
( out
, "L1CMDfree1(", tres, "; ", l1v1, ")")
|
L1CMDfree2
(tres, l1v1) =>
fprint!
( out
, "L1CMDfree2(", tres, "; ", l1v1, ")")
|
L1CMDfree3
(tres, l1v1) =>
fprint!
( out
, "L1CMDfree3(", tres, "; ", l1v1, ")")
//
(*
| _ (* else *) => fprint!(out, "L1CMD...(...)")
*)
//
) (* end of [fprint_l1cmd] *)
//
(* ****** ****** *)
//
implement
print_l1blk(x0) =
fprint_l1blk(stdout_ref, x0)
implement
prerr_l1blk(x0) =
fprint_l1blk(stderr_ref, x0)
//
implement
fprint_l1blk(out, x0) =
(
case+ x0 of
|
L1BLKnone() =>
fprint!(out, "L1BLKnone(", ")")
|
L1BLKsome(cmds) =>
fprint!(out, "L1BLKsome(", cmds, ")")
)
//
(* ****** ****** *)

local
//
implement
fprint_val<l1dcl> = fprint_l1dcl
//
implement
fprint_val<l1fundecl> = fprint_l1fundecl
implement
fprint_val<l1valdecl> = fprint_l1valdecl
implement
fprint_val<l1vardecl> = fprint_l1vardecl
//
implement
fprint_val<l1implmnt> = fprint_l1implmnt
//
in

implement
fprint_l1dcl(out, x0) =
(
case+
x0.node() of
//
(*
|
L1DCLnil() =>
fprint!(out, "L1DCLnil(", ")")
|
L1DCLlist(xs) =>
fprint!(out, "L1DCLcons(", xs, ")")
*)
//
|
L1DCLlocal
(head, body) =>
fprint!
( out
, "L1DCLlocal(", head, "; ", body, ")")
//
|
L1DCLinclude
( tok0
, src1, knd2
, opt1, opt2) =>
(
fprint!
( out
, "L1DCLinclude("
, "src= ", src1, "; "
, "knd= ", knd2, "; "
,  opt1, "; ", body, ")")
) where
{
  val body =
  (
  case+ opt2 of
  | None _ => "None()"
  | Some _ => "Some(<ldcls>)"): string
} (* end of [L1DCLinclude] *)
//
|
L1DCLfundclst
(knd0, mopt, lfds) =>
fprint!(out, "L1DCLfundclst(", lfds, ")")
|
L1DCLvaldclst
(knd0, mopt, lvds) =>
fprint!(out, "L1DCLvaldclst(", lvds, ")")
|
L1DCLvardclst
(knd0, mopt, lvds) =>
fprint!(out, "L1DCLvardclst(", lvds, ")")
//
|
L1DCLimplmnt3
(knd0, mopt, limp) =>
fprint!(out, "L1DCLimplmnt3(", limp, ")")
//
|
L1DCLtimpcst0
(ltc1, dcl2(*timp*)) =>
fprint!
( out
, "L1DCLtimpcst0(", ltc1, "; ", dcl2, ")")
//
|
L1DCLexcptcon
(hdcs, blk0(*init*)) =>
fprint!
( out
, "L1DCLexcptcon(", hdcs, "; ", blk0, ")")
//
| L1DCLnone0() =>
  fprint!(out, "L1DCLnone0(", ")")
(*
| L1DCLnone1(hdcl) =>
  fprint!(out, "L1DCLnone1(", hdcl, ")")
*)
| L1DCLnone1(hdcl) =>
  fprint!(out, "L1DCLnone1(", "...", ")")
//
(*
| _ (* else *) => fprint!(out, "L1DCL...(...)")
*)
//
) (* end of [fprint_l1dcl] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_l1lamexp(x0) =
fprint_l1lamexp(stdout_ref, x0)
implement
prerr_l1lamexp(x0) =
fprint_l1lamexp(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1lamexp
  (out, x0) = let
//
val+
L1LAMEXP(rcd) = x0
//
in
//
fprint!
( out
, "L1LAMEXP@{"
, "hfg=", rcd.hfg, "; "
, "def=", rcd.def, "; "
, "hfg_blk=", rcd.hfg_blk, "; "
, "def_blk=", rcd.def_blk, "; ", "}")
//
end // end of [fprint_l1lamexp]
//
(* ****** ****** *)
//
implement
print_l1fixexp(x0) =
fprint_l1fixexp(stdout_ref, x0)
implement
prerr_l1fixexp(x0) =
fprint_l1fixexp(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1fixexp
  (out, x0) = let
//
val+
L1FIXEXP(rcd) = x0
//
in
//
fprint!
( out
, "L1FIXEXP@{"
, "nam=", rcd.nam, "; "
, "hfg=", rcd.hfg, "; "
, "def=", rcd.def, "; "
, "hfg_blk=", rcd.hfg_blk, "; "
, "def_blk=", rcd.def_blk, "; ", "}")
//
end // end of [fprint_l1fixexp]
//
(* ****** ****** *)
//
implement
print_l1fundecl(x0) =
fprint_l1fundecl(stdout_ref, x0)
implement
prerr_l1fundecl(x0) =
fprint_l1fundecl(stderr_ref, x0)
//
implement
fprint_l1fundecl
  (out, x0) = let
//
val+L1FUNDECL(rcd) = x0
//
in
//
case+
rcd.hfg of
|
None() =>
fprint!
( out
, "L1FUNDECL@{"
, "nam=", rcd.nam, "; "
, "hdc=", rcd.hdc, "; ", "}")
|
Some(rcd_hfg) =>
fprint!
( out
, "L1FUNDECL@{"
, "nam=", rcd.nam, "; "
, "hdc=", rcd.hdc, "; "
, "hfg=", rcd_hfg, "; "
, "def=", rcd.def, "; "
, "hfg_blk=", rcd.hfg_blk, "; "
, "def_blk=", rcd.def_blk, "; ", "}")
//
end // end of [fprint_lfundecl]
//
(* ****** ****** *)
//
implement
print_l1valdecl(x0) =
fprint_l1valdecl(stdout_ref, x0)
implement
prerr_l1valdecl(x0) =
fprint_l1valdecl(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1valdecl
  (out, x0) = let
//
val+L1VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "L1VALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def
  , ", def_blk=", rcd.def_blk, "}")
end // end of [fprint_lvaldecl]
//
(* ****** ****** *)
//
implement
print_l1vardecl(x0) =
fprint_l1vardecl(stdout_ref, x0)
implement
prerr_l1vardecl(x0) =
fprint_l1vardecl(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1vardecl
  (out, x0) = let
//
val+L1VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "L1VARDECL@{"
  , ", hdv=", rcd.hdv
  , ", ini=", rcd.ini
  , ", hdv_tmp=", rcd.hdv_tmp
  , ", ini_blk=", rcd.ini_blk, "}")
end // end of [fprint_lvardecl]
//
(* ****** ****** *)
//
implement
print_l1implmnt(x0) =
fprint_l1implmnt(stdout_ref, x0)
implement
prerr_l1implmnt(x0) =
fprint_l1implmnt(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1implmnt
  (out, x0) = let
//
val+L1IMPLMNT(rcd) = x0
//
in
//
fprint!
( out
, "L1IMPLMNT@{"
, "hdc=", rcd.hdc, "; "
, "hfg=", rcd.hfg, "; "
, "def=", rcd.def, "; "
, "lev=(", rcd.lev, "); "
, "lts=(", rcd.lts, "); "
, "hfg_blk=", rcd.hfg_blk, "; "
, "def_blk=", rcd.def_blk, "; ", "}")
//
end // end of [fprint_limplmnt]
//
(* ****** ****** *)

(* end of [xats_intrep1_print0.dats] *)
