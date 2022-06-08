(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: September, 2019
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
#staload
_(*TMP*) =
"./../DATS/staexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/statyp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp1_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp3_print0.dats"
(* ****** ****** *)
//
#staload "./../SATS/xlabel0.sats"
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
//
#staload "./../SATS/tread23.sats"
//
(* ****** ****** *)

local

in(*in-of-local*)

implement
//{}(*tmp*)
tread23_d3exp
  (d3e0) = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
(*
val () =
println!
("tread23_d3exp: loc0 = ", loc0)
val () =
println!
("tread23_d3exp: d3e0 = ", d3e0)
val () =
println!
("tread23_d3exp: t2p0 = ", t2p0)
*)
//
//
in
end // end of [tread23_d3exp]

end // end of [local]

(* ****** ****** *)

implement
//{}(*tmp*)
tread23_d3explst(d3es) =
(
list_foreach<d3exp>(d3es)
) where
{
implement(env)
list_foreach$fwork<d3exp><env>(d3e, env) = tread23_d3exp(d3e)
} (* end of [tread23_d3explst] *)

(* ****** ****** *)
//
extern
fun
d2cst_tiarglst_artck
( d2c0: d2cst
, ti2s: ti2arglst): List0(int)
//
implement
d2cst_tiarglst_artck
  (d2c0, ti2s) =
(
let
val
tqas = d2c0.tqas()
in
  auxmain(tqas, ti2s)
end
) where
{
fun
auxmain
( xs
: tq2arglst
, ys
: ti2arglst): List0(int) =
(
case+ xs of
|
list_nil() =>
(
case+ ys of
| list_nil
  () => list_nil()
| list_cons
  (y0, ys) => list_sing(2)
)
|
list_cons(x0, xs) =>
(
case+ ys of
| list_nil
  () => list_nil()
| list_cons
  (y0, ys) =>
  let
  val sgn =
  compare
  ( length(x0.s2vs())
  , length(y0.s2es()))
  in
    list_cons(sgn, auxmain(xs, ys))
  end
)
)
} (* end of [d2cst_tiarglst_artck] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
tread23_s2exp
(s2e0: s2exp): void =
(
case+
s2e0.node() of
|
S2Ecast
(loc0, s2e1, s2t2) =>
{
val () =
trerr23_add
(TRERR23s2exp(s2e0))
//
val
s2t1 = s2e1.sort((*void*))
val () =
prerrln!
( loc0
, ": TRERR23(s2exp): s2e0 = ", s2e0);
val () =
prerrln!
( loc0
, ": TRERR23(s2exp): s2t1 = ", s2t1);
val () =
prerrln!
( loc0
, ": TRERR23(s2exp): s2t2 = ", s2t2);
//
}
| _ (* non-S2Ecast *) => ((*tread12-checked*))
)

(* ****** ****** *)

fun
aux_absopen
( d3cl
: d3ecl): void = ()

(* ****** ****** *)

fun
aux_absimpl
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cabsimpl
( knd
, is2c
, def1) = d3cl.node()
//
in
  tread23_s2exp(def1)
end // end of [aux_absimpl]

(* ****** ****** *)

fun
aux_excptcon
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
in
// HX-2020-11-21: FIXME!!!
end // end of [aux_excptcon]

fun
aux_datatype
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
in
// HX-2020-11-21: FIXME!!!
end // end of [aux_datatype]

(* ****** ****** *)

fun
aux_valdclst
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
in
// HX-2020-10-31: FIXME!!!
end // end of [aux_valdclst]

(* ****** ****** *)

fun
aux_vardclst
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
in
// HX-2020-10-31: FIXME!!!
end // end of [aux_vardclst]

(* ****** ****** *)

fun
aux_fundclst
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
in
// HX-2020-10-31: FIXME!!!
end // end of [aux_fundclst]

(* ****** ****** *)

fun
aux_implmnt1
( d3cl
: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimplmnt1
( knd
, mopt, stmp
, sqas, tqas
, id2c
, ti3a, ti2s
, f3as
, res0, d3e0) = d3cl.node()
//
val-
IMPLD2CST1
(dqid, d2cs) = id2c
val-
list_cons(d2c0, _) = d2cs
//
in
//
let
//
val
cmps =
d2cst_tiarglst_artck(d2c0, ti2s)
//
val
errck =
let
fun
loop
( xs
: List0(int)): bool =
(
case+ xs of
|
list_nil
((*void*)) => false
|
list_cons
( x0, xs ) =>
if x0 = 0 then loop(xs) else true
)
in
  loop(cmps)
end // end of [val errck]
//
in
//
let
//
fun
auxerr
( i0
: int
, xs
: List0(int)): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  auxerr(i0+1, xs)
) where
{
//
val () =
if i0 > 0 then prerr(",")
//
val () =
if x0 < 0 then prerr("-")
val () =
if x0 > 0 then prerr("+")
val () =
if x0 = 0 then prerr("0")
//
} (* end of [list_cons] *)
)
//
in
//
if
errck
then
{
//
val () =
trerr23_add(TRERR23d3ecl(d3cl))
//
val () =
(
prerr!
(loc0, ": ***TRERR23***"); prerrln!())
val () =
(
prerr!
(loc0, ": TRERR23(D3Cimplmnt1): d2c0 = ", d2c0); prerrln!())
val () =
(
prerr!
(loc0, ": TRERR23(D3Cimplmnt1): tmp-arity mismatch: "); auxerr(0, cmps); prerrln!())
//
}
// end of [if]
end // end-of-let
//
end // end-of-let

end // end of [aux_implmnt1]

in(*in-of-local*)

implement
//{}(*tmp*)
tread23_d3ecl(d3cl) =
let
//
val loc0 = d3cl.loc()
//
(*
val () =
println!
("tread23_d3ecl: loc0 = ", loc0)
val () =
println!
("tread23_d3ecl: d3cl = ", d3cl)
*)
//
in(*in-of-let*)
//
case+
d3cl.node() of
//
|
D3Cd2ecl(d2c) => ()
//
|
D3Cstatic(tok, d3c1) =>
{
  val () = tread23_d3ecl(d3c1)
}
|
D3Cextern(tok, d3c1) =>
{
  val () = tread23_d3ecl(d3c1)
}
//
|
D3Clocal(head, body) =>
{
(*
  val () =
  tread23_d3eclist(head)
  val () =
  tread23_d3eclist(body)
*)
  val () =
  tread23_d3ecl_D3Clocal(d3cl)
} (* end of [D3Clocal] *)
//
| D3Cinclude _ => ((*void*))
| D3Cstaload _ => ((*void*))
//
|
D3Cabsopen _ => aux_absopen(d3cl)
|
D3Cabsimpl _ => aux_absimpl(d3cl)
//
|
D3Cexcptcon _ => aux_excptcon(d3cl)
|
D3Cdatatype _ => aux_datatype(d3cl)
//
|
D3Cfundclst _ => aux_fundclst(d3cl)
|
D3Cvaldclst _ => aux_valdclst(d3cl)
|
D3Cvardclst _ => aux_vardclst(d3cl)
//
|
D3Cimplmnt1 _ => aux_implmnt1(d3cl)
(*
|
D3Cimplmnt2 _ => aux_implmnt2(d3cl)
*)
//
|
_(* rest-of-d3ecl *) =>
{
val () =
println!(loc0, ": tread23_d3ecl(", d3cl, ")")
}
//
end // end of [tread23_d3ecl]

end // end of [local]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread23_d3eclist(d3cs) =
(
list_foreach<d3ecl>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3ecl><env>(d3c, env) = tread23_d3ecl(d3c)
} (* end of [tread23_d3eclist] *)
//
(* ****** ****** *)

local

static
fun//{}
the_trerr23lst_get(): trerr23lst
extern
fun//{}
the_trerr23lst_set(trerr23lst): void

implement
//{}(*tmp*)
trerr23_add(xerr) = let
//
val
xerrs = the_trerr23lst_get()
//
in
the_trerr23lst_set(list_cons(xerr, xerrs))
end // end of [trerr23_add]

in (* in-of-local *)
//
local
//
val
the_trerr23lst =
ref<trerr23lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr23lst_get() = the_trerr23lst[]
implement
the_trerr23lst_set(xs) = the_trerr23lst[] := xs
end // end of [local]
//
implement
tread23_package
(
  p3kg
) = let
//
(*
val () =
println!
("tread23_package")
*)
//
val
D3TRANSD(rcd) = p3kg
//
val d3cs =
let
val
d3csopt = rcd.transd
in
case+
d3csopt of
| None() =>
  list_nil((*void*))
| Some(d3cs) => d3cs
end : d3eclist // end-of-val
//
val () =
tread23_d3eclist(d3cs)
//
val
xerrs = the_trerr23lst_get()
val
nxerr = list_length<trerr23>(xerrs)
//
in
//
if
(nxerr > 0)
then
{
//
val () =
prerrln!
("\
tread23_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread23_package: \
there is one trans23-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread23_package: \
there are some trans23-errors!")
//
val () =
(
$raise(XATSOPT_TRERR23_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread23_package: \
there are none of trans23-errors!")
//
} (* end of [else] *)
//
end // end of [tread23_package]

end // end of [local]

(* ****** ****** *)
//
//
// HX-2020-07-02:
// For contributed code
//
(* ****** ****** *)

#include
"./CONTRIB/tread23_dynexp.dats"

(* ****** ****** *)

(* end of [xats_tread23_dynexp.dats] *)
