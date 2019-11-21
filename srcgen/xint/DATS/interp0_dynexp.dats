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
// HX-2019-11-10:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
overload
print with $D2E.print_d2con
overload
print with $D2E.print_d2cst
overload
print with $D2E.print_d2var
//
(* ****** ****** *)
//
#staload "./../SATS/interp0.sats"
//
implement
fprint_val<ir0val> = fprint_ir0val
//
(* ****** ****** *)

implement
interp0_program
  (irdcls) =
let
//
val () =
interp0_initize()
//
val
env0 =
intpenv_make_nil()
//
val () =
interp0_irdclist(env0, irdcls)
//
val () = intpenv_free_nil(env0)
//
in
  // nothing
end // end of [interp0_program]

(* ****** ****** *)

local

fun
auxint
( ire0
: ir0exp): ir0val =
let
val-
IR0Eint(tok) = ire0.node()
in(*in-of-let*)
//
case-
tok.node() of
| T_INT1(rep) =>
  IR0Vint(g0string2int(rep))
//
end // end of [auxint]

fun
auxbtf
( ire0
: ir0exp): ir0val =
let
val-
IR0Ebtf(tok) = ire0.node()
in(*in-of-let*)
//
case-
tok.node() of
| T_IDENT_alp(rep) =>
  (
//
// HX-2019-11-18:
// [rep] is "true" or "false"
//
  IR0Vbtf
  (ifval(c0 = 't', true, false))
  ) where
  {
    val p0 = string2ptr(rep)
    val c0 = $UN.ptr0_get<char>(p0)
  }
//
end // end of [auxbtf]

fun
auxvar
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Evar(d2v) = ire0.node()
val
opt =
interp0_search_d2var(env0, d2v)
//
(*
val () =
println!("auxvar: d2v = ", d2v)
*)
//
in
case- opt of ~Some_vt(irv) => irv
end // end of [auxvar]

fun
auxfcst
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Efcst(d2c) = ire0.node()
val
opt = interp0_search_d2cst(d2c)
//
(*
val () =
println!("auxfcst: d2c = ", d2c)
*)
//
in
case- opt of ~Some_vt(irv) => irv
end // end of [auxfcst]

(* ****** ****** *)

fun
auxdapp
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
//
val-
IR0Edapp
( irf0
, npf1
, ires) = ire0.node()
//
val
irf0 =
auxdfun(env0, irf0)
val
irvs =
auxdarg(env0, npf1, ires)
//
(*
val () =
println!
("auxdapp: ire0 = ", ire0)
val () =
println!
("auxdapp: irf0 = ", irf0)
val () =
println!
("auxdapp: irvs = ", irvs)
*)
//
in
//
case- irf0 of
//
| IR0Vfun(fopr) => fopr(irvs)
//
| IR0Vlam(_, _, _) =>
  interp0_fcall_lam(irf0, irvs)
| IR0Vfix(_, _, _, _) =>
  interp0_fcall_fix(irf0, irvs)
//
end // end of [auxdapp]

and
auxdfun
( env0
: !intpenv
, irf0
: ir0exp): ir0val = 
(
  interp0_irexp(env0, irf0)
)

and
auxdarg
( env0
: !intpenv
, npf1: int
, ires
: ir0explst): ir0valist = 
(
case+ ires of
| list_nil() =>
  list_nil()
| list_cons(ire1, ires) =>
  (
  if
  npf1 >= 1
  then
  (
    auxdarg(env0, npf1-1, ires)
  )
  else let
    val irv1 =
    interp0_irexp(env0, ire1)
  in
    list_cons
    ( irv1
    , auxdarg(env0, npf1, ires))
  end // end of [else]    
  )
) (* end of [auxdarg] *)

(* ****** ****** *)

fun
aux_lam
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Elam
(iras, body) = ire0.node()
in
(
  IR0Vlam(fenv, iras, body)
) where
{
  val
  fenv = intpenv_take_env(env0)
}
end // end of [aux_lam]

in (* in-of-local *)

implement
interp0_irexp
  (env0, ire0) =
let
//
val () =
println!
("interp0_irexp: ire0 = ", ire0)
//
in
//
case+
ire0.node() of
//
| IR0Eint _ => auxint(ire0)
| IR0Ebtf _ => auxbtf(ire0)
(*
| IR0Estr(tok) =>
*)
//
| IR0Evar _ => auxvar(env0, ire0)
//
| IR0Efcst _ => auxfcst(env0, ire0)
//
| IR0Edapp _ => auxdapp(env0, ire0)
//
| IR0Elam(_, _) => aux_lam(env0, ire0)
//
| _(*rest-of-ir0exp*) => IR0Vnone1(ire0)
//
end // end of [interp0_irexp]

end // end of [local]

(* ****** ****** *)

implement
interp0_irexplst
  (env0, ires) =
(
case+ ires of
| list_nil() =>
  list_nil()
| list_cons(ire0, ires) =>
  (
    list_cons(irv0, irvs)
  ) where
  {
    val irv0 =
    interp0_irexp(env0, ire0)
    val irvs =
    interp0_irexplst(env0, ires)
  }
) (* end of [interp0_irexplst] *)

(* ****** ****** *)

implement
interp0_irexpopt
  (env0, opt1) =
(
case+ opt1 of
| None() =>
  None(*void*)
| Some(ire1) =>
  Some(interp0_irexp(env0, ire1))
) (* end of [interp0_irexpopt] *)

(* ****** ****** *)

local

fun
auxnpf
( npf1: int
, irps
: ir0patlst): ir0patlst =
if
(npf1 >= 1)
then
let
val-
list_cons
(_, irps) = irps in auxnpf(npf1-1, irps)
end
else irps // end of [if]

in(*in-of-local*)

implement
interp0_fcall_lam
  (irf0, irvs) =
let
val-
IR0Vlam
( fenv
, iras, body) = irf0
val env0 =
intpenv_make_fun(fenv)
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  IR0ARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  interp0_irpatlst_ck2(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil() =>
    interp0_irexp(env0, body)
  | list_cons _ =>
    (
    IR0Vlam(fenv, iras, body)
    ) where
    {
      val
      fenv = intpenv_take_env(env0)
    }
  ) : ir0val // end of [val]
in
  let
  val () = intpenv_free_fun(env0) in irv0
  end
end // end of [let]
//
end // end of [interp0_fcall_lam]

implement
interp0_fcall_fix
  (irf0, irvs) =
let
val-
IR0Vfix
( fenv
, d2v0
, iras, body) = irf0
val env0 =
intpenv_make_fun(fenv)
val ((*void*)) =
intpenv_bind_fix(env0, irf0)
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  IR0ARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  interp0_irpatlst_ck2(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil _ =>
    interp0_irexp(env0, body)
  | list_cons _ =>
    (
    IR0Vlam(fenv, iras, body)
    ) where
    {
      val
      fenv = intpenv_take_env(env0)
    }
  ) : ir0val // end of [val]
in
  let
  val () = intpenv_free_fun(env0) in irv0
  end
end // end of [let]
//
end // end of [interp0_fcall_fix]

end // end of [local]

(* ****** ****** *)

local

fun
aux_valdecl
( env0
: !intpenv
, irdcl: ir0dcl): void =
let
val-
IR0Cvaldecl
( knd
, mopt
, irvds) = irdcl.node()
in
  interp0_ir0valdeclist(env0, irvds)
end // end of [aux_valdecl]

in(*in-of-local*)

implement
interp0_irdcl
  (env0, x0) =
let
// (*
val () =
println!
("interp0_irdcl: x0 = ", x0)
// *)
in
case+
x0.node() of
//
| IR0Cvaldecl _ =>
  aux_valdecl(env0, x0)
//
| _(* rest-of-ir0dcl *) => ()
//
end // end of [interp0_irdcl]

end // end of [local]

(* ****** ****** *)

implement
interp0_irdclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_irdclist(env0, xs)
  ) where
  {
    val () = interp0_irdcl(env0, x0)
  }
) (* end of [interp0_irdclist] *)

(* ****** ****** *)

implement
interp0_irpat_ck2
  (env0, irp0, irv0) =
(
case-
irp0.node() of
//
| IR0Pany() => ()
| IR0Pvar(d2v0) =>
  {
    val () =
    interp0_insert_d2var(env0, d2v0, irv0)
  } (* end of [IR0Pvar] *)
//
) (* end of [interp0_irpat_ck2] *)

implement
interp0_irpatlst_ck2
  (env0, irps, irvs) =
(
case+ irps of
|
list_nil() => ()
|
list_cons(irp0, irps) =>
let
  val-
  list_cons(irv0, irvs) = irvs
  val () =
  interp0_irpat_ck2(env0, irp0, irv0)  
in
  interp0_irpatlst_ck2(env0, irps, irvs)
end // end of [list_cons]
) (* end of [interp0_irpatlst_ck2] *)

(* ****** ****** *)

implement
interp0_ir0valdecl
  (env0, x0) =
let
//
val+
IR0VALDECL(rcd) = x0
//
val pat = rcd.pat
val def = rcd.def
//
val def =
interp0_irexpopt(env0, def)
//
in
//
case+ def of
| None() => ()
| Some(irv) =>
  interp0_irpat_ck2(env0, pat, irv)
//
end // end of [interp0_ir0valdecl]

(* ****** ****** *)

implement
interp0_ir0valdeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_ir0valdeclist(env0, xs)
  ) where
  {
    val () = interp0_ir0valdecl(env0, x0)
  }
) (* end of [interp0_ir0valdeclist] *)

(* ****** ****** *)

(* end of [xint_interp0_dynexp.dats] *)
