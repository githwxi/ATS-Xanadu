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
(* ****** ****** *)
(*
** for flat tuples
** for boxd tuples
*)
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2023-08-06:
@(...): flat tuple
#(...): boxd tuple
$tup(...): boxd tuple
(Change: $(...) -> #(...))
Sun Aug  6 19:45:40 EDT 2023
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(Around some time in 2022)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Copying over from [srcgen1]
Sun 04 Aug 2024 05:41:59 PM EDT
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
t0up1_t0
(a0: t0) = @(  a0  )
#vwtpdef
t0up1_vt
(a0: vt) = @(  a0  )
//
#typedef
t1up1_t0
(a0: t0) = $tup_t0(a0)
#vwtpdef
t1up1_vt
(a0: vt) = $tup_vt(a0)
//
#sexpdef t0up = t0up1_t0
#sexpdef t1up = t1up1_t0
#sexpdef t0up_vt = t0up1_vt
#sexpdef t1up_vt = t1up1_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
t0up2_t0
(a0:t0,a1:t0) = @(a0,a1)
#vwtpdef
t0up2_vt
(a0:vt,a1:vt) = @(a0,a1)
//
#typedef
t1up2_t0
(a0:t0,a1:t0) = $tup_t0(a0,a1)
#vwtpdef
t1up2_vt
(a0:vt,a1:vt) = $tup_vt(a0,a1)
//
#sexpdef t0up = t0up2_t0//len-2
#sexpdef t1up = t1up2_t0//len-2
#sexpdef t0up_vt = t0up2_vt//len-2
#sexpdef t1up_vt = t1up2_vt//len-2
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
*)
#typedef
t0up3_t0
(a0:t0,a1:t0,a2:t0) = @(a0,a1,a2)
#vwtpdef
t0up3_vt
(a0:vt,a1:vt,a2:vt) = @(a0,a1,a2)
//
#typedef
t1up3_t0
(a0:t0,a1:t0,a2:t0) = $tup_t0(a0,a1,a2)
#vwtpdef
t1up3_vt
(a0:vt,a1:vt,a2:vt) = $tup_vt(a0,a1,a2)
//
#sexpdef t0up = t0up3_t0//len-3
#sexpdef t1up = t1up3_t0//len-3
#sexpdef t0up_vt = t0up3_vt//len-3
#sexpdef t1up_vt = t1up3_vt//len-3
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-18:
Sun 18 Aug 2024 09:16:41 PM EDT
*)
#typedef
t0up4_t0
(a0:t0
,a1:t0,a2:t0,a3:t0) = @(a0,a1,a2,a3)
#vwtpdef
t0up4_vt
(a0:vt
,a1:vt,a2:vt,a3:vt) = @(a0,a1,a2,a3)
//
#typedef
t1up4_t0
(a0:t0
,a1:t0,a2:t0,a3:t0) = $tup_t0(a0,a1,a2,a3)
#vwtpdef
t1up4_vt
(a0:vt
,a1:vt,a2:vt,a3:vt) = $tup_vt(a0,a1,a2,a3)
//
#sexpdef t0up = t0up4_t0//len-4
#sexpdef t1up = t1up4_t0//len-4
#sexpdef t0up_vt = t0up4_vt//len-4
#sexpdef t1up_vt = t1up4_vt//len-4
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-18:
Sun 18 Aug 2024 09:17:01 PM EDT
*)
#typedef
t0up5_t0
(a0:t0,a1:t0
,a2:t0,a3:t0,a4:t0) = @(a0,a1,a2,a3,a4)
#vwtpdef
t0up5_vt
(a0:vt,a1:vt
,a2:vt,a3:vt,a4:vt) = @(a0,a1,a2,a3,a4)
//
#typedef
t1up5_t0
(a0:t0,a1:t0
,a2:t0,a3:t0,a4:t0) = $tup_t0(a0,a1,a2,a3,a4)
#vwtpdef
t1up5_vt
(a0:vt,a1:vt
,a2:vt,a3:vt,a4:vt) = $tup_vt(a0,a1,a2,a3,a4)
//
#sexpdef t0up = t0up5_t0//len-5
#sexpdef t1up = t1up5_t0//len-5
#sexpdef t0up_vt = t0up5_vt//len-5
#sexpdef t1up_vt = t1up5_vt//len-5
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-18:
Sun 18 Aug 2024 09:17:01 PM EDT
*)
#typedef
t0up6_t0
(a0:t0,a1:t0,a2:t0
,a3:t0,a4:t0,a5:t0) = @(a0,a1,a2,a3,a4,a5)
#vwtpdef
t0up6_vt
(a0:vt,a1:vt,a2:vt
,a3:vt,a4:vt,a5:vt) = @(a0,a1,a2,a3,a4,a5)
//
#typedef
t1up6_t0
(a0:t0,a1:t0,a2:t0
,a3:t0,a4:t0,a5:t0) = $tup_t0(a0,a1,a2,a3,a4,a5)
#vwtpdef
t1up6_vt
(a0:vt,a1:vt,a2:vt
,a3:vt,a4:vt,a5:vt) = $tup_vt(a0,a1,a2,a3,a4,a5)
//
#sexpdef t0up = t0up6_t0//len-6
#sexpdef t1up = t1up6_t0//len-6
#sexpdef t0up_vt = t0up6_vt//len-6
#sexpdef t1up_vt = t1up6_vt//len-6
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_tupl000.sats] *)
