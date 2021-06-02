(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March 27, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./locinfo.sats"
(* ****** ****** *)
#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./cstrnt0.sats"
(* ****** ****** *)
//
abstbox c1hyp_tbox = ptr
abstbox c1str_tbox = ptr
//
typedef c1hyp = c1hyp_tbox
typedef c1str = c1str_tbox
typedef c1strlst = List0(c1str)
//
(* ****** ****** *)
//
datatype
c1knd =
//
| C1Knone of ()
//
| C1Kbloc of ()
//
| C1Ksexi of ()
//
| C1Kif0 | C1Kcas0 of ()
//
| C1Klams of () | C1Kfix1 of ()
//
| C1Kfun0 of () | C1Kimpl of ()
//
(* ****** ****** *)
//
fun
print_c1knd : print_type(c1knd)
fun
prerr_c1knd : prerr_type(c1knd)
fun
fprint_c1knd : fprint_type(c1knd)
//
overload print with print_c1knd
overload prerr with prerr_c1knd
overload fprint with fprint_c1knd
//
(* ****** ****** *)
//
datatype
c1itm =
//
| C1Igimp of ()
//
| C1Isvar of s2var
| C1Ichyp of c1hyp
| C1Icstr of c1str
(*
| C1Idisj of c1strlst
*)
//
and c1str_node =
| C1Ssexp of s2exp
| C1Scstr of c0str
| C1Smwfd of (s2explst)
| C1Sitms of (c1itmlst)
| C1Seqeq of (s2exp, s2exp)
| C1Stple of (s2exp, s2exp)
| C1Stpeq of (s2exp, s2exp)
//
and c1hyp_node =
//
| C1Hsexp of s2exp
| C1Hbind of (s2var, s2exp)
//
| C1Heqeq of (s2exp, s2exp)
| C1Htpeq of (s2exp, s2exp)
//
where
c1itmlst = List0(c1itm)
//
vtypedef
c1itmlst_vt = List0_vt(c1itm)
//
(* ****** ****** *)
//
fun
print_c1itm : print_type(c1itm)
fun
prerr_c1itm : prerr_type(c1itm)
fun
fprint_c1itm : fprint_type(c1itm)
//
overload print with print_c1itm
overload prerr with prerr_c1itm
overload fprint with fprint_c1itm
//
(* ****** ****** *)
//
fun
c1str_get_loc
( c1s: c1str ): loc_t
fun
c1str_get_node
( c1s: c1str ): c1str_node
//
overload .loc with c1str_get_loc
overload .node with c1str_get_node
//
fun
print_c1str : print_type(c1str)
fun
prerr_c1str : prerr_type(c1str)
fun
fprint_c1str : fprint_type(c1str)
//
overload print with print_c1str
overload prerr with prerr_c1str
overload fprint with fprint_c1str
//
(* ****** ****** *)
//
fun
c1hyp_get_loc
( c1s: c1hyp ): loc_t
fun
c1hyp_get_node
( c1s: c1hyp ): c1hyp_node
//
overload .loc with c1hyp_get_loc
overload .node with c1hyp_get_node
//
fun
print_c1hyp : print_type(c1hyp)
fun
prerr_c1hyp : prerr_type(c1hyp)
fun
fprint_c1hyp : fprint_type(c1hyp)
//
overload print with print_c1hyp
overload prerr with prerr_c1hyp
overload fprint with fprint_c1hyp
//
(* ****** ****** *)
//
fun
c1hyp_make_node
( loc0: loc_t
, node: c1hyp_node): c1hyp
//
fun
c1str_make_node1
( loc0: loc_t
, node: c1str_node): c1str
fun
c1str_make_node2
( loc0: loc_t
, knd0: c1knd
, node: c1str_node): c1str
//
#symload
c1str_make_node with c1str_make_node1
#symload
c1str_make_node with c1str_make_node2
//
(* ****** ****** *)

(* end of [xats_cstrnt1.sats] *)
