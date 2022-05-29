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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload
  SYM = "./xsymbol.sats"
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
fpath_is_normal(fp: string): bool
fun
fpath_normalize(fp: string): string
//
(* ****** ****** *)
//
abstbox dirpath_type = ptr
typedef dirpath = dirpath_type
typedef dirpathlst = List0(dirpath)
//
(* ****** ****** *)
//
abstbox filpath_type = ptr
//
typedef filpath = filpath_type
typedef filpathopt = Option(filpath)
//
(* ****** ****** *)
//
val
the_dirpath_dummy : dirpath
//
(* ****** ****** *)
//
fun
dirpath_make(string): dirpath
//
(* ****** ****** *)
//
fun
dirpath_get_name(dirpath): string
//
overload .name with dirpath_get_name
//
(* ****** ****** *)
//
fun
the_dirpath_get((*void*)): dirpath
//
fun
print_dirpath: print_type(dirpath)
fun
prerr_dirpath: prerr_type(dirpath)
//
fun
fprint_dirpath: fprint_type(dirpath)
fun
fprintln_dirpath: fprint_type(dirpath)
//
(* ****** ****** *)

absview the_dirpathlst_v

(* ****** ****** *)
//
fun
the_dirpathlst_pout
  (pf: the_dirpathlst_v|(*none*)): void
//
fun
the_dirpathlst_push
  (dp: dirpath): (the_dirpathlst_v | void)
// end of [the_dirpathlst_push]
//
fun the_dirpathlst_ppout((*void*)): void 
fun the_dirpathlst_ppush(dp: dirpath): void
//
fun the_dirpathlst_ppush_cwd((*void*)): void
//
(* ****** ****** *)
//
fun
the_includes_get(): dirpathlst
//
fun
the_includes_pout((*void*)): void
fun
the_includes_push(dir: string): void
//
(* ****** ****** *)
//
fun
filpath_dirbase
(dir: string, base: string): string
fun
filpath_dirbase_vt
(dir: string, base: string): Strptr1
//
(* ****** ****** *)
//
fun
eq_filpath_filpath
(x1: filpath, x2: filpath):<> bool
fun
neq_filpath_filpath
(x1: filpath, x2: filpath):<> bool
//
fun
cmp_filpath_filpath
(x1: filpath, x2: filpath):<> (Sgn)
//
overload = with eq_filpath_filpath
overload != with neq_filpath_filpath
//
overload cmp with cmp_filpath_filpath
//
(* ****** ****** *)
//
fun
print_filpath_full1: print_type(filpath)
fun
prerr_filpath_full1: prerr_type(filpath)
fun
fprint_filpath_full1: fprint_type(filpath)
fun
fprintln_filpath_full1: fprint_type(filpath)
//
(* ****** ****** *)
//
fun
print_filpath_full2: print_type(filpath)
fun
prerr_filpath_full2: prerr_type(filpath)
fun
fprint_filpath_full2: fprint_type(filpath)
fun
fprintln_filpath_full2: fprint_type(filpath)
//
(* ****** ****** *)
//
fun
filpath_get_given
  (fp: filpath):<> string
fun
filpath_get_full1
  (fp: filpath):<> string
fun
filpath_get_full2
  (fp: filpath):<> $SYM.symbol
//
overload .given with filpath_get_given
overload .full1 with filpath_get_full1
overload .full2 with filpath_get_full2
//
(* ****** ****** *)
//
fun
filpath_get_dirname
  (fp: filpath):<> string
//
(* ****** ****** *)
//
fun
filpath_is_cats(filpath):<> bool
fun
filpath_is_sats(filpath):<> bool
fun
filpath_is_dats(filpath):<> bool
//
overload is_cats with filpath_is_cats
overload is_sats with filpath_is_sats
overload is_dats with filpath_is_dats
//
(* ****** ****** *)
//
(*
HX-2020:
For obtaining
the current filpath
*)
//
fun
the_filpath_get((*void*)): filpath
//
(* ****** ****** *)

val the_filpath_dummy : filpath
val the_filpath_stdin : filpath
val the_filpath_string : filpath // text

(* ****** ****** *)
//
fun
filpath_is_dummy: filpath -> bool
fun
filpath_isnot_dummy: filpath -> bool
//
(* ****** ****** *)
//
fun
filpath_is_stdin: filpath -> bool
fun
filpath_is_string: filpath -> bool
//
(* ****** ****** *)
//
fun
filpath_make
(given: string, fname: string): filpath
//
(* ****** ****** *)
//
absview the_filpathlst_v
//
(* ****** ****** *)
//
fun
the_filpathlst_pout
  (pf: the_filpathlst_v|(*none*)): void
//
fun
the_filpathlst_push
  (fp0: filpath): (the_filpathlst_v | void)
// end of [the_filpathlst_push]
//
fun
the_filpathlst_pushck
  (fp0: filpath): (the_filpathlst_v | bool)
// end of [the_filpathlst_push_check]
//
fun the_filpathlst_ppout((*void*)): void 
fun the_filpathlst_ppush(fp0: filpath): void
//
(* ****** ****** *)
//
fun
the_filpath_fprint(out: FILEref): void
fun
the_filpathlst_fprint(out: FILEref): void
//
(* ****** ****** *)

(* end of [xats_filpath.sats] *)
