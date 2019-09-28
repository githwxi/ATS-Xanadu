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
// Start Time: June, 2018
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
#staload
"./../SATS/label0.sats"
#staload
"./../SATS/locinfo.sats"
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
//
implement
t0int_get_loc
  (x0) = x0.t0int_loc
implement
t0int_get_node
  (x0) = x0.t0int_node
//
implement
t0chr_get_loc
  (x0) = x0.t0chr_loc
implement
t0chr_get_node
  (x0) = x0.t0chr_node
//
implement
t0flt_get_loc
  (x0) = x0.t0flt_loc
implement
t0flt_get_node
  (x0) = x0.t0flt_node
//
implement
t0str_get_loc
  (x0) = x0.t0str_loc
implement
t0str_get_node
  (x0) = x0.t0str_node
//
(* ****** ****** *)

implement
i0dnt_get_loc(x0) = x0.i0dnt_loc
implement
i0dnt_get_node(x0) = x0.i0dnt_node

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

(* ****** ****** *)
//
implement
l0abl_get_loc
  (l0) = l0.l0abl_loc
implement
l0abl_get_node
  (l0) = l0.l0abl_node
//
implement
l0abl_make_node
  (loc, node) = $rec{
  l0abl_loc= loc, l0abl_node= node
} (* end of [l0abl_make] *)
//
(* ****** ****** *)

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
  (tok.loc(), L0ABLsome(lab))
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
  (tok.loc(), L0ABLsome(lab))
//
end // end of [l0abl_make_name]

implement
l0abl_make_none
  (tok) =
(
//
l0abl_make_node
  (tok.loc(), L0ABLnone(tok))
//
) (* end of [l0abl_make_none] *)

(* ****** ****** *)

local

absimpl
s0ymb_tbox = $rec{
//
  s0ymb_loc= loc_t
,
  s0ymb_node= s0ymb_node
//
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
s0ymb_get_loc
  (l0) = l0.s0ymb_loc
implement
s0ymb_get_node
  (l0) = l0.s0ymb_node
//
implement
s0ymb_make_node
  (loc, node) = $rec{
  s0ymb_loc= loc, s0ymb_node= node
} (* end of [s0ymb_make] *)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
sq0eid_get_loc
  (x0) =
(
case+ x0 of
| SQ0EIDnone(id0) => id0.loc()
| SQ0EIDsome(tok, id0) => tok.loc()+id0.loc()
)
implement
dq0eid_get_loc
  (x0) =
(
case+ x0 of
| DQ0EIDnone(id0) => id0.loc()
| DQ0EIDsome(tok, id0) => tok.loc()+id0.loc()
)
//
(* ****** ****** *)

local

absimpl
g0exp_tbox = $rec{
  g0exp_loc= loc_t
, g0exp_node= g0exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
g0exp_get_loc(x0) = x0.g0exp_loc
implement
g0exp_get_node(x0) = x0.g0exp_node

(* ****** ****** *)

implement
g0exp_make_node
(loc, node) = $rec
{
  g0exp_loc= loc, g0exp_node= node
} (* end of [g0exp_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
g0marg_tbox = $rec{
  g0marg_loc= loc_t
, g0marg_node= g0marg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
g0marg_get_loc(x0) = x0.g0marg_loc
implement
g0marg_get_node(x0) = x0.g0marg_node

(* ****** ****** *)

implement
g0marg_make_node
(loc, node) = $rec
{
  g0marg_loc= loc, g0marg_node= node
} (* end of [g0marg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
sort0_tbox = $rec{
  sort0_loc= loc_t
, sort0_node= sort0_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
sort0_get_loc(x0) = x0.sort0_loc
implement
sort0_get_node(x0) = x0.sort0_node

(* ****** ****** *)

implement
sort0_make_node
(loc, node) = $rec
{
  sort0_loc= loc, sort0_node= node
} (* end of [sort0_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0rtcon_tbox = $rec{
  s0rtcon_loc= loc_t
, s0rtcon_node= s0rtcon_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s0rtcon_get_loc(x0) = x0.s0rtcon_loc
implement
s0rtcon_get_node(x0) = x0.s0rtcon_node

(* ****** ****** *)

implement
s0rtcon_make_node
(loc, node) = $rec
{
  s0rtcon_loc= loc, s0rtcon_node= node
} (* end of [s0rtcon_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0tsort_tbox = $rec{
  d0tsort_loc= loc_t
, d0tsort_node= d0tsort_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d0tsort_get_loc(x0) = x0.d0tsort_loc
implement
d0tsort_get_node(x0) = x0.d0tsort_node

(* ****** ****** *)

implement
d0tsort_make_node
(loc, node) = $rec
{
  d0tsort_loc= loc, d0tsort_node= node
} (* end of [d0tsort_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0rtdef_tbox = $rec{
  s0rtdef_loc= loc_t
, s0rtdef_node= s0rtdef_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s0rtdef_get_loc(x0) = x0.s0rtdef_loc
implement
s0rtdef_get_node(x0) = x0.s0rtdef_node

(* ****** ****** *)

implement
s0rtdef_make_node
(loc, node) = $rec
{
  s0rtdef_loc= loc, s0rtdef_node= node
} (* end of [s0rtdef_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0arg_tbox = $rec{
  s0arg_loc= loc_t
, s0arg_node= s0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
s0arg_get_loc(x0) = x0.s0arg_loc
implement
s0arg_get_node(x0) = x0.s0arg_node

(* ****** ****** *)

implement
s0arg_make_node
(loc, node) = $rec
{
  s0arg_loc= loc, s0arg_node= node
} (* end of [s0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0marg_tbox = $rec{
  s0marg_loc= loc_t
, s0marg_node= s0marg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
s0marg_get_loc(x0) = x0.s0marg_loc
implement
s0marg_get_node(x0) = x0.s0marg_node

(* ****** ****** *)

implement
s0marg_make_node
(loc, node) = $rec
{
  s0marg_loc= loc, s0marg_node= node
} (* end of [s0marg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t0arg_tbox = $rec{
  t0arg_loc= loc_t
, t0arg_node= t0arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
t0arg_get_loc(x0) = x0.t0arg_loc
implement
t0arg_get_node(x0) = x0.t0arg_node

(* ****** ****** *)

implement
t0arg_make_node
(loc, node) = $rec
{
  t0arg_loc= loc, t0arg_node= node
} (* end of [t0arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t0marg_tbox = $rec{
  t0marg_loc= loc_t
, t0marg_node= t0marg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
t0marg_get_loc(x0) = x0.t0marg_loc
implement
t0marg_get_node(x0) = x0.t0marg_node

(* ****** ****** *)

implement
t0marg_make_node
(loc, node) = $rec
{
  t0marg_loc= loc, t0marg_node= node
} (* end of [t0marg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0qua_tbox = $rec{
  s0qua_loc= loc_t
, s0qua_node= s0qua_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s0qua_get_loc(x0) = x0.s0qua_loc
implement
s0qua_get_node(x0) = x0.s0qua_node

(* ****** ****** *)

implement
s0qua_make_node
(loc, node) = $rec
{
  s0qua_loc= loc, s0qua_node= node
} (* end of [s0qua_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0uni_tbox = $rec{
  s0uni_loc= loc_t
, s0uni_node= s0uni_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s0uni_get_loc(x0) = x0.s0uni_loc
implement
s0uni_get_node(x0) = x0.s0uni_node

(* ****** ****** *)

implement
s0uni_make_node
(loc, node) = $rec
{
  s0uni_loc= loc, s0uni_node= node
} (* end of [s0uni_make_node] *)

(* ****** ****** *)

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
s0exp_get_loc(x0) = x0.s0exp_loc
implement
s0exp_get_node(x0) = x0.s0exp_node

(* ****** ****** *)

implement
s0exp_anno_opt
(s0e, opt) =
(
case+ opt of
| None() => s0e
| Some(s0t) => let
    val
    loc = s0e.loc()+s0t.loc()
  in
    s0exp_make_node
      (loc, S0Eanno(s0e, s0t))
    // s0exp_make_node
  end (* end of [Some] *)
) (* end of [s0exp_anno_opt] *)

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
(* ****** ****** *)
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

local

absimpl
d0atcon_tbox = $rec{
  d0atcon_loc= loc_t
, d0atcon_node= d0atcon_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d0atcon_get_loc(x0) = x0.d0atcon_loc
implement
d0atcon_get_node(x0) = x0.d0atcon_node

(* ****** ****** *)

implement
d0atcon_make_node
(loc, node) = $rec
{
  d0atcon_loc= loc, d0atcon_node= node
} (* end of [d0atcon_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0atype_tbox = $rec{
  d0atype_loc= loc_t
, d0atype_node= d0atype_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d0atype_get_loc(x0) = x0.d0atype_loc
implement
d0atype_get_node(x0) = x0.d0atype_node

(* ****** ****** *)

implement
d0atype_make_node
(loc, node) = $rec
{
  d0atype_loc= loc, d0atype_node= node
} (* end of [d0atype_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp0.dats] *)
