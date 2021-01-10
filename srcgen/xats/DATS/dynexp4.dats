(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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
SYM = "./../SATS/xsymbol.sats"
#staload
LOC = "./../SATS/locinfo.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp4.sats"
//
(* ****** ****** *)

local
//
absimpl
d4pat_tbox = $rec
{ d4pat_loc= loc_t
, d4pat_sexp= s2exp
, d4pat_type= t2ype
, d4pat_node= d4pat_node
} (* end of [absimpl] *)
//
in(* in-of-local *)
//
implement
d4pat_get_loc
  (d4p) = d4p.d4pat_loc
implement
d4pat_get_node
  (d4p) = d4p.d4pat_node
//
implement
d4pat_get_sexp
  (d4p) = d4p.d4pat_sexp
implement
d4pat_get_type
  (d4p) = d4p.d4pat_type
//
implement
d4pat_make_node
( loc0
, s2e0, t2p0, node
) = $rec
{ d4pat_loc= loc0
, d4pat_sexp= s2e0
, d4pat_type= t2p0, d4pat_node= node
} (* d4pat_make_node *)
//
end // end of [local]

(* ****** ****** *)

local
//
absimpl
d4exp_tbox = $rec
{ d4exp_loc= loc_t
, d4exp_sexp= s2exp
, d4exp_type= t2ype
, d4exp_node= d4exp_node
} (* end of [absimpl] *)
//
in(* in-of-local *)
//
implement
d4exp_get_loc
  (d4p) = d4p.d4exp_loc
implement
d4exp_get_node
  (d4p) = d4p.d4exp_node
//
implement
d4exp_get_sexp
  (d4p) = d4p.d4exp_sexp
implement
d4exp_get_type
  (d4p) = d4p.d4exp_type
//
implement
d4exp_make_node
( loc0
, s2e0, t2p0, node
) = $rec
{ d4exp_loc= loc0
, d4exp_sexp= s2e0
, d4exp_type= t2p0, d4exp_node= node
} (* d4exp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
d4ecl_tbox = $rec
{
  d4ecl_loc= loc_t
, d4ecl_node= d4ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d4ecl_get_loc(x0) = x0.d4ecl_loc
implement
d4ecl_get_node(x0) = x0.d4ecl_node

(* ****** ****** *)

implement
d4ecl_make_node
(loc, node) = $rec
{
  d4ecl_loc= loc, d4ecl_node= node
} (* end of [d4ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
d4ecl_none0(loc0) =
d4ecl_make_node
(loc0, D4Cnone0(*void*))
//
implement
d4ecl_none1(d3cl) =
(
d4ecl_make_node
(loc0, D4Cnone1(d3cl))
) where
{
  val loc0 = d3cl.loc((*void*))
}
//
(* ****** ****** *)

(* end of [xats_dynexp4.dats] *)
