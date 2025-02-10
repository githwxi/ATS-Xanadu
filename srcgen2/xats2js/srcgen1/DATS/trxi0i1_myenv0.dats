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
//
(*
Author: Hongwei Xi
//
Sat 16 Mar 2024 07:04:29 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
iltlst = list(i1let)
(* ****** ****** *)
(* ****** ****** *)
#typedef
d2vtop = $MAP.topmap(i1val)
#vwtpdef
d2vstk = $MAP.stkmap(i1val)
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2var_get_lctn
(*
#symload name with d2var_get_name
*)
#symload unam with d2var_get_unam
(* ****** ****** *)
//
#symload
stkmap_nilq with $MAP.stkmap_nilq(*cbv*)
//
(* ****** ****** *)
//
#symload
stkmap_pshlam0 with $MAP.stkmap_pshlam0(*cbr*)
#symload
stkmap_pshlet0 with $MAP.stkmap_pshlet0(*cbr*)
#symload
stkmap_pshloc1 with $MAP.stkmap_pshloc1(*cbr*)
#symload
stkmap_pshloc2 with $MAP.stkmap_pshloc2(*cbr*)
//
#symload
stkmap_poplam0 with $MAP.stkmap_poplam0(*cbr*)
#symload
stkmap_poplet0 with $MAP.stkmap_poplet0(*cbr*)
#symload
stkmap_poploc0 with $MAP.stkmap_poploc0(*cbr*)
//
(* ****** ****** *)
//
#symload
topmap_make_nil with $MAP.topmap_make_nil(*void*)
#symload
stkmap_make_nil with $MAP.stkmap_make_nil(*void*)
//
#symload
stkmap_free_nil with $MAP.stkmap_free_nil(*void*)
//
(* ****** ****** *)
//
#symload
topmap_search$opt with $MAP.topmap_search$opt(*cbr*)
#symload
stkmap_search$opt with $MAP.stkmap_search$opt(*cbr*)
//
#symload
topmap_insert$any with $MAP.topmap_insert$any(*cbr*)
#symload
stkmap_insert$any with $MAP.stkmap_insert$any(*cbr*)
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
datavwtp
iltstk =
//
|iltstk_nil of ( (*v0*) ) 
//
|iltstk_blk0 of ( iltstk ) 
//
|iltstk_lam0 of ( iltstk ) 
|iltstk_let0 of ( iltstk ) 
//
(*
|iltstk_ift0 of ( iltstk ) 
|iltstk_cas0 of ( iltstk ) 
*)
//
|iltstk_cons of (i1let, iltstk)
//
(* ****** ****** *)
#absimpl iltstk_vtbx = iltstk
(* ****** ****** *)
//
datavwtp
envi0i1 =
ENVI0I1 of
(d2vtop,d2vstk,iltstk)
//
#absimpl envi0i1_vtbx = envi0i1
//
(* ****** ****** *)
(* ****** ****** *)
in//local
(* ****** ****** *)
(* ****** ****** *)
//
fun
iltstk_free_nil
(stk0: ~iltstk): void =
(
case-
stk0 of ~iltstk_nil() => ())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print1<iltstk>(stk0) =
iltstk_fprint1
(g_print$out<>( (*nil*) ), stk0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
iltstk_pshblk0
  (  stk0  ) =
(
  stk0 := iltstk_blk0(stk0))
//(*end of [iltstk_pshblk0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
iltstk_pshlam0
  (  stk0  ) =
(
  stk0 := iltstk_lam0(stk0))
//(*end of [iltstk_pshlam0(stk0)]*)
//
#implfun
iltstk_pshlet0
  (  stk0  ) =
(
  stk0 := iltstk_let0(stk0))
//(*end of [iltstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
(*
#implfun
iltstk_pshift0
  (  stk0  ) =
(
  stk0 := iltstk_ift0(stk0))
//(*end of [iltstk_pshift0(stk0)]*)
*)
//
(*
#implfun
iltstk_pshcas0
  (  stk0  ) =
(
  stk0 := iltstk_cas0(stk0))
//(*end of [iltstk_pshcas0(stk0)]*)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
iltstk_popblk0
  (  stk0  ) = let
//
fnx
loop
( kxs
: iltstk
, res: iltlst
, err: &sint >> _):
  @(iltstk, iltlst) =
(
case+ kxs of
//
| ~
iltstk_blk0
(   kxs   ) => (kxs, res)
//
| ~
iltstk_cons
(ilt , kxs) =>
(
  loop(kxs, res, err)) where
{
  val res = list_cons(ilt, res)
}
//
| !
iltstk_nil() =>
let
val () = err:=1 in (kxs,res) end
//
| !
iltstk_lam0 _ =>
let
val () = err:=1 in (kxs,res) end
| !
iltstk_let0 _ =>
let
val () = err:=1 in (kxs,res) end
//
(*
| !
iltstk_ift0 _ =>
let
val () = err:=1 in (kxs,res) end
| !
iltstk_cas0 _ =>
let
val () = err:=1 in (kxs,res) end
*)
//
)(*case+*)//end-[loop(kxs,res,err)]
//
in//let
//
let
var err: int = 0
val res: iltlst = list_nil()
val
(stk1,res) =
loop
(stk0,res,err) in stk0 := stk1; res
end//let
//
end//let
//(* end of [iltstk_popblk0(stk)] *)
//
(* ****** ****** *)
//
#implfun
iltstk_poplam0
  (  stk0  ) = let
//
fnx
loop
( kxs
: iltstk
, res: iltlst
, err: &sint >> _):
  @(iltstk, iltlst) =
(
case+ kxs of
//
| ~
iltstk_lam0
(   kxs   ) => (kxs, res)
//
| ~
iltstk_cons
(ilt , kxs) =>
(
  loop(kxs, res, err)) where
{
  val res = list_cons(ilt, res)
}
//
| !
iltstk_nil() =>
let
val () = err:=1 in (kxs,res) end
//
| !
iltstk_blk0 _ =>
let
val () = err:=1 in (kxs,res) end
//
| !
iltstk_let0 _ =>
let
val () = err:=1 in (kxs,res) end
//
(*
| !
iltstk_ift0 _ =>
let
val () = err:=1 in (kxs,res) end
| !
iltstk_cas0 _ =>
let
val () = err:=1 in (kxs,res) end
*)
//
)(*case+*)//end-[loop(kxs,res,err)]
//
in//let
//
let
var err: int = 0
val res: iltlst = list_nil()
val
(stk1,res) =
loop
(stk0,res,err) in stk0 := stk1; res
end//let
//
end//let
//(* end of [iltstk_poplam0(stk)] *)
//
(* ****** ****** *)
//
#implfun
iltstk_poplet0
  (  stk0  ) = let
//
fnx
loop
( kxs
: iltstk
, res: iltlst
, err: &sint >> _):
  @(iltstk, iltlst) =
(
case+ kxs of
//
| ~
iltstk_let0
(   kxs   ) => (kxs, res)
//
| ~
iltstk_cons
(ilt , kxs) =>
(
  loop(kxs, res, err)) where
{
  val res = list_cons(ilt, res)
}
//
| !
iltstk_nil() =>
let
val () = err:=1 in (kxs,res) end
//
| !
iltstk_blk0 _ =>
let
val () = err:=1 in (kxs,res) end
//
| !
iltstk_lam0 _ =>
let
val () = err:=1 in (kxs,res) end
//
(*
| !
iltstk_ift0 _ =>
let
val () = err:=1 in (kxs,res) end
| !
iltstk_cas0 _ =>
let
val () = err:=1 in (kxs,res) end
*)
//
)(*case+*)//end-[loop(kxs,res,err)]
//
in//let
//
let
var err: int = 0
val res: iltlst = list_nil()
val
(stk1,res) =
loop
(stk0,res,err) in stk0 := stk1; res
end//let
//
end//let
//(* end of [iltstk_poplet0(stk)] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
iltstk_insert_ilet
  (  stk0, ilet  ) =
(
  stk0 := iltstk_cons(ilet, stk0))
//(*end of [iltstk_insert_ilet(...)]*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_make_nil
  ((*void*)) =
(
ENVI0I1
(d2vtop,d2vstk,iltstk)) where
{
  val iltstk = iltstk_nil()
  val d2vtop = topmap_make_nil()
  val d2vstk = stkmap_make_nil()
}(*where*) // end of [envi0i1_make_nil]
//
(* ****** ****** *)
//
#implfun
envi0i1_free_top
  (  env0  ) =
let
//
val+
~ENVI0I1
(d2vtop,d2vstk,iltstk) = env0
//
in//let
  stkmap_free_nil(d2vstk);
  iltstk_free_nil(iltstk); ((*void*))
end//let
(*case+*)//end-of-(envi0i1_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_pshblk0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
iltstk_pshblk0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshblk0(env0))
//
#implfun
envi0i1_popblk0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
$fold(env0); ilts) where
{
  val ilts = iltstk_popblk0(iltstk) }
//
end(*let*)//end-of-(envi0i1_popblk0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_pshlam0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshlam0(d2vstk);
iltstk_pshlam0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshlam0(env0))
//
#implfun
envi0i1_poplam0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
$fold(env0); ilts) where
{
  val nerr = stkmap_poplam0(d2vstk)
  val ilts = iltstk_poplam0(iltstk) }
//
end(*let*)//end-of-(envi0i1_poplam0(env0))
//
(* ****** ****** *)
//
#implfun
envi0i1_pshlet0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshlet0(d2vstk);
iltstk_pshlet0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshlet0(env0))
//
#implfun
envi0i1_poplet0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
$fold(env0); ilts) where
{
  val nerr = stkmap_poplet0(d2vstk)
  val ilts = iltstk_poplet0(iltstk) }
//
end(*let*)//end-of-(envi0i1_poplet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
envi0i1_pshift0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
(*
HX-2024:
[d2vstk] is unchanged!
*)
iltstk_pshift0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshift0(env0))
*)
//
(* ****** ****** *)
//
(*
#implfun
envi0i1_pshcas0
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
(*
HX-2024:
There is
no [stkmap_pshcas0]!
*)
stkmap_pshlam0(d2vstk);
iltstk_pshcas0(iltstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshcas0(env0))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_pshloc1
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshloc1(d2vstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshloc1(env0))
//
#implfun
envi0i1_pshloc2
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
(
stkmap_pshloc2(d2vstk); $fold(env0))
//
end (*let*)//end-of-(envi0i1_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
envi0i1_locjoin
(     env0     ) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
val
(nerr, kxs) =
(
  stkmap_poploc0(d2vstk))
//
in//let
//
if
stkmap_nilq(d2vstk)
then // if-then
(
  $fold(env0)) where
{
val () =
$MAP.topmap_insert$kxs(d2vtop, kxs)}
else // if-else
(
  $fold(env0)) where
{
val () =
$MAP.stkmap_insert$kxs(d2vstk, kxs)}
//
end (*let*)//end-of-(envi0i1_locjoin(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_search_exnm
  (env0, loc0) = let
//
val+
@ENVI0I1
(d2vtop,
 d2vstk,!iltstk) = env0
//
val
sym1 =
(
  $SYM.DLR_EXTNAM_symbl)
//
val
opt1 =
stkmap_search$opt(d2vstk, sym1)
//
in//let
(
case+ opt1 of
| ~optn_vt_nil() =>
(
   i1val_none0(loc0))
| ~optn_vt_cons(ival) => ( ival ))
end//let//end-of-[envi0i1_search_exnm]
//
(* ****** ****** *)
//
#implfun
envi0i1_insert_exnm
  (env0, ival) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
val
sym1 =
(
  $SYM.DLR_EXTNAM_symbl)
//
in//let
//
let
val () =
(*
if
stkmap_nilq
(  d2vstk  )
then
topmap_insert$any
(d2vtop,sym1,ival)
else
*)
stkmap_insert$any
(d2vstk,sym1,ival) in $fold(env0) end
//
end(*let*)//end-of-( envi0i1_insert_exnm )
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_search_dvar
  (env0, d2v1) = let
//
val+
@ENVI0I1
(d2vtop,
 d2vstk,!iltstk) = env0
//
val
sym1 = d2v1.unam((*void*))
//
val
opt1 =
stkmap_search$opt(d2vstk, sym1)
//
in//let
//
case+ opt1 of
| ~
optn_vt_nil() =>
(
(
case+ opt2 of
| ~
optn_vt_nil() =>
i1val_none0(d2v1.lctn())
| ~
optn_vt_cons(ival) => ival)
where
{
val opt2 =
topmap_search$opt(d2vtop, sym1)}
)
| ~optn_vt_cons(ival) => ( ival )//case+
//
end(*let*)//end-of-( envi0i1_search_dvar )
//
(* ****** ****** *)
//
#implfun
envi0i1_insert_dvar
(env0, d2v1, ival) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
val
sym1 = d2v1.unam((*void*))
//
in//let
//
let
val () =
if
stkmap_nilq
(  d2vstk  )
then
topmap_insert$any
(d2vtop,sym1,ival)
else
stkmap_insert$any
(d2vstk,sym1,ival) in $fold(env0) end
//
end(*let*)//end-of-( envi0i1_insert_dvar )
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_insert_ilet
  (env0 , ilet) = let
//
val+
@ENVI0I1
(d2vtop,
!d2vstk,!iltstk) = env0
//
in//let
//
let
val () =
iltstk_insert_ilet
(  iltstk, ilet  ) in $fold(env0) end
//
end(*let*)//end-of-( envi0i1_insert_ilet )
//
(* ****** ****** *)
(* ****** ****** *)
//
endloc (*local*) // end of [ local(envi0i1...) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envi0i1_d2vins_self
  (env0, d2v0) =
let
val ival = i1val_var(d2v0)
in//let
  envi0i1_insert_dvar(env0, d2v0, ival)
end//let//end-of-[envi0i1_d2vins_self(env0,d2v0)]
//
#implfun
envi0i1_dvsins_self
  (env0, d2vs) =
(
case+ d2vs of
| list_nil() => ((*0*))
| list_cons(d2v1, d2vs) =>
(
  envi0i1_dvsins_self(env0, d2vs)) where
{
  val () = envi0i1_d2vins_self(env0, d2v1) }
)(*case+*)//end-of-[envi0i1_dvsins_self(env0,d2vs)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1_myenv0.dats] *)
(***********************************************************************)
