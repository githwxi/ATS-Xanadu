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
q0arg =
Q0ARG of
(
loctn, q0arg_node)
#absimpl
q0arg_tbox = q0arg
//
in (* in-of-local *)
//
#implfun
q0arg_make_node
(   loc,nod   ) = Q0ARG(loc,nod)
//
#implfun
q0arg_get_lctn(q0a) =
let
  val+Q0ARG(loc,nod) = q0a in loc
end
#implfun
q0arg_get_node(q0a) =
let
  val+Q0ARG(loc,nod) = q0a in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0qag =
S0QAG of
(
loctn, s0qag_node)
#absimpl
s0qag_tbox = s0qag
//
in (* in-of-local *)
//
#implfun
s0qag_make_node
(   loc,nod   ) = S0QAG(loc,nod)
//
#implfun
s0qag_get_lctn(sqa) =
let
  val+S0QAG(loc,nod) = sqa in loc
end
#implfun
s0qag_get_node(sqa) =
let
  val+S0QAG(loc,nod) = sqa in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0qag =
T0QAG of
(
loctn, t0qag_node)
#absimpl
t0qag_tbox = t0qag
//
in (* in-of-local *)
//
#implfun
t0qag_make_node
(   loc,nod   ) = T0QAG(loc,nod)
//
#implfun
t0qag_get_lctn(tqa) =
let
  val+T0QAG(loc,nod) = tqa in loc
end
#implfun
t0qag_get_node(tqa) =
let
  val+T0QAG(loc,nod) = tqa in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0iag =
T0IAG of
(
loctn, t0iag_node)
#absimpl
t0iag_tbox = t0iag
//
in (* in-of-local *)
//
#implfun
t0iag_make_node
(   loc,nod   ) = T0IAG(loc,nod)
//
#implfun
t0iag_get_lctn(tia) =
let
  val+T0IAG(loc,nod) = tia in loc
end
#implfun
t0iag_get_node(tia) =
let
  val+T0IAG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
a0typ =
A0TYP of
(
loctn, a0typ_node)
#absimpl
a0typ_tbox = a0typ
//
in (* in-of-local *)
//
#implfun
a0typ_make_node
(   loc,nod   ) = A0TYP(loc,nod)
//
#implfun
a0typ_get_lctn(a0t) =
let
  val+A0TYP(loc,nod) = a0t in loc
end
#implfun
a0typ_get_node(a0t) =
let
  val+A0TYP(loc,nod) = a0t in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0arg =
D0ARG of
(
loctn, d0arg_node)
#absimpl
d0arg_tbox = d0arg
//
in (* in-of-local *)
//
#implfun
d0arg_make_node
(   loc,nod   ) = D0ARG(loc,nod)
//
#implfun
d0arg_get_lctn(d0a) =
let
  val+D0ARG(loc,nod) = d0a in loc
end
#implfun
d0arg_get_node(d0a) =
let
  val+D0ARG(loc,nod) = d0a in nod
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

local
//
datatype
d0cstdcl =
D0CSTDCL of
( loc_t
, d0pid
, d0arglst,s0res,d0res)
//
#absimpl
d0cstdcl_tbox = d0cstdcl
//
in//local
//
#implfun
d0cstdcl_get_lctn
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in lctn end
//
#implfun
d0cstdcl_get_darg
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in darg end
//
#implfun
d0cstdcl_get_dpid
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dpid end
//
#implfun
d0cstdcl_get_sres
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in sres end
//
#implfun
d0cstdcl_get_dres
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dres end
//
#implfun
d0cstdcl_make_args
(lctn, dpid, darg, sred, dres) =
D0CSTDCL(lctn, dpid, darg, sred, dres)
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp0.dats] *)
