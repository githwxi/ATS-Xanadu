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
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
#symload
print
with $LOC.print_location
(* ****** ****** *)
//
macdef
token2dint=$TR01.token2dint
macdef
token2dbtf=$TR01.token2dbtf
macdef
token2dchr=$TR01.token2dchr
macdef
token2dflt=$TR01.token2dflt
macdef
token2dstr=$TR01.token2dstr
//
(* ****** ****** *)
overload
= with $D2E.eq_d2con_d2con
overload
= with $D2E.eq_d2cst_d2cst
(* ****** ****** *)
#symload
.ctag with $D2E.d2con_get_ctag
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
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)
//
implement
fprint_val<irval> = fprint_irval
//
(* ****** ****** *)
//
extern
fun
xatsopt_chrunq
( source // '<char>' -> <char>
: string
) : char = "ext#xatsopt_chrunq"
extern
fun
xatsopt_strunq
( source//"<string>" -> <string>
: string
) : string = "ext#xatsopt_strunq"
//
(* ****** ****** *)
//
extern
fun
pcon_lab2idx
(lab2: label): int(*index*)
//
implement
pcon_lab2idx
  (lab2) =
let
val
opt = lab2.int()
in
case- opt of ~Some_vt(idx2) => idx2
end // end of [pcon_lab2idx]
//
(* ****** ****** *)
local
//
fun
auxget_at
( irvs
: irvalist
, i0: int): irval =
(
case- irvs of
(*
|
list_nil
() => IRVerror()
*)
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
in(* in-of-local *)
//
fun
irval_con_arg
( irv0
: irval, i0: int): irval =
(
  auxget_at(irvs, i0)
) where
{
val-IRVcon(d2c1, irvs) = irv0
}
//
fun
irval_trcd1_arg
( irv0
: irval, i0: int): irval =
(
  auxget_at(irvs, i0)
) where
{
val-IRVtrcd1(knd0, irvs) = irv0
}
//
end // end of [local]
(* ****** ****** *)

implement
xinterp_program
  (dcls) =
let
//
val () =
xinterp_initize()
//
val
env0 =
intenv_make_nil()
//
val () =
xinterp_irdclist(env0, dcls)
//
val () = intenv_free_nil(env0)
//
in
  // nothing
end // end of [xinterp_program]

(* ****** ****** *)
//
extern
fun
xinterp_irexp_fun
(env: !intenv, ire: irexp): irval
//
implement
xinterp_irexp_fun
  (env0, ire0) =
let
val env0 =
$UN.castvwtp1{ptr}(env0)
in
try
irv0 where
{
val
env0 =
$UN.castvwtp0{intenv}(env0)
val
irv0 = xinterp_irexp(env0, ire0)
prval
((*void*)) = $UN.cast2void(env0)
}
with exn =>
let
val
env0 =
$UN.castvwtp0{intenv}(env0)
val () = intenv_free_fenv(env0) in $raise(exn)
end
end // end of [xinterp_irexp_fun]
//
(* ****** ****** *)
//
extern
fun
xinterp_irexp_try0
(env: !intenv, ire: irexp): irval
//
implement
xinterp_irexp_try0
  (env0, ire0) =
let
val env0 =
$UN.castvwtp1{ptr}(env0)
in
try
irv0 where
{
val
env0 =
$UN.castvwtp0{intenv}(env0)
val
irv0 = xinterp_irexp(env0, ire0)
prval
((*void*)) = $UN.cast2void(env0)
}
with exn =>
let
val
env0 =
$UN.castvwtp1{intenv}(env0)
val () = intenv_pop0_try1(env0)
prval
((*void*)) = $UN.cast2void(env0) in $raise(exn)
end
end // end of [xinterp_irexp_try0]
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxi00
( ire0
: irexp): irval =
IRVint(int) where
{
val-
IREi00(int) = ire0.node()
} (* end of [auxi00] *)

fun
auxs00
( ire0
: irexp): irval =
IRVstr(str) where
{
val-
IREs00(str) = ire0.node()
} (* end of [auxs00] *)

(* ****** ****** *)

fun
auxint
( ire0
: irexp): irval =
(
IRVint(token2dint(tok))
) where
{
val-
IREint(tok) = ire0.node()
} (* end of [auxint] *)

(* ****** ****** *)

(*
fun
auxbtf
( ire0
: irexp): irval =
let
val-
IREbtf(tok) = ire0.node()
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
IRVbtf
(ifval(c0 = 't', true, false))
) where
{
  val p0 = string2ptr(rep)
  val c0 = $UN.ptr0_get<char>(p0)
}
//
end // end of [auxbtf]
*)
fun
auxbtf
( ire0
: irexp): irval =
(
IRVbtf(token2dbtf(tok))
) where
{
val-IREbtf(tok) = ire0.node()
} (* end of [auxbtf] *)

(* ****** ****** *)

fun
auxchr
( ire0
: irexp): irval =
(
IRVchr(token2dchr(tok))
) where
{
val-IREchr(tok) = ire0.node()
} (* end of [auxchr] *)

(* ****** ****** *)

fun
auxflt
( ire0
: irexp): irval =
(
IRVflt(token2dflt(tok))
) where
{
val-IREflt(tok) = ire0.node()
} (* end of [auxflt] *)

fun
auxstr
( ire0
: irexp): irval =
(
IRVstr(token2dstr(tok))
) where
{
val-IREstr(tok) = ire0.node()
} (* end of [auxstr] *)

(* ****** ****** *)

fun
auxtop
( ire0
: irexp): irval =
(
  IRVnil() ) where
{
val-IREtop(tok) = ire0.node()
}

(* ****** ****** *)

fun
auxvar
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREvar(d2v) = ire0.node()
val
opt =
xinterp_search_d2var(env0, d2v)
//
(*
val () =
println!("auxvar: d2v = ", d2v)
*)
//
in
case- opt of ~Some_vt(irv) => irv
end // end of [auxvar]

(* ****** ****** *)

fun
auxcon1
( env0
: !intenv
, ire0
: irexp): irval =
IRVfun
(
lam(arg) => IRVcon(d2c0, arg)
) where
{
val-IREcon1(d2c0) = ire0.node()
}

(* ****** ****** *)

fun
auxfcon
( env0
: !intenv
, ire0
: irexp): irval =
IRVfun
(
lam(arg) => IRVcon(d2c0, arg)
) where
{
val-IREfcon(d2c0) = ire0.node()
}

(* ****** ****** *)

fun
auxfcst
( env0
: !intenv
, ire0
: irexp): irval =
let
//
// (*
val () =
println!
("auxfcst: ire0 = ", ire0)
// *)
//
val-
IREfcst(d2c) = ire0.node()
//
in
//
if
$D2E.d2cst_fcastq(d2c)
then
IRVfun
(
lam(vs) =>
let
val-
list_cons(v0, _) = vs in v0 
end
) (* end of [then] *)
else
(
  case-
  opt of ~Some_vt(irf) => irf
) where
{
val
opt =
xinterp_search_d2cst(env0, d2c)
} (* end of [else] *)
//
end // end of [auxfcst]

(* ****** ****** *)

fun
auxtcon
( env0
: !intenv
, ire0
: irexp): irval =
IRVfun
(
lam(arg) => IRVcon(d2c0, arg)
) where
{
val-IREtcon(d2c0, _, _) = ire0.node()
}

(* ****** ****** *)

fun
auxtimp
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREtimp
( ire1, targ
, ircl, tsub) = ire0.node()
val-
IREtcst
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
auxfixs
( irfds
: irfundeclist
) : irexplst =
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
IRFUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val f3g = rcd.f3g
val def = rcd.def
//
in
//
case+ f3g of
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
IRElam
(knd, iras, ire2) =>
let
val ire1 =
irexp_make_node
(
body.loc()
,
IREfix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [IRElam]
//
(*
|
IREfix
(knd, d2v, iras, ire2) =>
let
val irdf =
irexp_make_node
(
body.loc()
,
IREfix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-irexp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
irexp_make_node
(
rcd.loc
,
IREfix
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
auxirfd0
( fenv
: irenv
, irfd0
: irfundecl): irval =
let
//
val-
IRFUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
//
val-
Some(iras) = rcd.f3g
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
IRElam
(knd, iras, body) =>
IRVfix1(fenv, nam, iras, body)
)
|
list_cons _ =>
IRVfix1(fenv, nam, iras, body)
//
end // end of [auxirfd0]
//
fun
auxirfds
( fenv
: irenv
, irdfs
: irexplst
, irfds
: irfundeclist
) : irval =
(
case-
irfds of
(*
|
list_nil() =>
IRVerror()
*)
|
list_cons
(irfd0, irfds) =>
let
val+
IRFUNDECL
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
Some(iras) = rcd.f3g
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
IRElam
(knd, iras, body) =>
IRVfixs
(fenv, nam, iras, body, irdfs)
) (* end of [list_nil] *)
|
list_cons _ =>
IRVfixs
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
IRCfundclst
( knd0, mopt
, tqas, irfds) =>
let
//
val
fenv =
intenv_take_fenv(env0)
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
IRCimplmnt3
( knd0, mopt
, sqas, tqas, id2c
, ti3a, ti2s, iras, body
) =>
(
//
case+ iras of
|
list_nil _ =>
xinterp_irexp(env0, body)
|
list_cons _ =>
let
val
fenv =
intenv_take_fenv(env0)
in
  IRVlam1(fenv, iras, body)
end
//
) (* IRCimplmnt3 *)
//
end // end of [auxtimp]

(* ****** ****** *)

fun
auxdapp
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREdapp
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
// (*
//
val loc0 = ire0.loc()
//
val () =
println!
("auxdapp: loc0 = ", loc0)
val () =
println!
("auxdapp: ire0 = ", ire0)
val () =
println!
("auxdapp: irf0 = ", irf0)
val () =
println!
("auxdapp: irvs = ", irvs)
//
// *)
//
in
//
case- irf0 of
//
| IRVfun(fopr) => fopr(irvs)
//
| IRVlam1(_, _, _) =>
  xinterp_fcall_lam(irf0, irvs)
| IRVfix1(_, _, _, _) =>
  xinterp_fcall_fix(irf0, irvs)
| IRVfixs(_, _, _, _, _) =>
  xinterp_fcall_fixs(irf0, irvs)
//
end // end of [auxdapp]

and
auxdfun
( env0
: !intenv
, irf0
: irexp): irval = 
(
  xinterp_irexp(env0, irf0)
)

and
auxdarg
( env0
: !intenv
, npf1: int
, ires
: irexplst): irvalist = 
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
    xinterp_irexp(env0, ire1)
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
: irvalist
, i0: int): irval =
(
case-
irvs of
(*
|
list_nil
() => IRVerror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

in(* in-of-local*)

fun
auxpcon
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREpcon
( ire1
, lab2) = ire0.node()
val
irv1 =
xinterp_irexp(env0, ire1)
in
case- irv1 of
|
IRVcon
(d2c1, irvs) =>
(
  auxget_at(irvs, idx2)
) where
{
  val
  idx2 = pcon_lab2idx(lab2)
}
end // end of [auxpcon]

fun
auxpbox
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREpbox
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
xinterp_irexp(env0, ire1)
in
//
case- irv1 of
|
IRVtrcd1
(knd, irvs) =>
auxget_at(irvs, idx2)
//
end // end of [auxpbox]

fun
auxproj
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val
loc0 = ire0.loc()
val () =
println!
("auxproj: loc0 = ", loc0)
val () =
println!
("auxproj: ire0 = ", ire0)
//
val-
IREproj
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
xinterp_irexp(env0, ire1)
in
//
case- irv1 of
|
IRVtrcd1
(knd, irvs) => auxget_at(irvs, idx2)
//
end // end of [auxproj]

fun
auxplft
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREplft
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
xinterp_irexp(env0, ire1)
in
//
case- irv1 of
|
IRVlft(irlv) =>
IRVlft(IRLFTpflt(irlv, lab2, idx2))
//
end // end of [auxplft]

fun
auxpptr
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREpptr
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
xinterp_irexp(env0, ire1)
in
//
case- irv1 of
|
IRVlft(irlv) =>
IRVlft(IRLFTpflt(irlv, lab2, idx2))
//
end // end of [auxpptr]

end // end of [local]

(* ****** ****** *)

fun
aux_let
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IRElet
( ircs
, ire1) = ire0.node()
//
val () =
intenv_push_let1(env0)
//
val () =
xinterp_irdclist(env0, ircs)
//
val
irv0 = xinterp_irexp(env0, ire1)
//
in
let
val () =
intenv_pop0_let1(env0) in irv0 end
end // end of [aux_let]

fun
aux_where
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREwhere
( ire1
, ircs) = ire0.node()
//
val () =
intenv_push_let1(env0)
//
val () =
xinterp_irdclist(env0, ircs)
//
val
irv0 = xinterp_irexp(env0, ire1)
//
in
let
val () =
intenv_pop0_let1(env0) in irv0 end
end // end of [aux_where]

(* ****** ****** *)

fun
aux_seqn
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREseqn
( ires
, ire1) = ire0.node()
//
in
let
fun
auxlst
( env0
: !intenv
, ires
: irexplst): void =
(
case+ ires of
| list_nil() => ()
| list_cons
  (irea, ires) =>
  (
  auxlst(env0, ires)
  ) where
  {
(*
  val () =
  println!
  ("auxlst: irea = ", irea)
*)
  val-
  IRVnil() = irva where
  {
  val irva =
  xinterp_irexp(env0, irea)
(*
  val ((*void*)) =
  println!("auxlst: irva = ", irva)
*)
  }
//
  } (* where *)
) (* end of [auxlst] *)
val () =
  auxlst(env0, ires)
in
  xinterp_irexp(env0, ire1)
end
end // end of [aux_seqn]

(* ****** ****** *)

fun
aux_trcd1
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREtrcd1
( knd0
, npf1
, ires) = ire0.node()
//
fun
auxlst
( env0
: !intenv
, npf1: int
, ires
: irexplst
) : irvalist =
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
irv1 = xinterp_irexp(env0, ire1)
}
) (* end of [list_cons] *)
)
//
in
(
if
(knd0 > 0)
then
IRVtrcd1(knd0, irvs)
else
(
case+ irvs of
|
list_nil _ => IRVnil()
|
list_cons _ => IRVtrcd1(knd0, irvs)
)
) where
{
  val irvs = auxlst(env0, npf1, ires)
}
end // end of [aux_trcd1]

(* ****** ****** *)

local

fun
auxget_at
( irvs
: irvalist
, i0: int): irval =
(
case-
irvs of
(*
|
list_nil
() => IRVerror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

(* ****** ****** *)

fun
auxfset_at
( irvs
: irvalist
, i0: int
, irvr: irval): irvalist =
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
(
irv0
,
let
val i1 = i0-1
in
auxfset_at(irvs, i1, irvr)
end
)
)
//
) (* end of [auxfset_at] *)

(* ****** ****** *)

fun
auxlset_at
( xs
: !List0_vt(irval)
, i0: int, y0: irval): void =
(
case+ xs of
|list_vt_nil() => ()
|
@list_vt_cons(x0, xs1) =>
(
 if
 (i0 <= 0)
 then 
 fold@(xs) where
 {
   val () = (x0 := y0)
 }
 else
 fold@(xs) where
 {
   val () = auxlset_at(xs1, i0-1, y0)
 }
) (* list_vt_cons *)
) (* end of [auxlset_at] *)

in(*in-of-local*)

fun
aux_assgn
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREassgn
( irel
, irer) = ire0.node()
val
irvl = 
xinterp_irexp(env0, irel)
val
irvr = 
xinterp_irexp(env0, irer)
//
val () =
println!
("aux_assgn: ire0 = ", ire0)
val () =
println!
("aux_assgn: irvl = ", irvl)
val () =
println!
("aux_assgn: irvr = ", irvr)
//
in
case- irvl of
|
IRVlft(irlv) =>
(
case+ irlv of
|
IRLFTref(r0) =>
(
  IRVnil(*void*)
) where
{
  val () =
  ( r0[] := Some(irvr) )
} (* end of [IRLFTref] *)
|
//
IRLFTpcon
(_, lab2) =>
(
  IRVnil(*void*)
) where
{
val () =
aux_assgn_pcon(irvr, irlv)
}
//
|
IRLFTpbox
(_, _, _) =>
(
  IRVnil(*void*)
) where
{
val () =
aux_assgn_pbox(irvr, irlv)
}
|
IRLFTpflt
(_, _, _) =>
(
  IRVnil(*void*)
) where
{
val () =
aux_assgn_pflt(irvr, irlv)
}
)
|
IRVptr(p0) =>
(
  IRVnil()
) where
{
val () =
$UN.ptr0_set<irval>(p0, irvr)
}
//
end // end of [aux_assgn]
//
and
aux_assgn_pcon
( irvr: irval
, irlv: irlftv): void =
let
//
val-
IRLFTpcon
(irv1, lab2) = irlv
val
idx2 = pcon_lab2idx(lab2)
//
val-
IRVcon(d2c1, irvs) = irv1
//
in
{
//
typedef x0 = irval
//
val
irvs =
$UN.castvwtp0
{List0_vt(x0)}(irvs)
//
val () =
auxlset_at(irvs, idx2, irvr)
//
prval () = $UN.cast2void(irvs)
//
}
end
// end of [aux_assgn_pcon]
//
and
aux_assgn_pbox
( irvr: irval
, irlv: irlftv): void =
let
//
val-
IRLFTpbox
(irv1, _, idx2) = irlv
//
val-
IRVtrcd1(knd, irvs) = irv1
val () = assertloc(knd > 0)
//
in
{
//
typedef x0 = irval
//
val
irvs =
$UN.castvwtp0
{List0_vt(x0)}(irvs)
//
val () =
auxlset_at(irvs, idx2, irvr)
//
prval () = $UN.cast2void(irvs)
//
}
end
// end of [aux_assgn_pbox]
and
aux_assgn_pflt
( irvr: irval
, irlv: irlftv) : void =
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
auxlst_up
( irlv
: irlftv): irvalist =
(
case- irlv of
| IRLFTref(r0) =>
  (
    list_sing(x0)
  ) where
  {
    val-Some(x0) = r0[]
  }
| IRLFTpflt
  (irlv, lab2, idx2) =>
  let
  val
  irvs = auxlst_up(irlv)
  val-
  list_cons(irv1, _) = irvs
  in
  //
  case- irv1 of
  | IRVtrcd1
    (knd, xs) =>
    list_cons
    (auxget_at(xs, idx2), irvs)
  //
  end // end of [IRVproj]
)
//
fun
auxlst_dn
( irvr: irval
, irvs: irvalist
, irlv: irlftv): void =
(
case- irlv of
|
IRLFTref(r0) =>
(r0[] := Some(irvr))
|
IRLFTpflt
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
  IRVtrcd1(knd, xs) = irv1
  in
  IRVtrcd1
  ( knd
  , auxfset_at(xs, idx2, irvr))
  end
}
) (* end of [auxlst_dn] *)
//
} (* end of [aux_assgn_pflt] *)

end // end of [local]

(* ****** ****** *)

fun
aux_ift1
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREift1
( ire1
, ire2
, opt3) = ire0.node()
//
val
irv1 =
xinterp_irexp(env0, ire1)
//
(*
val () =
println!
("aux_ift1: ire1 = ", ire1)
val () =
println!
("aux_ift1: irv1 = ", irv1)
*)
//
in
//
case- irv1 of
|
IRVbtf(btf) =>
if
btf
then
xinterp_irexp(env0, ire2)
else
(
case+ opt3 of
| None() => IRVnil()
| Some(ire3) =>
  xinterp_irexp(env0, ire3)
)
//
end // end of [aux_ift1]

(* ****** ****** *)

fun
aux_case
( env0
: !intenv
, ire0
: irexp): irval =
(
case- opt2 of
(*
| ~None_vt() =>
   IRVerror((*void*))
*)
| ~Some_vt(irv2) => irv2
) where
{
//
val-
IREcase
( knd
, ire1
, ircls) = ire0.node()
//
// (*
//
val loc0 = ire0.loc()
//
val () =
println!("aux_case: loc0 = ", loc0)
val () =
println!("aux_case: ire0 = ", ire0)
// *)
//
val
irv1 =
xinterp_irexp(env0, ire1)
//
(*
val () =
println!("aux_case: irv1 = ", irv1)
*)
//
val
opt2 =
xinterp_irclaulst(env0, irv1, ircls)
//
} (* end of [aux_case] *)

(* ****** ****** *)

fun
aux_lam
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IRElam
( knd0
, iras, body) = ire0.node()
in
(
  IRVlam1
  (fenv, iras(*arg*), body)
) where
{
  val
  fenv = intenv_take_fenv(env0)
}
end // end of [aux_lam]

fun
aux_fix
( env0
: !intenv
, ire0
: irexp): irval =
let
val-
IREfix
( knd0
, d2v0
, iras, body) = ire0.node()
in
(
IRVfix1
( fenv
, d2v0(*fid*), iras(*arg*), body)
) where
{
  val
  fenv = intenv_take_fenv(env0)
}
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_try0
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREtry0
( ire1
, ircls) = ire0.node()
//
val () =
intenv_push_try1(env0)
//
val env0 =
$UN.castvwtp1{ptr}(env0)
//
in
//
try
let
val
env0 =
$UN.castvwtp0{intenv}(env0)
val
irv1 =
xinterp_irexp_try0(env0, ire1)
val () = intenv_pop0_try1(env0)
//
prval
((*void*)) = $UN.cast2void(env0)
in
  irv1
end
with
~IREXN(irx1) =>
let
val
env0 =
$UN.castvwtp0{intenv}(env0)
val
opt2 =
xinterp_irclaulst(env0, irx1, ircls)
prval ((*void*)) = $UN.cast2void(env0)
in
case- opt2 of
(*
| ~None_vt() =>
   IRVerror((*void*))
*)
| ~Some_vt(irv2) => irv2
end
//
end (* end of [aux_try0] *)

(* ****** ****** *)
//
fun
aux_addr
( env0
: !intenv
, ire0: irexp): irval =
let
//
(*
val () =
println!
("aux_addr: ire0 = ", ire0)
*)
//
val-
IREaddr(ire1) = ire0.node()
//
in
//
case-
ire1.node() of
|
IREflat(ire2) => 
(
  xinterp_irexp(env0, ire2)
)
|
IREeval(1(*ptr*), ire2) =>
(
  xinterp_irexp(env0, ire2)
)
|
IREpcon
(ire2, lab2) =>
let
val
irv2 =
xinterp_irexp(env0, ire2)
in
IRVlft(IRLFTpcon(irv2, lab2))
end
|
IREpbox
(ire2, lab2, idx2) =>
let
val
irv2 =
xinterp_irexp(env0, ire2)
in
IRVlft(IRLFTpbox(irv2, lab2, idx2))
end
//
end // end of [aux_addr]
//
(* ****** ****** *)

fun
aux_eval
( env0
: !intenv
, ire0: irexp): irval =
let
//
val loc0 = ire0.loc()
//
val-
IREeval
(knd0, ire1) = ire0.node()
//
val
irv1 = xinterp_irexp(env0, ire1)
//
// (*
val () =
println!("aux_eval: loc0 = ", loc0)
val () =
println!("aux_eval: ire1 = ", ire1)
val () =
println!("aux_eval: irv1 = ", irv1)
// *)
//
in
//
case- irv1 of
//
| IRVlft
  (irlv) =>
  aux_eval_irlv(irlv)
//
| IRVptr
  (ptr0) =>
  $UN.ptr0_get<irval>(ptr0)
//
| IRVlazy
  (ref0) => aux_eval_lazy(ref0)
//
| IRVllazy
  (fenv, ire1, ires) =>
  aux_eval_llazy(fenv, ire1, ires)
//
end // end of [aux_eval]
//
and
aux_eval_irlv
(x0: irlftv): irval =
let
//
fun
auxget_at
( irvs
: irvalist
, i0: int): irval =
(
case-
irvs of
(*
|
list_nil
() => IRVerror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)
in
case- x0 of
|
IRLFTref(r0) =>
let
  val-Some(irv0) = r0[] in irv0
end
|
IRLFTpcon
(irv1, lab2) =>
let
val-
IRVcon
(d2c1, irvs) = irv1
in
(
  auxget_at(irvs, idx2)
) where
{
  val idx2 = pcon_lab2idx(lab2)
}
end
|
IRLFTpflt
(x1, lab2, idx2) =>
let
val
irv1 = aux_eval_irlv(x1)
in
//
case- irv1 of
|
IRVtrcd1(knd, irvs) =>
let
val () = // flat
assertloc(knd=0) in auxget_at(irvs, idx2)
end
//
end
end (* end of [aux_eval_irlv] *)
//
and
aux_eval_lazy
( r0
: ref(irlazv)): irval =
(
case+ r0[] of
//
|
IRLAZval(irv2) => irv2
//
|
IRLAZexp(fenv, ire2) =>
let
  val env0 =
  intenv_make_fenv(fenv)
  val
  irv2 =
  xinterp_irexp_fun(env0, ire2)
in
  r0[] := IRLAZval(irv2);
  let
  val () = intenv_free_fenv(env0) in irv2
  end
end // IRLFTexp(fenv, ire2)
) (* end of [aux_eval_lazy] *)

and
aux_eval_llazy
( fenv: irenv
, ire1: irexp
, ires: irexplst): irval =
let
  val env0 =
  intenv_make_fenv(fenv)
  val
  irv1 = xinterp_irexp_fun(env0, ire1)
in
  let
  val () = intenv_free_fenv(env0) in irv1
  end
end

(* ****** ****** *)
fun
aux_fold
( env0
: !intenv
, ire0: irexp): irval =
( IRVnil() ) where
{
val-
IREfold(ire1) = ire0.node()
}
//
fun
aux_free
( env0
: !intenv
, ire0: irexp): irval =
( IRVnil() ) where
{
val-
IREfree(knd0, ire1) = ire0.node()
}
//
(* ****** ****** *)

fun
aux_raise
( env0
: !intenv
, ire0: irexp): irval =
let
//
val-
IREraise(ire1) = ire0.node()
//
val
irv1 = xinterp_irexp(env0, ire1)
in
let
val () =
($raise IREXN(irv1)){void} in IRVerror()
end
end

(* ****** ****** *)
//
fun
aux_lazy
( env0
: !intenv
, ire0: irexp): irval =
let
//
val-
IRElazy(ire1) = ire0.node()
//
val
fenv = intenv_take_fenv(env0)
//
in
IRVlazy(ref(IRLAZexp(fenv, ire1)))
end
//
fun
aux_llazy
( env0
: !intenv
, ire0: irexp): irval =
let
//
val-
IREllazy
( ire1
, opt2(*free*)) = ire0.node()
//
in
(
  IRVllazy(fenv, ire1, opt2)
) where
{
  val fenv = intenv_take_fenv(env0)
}
end
//
(* ****** ****** *)

local

fun
auxget_at
( irvs
: irvalist
, i0: int): irval =
(
case-
irvs of
(*
|
list_nil
() => IRVerror()
*)
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
: !intenv
, ire0
: irexp): irval =
let
val-
IREflat
  (ire1) = ire0.node()
//
in
  aux_flat_main(env0, ire1)
end
and
aux_flat_main
( env0
: !intenv
, ire0
: irexp): irval =
let
//
(*
val () =
println!
("aux_flat_main: ire0 = ", ire0)
*)
//
in
case-
ire0.node() of
|
IREvar _ =>
let
val
irv0 = auxvar(env0, ire0)
in
//
case- irv0 of
|
IRVlft
( irlv ) =>
(
case- irlv of
|
IRLFTref(r0) =>
let
val-Some(irv1) = r0[] in irv1
end
|
IRLFTpcon
(irv1, lab2) =>
let
val-
IRVcon(d2c1, irvs) = irv1
in
(
  auxget_at( irvs, idx2 )
) where
{
  val idx2 = pcon_lab2idx(lab2)
}
end // end of [IRLFTpcon]
//
|
IRLFTpbox
(irv1, lab2, idx2) =>
(
  auxget_at(irvs, idx2)
) where
{
val-IRVtrcd1(knd0, irvs) = irv1
} (* end of [IRLFTpbox] *)
//
(*
|
IRLFTpflt _ => // can it happen?
*)
//
) (* end of [IRVlft] *)
//
end (* end of [IREvar] *)
|
IREplft
(ire1, lab2, idx2) =>
let
val
irv1 = aux_flat_main(env0, ire1)
in
case- irv1 of
|
IRVtrcd1
(knd, irvs) => auxget_at(irvs, idx2)
end // end of [IREplft]
//
end (* let *) // end of [aux_flat_main]

end // end of [local]

(* ****** ****** *)

fun
aux_talf
( env0
: !intenv
, ire0
: irexp): irval =
let
//
val-
IREtalf(ire1) = ire0.node()
//
// (*
val () =
println!("aux_talf: ire1 = ", ire1)
// *)
//
in
case-
ire1.node() of
|
IREflat
(ire1) =>
xinterp_irexp(env0, ire1)
|
IREpcon
(ire1, lab2) =>
let
val
irv1 =
xinterp_irexp(env0, ire1)
in
IRVlft(IRLFTpcon(irv1, lab2))
end // end of [IREpcon]
|
IREpbox
(ire1, lab2, idx2) =>
let
val
irv1 = xinterp_irexp(env0, ire1)
in
IRVlft(IRLFTpbox(irv1, lab2, idx2))
end // end of [IREpbox]
|
IREeval(knd0, ire1) =>
let
val () =
assertloc(knd0=1) in xinterp_irexp(env0, ire1)
end // end of [IREeval]
//
end // end of [aux_talf]

(* ****** ****** *)

in (* in-of-local *)

implement
xinterp_irexp
  (env0, ire0) =
let
//
(*
val () =
println!
("xinterp_irexp: ire0 = ", ire0)
*)
//
in
//
case+
ire0.node() of
//
| IREi00 _ => auxi00(ire0)
| IREs00 _ => auxs00(ire0)
//
| IREint _ => auxint(ire0)
| IREbtf _ => auxbtf(ire0)
| IREchr _ => auxchr(ire0)
| IREflt _ => auxflt(ire0)
| IREstr _ => auxstr(ire0)
//
| IREtop _ => auxtop(ire0)
//
| IREvar _ => auxvar(env0, ire0)
//
| IREcon1 _ => auxcon1(env0, ire0)
//
| IREfcon _ => auxfcon(env0, ire0)
| IREfcst _ => auxfcst(env0, ire0)
//
| IREtcon _ => auxtcon(env0, ire0)
(*
| IREtcst _ => auxtcst(env0, ire0)
*)
//
| IREtimp _ => auxtimp(env0, ire0)
//
| IREdapp _ => auxdapp(env0, ire0)
//
| IREpcon _ => auxpcon(env0, ire0)
| IREpbox _ => auxpbox(env0, ire0)
| IREproj _ => auxproj(env0, ire0)
| IREplft _ => auxplft(env0, ire0)
| IREpptr _ => auxpptr(env0, ire0)
//
|
IRElet
(ircs, ire1) => aux_let(env0, ire0)
|
IREwhere
(ire1, ircs) => aux_where(env0, ire0)
//
|
IREseqn
(ires, ire1) => aux_seqn(env0, ire0)
//
|
IREtrcd1
(_, _, ires) => aux_trcd1(env0, ire0)
(*
|
IREtrcd2
(_, _, ires) => aux_trcd2(env0, ire0)
*)
//
|
IREassgn
(irel, irer) => aux_assgn(env0, ire0)
//
| IREift1
  ( _, _, _ ) => aux_ift1(env0, ire0)
  // IREift1
| IREcase
  ( _, _, _ ) => aux_case(env0, ire0)
  // IREcase
//
| IRElam
  ( _, _, _ ) => aux_lam(env0, ire0)
  // IRElam
| IREfix
  (_, _, _, _) => aux_fix(env0, ire0)
  // IREfix
//
| IREtry0
  (ire1, ircls) => aux_try0(env0, ire0)
  // IREtry0
//
| IREaddr(ire1) => aux_addr(env0, ire0)
| IREflat(ire1) => aux_flat(env0, ire0)
| IREtalf(ire1) => aux_talf(env0, ire0)
//
| IREfold(ire1) => aux_fold(env0, ire0)
//
| IREeval(_, _) => aux_eval(env0, ire0)
| IREfree(_, _) => aux_free(env0, ire0)
//
| IREraise(ire1) => aux_raise(env0, ire0)
//
| IRElazy(ire1) => aux_lazy(env0, ire0)
| IREllazy(_, _) => aux_llazy(env0, ire0)
//
| IREnone0((*void*)) => IRVnil(*void*)
//
| _(* rest-of-irexp *) => IRVnone1(ire0)
//
end // end of [xinterp_irexp]

end // end of [local]

(* ****** ****** *)

implement
xinterp_irexplst
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
    xinterp_irexp(env0, ire0)
    val irvs =
    xinterp_irexplst(env0, ires)
  }
) (* end of [xinterp_irexplst] *)

(* ****** ****** *)

implement
xinterp_irexpopt
  (env0, opt1) =
(
case+ opt1 of
| None() =>
  None(*void*)
| Some(ire1) =>
  Some(xinterp_irexp(env0, ire1))
) (* end of [xinterp_irexpopt] *)

(* ****** ****** *)

local

fun
auxnpf
( npf1: int
, irps
: irpatlst): irpatlst =
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
xinterp_fcall_lam
  (irf0, irvs) =
let
val-
IRVlam1
( fenv
, iras, body) = irf0
val env0 =
intenv_make_fenv(fenv)
in
let
//
val-
list_cons
(ira0, iras) = iras
val+
IRARGsome
(npf1, irps) = ira0
//
val
irps = auxnpf(npf1, irps)
//
val () =
xinterp_irpatlst_ck1(env0, irps, irvs)
//
val irv0 =
(
case+ iras of
|
list_nil() =>
( irv0 ) where
{
  val irv0 =
  xinterp_irexp_fun(env0, body)
}
|
list_cons _ =>
(
  IRVlam1(fenv, iras, body)
) where
{
  val fenv = intenv_take_fenv(env0)
}
) : irval // end of [val]
//
in
  let
  val () = intenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [xinterp_fcall_lam]

(* ****** ****** *)

implement
xinterp_fcall_fix
  (irf0, irvs) =
let
val-
IRVfix1
( fenv
, d2v0
, iras, body) = irf0
val env0 =
intenv_make_fenv(fenv)
val ((*void*)) =
intenv_bind_fix(env0, irf0)
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  IRARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  xinterp_irpatlst_ck1(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil _ =>
    ( irv0 ) where
    {
      val irv0 =
      xinterp_irexp_fun(env0, body)
    }
  | list_cons _ =>
    (
    IRVlam1(fenv, iras, body)
    ) where
    {
      val fenv = intenv_take_fenv(env0)
    }
  ) : irval // end of [val]
in
  let
  val () = intenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [xinterp_fcall_fix]

(* ****** ****** *)

implement
xinterp_fcall_fixs
  (irf0, irvs) =
let
val-
IRVfixs
( fenv
, d2v0
, iras
, body, irdfs) = irf0
//
val env0 =
intenv_make_fenv(fenv)
val ((*void*)) =
intenv_bind_fixs(env0, irf0)
//
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  IRARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  xinterp_irpatlst_ck1(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil _ =>
    ( irv0 ) where
    {
      val irv0 =
      xinterp_irexp_fun(env0, body)
    }
  | list_cons _ =>
    (
    IRVlam1(fenv, iras, body)
    ) where
    {
      val fenv = intenv_take_fenv(env0)
    }
  ) : irval // end of [val]
in
  let
  val () = intenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [xinterp_fcall_fixs]

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0:
! intenv
, irdcl: irdcl): void =
let
//
val-
IRCinclude
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
  xinterp_irdclist(env0, xs)
end // end of [aux_include]

(* ****** ****** *)

fun
aux_valdclst
( env0:
! intenv
, irdcl: irdcl): void =
let
val-
IRCvaldclst
( knd
, mopt
, irvds) = irdcl.node()
in
  xinterp_irvaldeclist(env0, irvds)
end // end of [aux_valdclst]

(* ****** ****** *)

fun
aux_vardclst
( env0:
! intenv
, irdcl: irdcl): void =
let
val-
IRCvardclst
( knd
, mopt
, irvds) = irdcl.node()
in
  xinterp_irvardeclist(env0, irvds)
end // end of [aux_vardclst]

(* ****** ****** *)

fun
aux_fundclst
( env0:
! intenv
, irdcl: irdcl): void =
let
val-
IRCfundclst
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
xinterp_irfundeclist(env0, irfds)
//
end // end of [aux_fundclst]

(* ****** ****** *)

in(*in-of-local*)

implement
xinterp_irdcl
  (env0, x0) =
let
//
(*
val () =
println!
("xinterp_irdcl: x0 = ", x0)
*)
//
in
case+
x0.node() of
//
|
IRCinclude _ =>
(
  aux_include(env0, x0)
)
//
| IRClocal
  (head, body) =>
{
  val () =
  xinterp_irdclist(env0, head)
  val () =
  xinterp_irdclist(env0, body)
}
//
| IRCvaldclst _ =>
  aux_valdclst(env0, x0)
//
| IRCvardclst _ =>
  aux_vardclst(env0, x0)
//
| IRCfundclst _ =>
  aux_fundclst(env0, x0)
//
| IRCimplmnt3 _ =>
  xinterp_irimplmnt3(env0, x0)
//
| _(* rest-of-irdcl *) => ()
//
end // end of [xinterp_irdcl]

end // end of [local]

(* ****** ****** *)

implement
xinterp_irdclist
  (env0, xs) =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
let
  val () =
  xinterp_irdcl(env0, x0)
in
  xinterp_irdclist(env0, xs)
end // end of [list_cons]
) (* end of [xinterp_irdclist] *)

(* ****** ****** *)

fun
xinterp_d2con_ck0
( d2c1
: d2con
, d2c2
: d2con ) : bool =
let
val tag1 = d2c1.ctag((*void*))
in
if
(tag1 < 0)
then (d2c1 = d2c2)
else (tag1 = d2c2.ctag((*void*)))
// end of [if]
end // end of [xinterp_d2con_ck0]

(* ****** ****** *)

implement
xinterp_irpat_ck0
  (irp0, irv0) =
let
//
(*
val () =
println!
("xinterp_irpat_ck0: irp0 = ", irp0)
val () =
println!
("xinterp_irpat_ck0: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
IRPany _ => true
|
IRPvar _ => true
//
|
IRPint
( int1 ) =>
(
case- irv0 of
|
IRVint(int0) => (int0=int1)
)
|
IRPbtf
( btf1 ) =>
(
case- irv0 of
|
IRVbtf(btf0) => (btf0=btf1)
)
|
IRPchr
( chr1 ) =>
(
case- irv0 of
|
IRVchr(chr0) => (chr0=chr1)
)
//
|
IRPbang
( irp1 ) =>
xinterp_irpat_ck0(irp1, irv0)
|
IRPflat
( irp1 ) =>
xinterp_irpat_ck0(irp1, irv0)
|
IRPfree
( irp1 ) =>
xinterp_irpat_ck0(irp1, irv0)
//
|
IRPcapp
(d2c0, irps) =>
(
case- irv0 of
|
IRVcon(d2c1, irvs) =>
if
(
xinterp_d2con_ck0(d2c0, d2c1)
)
then
xinterp_irpatlst_ck0(irps, irvs)
else false
)
//
|
IRPtrcd1(knd0, irps) =>
(
case- irv0 of
|
IRVtrcd1(knd1, irvs) =>
let
val () =
assertloc(knd0 = knd1)
in
xinterp_irpatlst_ck0(irps, irvs)
end
)
//
end (* end of [xinterp_irpat_ck0] *)

implement
xinterp_irpatlst_ck0
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
  xinterp_irpat_ck0(irp0, irv0)  
in
//
  if ans
  then xinterp_irpatlst_ck0(irps, irvs)
  else false
//
end // end of [list_cons]
) (* end of [xinterp_irpatlst_ck0] *)

(* ****** ****** *)

fun
irpat_flatq
(irp0: irpat) =
(
case+
irp0.node() of
//
|
IRPcapp
(d2c0, irps) => auxlst(irps)
//
|
IRPtrcd1
(knd0, irps) =>
if
(knd0 != 0)
then auxlst(irps) else false
//
| _ (* non-con-trcd1 *) => false
) where
{
fun
auxlst
( xs
: irpatlst): bool =
(
case+ xs of
| list_nil() => false
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | IRPbang _ => true | _ => auxlst(xs)
  )
)
} (* end of [irpat_flatq] *)

(* ****** ****** *)
//
(*
HX-2020-07-10:
Lefitization needs to
be annotated explicitly;
in the following patterns,
[x0] is a val but [xs] is a var:
//
@list_cons(x0, !xs) // xs: read-only
@list_vt_cons(x0, !xs) // xs: writable
//
*)
(*
fun
irpat_irlvize0
( env0
: !intenv
, irp1: irpat
, irv0: irval): void =
(
case+
irp1.node() of
|
IRPcapp
(d2c1, irps) =>
auxirps(env0, 0(*index*), irps)
|
_ (*non-IRPcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intenv
, i0: int
, irp1: irpat): void =
(
case+
irp1.node() of
|
IRPvar(d2v1) =>
(
xinterp_insert_d2var
  (env0, d2v1, irv1)
) where
{
val lab2 =
$LAB.label_make_int(i0)
val irv1 =
IRVlft(IRLFTpcon(irv0, lab2))
}
|
_(*non-IRPvar*) =>
let
val
irv1 = irval_con_arg(irv0, i0)
in
xinterp_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intenv
, i0: int
, irps: irpatlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, ir+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [irpat_irlvize0] *)
*)
//
(* ****** ****** *)

fun
irpat_irlvize1_con
( env0
: !intenv
, irp1: irpat
, irv0: irval): void =
(
case+
irp1.node() of
|
IRPcapp
(d2c1, irps) =>
auxirps(env0, 0(*index*), irps)
|
_ (*non-IRPcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intenv
, i0: int
, irp1: irpat): void =
(
case+
irp1.node() of
|
IRPbang(irp2) =>
(
case+
irp2.node() of
|
IRPvar(d2v1) =>
(
xinterp_insert_d2var
  (env0, d2v1, irv1)
) where
{
val lab2 =
$LAB.label_make_int(i0)
val irv1 =
IRVlft(IRLFTpcon(irv0, lab2))
}
|
_(*non-IRPvar*) =>
let
val
irv1 = irval_con_arg(irv0, i0)
in//let
xinterp_irpat_ck1(env0, irp1, irv1)
end//let
)
|
_(*non-IRPbang*) =>
let
val
irv1 = irval_con_arg(irv0, i0)
in
xinterp_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intenv
, i0: int
, irps: irpatlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, i0+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [irpat_irlvize1_con] *)

(* ****** ****** *)

fun
irpat_irlvize1_trcd1
( env0
: !intenv
, irp1: irpat
, irv0: irval): void =
(
case+
irp1.node() of
|
IRPtrcd1
(knd0, irps) =>
auxirps(env0, 0(*ir*), irps)
|
_ (*non-IRPcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intenv
, i0: int
, irp1: irpat): void =
(
case+
irp1.node() of
|
IRPbang(irp2) =>
(
case+
irp2.node() of
|
IRPvar(d2v1) =>
(
xinterp_insert_d2var
  (env0, d2v1, irv1)
) where
{
val lab2 =
$LAB.label_make_int(i0)
val irv1 =
IRVlft(IRLFTpbox(irv0, lab2, i0))
}
|
_(*non-IRPvar*) =>
let
val
irv1 = irval_trcd1_arg(irv0, i0)
in
xinterp_irpat_ck1(env0, irp1, irv1)
end
)
|
_(*non-IRPbang*) =>
let
val
irv1 = irval_trcd1_arg(irv0, i0)
in
xinterp_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intenv
, i0: int
, irps: irpatlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, i0+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [irpat_irlvize1_trcd1] *)

(* ****** ****** *)

implement
xinterp_irpat_ck1
( env0
, irp0, irv0 ) = let
//
(*
val () =
println!
("xinterp_irpat_ck1: irp0 = ", irp0)
val () =
println!
("xinterp_irpat_ck1: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
IRPnil() =>
(
case- irv0 of
|
IRVnil() => ()
)
|
IRPany() => ()
|
IRPvar(d2v0) =>
{
val () =
xinterp_insert_d2var
  (env0, d2v0, irv0)
} (* end of [IRPvar] *)
//
|
IRPint(int1) =>
(
case- irv0 of
| IRVint(int0) => ()
)
|
IRPbtf(btf1) =>
(
case- irv0 of
| IRVbtf(btf0) => ()
)
|
IRPchr(chr1) =>
(
case- irv0 of
| IRVchr(chr0) => ()
)
|
IRPstr(str1) =>
(
case- irv0 of
| IRVstr(str0) => ()
)
//
|
IRPflat(irp1) =>
(
(*
irpat_irlvize0(env0, irp1, irv0)
*)
) where
{
val () =
xinterp_irpat_ck1(env0, irp1, irv0)
}
|
IRPbang(irp1) =>
xinterp_irpat_ck1(env0, irp1, irv0)
|
IRPfree(irp1) =>
xinterp_irpat_ck1(env0, irp1, irv0)
//
|
IRPcapp(d2c0, irps) =>
(
let
val
test =
irpat_flatq(irp0)
in
if
test
then
(
irpat_irlvize1_con(env0, irp0, irv0)
)
else
(
case- irv0 of
|
IRVcon(d2c1, irvs) =>
xinterp_irpatlst_ck1(env0, irps, irvs)
)
end // end of [let]
)
//
|
IRPtrcd1(knd0, irps) =>
(
let
val
test =
irpat_flatq(irp0)
in
if
test
then
(
irpat_irlvize1_trcd1
( env0, irp0, irv0 )
)
else
(
case- irv0 of
|
IRVtrcd1(knd1, irvs) =>
let
val () = assertloc(knd0 = knd1)
in
xinterp_irpatlst_ck1(env0, irps, irvs)
end
)
end
)
//
end (* end of [xinterp_irpat_ck1] *)

implement
xinterp_irpatlst_ck1
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
  xinterp_irpat_ck1(env0, irp0, irv0)  
in
  xinterp_irpatlst_ck1(env0, irps, irvs)
end // end of [list_cons]
) (* end of [xinterp_irpatlst_ck1] *)

(* ****** ****** *)

implement
xinterp_irgpat_ck2
  (env0, irgp, irv0) =
(
case+
irgp.node() of
|
IRGPATpat(irp0) =>
(
  test
) where
{
val
test =
xinterp_irpat_ck0(irp0, irv0)
val () =
if test then
xinterp_irpat_ck1(env0, irp0, irv0)
}
|
IRGPATgua(irp0, irgs) =>
let
val
test =
xinterp_irpat_ck0(irp0, irv0)
val () =
if test then
xinterp_irpat_ck1(env0, irp0, irv0)
in
if
test
then
xinterp_irgualst_ck2(env0, irgs) else false
end // end of [let]
) (* end of [xinterp_irgpat_ck2] *)

(* ****** ****** *)
//
implement
xinterp_irgua_ck2
  (env0, irg0) =
(
case+
irg0.node() of
|
IRGUAexp(ire1) =>
let
val irv1 =
xinterp_irexp(env0, ire1)
in
case- irv1 of IRVbtf(tf) => tf
end
|
IRGUAmat(ire1, irp1) =>
let
val irv1 =
xinterp_irexp(env0, ire1)
val test =
xinterp_irpat_ck0(irp1, irv1)
in
if
test
then
xinterp_irpat_ck1(env0, irp1, irv1); test
end
)
//
implement
xinterp_irgualst_ck2
  (env0, irgs) =
(
case+ irgs of
|
list_nil() => true
|
list_cons(irg0, irgs) =>
if
xinterp_irgua_ck2(env0, irg0)
then
xinterp_irgualst_ck2(env0, irgs) else false
) (* end of [xinterp_irgualst_ck2] *)
//
(* ****** ****** *)

implement
xinterp_irclau
(env0, irv0, ircl) =
let
//
(*
val () =
println!
("xinterp_irclau: irv0 = ", irv0)
val () =
println!
("xinterp_irclau: ircl = ", ircl)
*)
//
in
//
case+
ircl.node() of
|
IRCLAUpat(irgp) =>
let
val () =
intenv_push_let1(env0)
val test =
xinterp_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
  if
  test
  then
  Some_vt(IRVerror()) else None_vt()
) : Option_vt(irval)
in
let
val () = intenv_pop0_let1(env0) in opt0
end
end
|
IRCLAUexp(irgp, ire1) =>
let
val () =
intenv_push_let1(env0)
val test =
xinterp_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
if
test
then
(
Some_vt(irv1)
) where
{
val
irv1 = xinterp_irexp(env0, ire1)
}
else
(
  None_vt(*void*)
)
) : Option_vt(irval)
in
  let
  val () = intenv_pop0_let1(env0) in opt0
  end
end // end of [IRCLAUexp]
//
end (* end of [xinterp_irclau] *)

(* ****** ****** *)

implement
xinterp_irclaulst
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
xinterp_irclau(env0, irv0, ircl)
in
case+ opt of
|  Some_vt _ => opt
| ~None_vt _ =>
   xinterp_irclaulst(env0, irv0, ircls)
end // end of [list_cons]
)

(* ****** ****** *)

implement
xinterp_irvaldecl
  (env0, x0) =
let
//
val+
IRVALDECL(rcd) = x0
//
val pat = rcd.pat
val def = rcd.def
//
val def =
xinterp_irexpopt(env0, def)
//
in
//
case+ def of
|
None() => ()
|
Some(irv) =>
xinterp_irpat_ck1(env0, pat, irv)
//
end // end of [xinterp_irvaldecl]

implement
xinterp_irvaldeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    xinterp_irvaldeclist(env0, xs)
  ) where
  {
    val () = xinterp_irvaldecl(env0, x0)
  }
) (* end of [xinterp_irvaldeclist] *)

(* ****** ****** *)

implement
xinterp_irvardecl
  (env0, x0) =
let
//
val+
IRVARDECL(rcd) = x0
//
val d2v = rcd.d2v
val ini = rcd.ini
//
val ini =
xinterp_irexpopt(env0, ini)
//
(*
val ( ) =
println!
("xinterp_irvardecl: d2v = ", d2v)
val ( ) =
println!
("xinterp_irvardecl: ini = ", ini)
*)
//
in
//
xinterp_insert_d2var
( env0
, d2v, IRVlft(IRLFTref(ref(ini))))
//
end // end of [xinterp_irvardecl]

implement
xinterp_irvardeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    xinterp_irvardeclist(env0, xs)
  ) where
  {
    val () = xinterp_irvardecl(env0, x0)
  }
) (* end of [xinterp_irvardeclist] *)

(* ****** ****** *)

implement
xinterp_irfundecl
(env0, irfd0) =
let
//
val+
IRFUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val f3g = rcd.f3g
val def = rcd.def
//
in
//
case+ f3g of
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
IRElam
(knd, iras, body) =>
let
val fenv =
intenv_take_fenv(env0)
in
IRVfix1(fenv, nam, iras, body)
end // end of [IRElam]
//
(*
|
IREfix
(knd, d2v, iras, ire2) =>
let
//
val
fenv =
intenv_take_env(env0)
//
val
irdf =
irexp_make_node
( body.loc()
, IREfix(0, nam, iras, ire2)
)
val
irdfs = list_pair(irdf, body)
//
in
IRVfixs
(fenv, nam, iras, ire2, irdfs)
end
*)
//
) : irval // end of [let]
in
  xinterp_insert_d2cst(env0, d2c, irv0)
end
|
list_cons _ =>
let
val fenv =
intenv_take_fenv(env0)
val irv0 =
IRVfix1(fenv, nam, iras, body)
in
  xinterp_insert_d2cst(env0, d2c, irv0)
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end // end of [xinterp_irfundecl]

(* ****** ****** *)

local

fun
auxfixs
(
irfds
:
irfundeclist
) : irexplst =
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
IRFUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val f3g = rcd.f3g
val def = rcd.def
//
in
//
case+ f3g of
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
IRElam
(knd, iras, ire2) =>
let
val ire1 =
irexp_make_node
(
body.loc()
,
IREfix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [IRElam]
//
(*
|
IREfix
(knd, d2v, iras, ire2) =>
let
val irdf =
irexp_make_node
(
body.loc()
,
IREfix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-irexp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
irexp_make_node
(
rcd.loc
,
IREfix
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
( env0
: !intenv
, fenv
: irenv
, irdfs
: irexplst
, irfds
: irfundeclist
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
IRFUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val f3g = rcd.f3g
val def = rcd.def
//
in
//
case+ f3g of
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
IRElam
(knd, iras, body) =>
IRVfixs
(fenv, nam, iras, body, irdfs)
(*
|
IREfix
(knd, d2v, iras, ire2) =>
IRVfixs
(fenv, nam, iras, ire2, irdfs)
*)
//
) : irval // end-of-let
in
(
auxirfds(env0, fenv, irdfs, irfds)
) where
{
val () =
xinterp_insert_d2cst(env0, d2c, irv0)
}
end
|
list_cons _ =>
let
val irv0 =
IRVfixs
(fenv, nam, iras, body, irdfs)
in
(
auxirfds(env0, fenv, irdfs, irfds)
) where
{
val () =
xinterp_insert_d2cst(env0, d2c, irv0)
}
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (* auxirfds *)

in (*in-of-local*)

implement
xinterp_irfundeclist
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
  xinterp_irfundecl(env0, x0)
| list_cons _ =>
  let
//
  val fenv =
  intenv_take_fenv(env0)
//
  val irdfs = auxfixs(irfds)
//
  in
    auxirfds(env0, fenv, irdfs, irfds)
  end
) (* end of [list_cons] *)
) (* xinterp_irfundeclist *)

end // end of [local]

(* ****** ****** *)

implement
xinterp_irimplmnt3
  (env0, irdcl) =
let
//
val-
IRCimplmnt3
( knd, mopt
, sqas, tqas
, id2c, ti3a
, ti2s, iras, body) = irdcl.node()
//
(*
val () =
println!
("xinterp_irimplmnt3: id2c = ", id2c)
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
intenv_take_fenv(env0)
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
irv0 = IRVlam1(fenv, iras, body)
//
in
xinterp_insert_d2cst(env0, d2c0, irv0)
end
//
|
list_cons(_, _) => ((*template*))
//
end (* end of [xinterp_irimplmnt3] *)

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_xintrep_dynexp.dats] *)
