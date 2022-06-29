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
//
#if
VERBOSE_FIXITY0
#then
#print \
"Loading [fixity.sats] starts!\n"
#endif // end of [VERBOSE_FIXITY0]
//
(* ****** ****** *)
//
(*
#infixl app of 70
*)
//
(* ****** ****** *)
//
(*
HX: ATS-specialty:
*)
//
#prefix
!  of 69 (*stadyn*)
(*
#prefix
~  of 69 (*static*)
*)
#prefix
&  of 69 (*stadyn*)
#prefix
?  of 69 (*static*)
#prefix
?! of 69 (*static*)
//
(* ****** ****** *)
//
#infixl + of 50 (*add*)
#infixl - of 50 (*sub*)
//
#infixl * of 60 (*mul*)
#infixl / of 60 (*div*)
#infixl % of 60 (*mod*)
//
(* ****** ****** *)
//
(*
HX-2015-08-04:
FORTRAN-notation
for exponentiation
*)
//
#infixr ** of 61 (* exp *)
//
(* ****** ****** *)
//
#prefix + of +(+1) (*uplus*)
#prefix - of -(+1) (*uminus*)
//
(* ****** ****** *)
(*
#infixl nadd nsub of 50
#infixl nmul ndiv nmod of 60
*)
(* ****** ****** *)
//
#prefix ~ of 51 // lnot(*neg*)
//
(* ****** ****** *)
//
#infixl & of 46 // land(*mul*)
#infixl ^ of 45 // lxor(*add*)
(*
// HX: yet-to-do!
#infixl | of 45 // lor2(*add*)
*)
//
(*
#infixl asrn of 41
#infixl lsln lsrn of 41
*)
#infixl << of 41 // lsln
#infixl >> of 41 // asrn/lsrn
//
(* ****** ****** *)
//
#infixr @ of 40 (*flat*)
#prefix @ of 69 (*uflat*)
//
#infixr :: of 41 (* cons *)
#infixr ++ of 40 (* join *)
//
(* ****** ****** *)
//
#infix0 < <= of 40 (*lt/eq*)
#infix0 > >= of 40 (*gt/eq*)
#infix0 = != of 30 (*equal*)
//
#infix0 == !== of 30 (*eqref*)
//
(* ****** ****** *)
(*
#infix0
=== !=== of 30 // HX: for JS?
*)
(* ****** ****** *)
//
#infixl || of 20
#infixl && of ||(+1)
//
(* ****** ****** *)

#infixr -> of 10 (*funarrow*)

(* ****** ****** *)
//
#infix0 := of 0 // HX: assign
#infix0 :=: of 0 // HX: exchange
//
(*
#infix0 <-> of 0 // HX: exchange?
*)
//
(* ****** ****** *)

(*
#prefix ++ -- // HX: inc/dec
#prefix !++ --! // HX: getinc/decget
#infixr =++ --= // HX: setinc/decset
*)

(* ****** ****** *)

(*
#infix0
:+= :-= :*= :/= // x:=x+a, x:=x-a, ...
#infix0
:=+ :=- :=* :=/ // x:=a+x, x:=a-x, ...
*)

(* ****** ****** *)
//
#infixl
orelse of || // HX: short-cutting
#infixl
andalso of && // HX: short-cutting
//
(* ****** ****** *)

#prefix
$raise of 0 // raising an exception

(* ****** ****** *)
(*
#prefix
ignoret of 0 // ignoring a funcall return
*)
(* ****** ****** *)
//
#if
VERBOSE_FIXITY0
#then
#print \
"Loading [fixity.sats] is done!\n"
#endif // end of [VERBOSE_FIXITY0]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_fixity0.sats] *)
