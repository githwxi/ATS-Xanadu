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
// Authoremail: gmhwxiATgmailDOTcom
//
// This one was
// there at the very beginning of ATS
//
(* ****** ****** *)
//
(*
HX-2018-10:
fixity declarations
#include "prelude/xparam.hats"
*)
//
(* ****** ****** *)

#if
VERBOSE_FIXITY
#then
#print \
"Loading [fixity.ats] starts!\n"
#endif // end of [VERBOSE_FIXITY]

(* ****** ****** *)

(*
#infixl
app of 70 // app_prcdv
*)

(* ****** ****** *)
//
#prefix
! of 69 (* stadyn *)
#prefix
& of 69 (* stadyn *)
#prefix
? of 69 (* static *)
#prefix
?! of 69 (* static *)
//
(* ****** ****** *)
//
// HX-2015-08-04:
// mostly following the Fortran convention
//
#infixr ** of 61 (*exp*)
//
(* ****** ****** *)
//
// multiplicative
//
#infixl * / % of 60
//
(*
#infixl nmul ndiv nmod of 60
*)
//
(* ****** ****** *)

#prefix ~ of 51 (*negative*)

(* ****** ****** *)
//
#infixl + - of 50 (*additive*)
//
#prefix + of +(+1) (* uplus *)
#prefix - of -(+1) (* uminus *)
//
(*
#infixr (+) ++ // concatenative
*)
//
(* ****** ****** *)

#infixl asl asr of 41
#infixl lsl lsr of 41 

(* ****** ****** *)
//
#infixr @ of 40 (*flat*)
#prefix @ of 69 (*uflat*)
//
#infixr :: of 40 (* cons *)
//
(* ****** ****** *)
//
#infix0 < > <= >= of 40
//
#infix0 = != == !== of 30
//
(* ****** ****** *)

#infixl || of 20
#infixl && of ||(+1)

#infixl xor lxor of ||
#infixl lor orelse of ||
#infixl land andalso of &&

(* ****** ****** *)

#infixr -> of 10

(* ****** ****** *)

#infix0 := of 0 // HX: assign
#infix0 :=: of 0 // HX: exchange

(* ****** ****** *)

#infixl << of 0 (* HX: asl/lsl *)
#infixr >> of 0 (* HX: asr/lsr *)

(* ****** ****** *)

(*
#prefix ++ -- // inc and dec
#prefix !++ --! // getinc and decget
#infixr =++ --= // setinc and decset
*)

(* ****** ****** *)

(*
#infix0 :+= :-= :*= :/= // x:=x+a, x:=x-a, ...
#infix0 :=+ :=- :=* :=/ // x:=a+x, x:=a-x, ...
*)

(* ****** ****** *)

#prefix $raise of 0 // raising an excetion

(* ****** ****** *)

#prefix ignoret of 0 // ignoring a funcall return

(* ****** ****** *)

#if
VERBOSE_FIXITY
#then
#print \
"Loading [fixity.ats] is done!\n"
#endif // end of [VERBOSE_FIXITY]

(* ****** ****** *)

(* end of [fixity.sats] *)
