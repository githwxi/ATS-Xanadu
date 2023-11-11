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
Fri Nov 10 13:33:46 EST 2023
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
(*
#staload
_(*Trtmp3c*) = "./trtmp3c.dats"
*)
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
(* ****** ****** *)
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
(* ****** ****** *)
//
#implfun
trtmp3c_d3exp
(env0 , d3e0) =
let
//
(*
val
loc0 = d3e0.lctn()
val () =
prerrln
("trtmp3c_d3exp: loc0 = ", loc0)
val () =
prerrln
("trtmp3c_d3exp: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
//
|D3Evar _ => d3e0
//
|D3Eint _ => d3e0
|D3Ebtf _ => d3e0
|D3Echr _ => d3e0
|D3Eflt _ => d3e0
|D3Estr _ => d3e0
//
|D3Ei00 _ => d3e0
|D3Eb00 _ => d3e0
|D3Ec00 _ => d3e0
|D3Ef00 _ => d3e0
|D3Es00 _ => d3e0
//
|D3Econ _ => d3e0
|D3Ecst _ => d3e0
//
|D3Etop _ => d3e0
//
|
_(*otherwise*) => (d3exp_none2(d3e0))
//
end where // end-of-[trtmp3c_d3exp(...)]
{
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3c_d3exp(env0,d3e0)]


(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_dynexp.dats] *)
