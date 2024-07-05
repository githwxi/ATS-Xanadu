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
HX: Implementation in ATS2!
Sun Nov 12 12:13:13 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload "./intrep1.sats"
(* ****** ****** *)
#define
XATSOPT_targetloc "./../../.."
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/lexing0.sats"
#staload
"{$XATSOPT}/SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
absvtype
emitenv_vtbox = ptr
vtypedef
emitenv = emitenv_vtbox
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_int00
(FILEref, int): void
fun
js1emit_btf00
(FILEref, bool): void
//
(* ****** ****** *)
//
fun
js1emit_txt00
(FILEref, string): void
fun
js1emit_txtln
(FILEref, string): void
//
(* ****** ****** *)
//
fun
js1emit_newln(FILEref): void
fun
js1emit_blnk1(FILEref): void
fun
js1emit_nblnk(FILEref, int): void
fun
js1emit_indnt(FILEref, int): void
//
(* ****** ****** *)
fun
js1emit_h0var(FILEref, h0var): void
(* ****** ****** *)
fun
js1emit_h0con(FILEref, h0con): void
fun
js1emit_h0cst(FILEref, h0cst): void
(* ****** ****** *)
fun
js1emit_l1con(FILEref, l1con): void
fun
js1emit_l1cst(FILEref, l1cst): void
(* ****** ****** *)
fun
js1emit_h0fag
( FILEref
, int(*flvl*)
, h0fag, int(*base*)): int
fun
js1emit_h0faglst
( FILEref
, int(*flvl*)
, h0faglst, int(*base*)): int
(* ****** ****** *)
//
fun
js1emit_lvi00
( out
: FILEref, int: int): void
fun
js1emit_lvb00
( out
: FILEref, btf: bool): void
fun
js1emit_lvc00
( out
: FILEref, chr: char): void
//
(* ****** ****** *)
//
fun
js1emit_lvint
( out
: FILEref, lint: token): void
fun
js1emit_lvbtf
( out
: FILEref, lbtf: token): void
fun
js1emit_lvchr
( out
: FILEref, lchr: token): void
//
(* ****** ****** *)
//
fun
js1emit_lvflt
( out
: FILEref, lflt: token): void
fun
js1emit_lvstr
( out
: FILEref, lstr: token): void
//
(* ****** ****** *)
fun
js1emit_lvtop
( out
: FILEref, ltop: token): void
(* ****** ****** *)
fun
js1emit_lvnam
( out
: FILEref, lnam: lvnam): void
(* ****** ****** *)
fun
js1emit_l1exn
( out
: FILEref, lexn: l1exn): void
fun
js1emit_l1tmp
( out
: FILEref, ltmp: l1tmp): void
(* ****** ****** *)
fun
js1emit_l1val
( out
: FILEref, lval: l1val): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_l1pck
( fout
: FILEref
, nind: int, pck0: l1pck): void
//
(* ****** ****** *)
//
fun
js1emit_l1cmd
( fout: FILEref
, nind: int, cmd0: l1cmd): void
fun
js1emit_l1blk
( fout: FILEref
, nind: int, blk0: l1blk): void
//
(* ****** ****** *)
fun
js1emit_l1cmdlst
( out: FILEref
, nind: int, cmds: l1cmdlst): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_fargdecs
( out
: FILEref, nind: int
, narg: int, flev: int): void
fun
js1emit_ftmpdecs
( out
: FILEref
, nind: int, tmps: l1tmplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_l1dcl
( out: FILEref
, nind: int, dcl0: l1dcl): void
fun
js1emit_l1dclist
( out: FILEref
, nind: int, dcls: l1dclist): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_l1dcl_fun
( fout
: FILEref, nind: int, dcl0: l1dcl): void
fun
js1emit_l1dcl_fnx
( fout
: FILEref, nind: int, dcl0: l1dcl): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
js1emit_package(fout: FILEref, pkg0: l1pkg): void
//
(* ****** ****** *)
(* ****** ****** *)

(* ************************************************************ *)
(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_js1emit.sats] *)
(* ************************************************************ *)
