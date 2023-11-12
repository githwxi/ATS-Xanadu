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
(*
HX-2023-11-12:
Sun Nov 12 15:36:27 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
(*
HX-2019-11-02: level-1 interpreter
*)
//
(* ****** ****** *)
#define
XATSOPT_targetloc
"./../../.."
(* ****** ****** *)
//
#staload LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
#staload D2E =
"{$XATSOPT}/SATS/dynexp2.sats"
//
(* ****** ****** *)

typedef label = $LAB.label

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)

#staload INT = "./intrep0.sats"

(* ****** ****** *)

typedef irpat = $INT.irpat
typedef irarg = $INT.irarg
typedef irexp = $INT.irexp
typedef irdcl = $INT.irdcl

typedef irgua = $INT.irgua
typedef irgpat = $INT.irgpat
typedef irclau = $INT.irclau

typedef irpatlst = $INT.irpatlst
typedef irarglst = $INT.irarglst
typedef irexplst = $INT.irexplst
typedef irexpopt = $INT.irexpopt
typedef irdclist = $INT.irdclist

typedef irgualst = $INT.irgualst
typedef irclaulst = $INT.irclaulst

typedef irvaldecl = $INT.irvaldecl
typedef irvardecl = $INT.irvardecl
typedef irfundecl = $INT.irfundecl
typedef irvaldeclist = $INT.irvaldeclist
typedef irvardeclist = $INT.irvardeclist
typedef irfundeclist = $INT.irfundeclist

(* ****** ****** *)

abstype irenv_tbox = ptr
typedef irenv = irenv_tbox

(* ****** ****** *)
//
datatype
irval =
//
| IRVnil of ()
//
| IRVint of int
| IRVptr of ptr
//
| IRVbtf of bool
| IRVchr of char
//
| IRVuii of uint
//
| IRVflt of double
| IRVstr of string
//
(*
| IRVvar of d2var
| IRVcon of d2con
| IRVcst of d2cst
*)
//
| IRVlft of irlftv
//
| IRVcon of
    (d2con, irvalist)
//
| IRVfun of (irvalfun)
//
| IRVtrcd1 of
  (int(*knd*), irvalist)
//
|
IRVlam1 of
  (irenv, irarglst, irexp)
|
IRVfix1 of
(irenv, d2var, irarglst, irexp)
(*
| IRVfix2 of
  ( irenv
  , d2var(*f*)
  , irarglst, irexp, irexp)
*)
|
IRVfixs of
( irenv
, d2var(*f*)
, irarglst, irexp, irexplst)
//
|
IRVlazy of ref(irlazv)
|
IRVllazy of
( irenv
, irexp(*eval*), irexplst(*frees*))
//
| IRVerror of () | IRVnone1 of (irexp)
//
and
irlftv =
| IRLFTref of ref(irvalopt)
//
| IRLFTpcon of (irval, label)
//
| IRLFTpbox of
  (irval, label, int(*index*))
| IRLFTpflt of
  (irlftv, label, int(*index*))
//
and
irlazv =
| IRLAZval of irval(*value*)
| IRLAZexp of (irenv, irexp) // thunk
//
where
//
irvalist = List0(irval)
and
irvalopt = Option(irval)
and
irvalfun = (irvalist -<cloref1> irval)
//
(* ****** ****** *)
//
fun
print_irval: print_type(irval)
fun
prerr_irval: prerr_type(irval)
overload print with print_irval
overload prerr with prerr_irval
//
fun
fprint_irval: fprint_type(irval)
overload fprint with fprint_irval
//
(* ****** ****** *)
//
fun
print_irlftv(irlftv): void
fun
prerr_irlftv(irlftv): void
fun
fprint_irlftv: fprint_type irlftv
//
overload print with print_irlftv
overload prerr with prerr_irlftv
overload fprint with fprint_irlftv
//
(* ****** ****** *)

exception IREXN of irval

(* ****** ****** *)

absvtype
intenv_vtbox = ptr
vtypedef
intenv = intenv_vtbox

(* ****** ****** *)
//
fun
irenv_make_nil
  ((*void*)): irenv
//
fun
intenv_make_nil
  ((*void*)): intenv
fun
intenv_make_fenv
  (env: irenv): intenv
//
(* ****** ****** *)
//
fun
intenv_take_fenv
  (env: !intenv): irenv
//
(* ****** ****** *)
//
fun
intenv_bind_fix
(env: !intenv, irv: irval): void
fun
intenv_bind_fixs
(env: !intenv, irv: irval): void
//
(* ****** ****** *)
//
fun
intenv_pop0_let1(!intenv): void
fun
intenv_push_let1(!intenv): void
//
(* ****** ****** *)
//
fun
intenv_pop0_try1(!intenv): void
fun
intenv_push_try1(!intenv): void
//
(* ****** ****** *)
//
fun
intenv_free_nil(env: intenv): void
fun
intenv_free_fenv(env: intenv): void
//
(* ****** ****** *)

fun
xinterp_search_d2cst
( env:
! intenv
, d2c: d2cst): Option_vt(irval)
fun
xinterp_search_d2var
( env:
! intenv
, d2v: d2var): Option_vt(irval)

(* ****** ****** *)
//
fun
xinterp_insert_d2cst
( env:
! intenv
, d2c: d2cst, irv: irval): void
//
fun
xinterp_insert_d2var
( env:
! intenv
, d2v: d2var, irv: irval): void
//
(* ****** ****** *)
//
fun
xinterp_irdcl
( env:
! intenv, irc: irdcl): void
fun
xinterp_irdclist
( env:
! intenv, ircs: irdclist): void
//
fun
xinterp_irexp
( env:
! intenv, ire: irexp): irval
fun
xinterp_irexplst
( env:
! intenv, ires: irexplst): irvalist
fun
xinterp_irexpopt
( env:
! intenv, opt0: irexpopt): irvalopt
//
(* ****** ****** *)
//
fun
xinterp_fcall_lam
(irf0: irval, irvs: irvalist): irval
fun
xinterp_fcall_fix
(irf0: irval, irvs: irvalist): irval
fun
xinterp_fcall_fixs
(irf0: irval, irvs: irvalist): irval
//
(* ****** ****** *)
//
fun
xinterp_irpat_ck0
(irp0: irpat, irv0: irval): bool
fun
xinterp_irpatlst_ck0
(irps: irpatlst, irvs: irvalist): bool
//
fun
xinterp_irpat_ck1
( env:
! intenv
, irp0: irpat, irv0: irval): void
fun
xinterp_irpatlst_ck1
( env:
! intenv
, irps: irpatlst, irvs: irvalist): void
//
(* ****** ****** *)
//
fun
xinterp_irgpat_ck2
( env:
! intenv
, irgp: irgpat, irv0: irval): bool
//
fun
xinterp_irgua_ck2
(env: !intenv, irg0: irgua): bool
fun
xinterp_irgualst_ck2
(env: !intenv, irgs: irgualst): bool
//
(* ****** ****** *)
//
fun
xinterp_irclau
( env:
! intenv
, irv0: irval
, ircl: irclau): Option_vt(irval)
fun
xinterp_irclaulst
( env:
! intenv
, irv0: irval
, ircls: irclaulst): Option_vt(irval)
//
(* ****** ****** *)

fun
xinterp_irvaldecl
( env
: !intenv, irvd: irvaldecl): void
fun
xinterp_irvaldeclist
( env
: !intenv, irvds: irvaldeclist): void

(* ****** ****** *)

fun
xinterp_irvardecl
( env
: !intenv, irvd: irvardecl): void
fun
xinterp_irvardeclist
( env
: !intenv, irvds: irvardeclist): void

(* ****** ****** *)
fun
xinterp_irfundecl
( env:
! intenv, irfd: irfundecl): void
fun
xinterp_irfundeclist
( env:
! intenv, irfds: irfundeclist): void
(* ****** ****** *)
//
fun
xinterp_irimplmnt3
( env:
! intenv, irdcl: irdcl(*implmnt3*)): void
//
(* ****** ****** *)
//
fun
xinterp_initize(): void
//
fun
xinterp_initize_gint(): void
//
(* ****** ****** *)
//
fun
xinterp_fprint_d2cstmap
  (out: FILEref): void
fun
xinterp_fprint_d2varmap
  (out: FILEref): void
//
(* ****** ****** *)
//
fun
xinterp_program(irdclist): void
//
(* ****** ****** *)
//
fun
the_XATSHOME_get((*void*)): string
//
(* ****** ****** *)
//
fun
xinterp_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [xint_xinterp.sats] *)
