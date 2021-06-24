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
#staload "./../SATS/xstamp0.sats"
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
#staload "./../SATS/cstrnt0.sats"
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
} (*$rec*) // d4pat_make_node
//
end // end of [local]

(* ****** ****** *)

implement
d4pat_none1
( d3p0 ) =
d4pat_make_node
( loc0
, s2e0, t2p0, node) where
{
  val loc0 = d3p0.loc()
  val t2p0 = d3p0.type()
  val s2e0 =
  the_s2exp_none0(*void*)
  val node = D4Pnone1(d3p0)
} (* end of [d4pat_none1] *)

(* ****** ****** *)

implement
d4pat_tasmp
( d4p1, s2e2 ) =
d4pat_make_node
( loc1
(*
HX-2021-03-28:
[s2e1] should not
be changed to [s2e2]!
*)
, s2e1, t2p1, node) where
{
//
  val loc1 = d4p1.loc()
  val t2p1 = d4p1.type()
  val s2e1 = d4p1.sexp()
//
  val cstr =
  c0str_make_tasmp
  (s2e1(*src*), s2e2(*dst*))
  val node = D4Ptasmp(d4p1, cstr)
//
} (* end of [d4pat_tasmp] *)

(* ****** ****** *)
(*
implement
d4pat_tcast
( d4p1, s2e2 ) =
d4pat_make_node
( loc1
(*
HX-2021-03-28:
[s2e1] should not
be changed to [s2e2]!
*)
, s2e1, t2p1, node) where
{
//
  val loc1 = d4p1.loc()
  val t2p1 = d4p1.type()
  val s2e1 = d4p1.sexp()
//
  val cstr =
  c0str_make_tcast
  ( loc1
  , s2e1(*src*), s2e2(*dst*))
  val node = D4Ptcast(d4p1, cstr)
//
} (* end of [d4pat_tcast] *)
*)
(* ****** ****** *)

local

absimpl
f4arg_tbox = $rec{
  f4arg_loc= loc_t
, f4arg_node= f4arg_node
} (* f4arg_tbox *)

in (* in-of-local *)

implement
f4arg_get_loc(x0) = x0.f4arg_loc
implement
f4arg_get_node(x0) = x0.f4arg_node

(* ****** ****** *)

implement
f4arg_make_node
(loc, node) = $rec
{
  f4arg_loc= loc, f4arg_node= node
} (* end of [f4arg_make_node] *)

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

implement
d4exp_none1
( d3e0 ) =
d4exp_make_node
( loc0
, s2e0, t2p0, node) where
{
  val loc0 = d3e0.loc()
  val t2p0 = d3e0.type()
  val s2e0 =
  the_s2exp_none0(*void*)
  val node = D4Enone1(d3e0)
} (*where*) // d4exp_none1

(* ****** ****** *)

implement
d4exp_none2
( d4e0 ) =
d4exp_make_node
( loc0
, s2e0, t2p0, node) where
{
  val loc0 = d4e0.loc()
  val t2p0 = d4e0.type()
  val s2e0 = d4e0.sexp()
  val node = D4Enone2(d4e0)
} (*where*) // d4exp_none2

(* ****** ****** *)

implement
d4exp_tcast
( d4e1, s2e2 ) =
d4exp_make_node
( loc1
, s2e2, t2p1, node) where
{
//
  val loc1 = d4e1.loc()
  val t2p1 = d4e1.type()
  val s2e1 = d4e1.sexp()
//
  val cstr =
  c0str_make_tcast
  (s2e1(*src*), s2e2(*dst*))
  val node = D4Etcast(d4e1, cstr)
//
} (*where*) // d4exp_make_node

(* ****** ****** *)
//
implement
d4exp_leakify
  (d4e0) = let
//
val
s2e0 = d4e0.sexp()
//
in
//
if
not
(
s2exp_islin(s2e0)
) then d4e0 else let
//
val loc0 = d4e0.loc()
val t2p0 = d4e0.type()
//
in
//
d4exp_make_node
( loc0
, s2e0, t2p0, D4Eleakd(d4e0))
//
end // else // end of [if]
//
end // end of [d4exp_leakify]
//
(* ****** ****** *)

local

absimpl
d4gua_tbox = $rec
{ d4gua_loc= loc_t
, d4gua_node= d4gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d4gua_get_loc(x0) = x0.d4gua_loc
implement
d4gua_get_node(x0) = x0.d4gua_node

implement
d4gua_make_node
  (loc0, node) = $rec
{
  d4gua_loc= loc0, d4gua_node= node
} (* d4gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d4clau_tbox = $rec
{ d4clau_loc= loc_t
, d4clau_node= d4clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d4clau_get_loc(x0) = x0.d4clau_loc
implement
d4clau_get_node(x0) = x0.d4clau_node

implement
d4clau_make_node
  (loc0, node) = $rec
{
  d4clau_loc= loc0, d4clau_node= node
} (* d4clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d4gpat_tbox = $rec
{ d4gpat_loc= loc_t
, d4gpat_node= d4gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d4gpat_get_loc(x0) = x0.d4gpat_loc
implement
d4gpat_get_node(x0) = x0.d4gpat_node

implement
d4gpat_make_node
  (loc0, node) = $rec
{
  d4gpat_loc= loc0, d4gpat_node= node
} (* d4gpat_make_node *)

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
(
  d4ecl_make_node
  (loc0, D4Cnone0(*void*))
)
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

local

(* ****** ******)
#staload
FS =
"libats/SATS\
/funset_avltree.sats"
(* ****** ******)
#staload
_(*FS*) =
"libats/DATS\
/funset_avltree.dats"
#staload
_(*QL*) =
"libats/DATS/qlist.dats"
(* ****** ******)
//
typedef elt = d2var
//
(* ****** ******)
//
absimpl
dlocs_type = $FS.set(elt)
//
(* ****** ******)
//
implement
$FS.compare_elt_elt<elt>
(k1, k2) =
$effmask_all
(compare(k1.stamp(), k2.stamp()))
//
(* ****** ******)

in(* in-of-local *)

(* ****** ******)
//
implement
dlocs_nil() = $FS.funset_nil()
//
(* ****** ******)

implement
dlocs_ismem
(dvs, d2v) =
$FS.funset_is_member<elt>(dvs, d2v)

(* ****** ****** *)

implement
dlocs_insert
(dvs, d2v) =
let
var dvs = dvs
val-false =
$FS.funset_insert<elt>(dvs, d2v) in dvs
end // end of [dlocs_insert]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

(* ****** ******)
#staload
FM =
"libats/SATS\
/funmap_avltree.sats"
(* ****** ******)
#staload
_(*FM*) =
"libats/DATS\
/funmap_avltree.dats"
#staload
_(*QL*) =
"libats/DATS/qlist.dats"
(* ****** ******)
//
typedef key = d2var
typedef itm = s2exp
//
(* ****** ******)
//
absimpl
stmap_type = $FM.map(key, itm)
//
(* ****** ******)
//
implement
$FM.equal_key_key<key>
(k1, k2) =
$effmask_all
(k1.stamp() = k2.stamp())
implement
$FM.compare_key_key<key>
(k1, k2) =
$effmask_all
(compare(k1.stamp(), k2.stamp()))
//
(* ****** ******)

in(*in-of-local*)

(* ****** ******)
//
implement
stmap_nil() = $FM.funmap_nil()
//
(* ****** ******)

implement
stmap_ismem
(map, key) =
let
//
var res: itm
//
val ans =
$FM.funmap_search<key,itm>(map,key,res)
//
in
let prval() = opt_clear{itm}(res) in ans end
end (*let*) // end of [stmap_ismem]

(* ****** ****** *)

implement
stmap_insert
(map, key, itm) =
let
val
ismem = stmap_ismem(map, key)
(*
val () =
println!("stmap_insert: key = ", key)
val () =
println!("stmap_insert: itm = ", itm)
*)
in
if
ismem
then false
else (true) where
{
val-
~None_vt() =
$FM.funmap_insert_opt<key,itm>(map,key,itm)
} (*where*)
end (*let*) // end of [stmap_insert]

(* ****** ****** *)

implement
stmap_remove
( map, key ) =
$FM.funmap_remove<key,itm>(map, key)

(* ****** ****** *)
//
implement
stmap_listize
( map ) = $FM.funmap_listize<key,itm>( map )
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp4.dats] *)
