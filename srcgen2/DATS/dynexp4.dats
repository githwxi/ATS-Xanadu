(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Dec 26 22:51:15 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload node with d4exp_get_node
(* ****** ****** *)
#symload lctn with d4ecl_get_lctn
#symload node with d4ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d4exp_none0
(  loc0  ) =
d4exp_make_node
(loc0,D4Enone0((*void*)))
#implfun
d4exp_none1
(  dexp  ) =
d4exp_make_node
(
dexp.lctn(),D4Enone1(dexp))
#implfun
d4exp_none2
(  dexp  ) =
d4exp_make_node
(
dexp.lctn(),D4Enone2(dexp))
//
(* ****** ****** *)
//
#implfun
d4ecl_none0
(  loc0  ) =
d4ecl_make_node
(loc0,D4Cnone0((*void*)))
#implfun
d4ecl_none1
(  d3cl  ) =
d4ecl_make_node
(
d3cl.lctn(),D4Cnone1(d3cl))
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d4exp =
D4EXP of
( loctn
, s2typ, d4exp_node)
datavwtp
d4exp_vt =
D4EXP_vt of
( loctn
, s2typ, d4exp_node)
//
#absimpl d4exp_tbox = d4exp
//
in (* in-of-local *)
//
#implfun
d4exp_make_node
(   loc,nod   ) =
(
let
val t2p =
s2typ_none0() in
D4EXP(loc, t2p, nod) endlet)
//
endloc (*local*) // end of [local(d4exp)]

(* ****** ****** *)

local
//
datatype
d4ecl =
D4ECL of
( loctn, d4ecl_node)
datavwtp
d4ecl_vt =
D4ECL_vt of
( loctn, d4ecl_node)
//
#absimpl d4ecl_tbox = d4ecl
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d4ecl_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in D4ECL(loc, nod)
endlet//end-of-[d4ecl_make_node(...)]
//
(* ****** ****** *)
//
#implfun
d4ecl_get_lctn(dcl) =
let
  val+D4ECL(loc,nod) = dcl in loc
end//let//end-of-[d4ecl_get_node(loc)]
#implfun
d4ecl_get_node(dcl) =
let
  val+D4ECL(loc,nod) = dcl in nod
end//let//end-of-[d4ecl_get_node(dcl)]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d4ecl)]

(* ****** ****** *)
(* ****** ****** *)


local
//
datatype
d4parsed =
D4PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d1topenv // t1penv
,
d2topenv // t2penv
,
d3topenv // t3penv
,
d4eclistopt)//program
//
#absimpl
d4parsed_tbox = d4parsed
//
in//local

(* ****** ****** *)

#implfun
d4parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_stadyn]

(* ****** ****** *)

#implfun
d4parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_nerror]

(* ****** ****** *)

#implfun
d4parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_source]

(* ****** ****** *)

#implfun
d4parsed_get_t1penv
  (dpar) =
(
  t1penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t1penv]

(* ****** ****** *)

#implfun
d4parsed_get_t2penv
  (dpar) =
(
  t2penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t2penv]

(* ****** ****** *)

#implfun
d4parsed_get_t3penv
  (dpar) =
(
  t3penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t3penv]

(* ****** ****** *)

#implfun
d4parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d4parsed_make_args
( stadyn
, nerror, source
, t1penv, t2penv
, t3penv, parsed) =
(
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed)) where
{
(*
val () =
prerrln
("d4parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d4parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d4parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.dats] *)
