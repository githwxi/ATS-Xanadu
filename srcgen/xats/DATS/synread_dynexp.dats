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
// Start Time: September, 2018
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
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/location.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/synread_basics.dats"
#staload
_(*TMP*) = "./../DATS/synread_staexp.dats"

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0explst
  (d0es) =
(
list_foreach<d0exp>(d0es)
) where
{
implement(env)
list_foreach$fwork<d0exp><env>(d0e, env) = synread_d0exp<>(d0e)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_d0ecl
  (d0c0) = let
//
val loc0 = d0c0.loc()
//
(*
val () =
println!
("synread_d0ecl: d0c0 = ", d0c0)
*)
//
in
//
case+
d0c0.node() of
//
| D0Cnonfix
  (tok, ids) =>
  {
    val () =
    synread_i0dntlst<>(ids)
  }
//
| D0Cfixity
  (tok, ids, opt) =>
  {
    val () =
    synread_i0dntlst<>(ids)
//
    val () =
    (
      synread_precopt<>(opt)
    ) (* end of [val] *)
  }
//
| D0Cstatic
  (tok, d0c) =>
  {
    val () = synread_d0ecl<>(d0c)
  }
| D0Cextern
  (tok, d0c) =>
  {
    val () = synread_d0ecl<>(d0c)
  }
//
| D0Cabssort
  (tok, tid) =>
  {
(*
    val () =
    synread_ABSSORT<>(tok)
*)
    val () = synread_s0tid<>(tid)
  }
//
| D0Csortdef
  (tok, tid, teq, def) =>
  {
(*
    val () =
    synread_SORTDEF<>(tok)
*)
    val () = synread_EQ<>(teq)
    val () = synread_s0tid<>(tid)
    val () = synread_s0rtdef<>(def)
  }
//
| D0Csexpdef
  ( tok, sid
  , arg, res, teq, def) =>
  {
(*
    val () =
      synread_SEXPDEF<>(tok)
    // end of [val]
*)
    val () = synread_EQ<>(teq)  
    val () = synread_s0eid<>(sid)
    val () = synread_sort0opt<>(res)
    val () = synread_s0marglst<>(arg)
    val () = synread_s0exp<>(def)
  }
//
| D0Cnone(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0c0))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", tok);
  end // end of [D0Cnone]
//
| D0Ctokerr(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0c0))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", tok);
  end // end of [D0Cnone]
//
| _(* rest-of-d0ecl *) =>
  (
    prerrln!("synread_d0ecl: d0c0 = ", d0c0)
  )
//
end // end of [synread_d0ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0eclist
  (d0cs) =
(
list_foreach<d0ecl>(d0cs)
) where
{
implement(env)
list_foreach$fwork<d0ecl><env>(d0c, env) = synread_d0ecl<>(d0c)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_precopt
  (opt) =
(
case+ opt of
| PRECOPTnil() => ()
| PRECOPTint(tok) =>
  {
    val () = synread_INT1<>(tok)
  }
| PRECOPTopr
  (topr, pmod) =>
  {
    val () = synread_i0dnt<>(topr)
    val () = synread_precmod<>(pmod)
  }
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_precmod
  (opt) =
(
case+ opt of
| PRECMODnone() => ()
| PRECMODsome
  (tbeg, sint, tend) =>
  {
    val () = synread_LPAREN<>(tbeg)
    val () = synread_signint<>(sint)
    val () = synread_RPAREN<>(tend)
  }
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_signint
  (sint) =
(
case+ sint of
| SIGNINTint(int) =>
  {
    val () = synread_INT1<>(int)
  }
| SIGNINTopr(opr, int) =>
  {
    val () = auxopr(opr)
    val () = synread_INT1<>(int)
  }
) where
{
// HX-2018-11-18:
// int sign is either + or -
  fun
  auxopr(tok: token): void =
  (
    case+
    tok.node() of
    | T_IDENT_sym"+" => ()
    | T_IDENT_sym"-" => ()
    | _(*unrecognized*) =>
      let
        val () =
        synerr_add(SYNERRsignint_opr(tok))
      in
        prerrln!
        (tok.loc(), ": SYNERR(SIGNINT_OPR): ", tok);
      end // end of [let]
  ) (* end of [auxopr] *)
//
} (* end of [synread_signint] *)

(* ****** ****** *)

local

extern
fun{}
the_synerrlst_get(): synerrlst
extern
fun{}
the_synerrlst_set(synerrlst): void

implement
{}(*tmp*)
synerr_add(xerr) = let
//
val
xerrs = the_synerrlst_get()
//
in
  the_synerrlst_set(list_cons(xerr, xerrs))
end // end of [synerr_add]

in (* in-of-local *)

implement
synread_top(d0cs) = let
//
local
val
the_synerrlst =
ref<synerrlst>(list_nil)
in(*in-of-local*)
val () =
$tempenver(the_synerrlst)
implement
the_synerrlst_get<>() = the_synerrlst[]
implement
the_synerrlst_set<>(xs) = the_synerrlst[] := xs
end // end of [local]
//
val () =
synread_d0eclist<>(d0cs)
val
xerrs = the_synerrlst_get()
val
nxerr = list_length<synerr>(xerrs)
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
("synread_top: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("synread_top: there is one synerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("synread_top: there are some synerrs!")
//
val () =
(
$raise(XATSOPT_SYNERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("synread_top: there are no synerrs!")
//
} (* end of [else] *)
//
end // end of [synread_top]

end // end of [local]

(* ****** ****** *)

(* end of [xats_synread_dynexp.dats] *)
