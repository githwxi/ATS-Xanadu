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
// HX-2023-08-14
// Mon Aug 14 14:38:03 EDT 2023
//
(* ****** ****** *)
//
#include "prelude/SATS/gbas000.sats"
#include "prelude/SATS/gnum000.sats"
#include "prelude/SATS/gord000.sats"
//
(* ****** ****** *)
#include "prelude/SATS/rand000.sats"
(* ****** ****** *)
//
#include "prelude/SATS/bool000.sats"
#include "prelude/SATS/char000.sats"
#include "prelude/SATS/gint000.sats"
#include "prelude/SATS/gflt000.sats"
#include "prelude/SATS/strn000.sats"
//
(* ****** ****** *)
//
#include "prelude/SATS/arrn000.sats"
#include "prelude/SATS/arrn001.sats"
//
#include "prelude/SATS/list000.sats"
#include "prelude/SATS/optn000.sats"
#include "prelude/SATS/strm000.sats"
#include "prelude/SATS/tupl000.sats"
//
(* ****** ****** *)
//
#include "prelude/SATS/gfor000.sats"
//
#include "prelude/SATS/gfun000.sats"
//
#include "prelude/SATS/gmap000.sats"
//
#include "prelude/SATS/gras000.sats"
#include "prelude/SATS/grasn00.sats"
//
#include "prelude/SATS/gseq000.sats"
#include "prelude/SATS/gseq001.sats"
#include "prelude/SATS/gseqn00.sats"
//
#include "prelude/SATS/genv000.sats"
//
(* ****** ****** *)
#include "prelude/SATS/synoug0.sats"
(* ****** ****** *)
//
#include "prelude/SATS/VT/strn000_vt.sats"
//
(* ****** ****** *)
//
#include "prelude/SATS/VT/arrn000_vt.sats"
#include "prelude/SATS/VT/arrn001_vt.sats"
//
#include "prelude/SATS/VT/list000_vt.sats"
#include "prelude/SATS/VT/optn000_vt.sats"
#include "prelude/SATS/VT/strm000_vt.sats"
#include "prelude/SATS/VT/tupl000_vt.sats"
//
(* ****** ****** *)
//
#include "prelude/SATS/VT/gseq000_vt.sats"
#include "prelude/SATS/VT/gseqn00_vt.sats"
//
(* ****** ****** *)
#include "prelude/SATS/VT/synoug0_vt.sats"
(* ****** ****** *)
//
(*
(*
HX-2023-08-18:
This does not work as 
the type definitions in the above included
files are not yet accessible!
*)
#staload
UNSF(*unsafe*) = "prelude/SATS/unsafex.sats"
*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_INIT_srcgen2_prelude.sats] *)
