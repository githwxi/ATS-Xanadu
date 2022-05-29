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
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
(* ****** ****** *)

local

absimpl
q1arg_tbox = $rec{
  q1arg_loc= loc_t
, q1arg_node= q1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
q1arg_get_loc(x0) = x0.q1arg_loc
implement
q1arg_get_node(x0) = x0.q1arg_node

(* ****** ****** *)

implement
q1arg_make_node
(loc, node) = $rec
{
  q1arg_loc= loc, q1arg_node= node
} (* end of [q1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
sq1arg_tbox = $rec{
  sq1arg_loc= loc_t
, sq1arg_node= sq1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
sq1arg_get_loc(x0) = x0.sq1arg_loc
implement
sq1arg_get_node(x0) = x0.sq1arg_node

(* ****** ****** *)

implement
sq1arg_make_node
(loc, node) = $rec
{
  sq1arg_loc= loc, sq1arg_node= node
} (* end of [sq1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
ti1arg_tbox = $rec{
  ti1arg_loc= loc_t
, ti1arg_node= ti1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
ti1arg_get_loc(x0) = x0.ti1arg_loc
implement
ti1arg_get_node(x0) = x0.ti1arg_node

(* ****** ****** *)

implement
ti1arg_make_node
(loc, node) = $rec
{
  ti1arg_loc= loc, ti1arg_node= node
} (* end of [ti1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
tq1arg_tbox = $rec{
  tq1arg_loc= loc_t
, tq1arg_node= tq1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
tq1arg_get_loc(x0) = x0.tq1arg_loc
implement
tq1arg_get_node(x0) = x0.tq1arg_node

(* ****** ****** *)

implement
tq1arg_make_node
(loc, node) = $rec
{
  tq1arg_loc= loc, tq1arg_node= node
} (* end of [tq1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
a1typ_tbox = $rec{
  a1typ_loc= loc_t
, a1typ_node= a1typ_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
a1typ_get_loc(x0) = x0.a1typ_loc
implement
a1typ_get_node(x0) = x0.a1typ_node

(* ****** ****** *)

implement
a1typ_make_node
(loc, node) = $rec
{
  a1typ_loc= loc, a1typ_node= node
} (* end of [a1typ_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1arg_tbox = $rec{
  d1arg_loc= loc_t
, d1arg_node= d1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
d1arg_get_loc(x0) = x0.d1arg_loc
implement
d1arg_get_node(x0) = x0.d1arg_node

(* ****** ****** *)

implement
d1arg_make_node
(loc, node) = $rec
{
  d1arg_loc= loc, d1arg_node= node
} (* end of [d1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1typ_tbox = $rec{
  d1typ_loc= loc_t
, d1typ_node= d1typ_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
d1typ_get_loc(x0) = x0.d1typ_loc
implement
d1typ_get_node(x0) = x0.d1typ_node

(* ****** ****** *)

implement
d1typ_make_node
(loc, node) = $rec
{
  d1typ_loc= loc, d1typ_node= node
} (* end of [d1typ_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1pat_tbox = $rec{
  d1pat_loc= loc_t
, d1pat_node= d1pat_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d1pat_get_loc(x0) = x0.d1pat_loc
implement
d1pat_get_node(x0) = x0.d1pat_node

(* ****** ****** *)

implement
d1pat_none
(loc) =
d1pat_make_node(loc, D1Pnone())
implement
d1pat_make_node
(loc, node) = $rec
{
  d1pat_loc= loc, d1pat_node= node
} (* end of [d1pat_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
f1arg_tbox = $rec{
  f1arg_loc= loc_t
, f1arg_node= f1arg_node
} (* f1arg_tbox *)

in (* in-of-local *)

(* ****** ****** *)

implement
f1arg_get_loc(x0) = x0.f1arg_loc
implement
f1arg_get_node(x0) = x0.f1arg_node

(* ****** ****** *)

implement
f1arg_make_node
(loc, node) = $rec
{
  f1arg_loc= loc, f1arg_node= node
} (* end of [f1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1exp_tbox = $rec{
  d1exp_loc= loc_t
, d1exp_node= d1exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d1exp_get_loc(x0) = x0.d1exp_loc
implement
d1exp_get_node(x0) = x0.d1exp_node

(* ****** ****** *)

implement
d1exp_none
(loc) =
d1exp_make_node(loc, D1Enone())
implement
d1exp_make_node
(loc, node) = $rec
{
  d1exp_loc= loc, d1exp_node= node
} (* end of [d1exp_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1gua_tbox = $rec{
  d1gua_loc= loc_t
, d1gua_node= d1gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d1gua_get_loc(x0) = x0.d1gua_loc
implement
d1gua_get_node(x0) = x0.d1gua_node

implement
d1gua_make_node
(loc, node) = $rec
{
  d1gua_loc= loc, d1gua_node= node
} (* end of [d1gua_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1gpat_tbox = $rec{
  d1gpat_loc= loc_t
, d1gpat_node= d1gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d1gpat_get_loc(x0) = x0.d1gpat_loc
implement
d1gpat_get_node(x0) = x0.d1gpat_node

implement
d1gpat_make_node
(loc, node) = $rec
{
  d1gpat_loc= loc, d1gpat_node= node
} (* end of [d1gpat_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1clau_tbox = $rec{
  d1clau_loc= loc_t
, d1clau_node= d1clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d1clau_get_loc(x0) = x0.d1clau_loc
implement
d1clau_get_node(x0) = x0.d1clau_node

implement
d1clau_make_node
(loc, node) = $rec
{
  d1clau_loc= loc, d1clau_node= node
} (* end of [d1clau_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1ecl_tbox = $rec{
  d1ecl_loc= loc_t
, d1ecl_node= d1ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d1ecl_get_loc(x0) = x0.d1ecl_loc
implement
d1ecl_get_node(x0) = x0.d1ecl_node

(* ****** ****** *)

implement
d1ecl_none0
(loc) =
d1ecl_make_node
( loc
, D1Cnone0()
)
implement
d1ecl_none1
(d0c) =
d1ecl_make_node
( loc
, D1Cnone1(d0c)
) where
{
  val loc = d0c.loc()
}
//
implement
d1ecl_make_node
(loc, node) = $rec
{
  d1ecl_loc= loc, d1ecl_node= node
} (* end of [d1ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
d1fundecl_get_loc
  (f1d0) = let
//
val+
D1FUNDECL(rcd) = f1d0 in rcd.loc
//
end // end of [d1fundecl_get_loc]

(* ****** ****** *)

implement
d1valdecl_get_loc
  (v1d0) = let
//
val+
D1VALDECL(rcd) = v1d0 in rcd.loc
//
end // end of [d1valdecl_get_loc]

(* ****** ****** *)

implement
d1cstdecl_get_loc
  (d1c0) = let
//
val+
D1CSTDECL(rcd) = d1c0 in rcd.loc
//
end // end of [d1cstdecl_get_loc]

(* ****** ****** *)

(*
implement
d1fundecl_classify
  (f1d0) = let
//
val+
D1FUNDECL(rcd) = f1d0
//
in
//
(
case+ dopt of
| None() => 0 | Some(d1e) => 1
) where
{
  val dopt = rcd.def
}
//
end // end of [d1fundecl_classify]

implement
d1valdecl_classify
  (v1d0) = let
//
val+
D1VALDECL(rcd) = v1d0
//
in
//
(
case+ dopt of
| None() => 0 | Some(d1e) => 1
) where
{
  val dopt = rcd.def
}
//
end // end of [d1valdecl_classify]
*)

(* ****** ****** *)

(* end of [xats_dynexp1.dats] *)
