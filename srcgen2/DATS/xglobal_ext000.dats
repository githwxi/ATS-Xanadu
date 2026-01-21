(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
(*
Author: Hongwei Xi
(*
Thu Jan 15 12:26:22 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
#typedef fxtyenv = topmap( fixty )
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-15:
Thu Jan 15 02:21:12 PM EST 2026
This one is idempotent.
If loading is done, 1 is returned
If no loading is done, 0 is returned.
This is a good example showing how one
can use templates to achieve a form
of "code mobility", which is of great
importance in programming.
*)
#extern
fun<(*tmp*)>
the_fxtyenv_pvsl00d((*0*)): sint(*0/1*)
#extern
fun<(*tmp*)>
the_fxtyenv_pvsl00d$atext((*0*)): (strn)
#extern
fun<(*tmp*)>
the_fxtyenv_pvsl00d$ntime((*0*)): (sint)
#extern
fun<(*tmp*)>
the_fxtyenv_pvsl00d$ntime$set(n0:sint): void
#extern
fun<(*tmp*)>
the_fxtyenv_pvsl00d$topmap$set(e0:fxtyenv): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
the_fxtyenv_pvsl00d
  ((*void*)) =
let
//
val n0 =
the_fxtyenv_pvsl00d$ntime
<  (*tmp*)  >( (*void*) )
val () =
the_fxtyenv_pvsl00d$ntime$set
<  (*tmp*)  >(     n0+1     )
//
in//let
//
if
(n0 > 0)
then ( 0 )
else f0_pvsl00d() end//let
where // end-of-let(val(test)
{
//
fun
f0_pvsl00d
((*void*)): sint =
let
//
val
dpar =
d0parsed_from_atext
(
0(*sta*), fixity0_sats)
where{
val
fixity0_sats =
the_fxtyenv_pvsl00d$atext
<  (*tmp*)  >(  (*void*)  ) }
//
val
dpar = d1parsed_of_trans01(dpar)
//
val
tenv = d1parsed_get_topenv(dpar)
//
(*
val () =
prerrsln("the_fxtyenv_pvsl00d:", tenv)
*)
//
in//let
(
case+ tenv of
|
D1TOPENV
( topenv ) => (  1  ) where
{
val ((*0*)) =
the_fxtyenv_pvsl00d$topmap$set
<  (*tmp*)  >(     topenv     ) } )
end(*let*)//end-of-[f0_pvsl00d((*0*))]
//
}(*where*)//end-of-[the_fxtyenv_pvsl00d()]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-18:
Sun Jan 18 05:36:02 PM EST 2026
This one just returns the
content of prelude/fixity0.sats
This makes sense as few changes
should be added to fixity0.sats!
*)
#impltmp
the_fxtyenv_pvsl00d$atext<>() = "\
(* ****** ****** *)
(*
The content of
prelude/fixity0.sats
*)
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
(*
HX: +1*2 = +(1*2)
HX: -1*2 = -(1*2)
*)
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
HX-2023-12-30:
BAR(|) is special;
it is for separating
proofs from programs!
#infixl | of 45 // lor2(*add*)
*)
//
(*
#infixl asrn of 41
#infixl lsln lsrn of 41
*)
#infixl << of 41 // lsln
#infixl >> of 41 // asrn
#infixl >>> of 41 // lsrn
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
#infix0 :=> of 0 // HX: exassign
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
#infixl orelse of || // HX: short-cutting
#infixl andalso of && // HX: short-cutting
//
(* ****** ****** *)
(* ****** ****** *)
//
#prefix $raise of 0 // raising an exception
//
(* ****** ****** *)
(* ****** ****** *)
//
"// end-of-[the_fxtyenv_pvsl00d$atext()=fixity0.sats]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_xglobal_ext000.dats] *)
(***********************************************************************)
