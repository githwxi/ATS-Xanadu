(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jul 26 12:38:32 EDT 2022
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
#staload
ERR = "./../SATS/xerrory.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
//
#implval
app_assoc = ASSOClft()
#implval
imp_assoc = ASSOCrgt()
//
(* ****** ****** *)
//
#implfun
assoc_fprint
(out, asc) =
let
#impltmp
g_print$out<>() = out
in//let
case+ asc of
| ASSOCnon() => print("ASSOCnon")
| ASSOClft() => print("ASSOClft")
| ASSOCrgt() => print("ASSOCrgt")
end (*let*) // end of [assoc_fprint]
//
(* ****** ****** *)

local
//
#absimpl
prcdv_tflt = sint
//
(*
HX:
PRCDV_MIN: low enough
PRCDV_MAX: high enough
*)
val
PRCDV_MIN = -1000000000
val
PRCDV_MAX =  1000000000
//
in (* in-of-local *)

(* ****** ****** *)
#implval
app_prcdv = 70
#implval
imp_prcdv = 10
(* ****** ****** *)

#implfun
prcdv_decode(cdv) = cdv

#implfun
prcdv_encode(cdv) =
(
if
(cdv<=PRCDV_MIN)
then PRCDV_MIN else
(
if
(cdv>=PRCDV_MAX)
then PRCDV_MAX else cdv))

(* ****** ****** *)
#implval
the_prcdv_neginf = PRCDV_MIN
#implval
the_prcdv_posinf = PRCDV_MAX
(* ****** ****** *)

endloc(*local*)//end-of-[local(prcdv)]

(* ****** ****** *)
#implfun
add_prcdv_int
( cdv , int ) =
prcdv(cdv.decd() + int)
#implfun
sub_prcdv_int
( cdv , int ) =
prcdv(cdv.decd() - int)
(* ****** ****** *)
#implval
brckt_prcdv =
add_prcdv_int(app_prcdv, 10)
#implval
dtsel_prcdv =
add_prcdv_int(app_prcdv, 10)
(* ****** ****** *)
#implval
forall_prcdv = prcdv( 0 )
#implval
exists_prcdv = prcdv( 0 )
(* ****** ****** *)
#implval
bslash_prcdv =
prcdv(app_prcdv.decd()+1)
#implval
inftmp_prcdv = prcdv ( 0 ) // for temp-infixity
(* ****** ****** *)
//
#implfun
cmp_prcdv_prcdv
(  cdv1,cdv2  ) =
(cdv1.decd() \cmp cdv2.decd())
//
(* ****** ****** *)
//
#implfun
prcdv_fprint
 (out, cdv) =
(
print(cdv.decd())) where
{
#implfun g_print$out<>() = out
} (*where*)//end-of-(prcdv_fprint)
//
(* ****** ****** *)
#implval
app_fixty =
FIXTYinf(app_prcdv, app_assoc)
#implval
imp_fixty =
FIXTYinf(imp_prcdv, imp_assoc)
(* ****** ****** *)
#implval
brckt_fixty = FIXTYpos(brckt_prcdv)
#implval
dtsel_fixty = FIXTYpos(dtsel_prcdv)
(* ****** ****** *)
#implval
forall_fixty = FIXTYpre(forall_prcdv)
#implval
exists_fixty = FIXTYpre(exists_prcdv)
(* ****** ****** *)
//
#implval
postplus_fixty = FIXTYpos(prcdv(0))
#implval
postmnus_fixty = FIXTYpos(prcdv(0))
//
(* ****** ****** *)
//
#implval
bslash_fixty = FIXTYpre(bslash_prcdv)
#implval
inftmp_fixty = FIXTYinf(inftmp_prcdv, ASSOCnon)
//
(* ****** ****** *)
//
#implfun
fixty_prcdv
  (fxt) =
(
case- fxt of
//
| FIXTYpre(p1) => p1
| FIXTYpos(p1) => p1
| FIXTYinf(p1, a2) => p1
//
) (*case-*) // end of [fxopr_prcdv(fxt]
//
#implfun
fixty_assoc
  (fxt) =
(
case- fxt of
//
| FIXTYpre
  (  p1  ) => ASSOCnon()
| FIXTYpos
  (  p1  ) => ASSOCnon()
//
| FIXTYinf(p1, a2) => a2
//
) (*case-*) // end of [fxopr_assoc(fxt]
//
(* ****** ****** *)
//
#implfun
fxopr_prcdv(itm) =
let
val-
FXITMopr(_, fxt) = itm in fixty_prcdv(fxt)
end (*let*) // end of [ fxopr_prcdv(itm) ]
//
#implfun
fxopr_assoc(itm) =
let
val-
FXITMopr(_, fxt) = itm in fixty_assoc(fxt)
end (*let*) // end of [ fxopr_assoc(itm) ]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
fxitm_fprint
( out, fxi ) =
let
#impltmp
g_print$out<>() = out
in//let
case+ fxi of
|
FXITMatm(itm) =>
print("FXITMatm(",itm,")")
|
FXITMopr(itm,fxt) =>
print("FXITMopr(",itm,";",fxt,")")
end (*let*) // end of [fixty_fprint(out,fxi)]
//
(* ****** ****** *)
//
#implfun
fixty_fprint
( out, fxt ) =
let
#impltmp
g_print$out<>() = out
in//let
case+ fxt of
|
FIXTYnon() =>
print("FIXTYnon(",")")
|
FIXTYpre(p1) =>
print("FIXTYpre(", p1, ")")
|
FIXTYpos(p1) =>
print("FIXTYpos(", p1, ")")
|
FIXTYinf(p1, a2) =>
print("FIXTYinf(",p1,";",a2,")")
|
FIXTYpreinf(p1, p2, a3) =>
print("FIXTYpreinf(",p1,";",p2,";",a3,")")
end (*let*) // end of [fixty_fprint(out,fxt)]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
fxitmlst_resolve
  (loc0, itms) =
(
process(itms, list_nil())
) where
{
//
#define :: list_cons
//
#typedef itm = fxitm(a)
#typedef itmlst = fxitmlst(a)
//
val () =
prerrln
("fxitmlst_resolve: itms = ", itms)
//
fnx
process
( xs0: itmlst
, ys0: itmlst): a =
(
case+ xs0 of
|
list_nil() => yreduce(nil(), ys0)
|
(x0 :: xs1) => resolve(x0, xs1, ys0)
) (* end of [process] *)
//
and
yreduce
( xs0: itmlst
, ys0: itmlst): a =
(
case+ ys0 of
//
|
list_nil
((*nil*)) => // HX-2018-09: is this
fxitmlst_resolve$rederr<a>(loc0, ys0) // deadcode?
//
|
list_cons
(y0, ys1) =>
(
case+ y0 of
|
FXITMopr(f0, fx) =>
( case+ fx of
  |
  FIXTYpos _ =>
  (
  case+ ys1 of
  | FXITMatm(t1) :: ys2 =>
    resolve
    (f0_t1, xs0, ys2) where
    {
      val f0_t1 =
      fxitm_pstfix<a>(t1, f0)
    }
  | _(*error*) =>
    resolve
    (f0_t1, xs0, ys1) where
    {
      val t1 =
      fxatm_none<a>
      (fxopr_get_lctn<a>(f0))
      val f0_t1 =
      fxitm_pstfix<a>(t1, f0) }
    // end of (reduction-error)
(*
  | _(*error*) =>
    fxitmlst_resolve$rederr<a>(loc0, ys0)
*)
  ) (*FIXTYpos*)
  |
  _ (*non-FIXTYpos*) =>
  let
    val l0 =
    fxopr_get_lctn<a>(f0)
    val t1 = fxatm_none<a>(l0)
  in
    yreduce(xs0, cons(FXITMatm(t1), ys0))
  endlet // end of [non-FIXTYpos]
) (*case+*) // end of [FXITMopr(f0,fx)]
|
FXITMatm(t0) =>
( case+ ys1 of
  |
  list_nil() => t0
  |
  FXITMopr
  (f1, FIXTYpre _) :: ys2 =>
  (
    resolve(f1_t0, xs0, ys2) where
    {
      val
      f1_t0 = fxitm_prefix<a>(f1, t0)
    }
  )
  |
  FXITMopr
  (f1, FIXTYinf(_, _)) :: ys2 =>
  ( case+ ys2 of
    | FXITMatm(t2) :: ys3 =>
      resolve
      (t2_f1_t0, xs0, ys3) where
      {
        val
        t2_f1_t0 = fxitm_infix0<a>(t2, f1, t0)
      }
    | _(* missing-left-arg *) => 
      resolve
      (t2_f1_t0, xs0, ys2) where
      {
        val l1 =
        fxopr_get_lctn<a>(f1)
        val t2 = fxatm_none<a>(l1)
        val
        t2_f1_t0 = fxitm_infix0<a>(t2, f1, t0)
      }
  )
  | _(* non-pre-inf :: ys2 *) =>  
    (
      fxitmlst_resolve$rederr<a>(loc0, ys0) // HX:deadcode?
    )
) (*case+*) // end of [FXITMatm( t0 )]
) (*case+*) // end of [list_cons(...)]
//
) (*case+*) // end of [yreduce(xs0, ys0)]
//
and
resolve
( y0: itm
, xs0: itmlst
, ys0: itmlst): a =
(
case+ y0 of
|
FXITMatm _ =>
(
case+ ys0 of
| FXITMatm _ :: _ =>
  resolve_app(y0, xs0, ys0)
| _(*non-FXITMatm*) =>
  process(xs0, cons(y0, ys0))
) (* end of [FXITMatm] *)
|
FXITMopr(_, fx) =>
(
  resolve_opr(fx, y0, xs0, ys0))
) (*case+*)// end of [resolve(y0,xs0,ys0)]
//
and
resolve_app
( y0: itm
, xs0: itmlst
, ys0: itmlst): a =
(
case+ ys0 of
//
|
y1 :: list_nil() =>
(
process
(xs0, y0 :: app :: ys0)) where
{
val app =
fxitmlst_resolve$appopr<a>(y1)
}
//
|
y1 ::
FXITMopr(_, fx1) :: ys2 =>
let
  val p1 = fixty_prcdv(fx1)
  val sgn = (app_prcdv \cmp p1)
in
if
(sgn < 0)
then
yreduce(y0 :: xs0, ys0)
else
(
if
(sgn > 0)
then
let
val app =
fxitmlst_resolve$appopr<a>(y1)
in//let
  process(xs0, y0 :: app :: ys0)
end // then
else // sgn = 0
let
val asc = fixty_assoc(fx1)
in//let
case+ asc of
|
ASSOClft() =>
(
  yreduce(y0 :: xs0, ys0))
|
ASSOCnon() =>
(
  yreduce(y0 :: xs0, ys0))
|
ASSOCrgt() =>
let
val app =
fxitmlst_resolve$appopr<a>(y1)
in//let
  process(xs0, y0 :: app :: ys0)
end
end // let // end-of-(else)
)
end // end of [y1 :: FIXITMopr _ :: ys2]
//
| _ (*error*) =>
(
fxitmlst_resolve$apperr<a>(y0) // deadcode?
)
//
) (*case+*)//end of [resolve_app(y0,xs0,ys0)]
//
and
resolve_opr
( fx: fixty
, y0: itm
, xs0: itmlst
, ys0: itmlst): a =
(
case+ fx of
//
|
FIXTYpre _ =>
(
  process(xs0, y0 :: ys0)
)
//
|
FIXTYpos _ =>
(
case+ ys0 of
| _ :: list_nil() =>
  (
    yreduce(xs0, y0 :: ys0)
  )
| _ :: FXITMopr(_, fy) :: _ =>
  let
    val
    sgn =
    (fixty_prcdv(fx) \cmp fixty_prcdv(fy))
  in
    if
    (sgn < 0)
    then
    yreduce(y0 :: xs0, ys0)
    else
    (
    if
    (sgn > 0)
    then yreduce(xs0, y0 :: ys0)
    else yreduce(y0 :: xs0, ys0))
  end
| _ (* error *) => yreduce(y0 :: xs0, ys0)
) (* FIXTYpos *)
//
|
FIXTYinf _ =>
(
case+ ys0 of
//
| list_nil() =>
  (
    process(xs0, y0 :: ys0)
  ) where
  {
    val
    l0 =
    fxitm_get_lctn<a>(y0)
    val
    t0 = fxatm_none<a>(l0)
    val
    ys0 = FXITMatm(t0) :: ys0
  }
//
| _ :: list_nil() =>
  (
    process(xs0, y0 :: ys0)
  )
//
| _ :: FXITMopr(_, fy) :: ys2 =>
  let
    val
    sgn =
    (fixty_prcdv(fx) \cmp fixty_prcdv(fy))
  in
    if
    (sgn < 0)
    then yreduce(y0 :: xs0, ys0)
    else
    (
    if
    (sgn > 0)
    then process(xs0, y0 :: ys0)
    else
    let
      val asc = fixty_assoc(fy)
    in
      case+ asc of
      | ASSOClft() => yreduce(y0 :: xs0, ys0)
      | ASSOCnon() => yreduce(y0 :: xs0, ys0)
      | ASSOCrgt() => process(xs0, y0 :: ys0)
    end
    ) (* end-of-(else) *) // end of [if]
  end (*let*) // end of [_ :: FXITMopr(_, fy) :: ys2]
//
| _ (*error*) =>
  fxitmlst_resolve$oprerr<a>(y0) // HX: deadcode?
//
)
//
|
FIXTYpreinf
(p1, p2, a3) =>
(
case+ ys0 of
| list_nil() =>
  let
    val fx = FIXTYpre(p1)
    val-FXITMopr(i0, _(*fx*)) = y0
  in
    resolve_opr(fx, FXITMopr(i0, fx), xs0, ys0)
  end
| FXITMopr _ :: _ =>
  let
    val fx = FIXTYpre(p1)
    val-FXITMopr(i0, _(*fx*)) = y0
  in
    resolve_opr(fx, FXITMopr(i0, fx), xs0, ys0)
  end
| _(* infix-opr *) =>
  let
    val fx = FIXTYinf(p2, a3)
    val-FXITMopr(i0, _(*fx*)) = y0
  in
    resolve_opr(fx, FXITMopr(i0, fx), xs0, ys0)
  end
) (* end of [FIXTYpreinf] *)
//
|
FIXTYnon((*void*)) => fxitmlst_resolve$oprerr<a>(y0) // HX: deadcode?
//
) (*case+*)//end of [resolve_opr(fx,y0,xs0,ys0)]
//
} (*where*)//end-of-[fxitmlst_resolve(loc0,itms)]

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
fxitmlst_resolve$apperr
  (itm) =
let
//
val
loc0 =
fxitm_get_lctn<a>(itm)
//
(*
val-FXITMatm(atm) = itm
*)
val () = prerr ( loc0 )
val () = prerr (": error(1)")
//
val () =
prerrln
(": app-fixity cannot be resolved: ", itm)
//
in
$raise
(
XATSOPT_fxitmlst_resolve$apperr_exn
) where
{
excptcon
XATSOPT_fxitmlst_resolve$apperr_exn of ((*void*))
}
endlet // end of [fxitmlst_resolve$apperr<a>(itm)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
fxitmlst_resolve$oprerr
  (itm) =
let
//
val
loc0 =
fxitm_get_lctn<a>(itm)
//
val () =
prerr("FIXITY-ERROR:")
val () = prerr( loc0 )
val () =
prerrln
(": opr-fixity cannot be resolved: ", itm)
//
in//let
$raise
(
XATSOPT_fxitmlst_resolve$oprerr_exn
) where
{
excptcon
XATSOPT_fxitmlst_resolve$oprerr_exn of ((*void*))
}
endlet // end of [fxitmlst_resolve$oprerr<a>(itm)]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
fxitmlst_resolve$rederr
  (loc0, itms) =
let
//
val () =
prerr("FIXITY-ERROR:")
val () = prerr( loc0 )
val () =
prerrln
(": opr-fixity cannot be resolved: ", itms)
//
in//let
$raise
(
XATSOPT_fxitmlst_resolve$rederr_exn
) where
{
excptcon
XATSOPT_fxitmlst_resolve$rederr_exn of ((*void*))
}
endlet // end of [fxitmlst_resolve$rederr<a>(loc0,itms)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xfixity.dats] *)
