(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June, 2020
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
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local
//
(*
HX-2020-09-13:
The tag of a constructor is
nonnegative if the constructor
is associated with a datatype.
Otherwise, the tag is set to be
-1 to indicate the constructor
is associated with 'exception'.
*)
//
typedef
tag_t = int
typedef
htqas = htqarglst
//
(* ****** ****** *)
//
typedef
h0con_struct = @{
//
  h0con_loc= loc_t // loc
, h0con_sym= sym_t // name
, h0con_ctag= tag_t // ctag
, h0con_tqas= htqas // tqas
, h0con_type= h0typ // type
, h0con_dvar= h0var // r-time
, h0con_stamp= stamp // unicity
//
} (* end of [h0con_tbox] *)

absimpl
h0con_tbox = ref(h0con_struct)

in(* in-of-local *)

(* ****** ****** *)

implement
h0con_get_loc
(hdc) = hdc->h0con_loc
implement
h0con_get_sym
(hdc) = hdc->h0con_sym
//
implement
h0con_get_ctag
(hdc) = hdc->h0con_ctag
implement
h0con_set_ctag
(hdc, tag) =
(hdc->h0con_ctag := tag)
//
implement
h0con_get_tqas
(hdc) = hdc->h0con_tqas
implement
h0con_get_type
(hdc) = hdc->h0con_type
//
implement
h0con_get_dvar
(hdc) = hdc->h0con_dvar
//
implement
h0con_get_stamp
(hdc) = hdc->h0con_stamp

(* ****** ****** *)

implement
h0con_make_idtp
( loc
, sym
, tqas, htp0) =
(
ref<h0con_struct>
@{
//
  h0con_loc=loc
, h0con_sym=sym
//
, h0con_ctag=(~1)
, h0con_tqas=tqas
, h0con_type=htp0
, h0con_dvar=hdv0
, h0con_stamp=stmp
//
}
) where
{
//
  val knd =
  T_EOF(*void*)
//
  val hdv0 =
  h0var_make_idtp
  (loc, sym, knd, htp0)
//
  val
  stmp = h0con_stamp_new()
//
} (* end of [h0con_make_idtp] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
implement
eq_h0con_h0con(x1, x2) =
( x1.stamp() = x2.stamp() )
(* ****** ****** *)

local
//
typedef
htqas = htqarglst
//
typedef
h0cst_struct = @{
//
  h0cst_loc= loc_t // loc
, h0cst_sym= sym_t // name
, h0cst_kind= tnode // kind
, h0cst_tqas= htqas // tqas
, h0cst_type= h0typ // type
, h0cst_xknd= x2knd // xknd
, h0cst_xnam= x2nam // xnam
, h0cst_stamp= stamp // unicity
//
} (* end of [h0cst_tbox] *)

absimpl
h0cst_tbox = ref(h0cst_struct)

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

implement
h0cst_get_loc
(hdc) = hdc->h0cst_loc
implement
h0cst_get_sym
(hdc) = hdc->h0cst_sym
//
implement
h0cst_get_kind
(hdc) = hdc->h0cst_kind
//
implement
h0cst_get_type
(hdc) = hdc->h0cst_type
//
implement
h0cst_get_xknd
(hdc) = hdc->h0cst_xknd
implement
h0cst_get_xnam
(hdc) = hdc->h0cst_xnam
//
implement
h0cst_get_stamp
(hdc) = hdc->h0cst_stamp

(* ****** ****** *)

implement
h0cst_make_idtp
( loc
, sym
, knd
, tqas, htp0
, xkd1, xnm2) =
(
ref<h0cst_struct>
@{
  h0cst_loc=loc
, h0cst_sym=sym
, h0cst_kind=knd
, h0cst_tqas=tqas
, h0cst_type=htp0
, h0cst_xknd=xkd1
, h0cst_xnam=xnm2
, h0cst_stamp=stmp
}
) where
{
val stmp = h0cst_stamp_new()
} (* end of [h0cst_make_idtp] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
implement
eq_h0cst_h0cst(x1, x2) =
( x1.stamp() = x2.stamp() )
(* ****** ****** *)

implement
h0cst_fcastq(hdc) =
let
val
knd = h0cst_get_kind(hdc)
in
//
case+ knd of
|
T_FUN(fnk) =>
(
case+ fnk of
| FNKfcast() => true
| _(*non-FNKfcast*) => false
)
(*
  | T_VAL(vlk) => false
*)
| _ (* rest-of-tnode *) => false
//
end // end of [h0cst_fcastq]

(* ****** ****** *)

local

(* ****** ****** *)

typedef
h0var_struct = @{
//
  h0var_loc= loc_t // loc
, h0var_sym= sym_t // name
, h0var_kind= tnode // kind
, h0var_type= h0typ // type
, h0var_stamp= stamp // unicity
//
} (* end of [h0var_tbox] *)

absimpl
h0var_tbox = ref(h0var_struct)

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

implement
h0var_get_loc
(hdv) = hdv->h0var_loc
implement
h0var_get_sym
(hdv) = hdv->h0var_sym
//
implement
h0var_get_kind
(hdv) = hdv->h0var_kind
implement
h0var_get_type
(hdv) = hdv->h0var_type
//
implement
h0var_get_stamp
(hdv) = hdv->h0var_stamp

(* ****** ****** *)

implement
h0var_make_idtp
( loc
, sym, knd, htp) =
(
ref<h0var_struct>
@{
  h0var_loc=loc
, h0var_sym=sym
, h0var_kind=knd
, h0var_type=htp
, h0var_stamp=stmp
}
) where
{
val stmp = h0var_stamp_new()
} // end of [h0var_make_idtp]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)
implement
eq_h0var_h0var(x1, x2) =
( x1.stamp() = x2.stamp() )
(* ****** ****** *)

local
//
absimpl
h0pat_tbox = $rec
{ h0pat_loc= loc_t
, h0pat_type= h0typ
, h0pat_node= h0pat_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0pat_get_loc
  (h0p) = h0p.h0pat_loc
//
implement
h0pat_get_type
  (h0p) = h0p.h0pat_type
//
implement
h0pat_get_node
  (h0p) = h0p.h0pat_node
//
implement
h0pat_make_node
(
loc0, h0t0, node
) = $rec
{ h0pat_loc= loc0
, h0pat_type= h0t0, h0pat_node= node
} (* h0pat_make_node *)
//
end (*local*) // end of [local]

(* ****** ****** *)

local
//
absimpl
h0fag_tbox = $rec
{ h0fag_loc= loc_t
, h0fag_node= h0fag_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0fag_get_loc
  (h0fa) = h0fa.h0fag_loc
//
implement
h0fag_get_node
  (h0fa) = h0fa.h0fag_node
//
implement
h0fag_make_node
(loc0, node) = $rec
{
h0fag_loc= loc0, h0fag_node= node
} (* h0fag_make_node *)
//
end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0exp_tbox = $rec
{ h0exp_loc= loc_t
, h0exp_type= h0typ
, h0exp_node= h0exp_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0exp_get_loc
  (h0e) = h0e.h0exp_loc
//
implement
h0exp_get_type
  (h0e) = h0e.h0exp_type
//
implement
h0exp_get_node
  (h0e) = h0e.h0exp_node
//
implement
h0exp_make_node
(
loc0, h0t0, node
) = $rec
{ h0exp_loc= loc0
, h0exp_type= h0t0, h0exp_node= node
} (* h0exp_make_node *)
//
end (*local*) // end of [local]

(* ****** ****** *)

local

absimpl
h0gua_tbox = $rec
{ h0gua_loc= loc_t
, h0gua_node= h0gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0gua_get_loc(x0) = x0.h0gua_loc
implement
h0gua_get_node(x0) = x0.h0gua_node

implement
h0gua_make_node
  (loc0, node) = $rec
{
  h0gua_loc= loc0, h0gua_node= node
} (* h0gua_make_node *)

end (*local*) // end of [local]

(* ****** ****** *)

local

absimpl
h0clau_tbox = $rec
{ h0clau_loc= loc_t
, h0clau_node= h0clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0clau_get_loc(x0) = x0.h0clau_loc
implement
h0clau_get_node(x0) = x0.h0clau_node

implement
h0clau_make_node
  (loc0, node) = $rec
{
  h0clau_loc= loc0, h0clau_node= node
} (* h0clau_make_node *)

end (*local*) // end of [local]

(* ****** ****** *)

local

absimpl
h0gpat_tbox = $rec
{ h0gpat_loc= loc_t
, h0gpat_node= h0gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0gpat_get_loc(x0) = x0.h0gpat_loc
implement
h0gpat_get_node(x0) = x0.h0gpat_node

implement
h0gpat_make_node
  (loc0, node) = $rec
{
  h0gpat_loc= loc0, h0gpat_node= node
} (* h0gpat_make_node *)

end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0dcl_tbox = $rec
{ h0dcl_loc= loc_t
, h0dcl_node= h0dcl_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0dcl_get_loc
(dcl) = dcl.h0dcl_loc
implement
h0dcl_get_node
(dcl) = dcl.h0dcl_node
//
implement
h0dcl_make_node
(loc0, node) = $rec
{
  h0dcl_loc= loc0, h0dcl_node= node
} (* h0dcl_make_node *)
//
end (*local*) // end of [local]

(* ****** ****** *)

(*
(*
HX-2022-01-30:
This code is moved to
[intrep0_staexp.dats]
*)
local

absimpl
htqarg_tbox = $rec
{
htqarg_loc= loc_t
,
htqarg_htvs= htvarlst
}

in (* in-of-local *)

implement
htqarg_make
(loc, htvs) = $rec
{
htqarg_loc= loc, htqarg_htvs= htvs
}

implement
htqarg_get_loc(x0) = x0.htqarg_loc
implement
htqarg_get_htvs(x0) = x0.htqarg_htvs

end (*local*) // end of [local]
*)

(* ****** ****** *)

(* end of [xats_intrep0_dynexp.dats] *)
