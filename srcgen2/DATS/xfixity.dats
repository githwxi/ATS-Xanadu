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

(*
#impltmp
<a>(*tmp*)
fxitmlst_resolve
  (loc0, itms) = let
//
//
#typedef itm = fxitm(a)
#typedef itmlst = fxitmlst(a)
//
val () =
prerrln
("fxitmlst_resolve: itms = ", itms)
//
in

end (*let*)//end-of-[fxitmlst_resolve(loc0,xs)]
*)

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
  $raise(XATSOPT_FixityExn(*void*))
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
  $raise(XATSOPT_FixityExn(*void*))
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
  $raise(XATSOPT_FixityExn(*void*))
endlet // end of [fxitmlst_resolve$rederr<a>(loc0,itms)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xfixity.dats] *)

(* ****** ****** *)
////

implement
{a}(*tmp*)
fxitmlst_resolve
(loc0, xs) = let
//
#define :: list_cons
#define nil list_nil
#define cons list_cons
//
fnx
process
( xs: itmlst
, ys: itmlst): a =
(
case+ xs of
| nil() => yreduce(nil(), ys)
| cons(x0, xs1) => resolve(x0, xs1, ys)
) (* end of [process] *)
//
and
yreduce
( xs: itmlst
, ys: itmlst): a =
(
case+ ys of
//
| nil() =>
  auxerr_red(ys) // HX-2018-09: deadcode?
//
| cons(y0, ys1) =>
  ( case+ y0 of
    | FXITMatm(t0) =>
      (
        case+ ys1 of
        | nil() => t0
        | FXITMopr
          (f1, FIXTYpre _) :: ys2 =>
          (
            resolve(f1_t0, xs, ys2) where
            {
              val f1_t0 = fxitm_prefix<a>(f1, t0)
            }
          )
        | FXITMopr
          (f1, FIXTYinf(_, _)) :: ys2 =>
          ( case+ ys2 of
            | FXITMatm(t2) :: ys3 =>
              resolve(t2_f1_t0, xs, ys3) where
              {
                val
                t2_f1_t0 = fxitm_infix<a>(t2, f1, t0)
              }
            | _ (* missing-left-arg *) => 
              resolve(t2_f1_t0, xs, ys2) where
              {
                val
                l1 =
                fxopr_get_loc<a>(f1)
                val
                t2 = fxatm_none<a>(l1)
                val
                t2_f1_t0 = fxitm_infix<a>(t2, f1, t0)
              }
            // end of [case]
          )
        | _ (*non-pre-inf*) => auxerr_red(ys) // deadcode?
      )
    | FXITMopr(f0, fx) =>
      ( case+ fx of
        | FIXTYpos _ =>
          ( case+ ys1 of
            | FXITMatm(t1) :: ys2 =>
              resolve(f0_t1, xs, ys2) where
              {
                val
                f0_t1 = fxitm_postfix<a>(t1, f0)
              }
            | _ (* error *) => auxerr_red(ys)
          )
        | _ (*non-FIXTYpos*) => let
            val
            l0 =
            fxopr_get_loc<a>(f0)
            val
            t0 = fxatm_none<a>(l0)
          in
            yreduce(xs, FXITMatm(t0) :: ys)
          end // end of [non-FIXTYpos]
      ) (* end of [FXITMopr] *)
  )
) (* end of [yreduce] *)
//
and
resolve
( y0: itm
, xs: itmlst
, ys: itmlst): a =
(
case+ y0 of
| FXITMatm _ =>
  ( case+ ys of
    | FXITMatm _ :: _ =>
      resolve_app(y0, xs, ys)
    | _(*non-FXITMatm*) => process(xs, y0 :: ys)
  ) (* end of [FXITMatm] *)
| FXITMopr(_, fx) => resolve_opr(fx, y0, xs, ys)
) (* end of [resolve] *)
//
and
resolve_app
( y0: itm
, xs: itmlst
, ys: itmlst): a =
(
case+ ys of
//
| y1 :: nil() => let
    val app =
      fxopr_make_app<a>(y1)
    // end of [val]
  in
    process(xs, y0 :: app :: ys)
  end
//
| y1 :: FXITMopr(_, fx1) :: _ =>
  let
    val p1 = fixty_prcdv(fx1)
    val sgn = compare(app_prcdv, p1)
  in
    ifcase
    | sgn < 0 =>
      (
        yreduce(y0 :: xs, ys)
      )
    | sgn > 0 => let
        val app =
          fxopr_make_app<a>(y1)
        // end of [val]
      in
        process(xs, y0 :: app :: ys)
      end
    | _ (*0*) => let
        val asc =
          fixty_assoc(fx1)
        // end of [val]
      in
        case+ asc of
        | ASSOClft() =>
          (
            yreduce(y0 :: xs, ys)
          )
        | ASSOCnon() =>
          (
            yreduce(y0 :: xs, ys)
          )
        | ASSOCrgt() => let
            val app =
              fxopr_make_app<a>(y1)
            // end of [val]
          in
            process(xs, y0 :: app :: ys)
          end
      end // end of [_]
  end // end of [_ :: ITERMopr :: _]
//
| _ (*error*) => auxerr_app(y0) // HX: [y0] is FXITMatm
//
) (* end of [resolve_app] *)
//
and
resolve_opr
( fx: fixty
, y0: itm
, xs: itmlst
, ys: itmlst): a =
(
case+ fx of
//
| FIXTYpre _ =>
  (
    process(xs, y0 :: ys)
  )
//
| FIXTYpos _ =>
  (
    case+ ys of
    | _ :: nil() =>
      (
        yreduce(xs, y0 :: ys)
      )
    | _ :: FXITMopr(_, fx1) :: _ =>
      let
        val
        sgn =
        compare
        (fixty_prcdv(fx), fixty_prcdv(fx1))
      in
        ifcase
        | sgn < 0 => yreduce(y0 :: xs, ys)
        | sgn > 0 => yreduce(xs, y0 :: ys)
        | _ (*else*) => yreduce(y0 :: xs, ys)
      end
    | _ (* error *) => yreduce(y0 :: xs, ys)
  )
//
| FIXTYinf _ =>
  (
    case+ ys of
//
    | nil() =>
      (
        process(xs, y0 :: ys)
      ) where
      {
        val
        l0 =
        fxitm_get_loc<a>(y0)
        val
        t0 = fxatm_none<a>(l0)
        val
        ys = FXITMatm(t0) :: ys
      }
//
    | _ :: nil() =>
      (
        process(xs, y0 :: ys)
      )
//
    | _ :: FXITMopr(_, fx1) :: _ =>
      let
        val
        sgn =
        compare
        (fixty_prcdv(fx), fixty_prcdv(fx1))
      in
        ifcase
        | sgn < 0 => yreduce(y0 :: xs, ys)
        | sgn > 0 => process(xs, y0 :: ys)
        | _ (*else*) =>
          let
            val asc1 = fixty_assoc(fx1)
          in
            case+ asc1 of
            | ASSOClft() => yreduce(y0 :: xs, ys)
            | ASSOCnon() => yreduce(y0 :: xs, ys)
            | ASSOCrgt() => process(xs, y0 :: ys)
          end
      end
//
    | _ (*error*) => auxerr_opr(y0) // HX: deadcode?
//
  )
//
| FIXTYpreinf
  (p0, p1, a1) =>
  ( case+ ys of
    | nil() =>
      let
        val fx = FIXTYpre(p0)
        val-FXITMopr(i0, _(*fx*)) = y0
      in
        resolve_opr(fx, FXITMopr(i0, fx), xs, ys)
      end
    | FXITMopr _ :: _ =>
      let
        val fx = FIXTYpre(p0)
        val-FXITMopr(i0, _(*fx*)) = y0
      in
        resolve_opr(fx, FXITMopr(i0, fx), xs, ys)
      end
    | _(* infix-opr *) =>
      let
        val fx = FIXTYinf(p1, a1)
        val-FXITMopr(i0, _(*fx*)) = y0
      in
        resolve_opr(fx, FXITMopr(i0, fx), xs, ys)
      end
  ) (* end of [FIXTYpreinf] *)
//
| FIXTYnon((*void*)) => auxerr_opr(y0) // HX: deadcode?
//
) (* end of [resolve_opr] *)
//
in
  process(xs, nil((*void*)))
end // end of [fxitmlst_resolve]

(* ****** ****** *)
