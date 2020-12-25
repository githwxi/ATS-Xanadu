(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xbasics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"

(* ****** ****** *)
//
abstbox d4pat_tbox = ptr
typedef d4pat = d4pat_tbox
typedef d4patlst = List0(d4pat)
typedef d4patopt = Option(d4pat)
//
(* ****** ****** *)
//
abstbox d4exp_tbox = ptr
abstbox t3imp_tbox = ptr
//
typedef d4exp = d4exp_tbox
typedef d4explst = List0(d4exp)
typedef d4expopt = Option(d4exp)
typedef d4explstopt = Option(d4explst)
//
(* ****** ****** *)
//
abstbox d4gua_tbox = ptr
typedef d4gua = d4gua_tbox
typedef d4gualst = List0(d4gua)
//
abstbox d4gpat_tbox = ptr
typedef d4gpat = d4gpat_tbox
//
abstbox d4clau_tbox = ptr
typedef d4clau = d4clau_tbox
typedef d4claulst = List0(d4clau)
//
(* ****** ****** *)
//
abstbox d4ecl_tbox = ptr
//
typedef d4ecl = d4ecl_tbox
typedef d4eclist = List0(d4ecl)
typedef d4eclopt = Option(d4ecl)
//
typedef d4eclistopt = Option(d4eclist)
//
(* ****** ****** *)

datatype
d4pat_node =
//
| D4Pnil of ()
//
| D4Pany of ()
| D4Pvar of (d2var)
//
| D4Pint of (token)
| D4Pbtf of (token)
| D4Pchr of (token)
| D4Pflt of (token)
| D4Pstr of (token)
//
| D4Pcon1 of (d2con)
| D4Pcon2 of (d2conlst)
//
| D4Pbang of (d4pat) // !
| D4Pflat of (d4pat) // @
| D4Pfree of (d4pat) // ~
//
| D4Psym0 of
  (d1pat(*sym*), d2pitmlst)
//
| D4Psap0 of (d4pat, s2explst)
| D4Psap1 of (d4pat, s2explst)
//
| D4Pdap1 of (d4pat)
| D4Pdapp of
  (d4pat, int(*npf*), d4patlst)
//
| D4Ptuple of
  (int(*knd*), int(*npf*), d4patlst)
//
| D4Panno of (d4pat, s2exp) // no s2xtv in anno
//
| D4Ptcast of (d4pat, t2ype) // HX: error indication?
//
| D4Pnone0 of ()
| D4Pnone1 of (d3pat) | D4Pnone2 of (d4pat)
//
(* ****** ****** *)

(* end of [xats_dynexp4.sats] *)
