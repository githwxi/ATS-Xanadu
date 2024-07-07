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
Wed 26 Jul 2023 01:08:16 PM EDT
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/fperr30.sats"
(* ****** ****** *)
//
#implfun
list_fperr30_fnp
{  syn:tx  }
(  out, lst, fpr  ) =
(
list_foreach<syn>(lst)) where
{
//
#impltmp
foreach$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(list_fperr30_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_fperr30_fnp
{  syn:tx  }
(  out, opt, fpr  ) =
(
optn_foreach<syn>(opt)) where
{
//
#impltmp
foreach$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(optn_fperr30_fnp(opt,err,fpr))
//
(* ****** ****** *)
//
#implfun
fperr30_d3parsed
  (out, dpar) = let
//
val nerror =
d3parsed_get_nerror(dpar)
//
in//let
if
(nerror > 0) then
let
val parsed =
d3parsed_get_parsed(dpar)
in//let
fperr30_d3eclistopt(out, parsed) end else ()
end (*let*)//end-of-[fperr30_d3parsed(out,dpar)]
//
(* ****** ****** *)
//
#implfun
fperr30_d3explstopt
  (out, dopt) =
(
case+ dopt of
|
optn_nil() => ((*void*))
|
optn_cons(d3es) => fperr30_d3explst(out, d3es)
)
//
(* ****** ****** *)
//
#implfun
fperr30_d3eclistopt
  (out, dopt) =
(
case+ dopt of
|
optn_nil() => ((*void*))
|
optn_cons(d3cs) => fperr30_d3eclist(out, d3cs)
)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr30.dats] *)
