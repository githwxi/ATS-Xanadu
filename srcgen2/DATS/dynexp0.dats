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
Start Time: June 19th, 2022
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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)

local
//
datatype
d0pat =
D0PAT of
(
loctn, d0pat_node)
#absimpl
d0pat_tbox = d0pat
//
in (* in-of-local *)
//
#implfun
d0pat_make_node
(   loc,nod   ) = D0PAT(loc,nod)
//
#implfun
d0pat_get_lctn(d0p) =
let
  val+D0PAT(loc,nod) = d0p in loc
end
#implfun
d0pat_get_node(d0p) =
let
  val+D0PAT(loc,nod) = d0p in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0exp =
D0EXP of
(
loctn, d0exp_node)
#absimpl
d0exp_tbox = d0exp
//
in (* in-of-local *)
//
#implfun
d0exp_make_node
(   loc,nod   ) = D0EXP(loc,nod)
//
#implfun
d0exp_get_lctn(d0e) =
let
  val+D0EXP(loc,nod) = d0e in loc
end
#implfun
d0exp_get_node(d0e) =
let
  val+D0EXP(loc,nod) = d0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0ecl =
D0ECL of
(
loctn, d0ecl_node)
#absimpl
d0ecl_tbox = d0ecl
//
in (* in-of-local *)
//
#implfun
d0ecl_make_node
(   loc,nod   ) = D0ECL(loc,nod)
//
#implfun
d0ecl_get_lctn(dcl) =
let
  val+D0ECL(loc,nod) = dcl in loc
end
#implfun
d0ecl_get_node(dcl) =
let
  val+D0ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp0.dats] *)
