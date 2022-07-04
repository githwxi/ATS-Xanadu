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
//
(*
Author: Hongwei Xi
Start Time: April, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#typedef ierr = sint
//
(* ****** ****** *)
//
#abstype
FILEref_tbox <= ptr0
#absvwtp
FILEptr_vtbx(l:addr) <= ptr0
//
#typedef
FILEref = FILEref_tbox
#sexpdef
FILEptr = FILEptr_vtbx
#vwtpdef
FILEptr0 = [l:addr] FILEptr(l)
#vwtpdef
FILEptr1 = [l:agtz] FILEptr(l)
//
(* ****** ****** *)

#typedef FILR = FILEref
#sexpdef FILP = FILEptr
#vwtpdef FILP0 = FILEptr0
#vwtpdef FILP1 = FILEptr1

(* ****** ****** *)
//
fun<>
g_stdin(): FILR // STDIN=0
//
fun<>
g_stdout(): FILR // STDOUT=1
fun<>
g_stderr(): FILR // STDERR=2
//
(* ****** ****** *)
//
fun<>
g_print$out(): FILR
fun<>
gl_print$out(): FILR
//
(* ****** ****** *)

fun<>
g_inp_char(): sint
fun<>
g_inp_cstrm(): strm_vt(sint)

(* ****** ****** *)

fun<>
g_inp_line(): strn
fun<>
g_inp_lline(): strn_vt

(* ****** ****** *)

fun<>
g_inp_line_list(): list(char)
fun<>
g_inp_lline_list(): list_vt(char)
fun<>
g_inp_lline_rlist(): list_vt(char)

(* ****** ****** *)
//
fun
<x0:t0> // STDOUT
prout_ref(x0: x0): void
fun
<x0:t0> // STDERR
prerr_ref(x0: x0): void
//
fun
<x0:vt> // STDOUT
prout0_ref(x0: ~x0): void
fun
<x0:vt> // STDERR
prerr0_ref(x0: ~x0): void
//
fun
<x0:vt> // STDOUT
prout1_ref(x0: !x0): void
fun
<x0:vt> // STDERR
prerr1_ref(x0: !x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
fprint_ref
(out: FILR, x0: x0): void
//
fun
<x0:vt>
fprint0_ref
(out: FILR, x0: ~x0): void
fun
<x0:vt>
fprint1_ref
(out: FILR, x0: !x0): void
//
fun
<x0:vt>
fprint0_ptr
(out: !FILP1, x0: ~x0): void
fun
<x0:vt>
fprint1_ptr
(out: !FILP1, x0: !x0): void
//
(* ****** ****** *)
//
fun<>
bool_fprint(FILR, bool): void
fun<>
char_fprint(FILR, char): void
fun<>
strn_fprint(FILR, strn): void
//
fun<>
gint_fprint_sint(FILR, sint): void
fun<>
gint_fprint_uint(FILR, uint): void
//
fun<>
gflt_fprint_sflt(FILR, sflt): void
fun<>
gflt_fprint_dflt(FILR, dflt): void
//
(* ****** ****** *)
//
fun<>
fgetc_ref(fr: FILR): ierr
fun<>
fgetc_ptr(fp: !FILP1): ierr
//
fun<>
fputc_ref(chr: sint, fr: FILR): ierr
fun<>
fputc_ptr(chr: sint, fp: !FILP1): ierr
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_libcats.sats] *)
