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
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
htcst_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
htvar_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
hdcon_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
hdcst_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
hdvar_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local
//
typedef
htcst_struct = @{
//
  htcst_loc= loc_t
, htcst_sym= sym_t // name
, htcst_sort= h0srt // type
, htcst_stamp= stamp // unicity
//
, htcst_abstdf2= h0typopt
//
, htcst_hdconlst= Option(hdconlst)
//
} (* end of [htcst_tbox] *)
//
absimpl
htcst_tbox = ref(htcst_struct)
//
in(* in-of-local *)

(* ****** ****** *)
//
implement
htcst_get_sym
(htc) = htc->htcst_sym
implement
htcst_get_sort
(htc) = htc->htcst_sort
implement
htcst_get_stamp
(htc) = htc->htcst_stamp
//
(* ****** ****** *)
//
implement
htcst_get_abstdf2
(htc) = htc->htcst_abstdf2
implement
htcst_set_abstdf2
(htc, h0t) =
(htc->htcst_abstdf2 := Some(h0t))
//
(* ****** ****** *)
//
implement
htcst_get_hdconlst
(htc) = htc->htcst_hdconlst
implement
htcst_set_hdconlst
(htc, hdcs) =
(htc->htcst_hdconlst := Some(hdcs))
//
(* ****** ****** *)

implement
htcst_make_idst
(loc, sym, hst) =
(
ref<htcst_struct>
@{
  htcst_loc=loc
, htcst_sym=sym
, htcst_sort=hst
, htcst_stamp=stmp
//
, htcst_abstdf2= None()
//
, htcst_hdconlst= None()
//
}
) where
{
val stmp = htcst_stamp_new()
}

end // end of [local]

(* ****** ****** *)
implement
eq_htcst_htcst(x1, x2) =
( x1.stamp() = x2.stamp() )
(* ****** ****** *)

local
//
typedef
htvar_struct = @{
//
  htvar_sym= sym_t // name
, htvar_sort= h0srt // type
, htvar_stamp= stamp // unicity
//
} (* end of [htvar_tbox] *)
//
absimpl
htvar_tbox = ref(htvar_struct)
//
in(* in-of-local *)

(* ****** ****** *)

implement
htvar_get_sym
(htv) = htv->htvar_sym
implement
htvar_get_sort
(htv) = htv->htvar_sort
implement
htvar_get_stamp
(htv) = htv->htvar_stamp

(* ****** ****** *)

implement
htvar_make_idst
  (sym, hst) =
(
ref<htvar_struct>
@{
  htvar_sym=sym
, htvar_sort=hst
, htvar_stamp=stmp
}
) where
{
val stmp = htvar_stamp_new()
}

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
implement
eq_htvar_htvar(x1, x2) =
( x1.stamp() = x2.stamp() )
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
hdcon_struct = @{
//
  hdcon_loc= loc_t // loc
, hdcon_sym= sym_t // name
, hdcon_tag= tag_t // tag
, hdcon_tqas= htqas // tqas
, hdcon_type= h0typ // type
, hdcon_dvar= hdvar // r-time
, hdcon_stamp= stamp // unicity
//
} (* end of [hdcon_tbox] *)

absimpl
hdcon_tbox = ref(hdcon_struct)

in(* in-of-local *)

(* ****** ****** *)

implement
hdcon_get_loc
(hdc) = hdc->hdcon_loc
implement
hdcon_get_sym
(hdc) = hdc->hdcon_sym
//
implement
hdcon_get_tag
(hdc) = hdc->hdcon_tag
implement
hdcon_set_tag
(hdc, tag) =
(hdc->hdcon_tag := tag)
//
implement
hdcon_get_tqas
(hdc) = hdc->hdcon_tqas
implement
hdcon_get_type
(hdc) = hdc->hdcon_type
//
implement
hdcon_get_dvar
(hdc) = hdc->hdcon_dvar
//
implement
hdcon_get_stamp
(hdc) = hdc->hdcon_stamp

(* ****** ****** *)

implement
hdcon_make_idtp
( loc
, sym
, tqas, htp0) =
(
ref<hdcon_struct>
@{
  hdcon_loc=loc
, hdcon_sym=sym
, hdcon_tag=(~1)
, hdcon_tqas=tqas
, hdcon_type=htp0
, hdcon_dvar=hdv0
, hdcon_stamp=stmp
}
) where
{
//
  val knd =
  T_EOF(*void*)
//
  val hdv0 =
  hdvar_make_idtp
  (loc, sym, knd, htp0)
//
  val
  stmp = hdcon_stamp_new()
//
} (* end of [hdcon_make_idtp] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
typedef
htqas = htqarglst
//
typedef
hdcst_struct = @{
//
  hdcst_loc= loc_t // loc
, hdcst_sym= sym_t // name
, hdcst_kind= tnode // kind
, hdcst_tqas= htqas // tqas
, hdcst_type= h0typ // type
, hdcst_xknd= x2knd // xknd
, hdcst_xnam= x2nam // xnam
, hdcst_stamp= stamp // unicity
//
} (* end of [hdcon_tbox] *)

absimpl
hdcst_tbox = ref(hdcst_struct)

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

implement
hdcst_get_loc
(hdc) = hdc->hdcst_loc
implement
hdcst_get_sym
(hdc) = hdc->hdcst_sym
//
implement
hdcst_get_kind
(hdc) = hdc->hdcst_kind
//
implement
hdcst_get_type
(hdc) = hdc->hdcst_type
//
implement
hdcst_get_xknd
(hdc) = hdc->hdcst_xknd
implement
hdcst_get_xnam
(hdc) = hdc->hdcst_xnam
//
implement
hdcst_get_stamp
(hdc) = hdc->hdcst_stamp

(* ****** ****** *)

implement
hdcst_make_idtp
( loc
, sym
, knd
, tqas, htp0
, xkd1, xnm2) =
(
ref<hdcst_struct>
@{
  hdcst_loc=loc
, hdcst_sym=sym
, hdcst_kind=knd
, hdcst_tqas=tqas
, hdcst_type=htp0
, hdcst_xknd=xkd1
, hdcst_xnam=xnm2
, hdcst_stamp=stmp
}
) where
{
val stmp = hdcst_stamp_new()
} (* end of [hdcst_make_idtp] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

typedef
hdvar_struct = @{
//
  hdvar_loc= loc_t // loc
, hdvar_sym= sym_t // name
, hdvar_kind= tnode // kind
, hdvar_type= h0typ // type
, hdvar_stamp= stamp // unicity
//
} (* end of [hdvar_tbox] *)

absimpl
hdvar_tbox = ref(hdvar_struct)

in(* in-of-local *)

implement
hdvar_get_loc
(hdv) = hdv->hdvar_loc
implement
hdvar_get_sym
(hdv) = hdv->hdvar_sym
//
implement
hdvar_get_kind
(hdv) = hdv->hdvar_kind
implement
hdvar_get_type
(hdv) = hdv->hdvar_type
//
implement
hdvar_get_stamp
(hdv) = hdv->hdvar_stamp

implement
hdvar_make_idtp
( loc
, sym, knd, htp) =
(
ref<hdvar_struct>
@{
  hdvar_loc=loc
, hdvar_sym=sym
, hdvar_kind=knd
, hdvar_type=htp
, hdvar_stamp=stmp
}
) where
{
val stmp = hdvar_stamp_new()
}

end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0.dats] *)
