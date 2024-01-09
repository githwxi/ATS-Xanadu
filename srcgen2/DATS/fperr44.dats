(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jan  9 07:54:19 EST 2024
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
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/fperr44.sats"
(* ****** ****** *)
//
#implfun
list_fperr44_fnp
{  syn:tx  }
(  out, lst, fpr  ) =
(
list_foreach<syn>(lst)) where
{
//
#impltmp
foreach$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(list_fperr44_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_fperr44_fnp
{  syn:tx  }
(  out, opt, fpr  ) =
(
optn_foreach<syn>(opt)) where
{
//
#impltmp
foreach$work<syn>(syn) = fpr(out, syn)
//
}(*where*)//end(optn_fperr44_fnp(opt,err,fpr))
//
(* ****** ****** *)
//
#implfun
fperr44_d3parsed
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
fperr44_d4eclistopt(out, parsed) end else ()
end (*let*)//end-of-[fperr44_d3parsed(out,dpar)]
//
(* ****** ****** *)
//
#implfun
fperr44_d4explstopt
  (out, dopt) =
(
case+ dopt of
|
optn_nil() => ((*void*))
|
optn_cons(d4es) => fperr44_d4explst(out, d4es)
)
//
(* ****** ****** *)
//
#implfun
fperr44_d4eclistopt
  (out, dopt) =
(
case+ dopt of
|
optn_nil() => ((*void*))
|
optn_cons(d3cs) => fperr44_d4eclist(out, d3cs)
)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr44.dats] *)
