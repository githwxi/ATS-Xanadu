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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02: level-1 interpreter
//
(* ****** ****** *)

#define
XATS_targetloc "./../../xats"

(* ****** ****** *)

#staload
LAB = "{$XATS}/SATS/label0.sats"
#staload
D2E = "{$XATS}/SATS/dynexp2.sats"
#staload
INT = "{$XATS}/SATS/intrep0.sats"

(* ****** ****** *)

typedef label = $LAB.label

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)
typedef ir0pat = $INT.ir0pat
typedef ir0arg = $INT.ir0arg
typedef ir0exp = $INT.ir0exp
typedef ir0dcl = $INT.ir0dcl

typedef ir0gua = $INT.ir0gua
typedef ir0gpat = $INT.ir0gpat
typedef ir0clau = $INT.ir0clau

typedef ir0patlst = $INT.ir0patlst
typedef ir0arglst = $INT.ir0arglst
typedef ir0explst = $INT.ir0explst
typedef ir0expopt = $INT.ir0expopt
typedef ir0dclist = $INT.ir0dclist

typedef ir0gualst = $INT.ir0gualst
typedef ir0claulst = $INT.ir0claulst

typedef ir0valdecl = $INT.ir0valdecl
typedef ir0vardecl = $INT.ir0vardecl
typedef ir0fundecl = $INT.ir0fundecl
typedef ir0valdeclist = $INT.ir0valdeclist
typedef ir0vardeclist = $INT.ir0vardeclist
typedef ir0fundeclist = $INT.ir0fundeclist

(* ****** ****** *)

abstype ir0env_tbox = ptr
typedef ir0env = ir0env_tbox

(* ****** ****** *)
//
datatype
ir0val =
//
| IR0Vnil of ()
//
| IR0Vint of int
| IR0Vbtf of bool
| IR0Vchr of char
| IR0Vflt of double
| IR0Vstr of string
//
(*
| IR0Vvar of d2var
| IR0Vcon of d2con
| IR0Vcst of d2cst
*)
//
| IR0Vlft of ir0lval
//
| IR0Vcon of
  (d2con, ir0valist)
//
| IR0Vfun of ir0valfun
//
| IR0Vtuple of
  (int(*knd*), ir0valist)
//
| IR0Vlam of
  (ir0env, ir0arglst, ir0exp)
| IR0Vfix of
  (ir0env, d2var, ir0arglst, ir0exp)
(*
| IR0Vfix2 of
  (ir0env, d2var, ir0arglst, ir0exp, ir0exp)
*)
| IR0Vfixs of
  (ir0env, d2var, ir0arglst, ir0exp, ir0explst)
//
| IR0Vnone0 of () | IR0Vnone1 of (ir0exp)
//
and
ir0lval =
| IR0LVref of ref(ir0valopt)
| IR0LVproj of
  (ir0lval, label, int(*index*))
//
where
//
ir0valist = List0(ir0val)
and
ir0valopt = Option(ir0val)
and
ir0valfun = (ir0valist -<cloref1> ir0val)
//
(* ****** ****** *)
//
fun
print_ir0val: print_type(ir0val)
fun
prerr_ir0val: prerr_type(ir0val)
overload print with print_ir0val
overload prerr with prerr_ir0val
//
fun
fprint_ir0val: fprint_type(ir0val)
overload fprint with fprint_ir0val
//
(* ****** ****** *)
//
fun
print_ir0lval: print_type ir0lval
fun
prerr_ir0lval: prerr_type ir0lval
overload print with print_ir0lval
overload prerr with prerr_ir0lval
//
fun
fprint_ir0lval: fprint_type ir0lval
overload fprint with fprint_ir0lval
//
(* ****** ****** *)

absvtype intpenv_vtbox = ptr
vtypedef intpenv = intpenv_vtbox

(* ****** ****** *)
//
fun
ir0env_make_nil(): ir0env
//
fun
intpenv_make_nil(): intpenv
fun
intpenv_make_fun(ir0env): intpenv
//
(* ****** ****** *)
//
fun
intpenv_take_env(!intpenv): ir0env
//
(* ****** ****** *)
//
fun
intpenv_bind_fix(!intpenv, ir0val): void
fun
intpenv_bind_fixs(!intpenv, ir0val): void
//
(* ****** ****** *)
//
fun
intpenv_pop0_let1(!intpenv): void
fun
intpenv_push_let1(!intpenv): void
//
(* ****** ****** *)
//
fun
intpenv_free_nil(env: intpenv): void
fun
intpenv_free_fun(env: intpenv): void
//
(* ****** ****** *)

fun
interp0_search_d2cst
(d2c: d2cst): Option_vt(ir0val)
fun
interp0_search_d2var
( env
: !intpenv
, d2v: d2var): Option_vt(ir0val)

(* ****** ****** *)
//
fun
interp0_insert_d2cst
(d2c: d2cst, irv: ir0val): void
//
fun
interp0_insert_d2var
( env
: !intpenv
, d2v: d2var, irv: ir0val): void
//
(* ****** ****** *)
//
fun
interp0_irdcl
(env: !intpenv, irc: ir0dcl): void
fun
interp0_irdclist
(env: !intpenv, ircs: ir0dclist): void
//
fun
interp0_irexp
(env: !intpenv, ire: ir0exp): ir0val
fun
interp0_irexplst
(env: !intpenv, ires: ir0explst): ir0valist
fun
interp0_irexpopt
(env: !intpenv, opt0: ir0expopt): ir0valopt
//
(* ****** ****** *)
//
fun
interp0_fcall_lam
(irf0: ir0val, irvs: ir0valist): ir0val
fun
interp0_fcall_fix
(irf0: ir0val, irvs: ir0valist): ir0val
fun
interp0_fcall_fixs
(irf0: ir0val, irvs: ir0valist): ir0val
//
(* ****** ****** *)
//
fun
interp0_irpat_ck0
(irp0: ir0pat, irv0: ir0val): bool
fun
interp0_irpatlst_ck0
(irps: ir0patlst, irvs: ir0valist): bool
//
fun
interp0_irpat_ck1
( env
: !intpenv
, irp0: ir0pat, irv0: ir0val): void
fun
interp0_irpatlst_ck1
( env
: !intpenv
, irps: ir0patlst, irvs: ir0valist): void
//
(* ****** ****** *)
//
fun
interp0_irgpat_ck2
( env
: !intpenv
, irgp: ir0gpat, irv0: ir0val): bool
//
fun
interp0_irgua_ck2
(env: !intpenv, irg0: ir0gua): bool
fun
interp0_irgualst_ck2
(env: !intpenv, irgs: ir0gualst): bool
//
(* ****** ****** *)
//
fun
interp0_irclau
( env
: !intpenv
, irv0: ir0val
, ircl: ir0clau): Option_vt(ir0val)
fun
interp0_irclaulst
( env
: !intpenv
, irv0: ir0val
, ircls: ir0claulst): Option_vt(ir0val)
//
(* ****** ****** *)

fun
interp0_ir0valdecl
(env: !intpenv, irvd: ir0valdecl): void
fun
interp0_ir0valdeclist
(env: !intpenv, irvds: ir0valdeclist): void

(* ****** ****** *)

fun
interp0_ir0vardecl
(env: !intpenv, irvd: ir0vardecl): void
fun
interp0_ir0vardeclist
(env: !intpenv, irvds: ir0vardeclist): void

(* ****** ****** *)

fun
interp0_ir0fundecl
(env: !intpenv, irfd: ir0fundecl): void
fun
interp0_ir0fundeclist
(env: !intpenv, irfds: ir0fundeclist): void

(* ****** ****** *)
//
fun
interp0_ir0impdecl3
(env: !intpenv, irdcl: ir0dcl(*impdecl3*)): void
//
(* ****** ****** *)

//
fun
interp0_initize(): void
//
fun
interp0_initize_gint(): void
//
(* ****** ****** *)

fun
interp0_program(xs: ir0dclist): void

(* ****** ****** *)
//
fun
interp0_fprint_d2cstmap(FILEref): void
fun
interp0_fprint_d2varmap(FILEref): void
//
(* ****** ****** *)
//
fun
interp0_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [xint_interp0.sats] *)
