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
#staload
"./../SATS/label0.sats"
#staload
"./../SATS/location.sats"
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
//
(* ****** ****** *)

local

absimpl
t0int_tbox = $rec{
  t0int_loc= loc_t
, t0int_node= t0int_node
} (* end of [absimpl] *)
absimpl
t0chr_tbox = $rec{
  t0chr_loc= loc_t
, t0chr_node= t0chr_node
} (* end of [absimpl] *)
absimpl
t0flt_tbox = $rec{
  t0flt_loc= loc_t
, t0flt_node= t0flt_node
} (* end of [absimpl] *)
absimpl
t0str_tbox = $rec{
  t0str_loc= loc_t
, t0str_node= t0str_node
} (* end of [absimpl] *)
//
absimpl
i0dnt_tbox = $rec{
  i0dnt_loc= loc_t
, i0dnt_node= i0dnt_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

fun
t0int_make_node
(
loc0: loc_t
,
node: t0int_node
) : t0int = $rec{
  t0int_loc= loc0, t0int_node= node
} (* end of [t0int_make_node] *)

fun
t0chr_make_node
(
loc0: loc_t
,
node: t0chr_node
) : t0chr = $rec{
  t0chr_loc= loc0, t0chr_node= node
} (* end of [t0chr_make_node] *)

fun
t0flt_make_node
(
loc0: loc_t
,
node: t0flt_node
) : t0flt = $rec{
  t0flt_loc= loc0, t0flt_node= node
} (* end of [t0flt_make_node] *)

fun
t0str_make_node
(
loc0: loc_t
,
node: t0str_node
) : t0str = $rec{
  t0str_loc= loc0, t0str_node= node
} (* end of [t0str_make_node] *)

(* ****** ****** *)

fun
i0dnt_make_node
(
loc0: loc_t
,
node: i0dnt_node
) : i0dnt = $rec{
  i0dnt_loc= loc0, i0dnt_node= node
} (* end of [i0dnt_make_node] *)

(* ****** ****** *)

implement
t0int_get_loc(x) = x.t0int_loc
implement
t0int_get_node(x) = x.t0int_node

implement
t0chr_get_loc(x) = x.t0chr_loc
implement
t0chr_get_node(x) = x.t0chr_node

implement
t0flt_get_loc(x) = x.t0flt_loc
implement
t0flt_get_node(x) = x.t0flt_node

implement
t0str_get_loc(x) = x.t0str_loc
implement
t0str_get_node(x) = x.t0str_node

(* ****** ****** *)

implement
i0dnt_get_loc(x) = x.i0dnt_loc
implement
i0dnt_get_node(x) = x.i0dnt_node

(* ****** ****** *)

implement
t0int_none(tok) =
t0int_make_node(tok.loc(), T0INTnone(tok))
implement
t0int_some(tok) =
t0int_make_node(tok.loc(), T0INTsome(tok))

implement
t0chr_none(tok) =
t0chr_make_node(tok.loc(), T0CHRnone(tok))
implement
t0chr_some(tok) =
t0chr_make_node(tok.loc(), T0CHRsome(tok))

implement
t0flt_none(tok) =
t0flt_make_node(tok.loc(), T0FLTnone(tok))
implement
t0flt_some(tok) =
t0flt_make_node(tok.loc(), T0FLTsome(tok))

implement
t0str_none(tok) =
t0str_make_node(tok.loc(), T0STRnone(tok))
implement
t0str_some(tok) =
t0str_make_node(tok.loc(), T0STRsome(tok))

(* ****** ****** *)

implement
i0dnt_some(tok) =
i0dnt_make_node(tok.loc(), I0DNTsome(tok))
implement
i0dnt_none(tok) =
i0dnt_make_node(tok.loc(), I0DNTnone(tok))

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
l0abl_tbox = $rec{
//
  l0abl_loc= loc_t
,
  l0abl_node= l0abl_node
//
} (* end of [absimpl] *)

in (* in-of-local *)

implement
l0abl_get_loc(l0) = l0.l0abl_loc
implement
l0abl_get_node(l0) = l0.l0abl_node

implement
l0abl_make_node
  (loc, node) = $rec{
  l0abl_loc= loc, l0abl_node= node
} (* end of [l0abl_make] *)

end // end of [local]

(* ****** ****** *)

implement
l0abl_make_int1
  (tok) = let
//
val-
T_INT1(rep) = tok.node()
//
val i0 = g0string2int(rep)
val lab = label_make_int(i0)
//
in
//
l0abl_make_node
  (tok.loc(), L0ABsome(lab))
//
end // end of [l0abl_make_int1]

implement
l0abl_make_name
  (tok) = let
//
val-
T_IDENT_alp(s0) = tok.node()
//
val lab = label_make_name(s0)
//
in
//
l0abl_make_node
  (tok.loc(), L0ABsome(lab))
//
end // end of [l0abl_make_name]

implement
l0abl_make_none
  (tok) =
(
//
l0abl_make_node
  (tok.loc(), L0ABnone(tok))
//
) (* end of [l0abl_make_none] *)

(* ****** ****** *)

local

absimpl
sort0_tbox = $rec{
  sort0_loc= loc_t
, sort0_node= sort0_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
sort0_get_loc(x) = x.sort0_loc
implement
sort0_get_node(x) = x.sort0_node

implement
sort0_make_node
(loc, node) = $rec
{
  sort0_loc= loc, sort0_node= node
} (* end of [sort0_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0arg_tbox = $rec{
  s0arg_loc= loc_t
, s0arg_node= s0arg_node
}

in (* in-of-local *)

implement
s0arg_get_loc(x) = x.s0arg_loc
implement
s0arg_get_node(x) = x.s0arg_node

implement
s0arg_make_node
(loc, node) = $rec
{
  s0arg_loc= loc, s0arg_node= node
} (* end of [s0arg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0marg_tbox = $rec{
  s0marg_loc= loc_t
, s0marg_node= s0marg_node
}

in (* in-of-local *)

implement
s0marg_get_loc(x) = x.s0marg_loc
implement
s0marg_get_node(x) = x.s0marg_node

implement
s0marg_make_node
(loc, node) = $rec
{
  s0marg_loc= loc, s0marg_node= node
} (* end of [s0marg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0exp_tbox = $rec{
  s0exp_loc= loc_t
, s0exp_node= s0exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s0exp_get_loc(x) = x.s0exp_loc
implement
s0exp_get_node(x) = x.s0exp_node

implement
s0exp_make_node
(loc, node) = $rec
{
  s0exp_loc= loc, s0exp_node= node
} (* end of [s0exp_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
s0exp_RPAREN_loc(x0) =
(
case+ x0 of
| s0exp_RPAREN_cons0
    (tok) => tok.loc()
  // s0exp_RPAREN_cons0
| s0exp_RPAREN_cons1
    (tok1, s0es, tok2) => tok1.loc() + tok2.loc()
  // s0exp_RPAREN_cons1
)  
//
implement
labs0exp_RBRACE_loc(x0) =
(
case+ x0 of
| labs0exp_RBRACE_cons0
    (tok) => tok.loc()
  // labs0exp_RBRACE_cons0
| labs0exp_RBRACE_cons1
    (tok1, ls0es, tok2) => tok1.loc() + tok2.loc()
  // labs0exp_RBRACE_cons1
)  
//
(* ****** ****** *)

(* end of [xats_staexp0.dats] *)
