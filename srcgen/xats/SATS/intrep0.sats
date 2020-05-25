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
// Start Time: May 24, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"

(* ****** ****** *)

abstype t0var_type
typedef t0var = t0var_type

(* ****** ****** *)

abstype t0lab_type
abstype f0lab_type
typedef t0lab = t0lab_type
typedef f0lab = f0lab_type

(* ****** ****** *)

abstype i0val_type
abstype i0cmd_type
typedef i0val = i0val_type
typedef i0cmd = i0cmd_type

(* ****** ****** *)

typedef i0valist = List0(i0val)
typedef i0valopt = Option(i0val)

(* ****** ****** *)
//
datatype
i0val_node =
//
| I0Vint of token
| I0Vbtf of token
| I0Vchr of token
| I0Vflt of token
| I0Vstr of token
//
| I0Vtmp of t0var // tmp variables
//
| I0Varg of d2var
| I0Vcst of d2cst // dyn constants
| I0Venv of d2var // for env variables
| I0Vvar of
    (d2var, i0val) // for local variables
  // end of [I0Vvar]
//
| I0Verror of (d3exp) // for error indication
//
(* ****** ****** *)

datatype
i0cmd_node =
//
| CMDflab of (f0lab)
| CMDtlab of (t0lab)
//
| CMDcmnt of (string)
//
| CMDmove_val of (t0var, i0val) // tmp := i0v
| CMDmove_ref of (t0var, i0val) // tmp := ref(i0v)
//
(* ****** ****** *)

(* end of [intrep0.sats] *)
