(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: July, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/dynexp0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<token> = fprint_token
//
implement
fprint_val<d0exp> = fprint_d0exp
implement
fprint_val<d0ecl> = fprint_d0ecl
//
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>
//
(* ****** ****** *)

implement
{a}(*tmp*)
fprint_dl0abeled
  (out, x0) = let
//
val+DL0ABELED(l0, t0, x1) = x0
//
in
  fprint!(out, "SL0ABELED(");
  fprint!(out, l0, ", ", t0, ", ");
  fprint_val<a>(out, x1); fprint!(out, ")")
end // end of [fprint_dl0abeled]

(* ****** ****** *)

implement
print_d0exp(x0) =
fprint_d0exp(stdout_ref, x0)
implement
prerr_d0exp(x0) =
fprint_d0exp(stderr_ref, x0)

local

implement
fprint_val<d0exp> = fprint_d0exp

in (* in-of-local *)

implement
fprint_d0exp
  (out, x0) =
(
case+ x0.node() of
//
| D0Eint(i0) =>
  fprint!(out, "D0Eint(", i0, ")")
| D0Echar(c0) =>
  fprint!(out, "D0Echar(", c0, ")")
//
| D0Eid(id) =>
  fprint!(out, "D0Eid(", id, ")")
//
| D0Equal(d0e) =>
  fprint!(out, "D0Equal(", d0e, ")")
//
| D0Eapps(d0es) =>
  fprint!(out, "D0Eapps(", d0es, ")")
//
| D0Elet _ => fprint!(out, "D0Elet(...)")
| D0Ewhere _ => fprint!(out, "D0Ewhere(...)")
//
| D0Enone(token) => fprint!(out, "D0Enone(", token, ")")
//
) (* end of [fprint_d0exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_d0ecl(x0) =
fprint_d0ecl(stdout_ref, x0)
implement
prerr_d0ecl(x0) =
fprint_d0ecl(stderr_ref, x0)

local

implement
fprint_val<d0ecl> = fprint_d0ecl

in (* in-of-local *)

implement
fprint_d0ecl
  (out, x0) =
(
case+ x0.node() of
//
| D0Cnone(tok) =>
  fprint!(out, "D0Cnone(", tok, ")")
//
| D0Clocal
  (tok0, d0cs0, tok1, d0cs1, tok2) =>
  fprint!
  ( out, "D0Clocal("
  , tok0, "; ", d0cs0, "; "
  , tok1, "; ", d0cs1, "; ", tok2, ")")
//
| D0Cnonfix(tok, ids) =>
  fprint!(out, "D0Cnonfix(", tok, "; ", ids, ")")
| D0Cfixity(tok, opt, ids) =>
  fprint!(out, "D0Cfixity(", tok, "; ", opt, "; ", ids, ")")
//
) (* end of [fprint_d0ecl] *)

end // end of [local]

(* ****** ****** *)

implement
print_precopt(x0) =
fprint_precopt(stdout_ref, x0)
implement
prerr_precopt(x0) =
fprint_precopt(stderr_ref, x0)

implement
fprint_precopt
  (out, x0) =
(
case+ x0 of
| PRECOPTnil() =>
  fprint(out, "PRECOPTnil()")
| PRECOPTsing(tok) =>
  fprint!(out, "PRECOPTsing(", tok, ")")
| PRECOPTlist(t0, ts, t1) =>
  fprint!(out, "PRECOPTlist(", t0, "; ", ts, "; ", t1)
) (* end of [fprint_precopt] *)

(* ****** ****** *)

(* end of [xats_dynexp0_print.dats] *)
