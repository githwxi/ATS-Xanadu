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
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/label0.sats"
#staload "./../SATS/location.sats"
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

local

absimpl
q0arg_tbox = $rec{
  q0arg_loc= loc_t
, q0arg_node= q0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
q0arg_get_loc(x0) = x0.q0arg_loc
implement
q0arg_get_node(x0) = x0.q0arg_node

(* ****** ****** *)

implement
q0arg_make_node
(loc, node) = $rec
{
  q0arg_loc= loc, q0arg_node= node
} (* end of [q0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
sq0arg_tbox = $rec{
  sq0arg_loc= loc_t
, sq0arg_node= sq0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
sq0arg_get_loc(x0) = x0.sq0arg_loc
implement
sq0arg_get_node(x0) = x0.sq0arg_node

(* ****** ****** *)

implement
sq0arg_make_node
(loc, node) = $rec
{
  sq0arg_loc= loc, sq0arg_node= node
} (* end of [sq0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
tq0arg_tbox = $rec{
  tq0arg_loc= loc_t
, tq0arg_node= tq0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
tq0arg_get_loc(x0) = x0.tq0arg_loc
implement
tq0arg_get_node(x0) = x0.tq0arg_node

(* ****** ****** *)

implement
tq0arg_make_node
(loc, node) = $rec
{
  tq0arg_loc= loc, tq0arg_node= node
} (* end of [tq0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
ti0arg_tbox = $rec{
  ti0arg_loc= loc_t
, ti0arg_node= ti0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
ti0arg_get_loc(x0) = x0.ti0arg_loc
implement
ti0arg_get_node(x0) = x0.ti0arg_node

(* ****** ****** *)

implement
ti0arg_make_node
(loc, node) = $rec
{
  ti0arg_loc= loc, ti0arg_node= node
} (* end of [ti0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
a0typ_tbox = $rec{
  a0typ_loc= loc_t
, a0typ_node= a0typ_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
a0typ_get_loc(x0) = x0.a0typ_loc
implement
a0typ_get_node(x0) = x0.a0typ_node

(* ****** ****** *)

implement
a0typ_make_node
(loc, node) = $rec
{
  a0typ_loc= loc, a0typ_node= node
} (* end of [a0typ_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0arg_tbox = $rec{
  d0arg_loc= loc_t
, d0arg_node= d0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
d0arg_get_loc(x0) = x0.d0arg_loc
implement
d0arg_get_node(x0) = x0.d0arg_node

(* ****** ****** *)

implement
d0arg_make_node
(loc, node) = $rec
{
  d0arg_loc= loc, d0arg_node= node
} (* end of [d0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
f0arg_tbox = $rec{
  f0arg_loc= loc_t
, f0arg_node= f0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
f0arg_get_loc(x0) = x0.f0arg_loc
implement
f0arg_get_node(x0) = x0.f0arg_node

(* ****** ****** *)

implement
f0arg_make_node
(loc, node) = $rec
{
  f0arg_loc= loc, f0arg_node= node
} (* end of [f0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0pat_tbox = $rec{
  d0pat_loc= loc_t
, d0pat_node= d0pat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0pat_get_loc(x0) = x0.d0pat_loc
implement
d0pat_get_node(x0) = x0.d0pat_node

(* ****** ****** *)

implement
d0pat_anno_opt
(d0p, opt) =
(
case+ opt of
| None() => d0p
| Some(s0t) => let
    val
    loc = d0p.loc()+s0t.loc()
  in
    d0pat_make_node
      (loc, D0Panno(d0p, s0t))
    // d0pat_make_node
  end (* end of [Some] *)
) (* end of [d0pat_anno_opt] *)
implement
d0pat_make_node
(loc, node) = $rec
{
  d0pat_loc= loc, d0pat_node= node
} (* end of [d0pat_make_node] *)

end // end of [local]

(* ****** ****** *)
//
implement
d0pat_RPAREN_loc(x0) =
(
case+ x0 of
| d0pat_RPAREN_cons0
    (tok) => tok.loc()
  // d0pat_RPAREN_cons0
| d0pat_RPAREN_cons1
    (tok1, d0ps, tok2) => tok1.loc() + tok2.loc()
  // d0pat_RPAREN_cons1
)  
//
(* ****** ****** *)

local

absimpl
d0exp_tbox = $rec{
  d0exp_loc= loc_t
, d0exp_node= d0exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0exp_get_loc(x0) = x0.d0exp_loc
implement
d0exp_get_node(x0) = x0.d0exp_node

(* ****** ****** *)

implement
d0exp_anno_opt
(d0e, opt) =
(
case+ opt of
| None() => d0e
| Some(s0t) => let
    val
    loc = d0e.loc()+s0t.loc()
  in
    d0exp_make_node
      (loc, D0Eanno(d0e, s0t))
    // d0exp_make_node
  end (* end of [Some] *)
) (* end of [d0exp_anno_opt] *)
implement
d0exp_make_node
(loc, node) = $rec
{
  d0exp_loc= loc, d0exp_node= node
} (* end of [d0exp_make_node] *)

end // end of [local]

(* ****** ****** *)
//
implement
d0exp_RPAREN_loc(x0) =
(
case+ x0 of
| d0exp_RPAREN_cons0
    (tok) => tok.loc()
  // d0exp_RPAREN_cons0
| d0exp_RPAREN_cons1
    (tok1, d0es, tok2) => tok1.loc() + tok2.loc()
  // d0exp_RPAREN_cons1
| d0exp_RPAREN_cons2
    (tok1, d0es, tok2) => tok1.loc() + tok2.loc()
  // d0exp_RPAREN_cons1
)  
//
(* ****** ****** *)
//
implement
labd0exp_RBRACE_loc(x0) =
(
case+ x0 of
| labd0exp_RBRACE_cons0
    (tok) => tok.loc()
  // labd0exp_RBRACE_cons0
| labd0exp_RBRACE_cons1
    (tok1, ld0es, tok2) => tok1.loc() + tok2.loc()
  // labd0exp_RBRACE_cons1
)  
//
(* ****** ****** *)

local

absimpl
d0gua_tbox = $rec{
  d0gua_loc= loc_t
, d0gua_node= d0gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0gua_get_loc(x0) = x0.d0gua_loc
implement
d0gua_get_node(x0) = x0.d0gua_node

implement
d0gua_make_node
(loc, node) = $rec
{
  d0gua_loc= loc, d0gua_node= node
} (* end of [d0gua_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
dg0pat_tbox = $rec{
  dg0pat_loc= loc_t
, dg0pat_node= dg0pat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
dg0pat_get_loc(x0) = x0.dg0pat_loc
implement
dg0pat_get_node(x0) = x0.dg0pat_node

implement
dg0pat_make_node
(loc, node) = $rec
{
  dg0pat_loc= loc, dg0pat_node= node
} (* end of [dg0pat_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0clau_tbox = $rec{
  d0clau_loc= loc_t
, d0clau_node= d0clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0clau_get_loc(x0) = x0.d0clau_loc
implement
d0clau_get_node(x0) = x0.d0clau_node

implement
d0clau_make_node
(loc, node) = $rec
{
  d0clau_loc= loc, d0clau_node= node
} (* end of [d0clau_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0ecl_tbox = $rec{
  d0ecl_loc= loc_t
, d0ecl_node= d0ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0ecl_get_loc(x0) = x0.d0ecl_loc
implement
d0ecl_get_node(x0) = x0.d0ecl_node

implement
d0ecl_make_node
(loc, node) = $rec
{
  d0ecl_loc= loc, d0ecl_node= node
} (* end of [d0ecl_make_node] *)

end // end of [local]

(* ****** ****** *)

implement
v0aldecl_get_loc
  (x0) =
let
  val+V0ALDECL(rcd) = x0 in rcd.loc
end // end of [v0aldecl_get_loc]

(* ****** ****** *)

implement
v0ardecl_get_loc
  (x0) =
let
  val+V0ARDECL(rcd) = x0 in rcd.loc
end // end of [v0ardecl_get_loc]

(* ****** ****** *)

implement
f0undecl_get_loc
  (x0) =
let
  val+F0UNDECL(rcd) = x0 in rcd.loc
end // end of [f0undecl_get_loc]

(* ****** ****** *)

implement
d0cstdecl_get_loc
  (x0) =
let
  val+D0CSTDECL(rcd) = x0 in rcd.loc
end // end of [d0cstdecl_get_loc]

(* ****** ****** *)

(* end of [xats_dynexp0.dats] *)
