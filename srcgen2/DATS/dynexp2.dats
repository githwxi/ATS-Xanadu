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
Sat 27 Aug 2022 02:42:37 AM EDT
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)

local
//
datatype
d2parsed =
D2PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d2eclistopt)//program
//
#absimpl
d2parsed_tbox = d2parsed
//
in//local

(* ****** ****** *)

#implfun
d2parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D2PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_stadyn]

(* ****** ****** *)

#implfun
d2parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D2PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_nerror]

(* ****** ****** *)

#implfun
d2parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D2PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_source]

(* ****** ****** *)

#implfun
d2parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D2PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d2parsed_make_args
(stadyn,nerror,source,parsed) =
(
D2PARSED(stadyn,nerror,source,parsed)
) where
{
(*
val () =
prerrln
("d2parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d2parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d2parsed) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp2.dats] *)
