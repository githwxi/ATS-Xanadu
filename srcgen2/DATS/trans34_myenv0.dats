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
Wed Dec 27 11:34:52 EST 2023
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload styp with d2var_get_styp
(* ****** ****** *)
(*
#symload styp with d4typ_get_styp
*)
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload node with d4pat_get_node
#symload styp with d4pat_get_styp
(* ****** ****** *)
#symload lctn with f4arg_get_lctn
#symload node with f4arg_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2varlst_vt_sort0
( d2vs
: d2varlst_vt): d2varlst_vt =
(
list_vt_mergesort0<d2var>(d2vs))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
datavwtp
linstk =
//
|
linstk_nil of ()
//
|
linstk_lam0 of ( linstk )
|
linstk_let0 of ( linstk )
//
|
linstk_ift0 of ( linstk )
|
linstk_cas0 of ( linstk )
//
|linstk_dvar of
(d2var(*lin*), d4typ, linstk)
//
|linstk_dget of
(d2var(*lin*), d4typ, linstk)
|linstk_dset of
(d2var(*lin*), d4typ, linstk)
//
|linstk_dvtp of
(d2var(*lin*), d4typ, linstk)
//
(*
|linstk_dlft of
(d2var(*lin*), d4lft, linstk)
*)
//
#absimpl linstk_vtbx = linstk
//
(* ****** ****** *)
//
datavwtp
tr34env =
TR34ENV of
(
linstk(*void*),
stkmap(s2cstlst))
//
(* ****** ****** *)
#absimpl tr34env_vtbx = tr34env
(* ****** ****** *)
(* ****** ****** *)
in//local
(* ****** ****** *)
(* ****** ****** *)
//
fun
linstk_free_nil
(stk0: ~linstk): void =
(
case-
stk0 of ~linstk_nil() => ())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gl_print1<linstk>(stk0) =
linstk_fprint1
(gl_print$out<>( (*nil*) ), stk0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_pshlam0
  (  stk0  ) =
(
  stk0 := linstk_lam0(stk0))
//(*end of [linstk_pshlam0(stk0)]*)
//
#implfun
linstk_pshlet0
  (  stk0  ) =
(
  stk0 := linstk_let0(stk0))
//(*end of [linstk_pshlet0(stk0)]*)
//
(* ****** ****** *)
//
#implfun
linstk_pshift0
  (  stk0  ) =
(
  stk0 := linstk_ift0(stk0))
where
{
val () =
prerrln
("linstk_pshift0: stk0 = ", stk0)
}
//(*end of [linstk_pshift0(stk0)]*)
//
#implfun
linstk_pshcas0
  (  stk0  ) =
(
  stk0 := linstk_cas0(stk0))
//(*end of [linstk_pshcas0(stk0)]*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_lamvars
  (  stk0  ) =
(
list_vt2t
(
d2varlst_vt_sort0
(
loop
(stk0, list_vt_nil())))
) where
{
fun
loop
( stk0:
! linstk
, res1
: d2varlst_vt): d2varlst_vt =
(
case- stk0 of
(*
|linstk_nil
 ( (*0*) ) => res1
*)
|linstk_lam0
 (  stk1  ) => res1
(*
|linstk_let0
 (  stk1  ) => res1
|linstk_ift0
 (  stk1  ) => res1
|linstk_cas0
 (  stk1  ) => res1
*)
//
|linstk_dvar
(d2v0, dtp0, stk1) =>
loop
(stk1, list_vt_cons(d2v0, res1))
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|linstk_dvtp
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
//
) where
{
//
val () =
prerrln
("linstk_lamvars:loop: stk0 = ", stk0)
//
}(*where*)
}(*where*)//end-of-[linstk_lamvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_letvars
  (  stk0  ) =
(
list_vt2t
(
d2varlst_vt_sort0
(
loop
(stk0, list_vt_nil())))
) where
{
fun
loop
( stk0:
! linstk
, res1
: d2varlst_vt): d2varlst_vt =
(
case- stk0 of
(*
|linstk_nil
 ( (*0*) ) => res1
*)
//
(*
|linstk_lam0
 (  stk1  ) => res1
*)
|linstk_let0
 (  stk1  ) => res1
//
(*
|linstk_ift0
 (  stk1  ) => res1
|linstk_cas0
 (  stk1  ) => res1
*)
|linstk_dvar
(d2v0, dtp0, stk1) =>
loop
(stk1, list_vt_cons(d2v0, res1))
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
|linstk_dvtp
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
) where
{
//
val () =
prerrln
("linstk_letvars:loop: stk0 = ", stk0)
//
}(*where*)
}(*where*)//end-of-[linstk_letvars(...)]
//
(* ****** ****** *)
//
#implfun
linstk_casvars
  (  stk0  ) =
(
list_vt2t
(
d2varlst_vt_sort0
(
loop
(stk0, list_vt_nil())))
) where
{
fun
loop
( stk0:
! linstk
, res1
: d2varlst_vt): d2varlst_vt =
(
case- stk0 of
(*
|
linstk_nil
 ( (*0*) ) => res1
*)
//
(*
|
linstk_lam0
 (  stk1  ) => res1
|
linstk_let0
 (  stk1  ) => res1
*)
//
(*
|
linstk_ift0
 (  stk1  ) => res1
*)
|
linstk_cas0
 (  stk1  ) => res1
//
|
linstk_dvar
(d2v0, dtp0, stk1) =>
loop
(stk1, list_vt_cons(d2v0, res1))
//
|linstk_dget
(d2v0, dtp0, stk1) => loop(stk1, res1)
|linstk_dset
(d2v0, dtp0, stk1) => loop(stk1, res1)
//
(*
|linstk_dlft
(d2v0, lft0, stk1) => loop(stk1, res1)
*)
)
}(*where*)//end-of-[linstk_casvars(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_poptop0
  (stk0) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
| !
linstk_nil() => kxs // err = 0
//
| ~
linstk_dvar
(k1, x1, kxs) => loop(kxs, err)
//
| ~
linstk_dget
(k1, x1, kxs) => loop(kxs, err)
| ~
linstk_dset
(k1, x1, kxs) => loop(kxs, err)
//
| ~
linstk_dvtp
(k1, x1, kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(k1, x1, kxs) => loop(kxs, err)
*)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
) (*case+*)//end-of-[loop(kxs, err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*)//end-[linstk_poptop0(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_poplam0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_lam0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dvtp
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplam0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_poplet0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_let0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dvar
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
| !
linstk_cas0 _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end (*let*) // end of [linstk_poplet0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_popift0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_ift0
(   kxs   ) => kxs // err = 0
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dvtp
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_cas0 _ => (err := 1; kxs)
//
| !
linstk_dvar _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*)//end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end where
{
val () =
prerrln
("linstk_popift0:loop: stk0 = ", stk0)
}(*where*) // end of [linstk_popift0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_popcas0
  (  stk0  ) = let
//
fnx
loop
( kxs
: linstk
, err: &sint >> _): linstk =
(
case+ kxs of
//
| ~
linstk_cas0
(   kxs   ) => kxs // err = 0
//
//
| ~
linstk_dvar
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dget
(d2v,dtp,kxs) => loop(kxs, err)
| ~
linstk_dset
(d2v,dtp,kxs) => loop(kxs, err)
//
| ~
linstk_dvtp
(d2v,dtp,kxs) => loop(kxs, err)
//
(*
| ~
linstk_dlft
(d2v,lft,kxs) => loop(kxs, err)
*)
//
| !
linstk_nil( ) => (err := 1; kxs)
//
| !
linstk_lam0 _ => (err := 1; kxs)
| !
linstk_let0 _ => (err := 1; kxs)
//
| !
linstk_ift0 _ => (err := 1; kxs)
//
(* ****** ****** *)
//
) (*case+*) // end of [loop(kxs,err)]
//
in//let
let
var
err: sint = 0
val
( ) =
(stk0 := loop(stk0, err)) in err end
end where
{
val () =
prerrln
("linstk_popift0:loop: stk0 = ", stk0)
} (*where*) // end of [linstk_popcas0(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_getlam0
  (  stk0  ) = let
//
#vwtpdef
d2vts_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res
: d2vts_vt): d2vts_vt =
(
case- kxs of
//
| !
linstk_nil
 ((*00*)) => res
| !
linstk_lam0
(   stk   ) => res
//
| !
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
)(*case-*)//end-of-[loop( ... )]
//
in//let
//
(
d2vdtplst_d2vtize(dvts)) where
{
val dvts = loop(stk0, list_vt_nil) }
//
end where
{
//
val () =
prerrln("linstk_getlam0: stk0 = ", stk0)
//
}(*where*) // end of [linstk_getlam0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_getlet0
  (  stk0  ) = let
//
#vwtpdef
d2vts_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res
: d2vts_vt): d2vts_vt =
(
case- kxs of
//
| !
linstk_nil
 ((*00*)) => res
| !
linstk_let0
(   stk   ) => res
//
| !
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
)(*case-*)//end-of-[loop( ... )]
//
in//let
//
(
d2vdtplst_d2vtize(dvts)) where
{
val dvts = loop(stk0, list_vt_nil) }
//
end where
{
//
val () =
prerrln("linstk_getlet0: stk0 = ", stk0)
//
}(*where*) // end of [linstk_getlet0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_getift0
  (  stk0  ) = let
//
#vwtpdef
d2vts_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res
: d2vts_vt): d2vts_vt =
(
case- kxs of
//
| !
linstk_nil
 ((*00*)) => res
| !
linstk_ift0
(   stk   ) => res
//
| !
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
)(*case-*)//end-of-[loop( ... )]
//
in//let
//
(
d2vdtplst_d2vtize(dvts)) where
{
val dvts = loop(stk0, list_vt_nil) }
//
end where
{
//
val () =
prerrln("linstk_getift0: stk0 = ", stk0)
//
}(*where*) // end of [linstk_getlet0(stk)]
//
(* ****** ****** *)
//
#implfun
linstk_getcas0
  (  stk0  ) = let
//
#vwtpdef
d2vts_vt =
list_vt@(d2var, d4typ)
//
fnx
loop
( kxs
: linstk
, res
: d2vts_vt): d2vts_vt =
(
case- kxs of
//
| !
linstk_nil
 ((*00*)) => res
| !
linstk_cas0
(   stk   ) => res
//
| !
linstk_dvar
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dget
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
| !
linstk_dset
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
| !
linstk_dvtp
(d2v,dtp,kxs) =>
loop(kxs, res) where
{
val res =
list_vt_cons(@(d2v,dtp), res)
}
//
)(*case-*)//end-of-[loop( ... )]
//
in//let
//
(
d2vdtplst_d2vtize(dvts)) where
{
val dvts = loop(stk0, list_vt_nil) }
//
end where
{
//
val () =
prerrln("linstk_getcas0: stk0 = ", stk0)
//
}(*where*) // end of [linstk_getcas0(stk)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_fprint1
  (out, stk0) =
(
//
case+ stk0 of
|linstk_nil() =>
(
print1("linstk_nil(", ")"))
//
|linstk_lam0(stk1) =>
(
print1("linstk_lam0(",stk1,")"))
|linstk_let0(stk1) =>
(
print1("linstk_let0(",stk1,")"))
//
|linstk_ift0(stk1) =>
(
print1("linstk_ift0(",stk1,")"))
|linstk_cas0(stk1) =>
(
print1("linstk_cas0(",stk1,")"))
//
|linstk_dvar
(d2v1, dtp1, stk1) =>
(
print1("linstk_dvar(");
print1(d2v1,";",dtp1,";",stk1,")"))
//
|linstk_dget
(d2v1, dtp1, stk1) =>
(
print1("linstk_dget(");
print1(d2v1,";",dtp1,";",stk1,")"))
|linstk_dset
(d2v1, dtp1, stk1) =>
(
print1("linstk_dset(");
print1(d2v1,";",dtp1,";",stk1,")"))
//
|linstk_dvtp
(d2v1, dtp1, stk1) =>
(
print1("linstk_dvtp(");
print1(d2v1,";",dtp1,";",stk1,")"))
//
) where//end-of-[case+(stk0)]
{
//
#impltmp
g_print$out<>((*void*)) = (  out  )
#impltmp
gl_print$out<>((*void*)) = (  out  )
//
}(*where*)//endof(linstk_fprint1(out,stk0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_stprch_dvar
  (stk0, d2v0) =
(
case+ opt0 of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(dtp1) =>
optn_vt_cons
(d4typ_get_styp(dtp1))) where
{
val
opt0 =
linstk_dtprch_dvar(stk0, d2v0) }
//
#implfun
linstk_dtprch_dvar
  (stk0, d2v0) =
(
  loop(stk0) ) where
{
fnx
loop
( stk0:
! linstk ): d4typopt_vt =
(
case+ stk0 of
//
|linstk_nil() => optn_vt_nil()
//
|linstk_lam0(stk1) => loop(stk1)
//
|linstk_let0(stk1) => loop(stk1)
//
|linstk_ift0(stk1) => loop(stk1)
|linstk_cas0(stk1) => loop(stk1)
//
|
linstk_dvar
(d2v1, dtp1, stk1) =>
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1)
//
|
linstk_dget
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
|
linstk_dset
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
//
|
linstk_dvtp
(d2v1, dtp1, stk1) =>
(
if
(d2v0 = d2v1)
then
optn_vt_cons(dtp1) else loop(stk1))
//
)
}(*where*)//end-of-[linstk_dtprch_dvar(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
linstk_d2vins_dvar
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dvar
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dvar: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dvar: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dvar(...)]
//
(* ****** ****** *)
//
#implfun
linstk_d2vins_dget
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dget
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dget: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dget: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dget(...)]
//
#implfun
linstk_d2vins_dset
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dset
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dset: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dset: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dset(...)]
//
(* ****** ****** *)
//
#implfun
linstk_d2vins_dvtp
(stk0, d2v1, dtp1) =
(
stk0 :=
linstk_dvtp
(d2v1, dtp1, stk0)) where
{
//
// (*
val () =
prerrln
("linstk_d2vins_dvtp: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dvtp: dtp1 = ", dtp1)
// *)
//
}(*where*)//end-of-[linstk_d2vins_dvtp(...)]
//
(* ****** ****** *)
//
(*
#implfun
linstk_d2vins_dlft
(stk0, d2v1, lft1) =
(
stk0 :=
linstk_dlft
(d2v1, lft1, stk0)) where
{
//
(*
val () =
prerrln
("linstk_d2vins_dlft: d2v1 = ", d2v1)
val () =
prerrln
("linstk_d2vins_dlft: lft1 = ", lft1)
*)
//
}(*where*)//end-of-[linstk_d2vins_dlft(...)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_make_nil
  ((*nil*)) =
(
  TR34ENV
  (linstk, stkmap)) where
{
  val linstk = linstk_nil((*0*))
  val stkmap = stkmap_make_nil()
} (*where*)//end of [tr34env_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr34env_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR34ENV
(stk1, map2) => () where
{
//
var
linstk = stk1//local lin-proofs
var
stkmap = map2//local sta-consts
//
val nex1 = linstk_poptop0(linstk)
val nex2 = stkmap_poptop0(stkmap)
//
val (  ) = linstk_free_nil(linstk)
val (  ) = stkmap_free_nil(stkmap) }
//
)(*case+*)//end-of-(tr34env_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_lamvars
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  $fold(env0); d2vs) where
{
  val d2vs = linstk_lamvars(linstk) }
//
end(*let*)//end-of-(tr34env_lamvars(env0))
//
#implfun
tr34env_letvars
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  $fold(env0); d2vs) where
{
  val d2vs = linstk_letvars(linstk) }
//
end(*let*)//end-of-(tr34env_letvars(env0))
//
#implfun
tr34env_casvars
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  $fold(env0); d2vs) where
{
  val d2vs = linstk_casvars(linstk) }
//
end(*let*)//end-of-(tr34env_casvars(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_pshlam0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_pshlam0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlam0(env0))
//
#implfun
tr34env_poplam0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
let
val nerr =
linstk_poplam0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshlet0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_pshlet0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshlet0(env0))
//
#implfun
tr34env_poplet0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
let
val nerr =
linstk_poplet0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshift0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
 linstk_pshift0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshift0(env0))
//
#implfun
tr34env_popift0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
let
val nerr =
linstk_popift0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_popift0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_pshcas0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
 linstk_pshcas0(linstk); $fold(env0))
//
end(*let*)//end-of-(tr34env_pshcas0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_popcas0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
let
val nerr =
linstk_popcas0(linstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr34env_popcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_getlam0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getlam0(linstk)}
//
end(*let*)//end-of-(tr34env_getlam0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getlet0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getlet0(linstk)}
//
end(*let*)//end-of-(tr34env_getlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getift0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getift0(linstk)}
//
end(*let*)//end-of-(tr34env_getift0(env0))
//
(* ****** ****** *)
//
#implfun
tr34env_getcas0
(     env0     ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
$fold(env0); dvts) where
{
val dvts = linstk_getcas0(linstk)}
//
end(*let*)//end-of-(tr34env_getcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_stprch_dvar
  (env0, d2v0) =
(
case+ opt0 of
| ~
optn_vt_nil() =>
optn_vt_nil((*void*))
| ~
optn_vt_cons(dtp1) =>
optn_vt_cons
(d4typ_get_styp(dtp1))) where
{
val
opt0 =
tr34env_dtprch_dvar(env0, d2v0) }
//
(* ****** ****** *)
//
#implfun
tr34env_dtprch_dvar
  (env0, d2v0) =
let
val+
@TR34ENV
(!linstk, !stkmap) = env0
in//let
(
  $fold(env0); opt1 ) where
{
val
opt1 = linstk_dtprch_dvar(linstk, d2v0)
}
end(*let*)//end-of-(tr34env_dtprch_dvar(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dvar
  (env0,d2v1,stp1) = let
//
val
dtp1 = D4TYPstp(stp1)
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_d2vins_dvar
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dvar(...))
//
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dget
  (env0,d2v1,dtp1) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_d2vins_dget
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dget(...))
//
#implfun
tr34env_d2vins_dset
  (env0,d2v1,dtp1) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_d2vins_dset
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dset(...))
//
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dvtp
  (env0,d2v1,stp1) = let
//
val
dtp1 = D4TYPstp(stp1)
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_d2vins_dvtp
  (linstk, d2v1, dtp1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dvtp(...))
//
(* ****** ****** *)
//
#implfun
tr34env_d2vins_dvts
  ( env0 , dvts ) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  feach(linstk, dvts) ; $fold( env0 ))
where
{
fnx
feach
( stk0:
& linstk, dvts: d2vts): void =
case+ dvts of
|list_nil() =>
( (*void*) )
|list_cons
((d2v1, stp1), dvts) =>
let
val dtp1 =
D4TYPstp(stp1)
val (  ) =
linstk_d2vins_dvtp
(stk0, d2v1, dtp1) in feach(stk0, dvts) end
}(*where*)
end(*let*)//end-of-(tr34env_d2vins_dvtp(...))
//
(* ****** ****** *)
//
(*
#implfun
tr34env_d2vins_dlft
  (env0,d2v1,lft1) = let
//
val+
@TR34ENV
(!linstk, !stkmap) = env0
//
in//let
//
(
  linstk_d2vins_dlft
  (linstk, d2v1, lft1) ; $fold( env0 ))
//
end(*let*)//end-of-(tr34env_d2vins_dlft(...))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
endloc (*local*) // end of [ local(tr34env...) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_evstyp_cst
  (env0, s2c0) =
let
val
opt0 = optn_vt_nil((*void*)) in opt0 end//HX:FIXME!
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_insert_dpat
  (env0, dpat) =
(
case+
dpat.node() of
//
|D4Pvar _ =>
(
  f0_var(env0, dpat) )
//
|D4Pany _ => ( (*void*) )
//
|D4Pint _ => ( (*void*) )
|D4Pbtf _ => ( (*void*) )
|D4Pchr _ => ( (*void*) )
|D4Pstr _ => ( (*void*) )
//
|
D4Pannot _ => f0_annot(env0, dpat)
//
| _(* otherwise *) => (  (*void*)  )
//
) where
{
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, dpat: d4pat): void =
let
//
val-
D4Pvar(d2v1) = dpat.node()
//
in//let
let
(*
HX-2024-02-29:
Note that d2v1.styp() can tell
whether d2v1 is a mutable variable!
*)
val t2p0 = dpat.styp()
val t2p0 = s2typ_unargx(t2p0)
in//let
tr34env_d2vins_dvar(env0,d2v1,t2p0)
end//let
end(*let*)//end-of-[f0_var(env0,dpat)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr34env
, dpat: d4pat): void =
let
//
val-
D4Pannot
( d4p1
, s1e2, s2e2) = dpat.node()
//
in//let
(
  tr34env_insert_dpat(env0, d4p1) )
end(*let*)//end-of-[f0_annot(env0,dpat)]
//
(* ****** ****** *)
//
val () =
prerrln("tr34env_insert_dpat: dpat = ", dpat)
//
(* ****** ****** *)
//
}(*where*)//end-of-[tr34env_insert_dpat(env0,dpat)]
//
(* ****** ****** *)
//
#implfun
tr34env_insert_dgpt
  (env0, dgpt) =
(
case+
dgpt.node() of
|
D4GPTpat(dpat) =>
tr34env_insert_dpat(env0, dpat)
|
D4GPTgua(dpat, d4gs) =>
tr34env_insert_dpat(env0, dpat)
) where
{
//
val () =
prerrln("tr34env_insert_dgpt: dgpt = ", dgpt)
//
}(*where*)//end-of-[tr34env_insert_dgpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
tr34env_insert_farg
  (env0, farg) =
(
case+
farg.node() of
|F4ARGdapp
(npf1, d4ps) =>
tr34env_insert_dpatlst(env0, d4ps)
//
|F4ARGsapp _ => () |F4ARGmets _ => ()
) where
{
//
val () =
prerrln("tr34env_insert_farg: farg = ", farg)
//
}(*where*)//end-of-[tr34env_insert_farg(env0,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr34env_insert_dpatlst
  (env0, d4ps) =
(
case+ d4ps of
| list_nil() => ((*void*))
| list_cons(d4p0, d4ps) =>
(
tr34env_insert_dpat(env0, d4p0);
tr34env_insert_dpatlst(env0, d4ps)))//end-(implfun)
//
#implfun
tr34env_insert_farglst
  (env0, f4as) =
(
case+ f4as of
| list_nil() => ((*void*))
| list_cons(f4a0, f4as) =>
(
tr34env_insert_farg(env0, f4a0);
tr34env_insert_farglst(env0, f4as)))//end-(implfun)
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
tr34env_d2vtck_dvts
  ( env0, dvts ) =
(
  auxmain(env0, dvts)
) where
{
//
fun
auxmain
( env0:
! tr34env
, dvts: d2vts): dvtcklst =
(
case+ dvts of
//
|list_nil
((*nil*)) =>
list_nil(*void*)
//
|list_cons
(
(d2v1,stp1),dvts) =>
let
//
val opt1 =
tr34env_stprch_dvar
  ( env0 , d2v1 )
//
val t2p1 =
(
case+ opt1 of
| ~
optn_vt_nil
( (*nil*) ) => d2v1.styp()
| ~
optn_vt_cons(t2p1) => t2p1)
: s2typ // end-of-[val(t2p1)]
//
val ubtf =
unify34_s2typ(env0, t2p1, stp1)
//
in//let
if
ubtf
then
(
auxmain(env0, dvts))
else
(
let
val vtck =
DVTCK(d2v1, t2p1, stp1) in
list_cons
(vtck, auxmain(env0, dvts)) end)
end(*let*) // end-of-[list_cons(...)]
)(*case+*) // end-of-[auxmain(env0,dvts)]
//
val () =
prerrln("tr34env_d2vtck_dvts: dvts = ", dvts)
//
}(*where*)//end of [tr34env_d2vtck_dvts(env0,dvts)]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_myenv0.dats] *)
