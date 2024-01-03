(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
For functional lin-streams.
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Tue Jan  2 20:48:52 EST 2024
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#sexpdef strm_vt = stream_vt
#sexpdef strq_vt = streaq_vt
#sexpdef strx_vt = streax_vt
*)
(* ****** ****** *)
//
fun<>
strmcon_vt_nil_
{a:vt}
((*void*)): strmcon_vt(a)
fun
<a:vt>
strmcon_vt_cons_
( x0: (a)
, xs
: strm_vt(a)): strmcon_vt(a)
//
fun
<a:vt>
strxcon_vt_cons_
( x0: (a)
, xs
: strx_vt(a)): strxcon_vt(a)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strmcon_vt_uncons_cfr
( xs: strmcon_vt( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, strm_vt(x0)) -<cfr> r0): r0
fun
<x0:vt>
<r0:vt>
strxcon_vt_uncons_cfr
( xs: strxcon_vt( x0 )
, f1: (x0, strx_vt(x0)) -<cfr> r0): r0
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm001_vt.sats] *)
