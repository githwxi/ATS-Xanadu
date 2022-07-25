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
(*
Sun Jul 24 18:06:09 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)

local
//
datatype
d1pat =
D1PAT of
(loctn, d1pat_node)
//
#absimpl d1pat_tbox = d1pat
//
in (* in-of-local *)
//
#implfun
d1pat_make_node
(   loc,nod   ) = D1PAT(loc,nod)
//
#implfun
d1pat_get_lctn(d1p) =
let
  val+D1PAT(loc,nod) = d1p in loc
end
#implfun
d1pat_get_node(d1p) =
let
  val+D1PAT(loc,nod) = d1p in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1gua =
D1GUA of
(loctn, d1gua_node)
//
#absimpl d1gua_tbox = d1gua
//
in (* in-of-local *)
//
#implfun
d1gua_make_node
(   loc,nod   ) = D1GUA(loc,nod)
//
#implfun
d1gua_get_lctn(d1g) =
let
  val+D1GUA(loc,nod) = d1g in loc
end
#implfun
d1gua_get_node(d1g) =
let
  val+D1GUA(loc,nod) = d1g in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1gpt =
D1GPT of
(loctn, d1gpt_node)
//
#absimpl d1gpt_tbox = d1gpt
//
in (* in-of-local *)
//
#implfun
d1gpt_make_node
(   loc,nod   ) = D1GPT(loc,nod)
//
#implfun
d1gpt_get_lctn(d1g) =
let
  val+D1GPT(loc,nod) = d1g in loc
end
#implfun
d1gpt_get_node(d1g) =
let
  val+D1GPT(loc,nod) = d1g in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1cls =
D1CLS of
(loctn, d1cls_node)
//
#absimpl d1cls_tbox = d1cls
//
in (* in-of-local *)
//
#implfun
d1cls_make_node
(   loc,nod   ) = D1CLS(loc,nod)
//
#implfun
d1cls_get_lctn(dcl) =
let
  val+D1CLS(loc,nod) = dcl in loc
end
#implfun
d1cls_get_node(dcl) =
let
  val+D1CLS(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1.dats] *)
