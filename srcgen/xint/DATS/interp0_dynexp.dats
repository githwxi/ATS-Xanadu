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
overload
print with $D2E.print_impld2cst
//
overload = with $D2E.eq_d2con_d2con
overload = with $D2E.eq_d2cst_d2cst
//
(* ****** ****** *)
//
#staload "./../SATS/interp0.sats"
//
implement
fprint_val<ir0val> = fprint_ir0val
//
(* ****** ****** *)
//
extern
fun
xatsopt_strunq
( source // "<string>" -> <string>
: string) : string = "ext#xatsopt_strunq"
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
|
T_IDENT_alp(rep) =>
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
auxstr
( ire0
: ir0exp): ir0val =
let
val-
IR0Estr(tok) = ire0.node()
in(*in-of-let*)
//
case-
tok.node() of
| T_STRING_closed(rep) =>
  IR0Vstr(xatsopt_strunq(rep))
//
end // end of [auxstr]

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
// (*
val () =
println!("auxvar: d2v = ", d2v)
// *)
//
in
case- opt of ~Some_vt(irv) => irv
end // end of [auxvar]

fun
auxcon1
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
IR0Vfun
(
lam(arg) => IR0Vcon(d2c0, arg)
) where
{
val-IR0Econ1(d2c0) = ire0.node()
}

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
auxtimp
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
//
val-
IR0Etimp
( ire1, targ
, ircl, tsub) = ire0.node()
val-
IR0Etcst
( d2c0
, ti3a, ti2s) = ire1.node()
//
(*
val () =
println!("auxtimp: ire0 = ", ire0)
val () =
println!("auxtimp: ire1 = ", ire1)
*)
//
fun
auxirfd0
( fenv
: ir0env
, irfd0
: ir0fundecl): ir0val =
let
//
val-
IR0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
//
val-
Some(iras) = rcd.a3g
val-
Some(body) = rcd.def
//
in
//
case+ iras of
|
list_nil _ =>
(
case-
body.node() of
|
IR0Elam
(knd, iras, body) =>
IR0Vfix(fenv, nam, iras, body)
)
|
list_cons _ =>
IR0Vfix(fenv, nam, iras, body)
//
end // end of [auxirfd0]
//
fun
auxfixs
( irfds
: ir0fundeclist
) : ir0explst =
(
case+
irfds of
|
list_nil() =>
list_nil()
|
list_cons
(irfd0, irfds) =>
let
val+
IR0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() =>
auxfixs(irfds)
|
Some(iras) =>
(
case+ def of
|
None() =>
auxfixs(irfds)
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
(
case+
body.node() of
|
IR0Elam
(knd, iras, ire2) =>
let
val ire1 =
ir0exp_make_node
(
body.loc()
,
IR0Efix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [IR0Elam]
//
(*
|
IR0Efix
(knd, d2v, iras, ire2) =>
let
val irdf =
ir0exp_make_node
(
body.loc()
,
IR0Efix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-ir0exp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
ir0exp_make_node
(
rcd.loc
,
IR0Efix
(0(*knd*), nam, iras, body)
) (* end of [val] *)
in
  list_cons(ire1, auxfixs(irfds))
end 
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (*auxfixs*)
//
fun
auxirfds
( fenv
: ir0env
, irdfs
: ir0explst
, irfds
: ir0fundeclist
) : ir0val =
(
case+
irfds of 
|
list_nil() =>
IR0Vnone0()
|
list_cons
(irfd0, irfds) =>
let
val+
IR0FUNDECL
  (rcd) = irfd0
in
//
if
(d2c0 = rcd.d2c)
then let
//
val nam = rcd.nam
//
val-
Some(iras) = rcd.a3g
val-
Some(body) = rcd.def
//
in
//
case+
iras of
|
list_nil() =>
(
case-
body.node() of
IR0Elam
(knd, iras, body) =>
IR0Vfixs
(fenv, nam, iras, body, irdfs)
) (* end of [list_nil] *)
|
list_cons _ =>
IR0Vfixs
(fenv, nam, iras, body, irdfs)
//
end // end of [then]
else auxirfds(fenv, irdfs, irfds)
//
end // end of [list_cons]
)
//
in
//
case-
ircl.node() of
|
IR0Cfundecl
( knd0, mopt
, tqas, irfds) =>
let
//
val
fenv =
intpenv_take_env(env0)
//
val-
list_cons(irfd0, xs) = irfds
//
in
//
case- xs of
| list_nil _ =>
  auxirfd0(fenv, irfd0)
| list_cons _ =>
  let
  val
  irdfs = auxfixs(irfds)
  in
  auxirfds(fenv, irdfs, irfds)
  end
//
end
|
IR0Cimpdecl3
( knd0, mopt
, sqas, tqas, id2c
, ti3a, ti2s, iras, body
) =>
(
//
case+ iras of
|
list_nil _ =>
interp0_irexp(env0, body)
|
list_cons _ =>
let
val
fenv =
intpenv_take_env(env0)
in
  IR0Vlam(fenv, iras, body)
end
//
) (* IR0Cimpdecl3 *)
//
end // end of [auxtimp]

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
| IR0Vfixs(_, _, _, _, _) =>
  interp0_fcall_fixs(irf0, irvs)
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

local

fun
auxget_at
( irvs
: ir0valist
, i0: int): ir0val =
(
case+ irvs of
|
list_nil() =>
IR0Vnone0()
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

in(* in-of-local*)

fun
auxproj
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Eproj
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
IR0Vtuple
(knd, irvs) => auxget_at(irvs, idx2)
|
IR0Vlft(irlv) =>
IR0Vlft(IR0LVproj(irlv, lab2, idx2))
//
end // end of [auxproj]

end // end of [local]

(* ****** ****** *)

fun
aux_let
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
//
val-
IR0Elet
( ircs
, ire1) = ire0.node()
//
val () =
intpenv_push_let1(env0)
//
val () =
interp0_irdclist(env0, ircs)
//
val
irv0 = interp0_irexp(env0, ire1)
//
in
let
val () =
intpenv_pop0_let1(env0) in irv0 end
end // end of [aux_let]

fun
aux_where
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
//
val-
IR0Ewhere
( ire1
, ircs) = ire0.node()
//
val () =
intpenv_push_let1(env0)
//
val () =
interp0_irdclist(env0, ircs)
//
val
irv0 = interp0_irexp(env0, ire1)
//
in
let
val () =
intpenv_pop0_let1(env0) in irv0 end
end // end of [aux_where]

(* ****** ****** *)

fun
aux_tuple
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
//
val-
IR0Etuple
( knd0
, npf1
, ires) = ire0.node()
//
fun
auxlst
( env0
: !intpenv
, npf1: int
, ires
: ir0explst
) : ir0valist =
(
case+ ires of
|
list_nil() =>
list_nil()
|
list_cons
(ire1, ires) =>
(
if
(npf1 > 0)
then
auxlst(env0, npf1-1, ires)
else
(
list_cons
( irv1
, auxlst(env0, npf1-1, ires))
) where
{
val
irv1 = interp0_irexp(env0, ire1)
}
) (* end of [list_cons] *)
)
//
in
(
  IR0Vtuple(knd0, irvs)
) where
{
  val irvs = auxlst(env0, npf1, ires)
}
end // end of [aux_tuple]

(* ****** ****** *)

fun
aux_assgn
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Eassgn
( irel
, irer) = ire0.node()
val
irvl = 
interp0_irexp(env0, irel)
val
irvr = 
interp0_irexp(env0, irer)
in
case- irvl of
|
IR0Vlft(irlv) =>
(
case- irlv of
|
IR0LVref(r0) =>
(
  IR0Vnil((*void*))
) where
{
  val () =
  (r0[] := Some(irvr))
} (* end of [IR0LVref] *)
|
IR0LVproj
(_, _, _) =>
(
  IR0Vnil((*void*))
) where
{
val () =
aux_assgn_proj(irvr, irlv)
}
)
end // end of [aux_assgn]
and
aux_assgn_proj
( irvr: ir0val
, irlv: ir0lval) : void =
let
val
irvs = auxlst_up(irlv)
val-
list_cons(_, irvs) = irvs
in
auxlst_dn(irvr, irvs, irlv)
end where
{
//
fun
auxget_at
( irvs
: ir0valist
, i0: int): ir0val =
(
case+ irvs of
|
list_nil() =>
IR0Vnone0()
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)
//
fun
auxset_at
( irvs
: ir0valist
, i0: int
, irvr: ir0val): ir0valist =
(
case+ irvs of
|
list_nil() => list_nil()
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then
list_cons(irvr, irvs)
else
list_cons
( irv0
, auxset_at(irvs, i0-1, irvr))
)
) (* end of [auxset_at] *)
//
fun
auxlst_up
( irlv
: ir0lval): ir0valist =
(
case+ irlv of
| IR0LVref(r0) =>
  (
    list_sing(x0)
  ) where
  {
    val-Some(x0) = r0[]
  }
| IR0LVproj
  (irlv, lab2, idx2) =>
  let
  val
  irvs = auxlst_up(irlv)
  val-
  list_cons(irv1, _) = irvs
  in
  //
  case- irv1 of
  | IR0Vtuple
    (knd, xs) =>
    list_cons
    (auxget_at(xs, idx2), irvs)
  //
  end // end of [IR0Vproj]
)
//
fun
auxlst_dn
( irvr
: ir0val
, irvs
: ir0valist
, irlv: ir0lval): void =
(
case+ irlv of
| IR0LVref(r0) =>
  (r0[] := Some(irvr))
| IR0LVproj
  (irlv, lab2, idx2) =>
  auxlst_dn
  (irvr, irvs, irlv) where
  {
    val-
    list_cons
    (irv1, irvs) = irvs
    val irvr = 
    let
    val-
    IR0Vtuple(knd, xs) = irv1
    in
    IR0Vtuple
    (knd, auxset_at(xs, idx2, irvr))
    end
  }
)
//
} (* end of [aux_assgn_proj] *)

(* ****** ****** *)

fun
aux_if0
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Eif0
( ire1
, ire2
, opt3) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
IR0Vbtf(tf) =>
if
(tf)
then
interp0_irexp(env0, ire2)
else
(
case+ opt3 of
| None() => IR0Vnil()
| Some(ire3) =>
  interp0_irexp(env0, ire3)
)
//
end // end of [aux_if0]

(* ****** ****** *)

fun
aux_case
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
(
case+ opt2 of
| ~None_vt() =>
   IR0Vnone0((*void*))
| ~Some_vt(irv2) => irv2
) where
{
//
val-
IR0Ecase
( knd
, ire1, ircls) = ire0.node()
//
val
irv1 = interp0_irexp(env0, ire1)
val
opt2 =
interp0_irclaulst(env0, irv1, ircls)
//
} (* end of [aux_case] *)

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
( knd0
, iras, body) = ire0.node()
in
(
  IR0Vlam
  (fenv, iras(*arg*), body)
) where
{
  val
  fenv = intpenv_take_env(env0)
}
end // end of [aux_lam]

fun
aux_fix
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Efix
( knd0
, d2v0
, iras, body) = ire0.node()
in
(
IR0Vfix
( fenv
, d2v0(*fid*), iras(*arg*), body)
) where
{
  val
  fenv = intpenv_take_env(env0)
}
end // end of [aux_fix]

(* ****** ****** *)

local

fun
auxget_at
( irvs
: ir0valist
, i0: int): ir0val =
(
case+ irvs of
|
list_nil() =>
IR0Vnone0()
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

in(*in-of-local*)

fun
aux_flat
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Eflat
  (ire1) = ire0.node()
//
in
  aux_flat_main(env0, ire1)
end
and
aux_flat_main
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
(
case-
ire0.node() of
|
IR0Evar(d2v1) =>
let
val irv1 = auxvar(env0, ire0)
in
//
case- irv1 of
|
IR0Vlft(irlv) =>
(
case- irlv of
|
IR0LVref(r0) =>
let
  val-Some(irv0) = r0[] in irv0
end
)
//
end // end of [IR0Evar]
|
IR0Eproj
(ire1, lab2, idx2) =>
let
val irv1 = aux_flat_main(env0, ire1)
in
case- irv1 of
| IR0Vtuple
  (knd, irvs) => auxget_at(irvs, idx2)
end
) (* end of [aux_flat_main] *)

end // end of [local]


(* ****** ****** *)

fun
aux_talf
( env0
: !intpenv
, ire0
: ir0exp): ir0val =
let
val-
IR0Etalf(ire1) = ire0.node()
in
case-
ire1.node() of
|
IR0Eflat(ire1) => interp0_irexp(env0, ire1)
end // end of [aux_talf]

(* ****** ****** *)

in (* in-of-local *)

implement
interp0_irexp
  (env0, ire0) =
let
//
// (*
val () =
println!
("interp0_irexp: ire0 = ", ire0)
// *)
//
in
//
case+
ire0.node() of
//
| IR0Eint _ => auxint(ire0)
| IR0Ebtf _ => auxbtf(ire0)
| IR0Estr _ => auxstr(ire0)
//
| IR0Evar _ => auxvar(env0, ire0)
//
| IR0Econ1 _ => auxcon1(env0, ire0)
//
| IR0Efcst _ => auxfcst(env0, ire0)
//
(*
| IR0Etcst _ => auxtcst(env0, ire0)
*)
| IR0Etimp _ => auxtimp(env0, ire0)
//
| IR0Edapp _ => auxdapp(env0, ire0)
//
| IR0Eproj _ => auxproj(env0, ire0)
//
| IR0Elet
  (ircs, ire1) => aux_let(env0, ire0)
| IR0Ewhere
  (ire1, ircs) => aux_where(env0, ire0)
//
| IR0Etuple
  (_, _, ires) => aux_tuple(env0, ire0)
//
| IR0Eassgn
  (irel, irer) => aux_assgn(env0, ire0)
//
| IR0Eif0
    (_, _, _) => aux_if0(env0, ire0)
  // IR0Eif0
| IR0Ecase
    (_, _, _) => aux_case(env0, ire0)
//
| IR0Elam
    (_, _, _) => aux_lam(env0, ire0)
  // IR0Elam
| IR0Efix
    (_, _, _, _) => aux_fix(env0, ire0)
  // IR0Efix
//
| IR0Eflat(ire1) => aux_flat(env0, ire0)
| IR0Etalf(ire1) => aux_talf(env0, ire0)
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
  interp0_irpatlst_ck1(env0, irps, irvs)
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

(* ****** ****** *)

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
  interp0_irpatlst_ck1(env0, irps, irvs)
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

(* ****** ****** *)

implement
interp0_fcall_fixs
  (irf0, irvs) =
let
val-
IR0Vfixs
( fenv
, d2v0
, iras
, body, irdfs) = irf0
//
val env0 =
intpenv_make_fun(fenv)
val ((*void*)) =
intpenv_bind_fixs(env0, irf0)
//
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
  interp0_irpatlst_ck1(env0, irps, irvs)
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
end // end of [interp0_fcall_fixs]

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0
: !intpenv
, irdcl: ir0dcl): void =
let
//
val-
IR0Cinclude
( tok
, src(*d1exp*)
, knd(*stadyn*)
, fopt(*fpathopt*)
, iropt) = irdcl.node()
//
in
case+ iropt of
| None() => ()
| Some(xs) =>
  interp0_irdclist(env0, xs)
end // end of [aux_include]

(* ****** ****** *)

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

(* ****** ****** *)

fun
aux_vardecl
( env0
: !intpenv
, irdcl: ir0dcl): void =
let
val-
IR0Cvardecl
( knd
, mopt
, irvds) = irdcl.node()
in
  interp0_ir0vardeclist(env0, irvds)
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_fundecl
( env0
: !intpenv
, irdcl: ir0dcl): void =
let
val-
IR0Cfundecl
( knd
, mopt
, tqas
, irfds) = irdcl.node()
//
val
istmp = list_is_cons(tqas)
in
//
if
istmp
then
((*nothing*))
else
interp0_ir0fundeclist(env0, irfds)
//
end // end of [aux_fundecl]

(* ****** ****** *)

in(*in-of-local*)

implement
interp0_irdcl
  (env0, x0) =
let
//
(*
val () =
println!
("interp0_irdcl: x0 = ", x0)
*)
//
in
case+
x0.node() of
//
|
IR0Cinclude _ =>
(
  aux_include(env0, x0)
)
//
| IR0Clocal
  (head, body) =>
{
  val () =
  interp0_irdclist(env0, head)
  val () =
  interp0_irdclist(env0, body)
}
//
| IR0Cvaldecl _ =>
  aux_valdecl(env0, x0)
//
| IR0Cvardecl _ =>
  aux_vardecl(env0, x0)
//
| IR0Cfundecl _ =>
  aux_fundecl(env0, x0)
//
| IR0Cimpdecl3 _ =>
  interp0_ir0impdecl3(env0, x0)
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
interp0_irpat_ck0
  (irp0, irv0) =
let
//
(*
val () =
println!
("interp0_irpat_ck0: irp0 = ", irp0)
val () =
println!
("interp0_irpat_ck0: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
IR0Pany() => true
|
IR0Pvar(d2v0) => true
//
|
IR0Pcapp(d2c0, irps) =>
(
case- irv0 of
|
IR0Vcon(d2c1, irvs) =>
if
d2c0=d2c1
then
interp0_irpatlst_ck0(irps, irvs)
else false
)
//
|
IR0Ptuple(knd0, irps) =>
(
case- irv0 of
|
IR0Vtuple(knd1, irvs) =>
let
val () =
assertloc(knd0 = knd1)
in
interp0_irpatlst_ck0(irps, irvs)
end
)
//
end (* end of [interp0_irpat_ck0] *)

implement
interp0_irpatlst_ck0
  (irps, irvs) =
(
case+ irps of
|
list_nil() => true
|
list_cons(irp0, irps) =>
let
  val-
  list_cons(irv0, irvs) = irvs
  val ans =
  interp0_irpat_ck0(irp0, irv0)  
in
//
  if ans
  then interp0_irpatlst_ck0(irps, irvs)
  else false
//
end // end of [list_cons]
) (* end of [interp0_irpatlst_ck0] *)

(* ****** ****** *)

implement
interp0_irpat_ck1
  (env0, irp0, irv0) =
let
//
(*
val () =
println!
("interp0_irpat_ck1: irp0 = ", irp0)
val () =
println!
("interp0_irpat_ck1: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
IR0Pnil() =>
(
case- irv0 of
|
IR0Vnil() => ()
)
|
IR0Pany() => ()
|
IR0Pvar(d2v0) =>
{
val () =
interp0_insert_d2var
  (env0, d2v0, irv0)
} (* end of [IR0Pvar] *)
//
|
IR0Pcapp(d2c0, irps) =>
(
case- irv0 of
|
IR0Vcon(d2c1, irvs) =>
interp0_irpatlst_ck1(env0, irps, irvs)
)
//
|
IR0Ptuple(knd0, irps) =>
(
case- irv0 of
|
IR0Vtuple(knd1, irvs) =>
let
val () = assertloc(knd0 = knd1)
in
interp0_irpatlst_ck1(env0, irps, irvs)
end
)
//
end (* end of [interp0_irpat_ck1] *)

implement
interp0_irpatlst_ck1
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
  interp0_irpat_ck1(env0, irp0, irv0)  
in
  interp0_irpatlst_ck1(env0, irps, irvs)
end // end of [list_cons]
) (* end of [interp0_irpatlst_ck1] *)

(* ****** ****** *)

implement
interp0_irgpat_ck2
  (env0, irgp, irv0) =
(
case+
irgp.node() of
|
IR0GPATpat(irp0) =>
(
  test
) where
{
val
test =
interp0_irpat_ck0(irp0, irv0)
val () =
if test then
interp0_irpat_ck1(env0, irp0, irv0)
}
|
IR0GPATgua(irp0, irgs) =>
let
val
test =
interp0_irpat_ck0(irp0, irv0)
val () =
if test then
interp0_irpat_ck1(env0, irp0, irv0)
in
if
test
then
interp0_irgualst_ck2(env0, irgs) else false
end // end of [let]
) (* end of [interp0_irgpat_ck2] *)

(* ****** ****** *)
//
implement
interp0_irgua_ck2
  (env0, irg0) =
(
case+
irg0.node() of
|
IR0GUAexp(ire1) =>
let
val irv1 =
interp0_irexp(env0, ire1)
in
case- irv1 of IR0Vbtf(tf) => tf
end
|
IR0GUAmat(ire1, irp1) =>
let
val irv1 =
interp0_irexp(env0, ire1)
val test =
interp0_irpat_ck0(irp1, irv1)
in
if
test
then
interp0_irpat_ck1(env0, irp1, irv1); test
end
)
//
implement
interp0_irgualst_ck2
  (env0, irgs) =
(
case+ irgs of
|
list_nil() => true
|
list_cons(irg0, irgs) =>
if
interp0_irgua_ck2(env0, irg0)
then
interp0_irgualst_ck2(env0, irgs) else false
) (* end of [interp0_irgualst_ck2] *)
//
(* ****** ****** *)

implement
interp0_irclau
(env0, irv0, ircl) =
let
(*
val () =
println!
("interp0_irclau: irv0 = ", irv0)
val () =
println!
("interp0_irclau: ircl = ", ircl)
*)
in
//
case+
ircl.node() of
|
IR0CLAUpat(irgp) =>
let
val () =
intpenv_push_let1(env0)
val test =
interp0_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
  if
  test
  then
  Some_vt(IR0Vnone0()) else None_vt()
) : Option_vt(ir0val)
in
let
val () = intpenv_pop0_let1(env0) in opt0
end
end
|
IR0CLAUexp(irgp, ire1) =>
let
val () =
intpenv_push_let1(env0)
val test =
interp0_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
if
test
then
let
val
irv1 =
interp0_irexp(env0, ire1) in Some_vt(irv1)
end
else
(
  None_vt(*void*)
)
) : Option_vt(ir0val)
in
  let
  val () = intpenv_pop0_let1(env0) in opt0
  end
end // end of [IR0CLAUexp]
//
end (* end of [interp0_irclau] *)

(* ****** ****** *)

implement
interp0_irclaulst
(env0, irv0, ircls) =
(
case+ ircls of
|
list_nil() =>
(
  None_vt(*void*)
)
|
list_cons
(ircl, ircls) =>
let
val opt =
interp0_irclau(env0, irv0, ircl)
in
case+ opt of
|  Some_vt _ => opt
| ~None_vt _ =>
   interp0_irclaulst(env0, irv0, ircls)
end // end of [list_cons]
)

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
|
None() => ()
|
Some(irv) =>
interp0_irpat_ck1(env0, pat, irv)
//
end // end of [interp0_ir0valdecl]

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

implement
interp0_ir0vardecl
  (env0, x0) =
let
//
val+
IR0VARDECL(rcd) = x0
//
val d2v = rcd.d2v
val ini = rcd.ini
//
val ini =
interp0_irexpopt(env0, ini)
//
(*
val ( ) =
println!
("interp0_ir0vardecl: d2v = ", d2v)
val ( ) =
println!
("interp0_ir0vardecl: ini = ", ini)
*)
//
in
//
interp0_insert_d2var
( env0
, d2v, IR0Vlft(IR0LVref(ref(ini))))
//
end // end of [interp0_ir0vardecl]

implement
interp0_ir0vardeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_ir0vardeclist(env0, xs)
  ) where
  {
    val () = interp0_ir0vardecl(env0, x0)
  }
) (* end of [interp0_ir0vardeclist] *)

(* ****** ****** *)

implement
interp0_ir0fundecl
(env0, irfd0) =
let
//
val+
IR0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() => ()
|
Some(iras) =>
(
case+ def of
|
None() => ()
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
let
val irv0 =
(
case-
body.node() of
|
IR0Elam
(knd, iras, body) =>
let
val fenv =
intpenv_take_env(env0)
in
IR0Vfix(fenv, nam, iras, body)
end // end of [IR0Elam]
//
(*
|
IR0Efix
(knd, d2v, iras, ire2) =>
let
//
val
fenv =
intpenv_take_env(env0)
//
val
irdf =
ir0exp_make_node
( body.loc()
, IR0Efix(0, nam, iras, ire2)
)
val
irdfs = list_pair(irdf, body)
//
in
IR0Vfixs
(fenv, nam, iras, ire2, irdfs)
end
*)
//
) : ir0val // end of [let]
in
  interp0_insert_d2cst(d2c, irv0)
end
|
list_cons _ =>
let
val fenv =
intpenv_take_env(env0)
val irv0 =
IR0Vfix(fenv, nam, iras, body)
in
  interp0_insert_d2cst(d2c, irv0)
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end // end of [interp0_ir0fundecl]

(* ****** ****** *)

local

fun
auxfixs
(
irfds
:
ir0fundeclist
) : ir0explst =
(
case+
irfds of
|
list_nil() =>
list_nil()
|
list_cons
(irfd0, irfds) =>
let
val+
IR0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() =>
auxfixs(irfds)
|
Some(iras) =>
(
case+ def of
|
None() =>
auxfixs(irfds)
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
(
case+
body.node() of
|
IR0Elam
(knd, iras, ire2) =>
let
val ire1 =
ir0exp_make_node
(
body.loc()
,
IR0Efix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [IR0Elam]
//
(*
|
IR0Efix
(knd, d2v, iras, ire2) =>
let
val irdf =
ir0exp_make_node
(
body.loc()
,
IR0Efix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-ir0exp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
ir0exp_make_node
(
rcd.loc
,
IR0Efix
(0(*knd*), nam, iras, body)
) (* end of [val] *)
in
  list_cons(ire1, auxfixs(irfds))
end 
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (*auxfixs*)

fun
auxirfds
( fenv
: ir0env
, irdfs
: ir0explst
, irfds
: ir0fundeclist
) : void =
(
case+
irfds of
|
list_nil() => ()
|
list_cons
(irfd0, irfds) =>
let
val+
IR0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() => ()
|
Some(iras) =>
(
case+ def of
|
None() => ()
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
let
val irv0 =
(
case-
body.node() of
|
IR0Elam
(knd, iras, body) =>
IR0Vfixs
(fenv, nam, iras, body, irdfs)
(*
|
IR0Efix
(knd, d2v, iras, ire2) =>
IR0Vfixs
(fenv, nam, iras, ire2, irdfs)
*)
//
) : ir0val // end-of-let
in
(
  auxirfds(fenv, irdfs, irfds)
) where
{
val () =
interp0_insert_d2cst(d2c, irv0)
}
end
|
list_cons _ =>
let
val irv0 =
IR0Vfixs
(fenv, nam, iras, body, irdfs)
in
(
  auxirfds(fenv, irdfs, irfds)
) where
{
val () =
interp0_insert_d2cst(d2c, irv0)
}
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (* auxirfds *)

in (*in-of-local*)

implement
interp0_ir0fundeclist
(env0, irfds) =
(
case+ irfds of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
case+ xs of
| list_nil _ =>
  interp0_ir0fundecl(env0, x0)
| list_cons _ =>
  let
//
  val fenv =
  intpenv_take_env(env0)
//
  val irdfs = auxfixs(irfds)
//
  in
    auxirfds(fenv, irdfs, irfds)
  end
) (* end of [list_cons] *)
) (* interp0_ir0fundeclist *)

end // end of [local]

(* ****** ****** *)

implement
interp0_ir0impdecl3
  (env0, irdcl) =
let
//
val-
IR0Cimpdecl3
( knd, mopt
, sqas, tqas, id2c
, ti3a, ti2s, iras, body) = irdcl.node()
//
(*
val () =
println!
("interp0_ir0impdecl3: id2c = ", id2c)
*)
//
in
//
case+ ti2s of
|
list_nil() =>
let
//
val fenv =
intpenv_take_env(env0)
val d2c0 =
(
case+ id2c of
|
$D2E.IMPLD2CST1
(dqid, d2cs) =>
let
val-
list_cons
(d2c0, _) = d2cs in d2c0 end
|
$D2E.IMPLD2CST2
(dqid, d2cs, opt3) =>
let
val-
Some(d2c0) = opt3 in d2c0 end
) : d2cst // end of [val]
//
val
irv0 = IR0Vlam(fenv, iras, body)
//
in
  interp0_insert_d2cst(d2c0, irv0)
end
//
|
list_cons(_, _) => ((*template*))
//
end (* end of [interp0_ir0impdecl3] *)

(* ****** ****** *)

(* end of [xint_interp0_dynexp.dats] *)
