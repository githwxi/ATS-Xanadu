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
#staload
SYM = "./symbol.sats"
//
(* ****** ****** *)
//
abstbox
filepath_type = ptr
typedef
filepath = filepath_type
//
(* ****** ****** *)
//
fun theDirSep_get(): char
fun theCurDir_get(): string
fun theParDir_get(): string
//
(* ****** ****** *)
//
fun
filepath_dirbase
(dir: string, base: string): string
//
(* ****** ****** *)
//
fun
eq_filepath_filepath
(x1: filepath, x2: filepath):<> bool
fun
neq_filepath_filepath
(x1: filepath, x2: filepath):<> bool
//
fun
compare_filepath_filepath
(x1: filepath, x2: filepath):<> (Sgn)
//
overload = with eq_filepath_filepath
overload != with neq_filepath_filepath
//
overload
compare with compare_filepath_filepath
//
(* ****** ****** *)
//
fun
print_filepath_full: print_type(filepath)
fun
prerr_filepath_full: prerr_type(filepath)
fun
fprint_filepath_full: fprint_type(filepath)
//
(* ****** ****** *)
//
fun
filepath_get_full
  (fp: filepath):<> $SYM.symbol
//
overload .full with filepath_get_full
//
(* ****** ****** *)
//
fun
filepath_get_current((*void*)): filepath
//
(* ****** ****** *)

val the_filepath_dummy : filepath
val the_filepath_stdin : filepath
val the_filepath_string : filepath // text

(* ****** ****** *)
//
fun
filepath_make
( given: string
, pname: string, fname: string): filepath
//
(* ****** ****** *)
//
fun
filepath_is_dummy: filepath -> bool
fun
filepath_isnot_dummy: filepath -> bool
//
(* ****** ****** *)
//
absview the_filepathlst_v
//
(* ****** ****** *)
//
fun
the_filepathlst_pout
  (pf: the_filepathlst_v|(*none*)): void
//
fun
the_filepathlst_push
  (fp0: filepath): (the_filepathlst_v | void)
// end of [the_filepathlst_push]
//
fun
the_filepathlst_pushck
  (fp0: filepath): (the_filepathlst_v | bool)
// end of [the_filepathlst_push_check]
//
fun the_filepathlst_ppout((*void*)): void 
fun the_filepathlst_ppush(fp0: filepath): void
//
(* ****** ****** *)
//
fun
the_filepath_fprint(out: FILEref): void
fun
the_filepathlst_fprint(out: FILEref): void
//
(* ****** ****** *)

(* end of [xats_filepath.sats] *)
