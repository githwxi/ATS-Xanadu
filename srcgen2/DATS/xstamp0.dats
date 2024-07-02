(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)

local

#absimpl
stamp_type = uint

in//local

#implval
the_stamp_nil =
gint_sint2uint(0)

#implfun
stamp_get_uint(tmp) = tmp
#implfun
stamp_make_uint(tmp) = tmp

end (*local*) // end of [local]

(* ****** ****** *)

local

#absimpl
stamper_tbox = a0ref(uint)

in//local

(*
HX: [stamp(0)] is special
*)
#implfun
stamper_new
  ( ) = a0ref_make_1val(1u)
//
#implfun
stamper_tmpset
  (obj, cnt) =
(
 a0ref_set(obj, g0s2u(cnt))
)
//
#implfun
stamper_getinc
  (  obj  ) =
(
stamp(cnt)) where
{
val cnt = a0ref_get(obj)
val ( ) = a0ref_set(obj,succ(cnt))
} (*where*)//end-of(stamper_getinc)
//
end (*local*) // end of [local]

(* ****** ****** *)
//
#implfun
stamp_nilq(tmp) = (tmp.uint() = 0u)
//
(* ****** ****** *)
//
#implfun
stamp_cmp(x1, x2) = x1.uint()\cmp(x2.uint())
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xstamp0.dats] *)
