(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun May 18 01:19:46 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/staexp2.sats"
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "\
./../../../SATS/locinfo.sats"
#staload "\
./../../../SATS/staexp2.sats"
#staload "\
./../../../SATS/statyp2.sats"
#staload "\
./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
t2iag1 =
T2IAG1 of (loc_t, s2typ1lst)
//
#absimpl t2iag1_tbox = t2iag1
//
datatype
t2iag1_vt =
T2IAG1_vt of (loc_t, s2typ1lst)
//
in (* in-of-local *)
//
#implfun
t2iag1_lctn$get
  (  t2ia  ) =
let
val+
T2IAG1
(loc0, t2qs) = t2ia in loc0 end
//
#implfun
t2iag1_t2qs$get
  (  t2ia  ) =
let
val+
T2IAG1
(loc0, t2qs) = t2ia in t2qs end
//
#implfun
t2iag1_make_t2qs
(  loc0, t2qs  ) = T2IAG1(loc0, t2qs)
//
(* ****** ****** *)
//
end (*local*) // end of [local(t2iag1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
t2jag1 =
T2JAG1 of (loc_t, s2typ1lst)
//
#absimpl t2jag1_tbox = t2jag1
//
datatype
t2jag1_vt =
T2JAG1_vt of (loc_t, s2typ1lst)
//
in (* in-of-local *)
//
#implfun
t2jag1_lctn$get
  (  t2ja  ) =
let
val+
T2JAG1
(loc0, t2qs) = t2ja in loc0 end
//
#implfun
t2jag1_t2qs$get
  (  t2ja  ) =
let
val+
T2JAG1
(loc0, t2qs) = t2ja in t2qs end
//
#implfun
t2jag1_make_t2qs
(  loc0, t2qs  ) = T2JAG1(loc0, t2qs)
//
(* ****** ****** *)
//
end (*local*) // end of [local(t2jag1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp2.dats] *)
(***********************************************************************)
