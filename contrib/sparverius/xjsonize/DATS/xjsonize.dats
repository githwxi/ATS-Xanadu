(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: November, 2019
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

#staload "./../SATS/json.sats"
#staload "./../SATS/basics.sats"
#staload "./../SATS/fixity.sats"
#staload "./../SATS/label0.sats"
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/stamp0.sats"
#staload "./../SATS/symbol.sats"
#staload "./../SATS/filpath.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/interp0.sats"
(* #staload "./../SATS/trans01.sats" *)

(* #staload _ = "./json.dats" *)
(* #staload _ = "./basics.dats" *)
(* #staload _ = "./label0.dats" *)
(* #staload _ = "./locinfo.dats" *)
(* #staload _ = "./lexing_token.dats" *)
(* #staload _ =  "./filpath.dats" *)
(* #staload _ = "./staexp0.dats" *)
(* #staload _ = "./dynexp0.dats" *)
(* #staload _ = "./stamp0.dats" *)
(* #staload _ = "./symbol.dats" *)
(* #staload _ = "./staexp1.dats" *)
(* #staload _ = "./dynexp1.dats" *)
(* #staload _ = "./statyp2.dats" *)
(* #staload _ = "./staexp2.dats" *)
(* #staload _ = "./dynexp2.dats" *)
(* #staload _ = "./dynexp3.dats" *)
(* #staload _ = "./intrep0.dats" *)

#ifdef
_LIBXJSONIZE_
#then
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "libxjsonize_dynloadall"
#endif // #ifdef



#dynload "./json.dats"
#dynload "./basics.dats"
#dynload "./stamp0.dats"
#dynload "./symbol.dats"
#dynload "./label0.dats"
#dynload "./locinfo.dats"
#dynload "./lexing_token.dats"
#dynload "./filpath.dats"
#dynload "./staexp0.dats"
#dynload "./dynexp0.dats"
#dynload "./staexp1.dats"
#dynload "./dynexp1.dats"
#dynload "./statyp2.dats"
#dynload "./staexp2.dats"
#dynload "./dynexp2.dats"
#dynload "./dynexp3.dats"
#dynload "./intrep0.dats"
#dynload "./interp0.dats"
//
(* ****** ****** *)
//
#ifdef
_LIBXJSONIZE_
#then
#else
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then interp0_main0(argc, argv)
else prerrln! ("Hello from ATS3(xinterp)!")
// end of [if]
) (* end of [main] *)
#endif // ifdef(_LIBXJSONIZE_)
//
(* ****** ****** *)

(* end of [xjsonize.dats] *)
