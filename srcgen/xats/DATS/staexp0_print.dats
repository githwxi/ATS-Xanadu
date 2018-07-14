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
// Start Time: June, 2018
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
#staload "./../SATS/staexp0.sats"
//
(* ****** ****** *)

implement
fprint_val<i0nt> = fprint_i0nt
implement
fprint_val<c0har> = fprint_c0har

implement
fprint_val<i0dnt> = fprint_i0dnt

implement
fprint_val<sort0> = fprint_sort0

implement
fprint_val<s0exp> = fprint_s0exp

implement
(a)//tmp
fprint_val<sl0abeled(a)> = fprint_sl0abeled<a>
implement
(a)//tmp
fprint_val<dl0abeled(a)> = fprint_dl0abeled<a>

(* ****** ****** *)

implement
print_i0nt(x0) =
fprint_i0nt(stdout_ref, x0)
implement
prerr_i0nt(x0) =
fprint_i0nt(stderr_ref, x0)

implement
fprint_i0nt
  (out, x0) =
(
case+ x0.node() of
| I0NTnone(tok) =>
  fprint!(out, "I0NTnone(", tok, ")")
| I0NTsome(tok) =>
  fprint!(out, "I0NTsome(", tok, ")")
)

(* ****** ****** *)

implement
print_c0har(x0) =
fprint_c0har(stdout_ref, x0)
implement
prerr_c0har(x0) =
fprint_c0har(stderr_ref, x0)

implement
fprint_c0har
  (out, x0) =
(
case+ x0.node() of
| C0HARnone(tok) =>
  fprint!(out, "C0HARnone(", tok, ")")
| C0HARsome(tok) =>
  fprint!(out, "C0HARsome(", tok, ")")
)

(* ****** ****** *)

implement
print_i0dnt(x0) =
fprint_i0dnt(stdout_ref, x0)
implement
prerr_i0dnt(x0) =
fprint_i0dnt(stderr_ref, x0)

implement
fprint_i0dnt
  (out, x0) =
(
case+ x0.node() of
| I0DNTnone(tok) =>
  fprint!(out, "I0DNTnone(", tok, ")")
| I0DNTsome(tok) =>
  fprint!(out, "I0DNTsome(", tok, ")")
)

(* ****** ****** *)

(*
implement
print_s0qua(x0) =
fprint_s0qua(stdout_ref, x0)
implement
prerr_s0qua(x0) =
fprint_s0qua(stderr_ref, x0)
implement
fprint_s0qua
  (out, x0) =
(
case+ x0.node() of
| S0QUAnone(tok) =>
  fprint!(out, "S0QUAnone(", tok, ")")
| S0QUAsymdot(tok0, tok1) =>
  fprint!(out, "S0QUAsymdot(", tok0, ", ", tok1, ")")
)
*)

(* ****** ****** *)

implement
print_sort0(x0) =
fprint_sort0(stdout_ref, x0)
implement
prerr_sort0(x0) =
fprint_sort0(stderr_ref, x0)

local

implement
fprint_val<sort0> = fprint_sort0

in (* in-of-local *)

implement
fprint_sort0
  (out, x0) =
(
case+ x0.node() of
//
| S0Tid(id) =>
  fprint!(out, "S0Tid(", id, ")")
//
| S0Tapp(s0ts) =>
  fprint!(out, "S0Tapp(", s0ts, ")")
//
| S0Tlist(t0, s0ts, t1) =>
  fprint!
  (out, "S0Tlist(", t0, ", ", s0ts, ", ", t1, ")")
//
| S0Tqual(q, s0t) =>
  fprint!
  (out, "S0Tqid(", q, ", ", s0t, ")")
//
| S0Tnone(token) =>
  (
    fprint!(out, "S0Tnone(", token, ")")
  )
//
) (* end of [fprint_sort0] *)

end // end of [local]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_sl0abeled
  (out, x0) = let
//
val+SL0ABELED(l0, x1) = x0
//
in
  fprint!(out, "SL0ABELED(", l0, ", ");
  fprint_val<a>(out, x1); fprint!(out, ")")
end // end of [fprint_sl0abeled]

implement
{a}(*tmp*)
fprint_dl0abeled
  (out, x0) = let
//
val+DL0ABELED(l0, x1) = x0
//
in
  fprint!(out, "DL0ABELED(", l0, ", ");
  fprint_val<a>(out, x1); fprint!(out, ")")
end // end of [fprint_dl0abeled]

(* ****** ****** *)

implement
print_s0exp(x0) =
fprint_s0exp(stdout_ref, x0)
implement
prerr_s0exp(x0) =
fprint_s0exp(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_s0exp
  (out, x0) =
(
case+ x0.node() of
//
| S0Eint(i0) =>
  fprint!(out, "S0Eint(", i0, ")")
| S0Echar(c0) =>
  fprint!(out, "S0Echar(", c0, ")")
//
| S0Eid(id) =>
  fprint!(out, "S0Eid(", id, ")")
//
| S0Eapp(s0es) =>
  fprint!(out, "S0Eapp(", s0es, ")")
//
| S0Ebrack
  (tbeg, s0es, tend) =>
  fprint!
  (out, "S0Ebrack(", tbeg, ", ", s0es, ", ", tend, ")")
//
| S0Eparen
  (tbeg, s0es, tend) =>
  fprint!
  (out, "S0Eparen(", tbeg, ", ", s0es, ", ", tend, ")")
| S0Ebrace
  (tbeg, s0es, tend) =>
  fprint!
  (out, "S0Ebrace(", tbeg, ", ", s0es, ", ", tend, ")")
//
| S0Equal(tok, s0e) =>
  fprint!
  (out, "S0Equal(", tok, ", ", s0e, ")")
//
| S0Eanno(s0e, s0t) =>
  fprint!
  (out, "S0Eanno(", s0e, ", ", s0t, ")")
//
| S0Enone(token) =>
  (
    fprint!(out, "S0Enone(", token, ")")
  ) // end of [S0Enone]
//
) (* end of [fprint_s0exp] *)

end // end of [local]

(* ****** ****** *)

implement
print_s0exp_RPAREN(x0) =
fprint_s0exp_RPAREN(stdout_ref, x0)
implement
prerr_s0exp_RPAREN(x0) =
fprint_s0exp_RPAREN(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_s0exp_RPAREN
  (out, x0) =
(
case+ x0 of
| s0exp_RPAREN_cons0(tok) =>
  fprint!
  (out, "s0exp_RPAREN_cons0(", tok, ")")
| s0exp_RPAREN_cons1(tok1, s0es, tok2) =>
  fprint!
  (out, "s0exp_RPAREN_cons1(", tok1, ", ", s0es, ", ", tok2, ")")
) (* end of [fprint_s0exp_RPAREN] *)

end // end of [local]

(* ****** ****** *)

implement
print_s0exp_RBRACE(x0) =
fprint_s0exp_RBRACE(stdout_ref, x0)
implement
prerr_s0exp_RBRACE(x0) =
fprint_s0exp_RBRACE(stderr_ref, x0)

local

implement
fprint_val<s0exp> = fprint_s0exp

in (* in-of-local *)

implement
fprint_s0exp_RBRACE
  (out, x0) =
(
case+ x0 of
| s0exp_RBRACE_cons0(tok) =>
  fprint!
  (out, "s0exp_RBRACE_cons0(", tok, ")")
| s0exp_RBRACE_cons1(tok1, s0es, tok2) =>
  fprint!
  (out, "s0exp_RBRACE_cons1(", tok1, ", ", s0es, ", ", tok2, ")")
) (* end of [fprint_s0exp_RBRACE] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp0_print.dats] *)
