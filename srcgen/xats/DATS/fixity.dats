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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload
ERR = "./../SATS/xerrory.sats"

(* ****** ****** *)

#staload "./../SATS/fixity.sats"
#staload "./../SATS/locinfo.sats"

(* ****** ****** *)
//
implement
print_assoc(x0) =
fprint_assoc(stdout_ref, x0)
implement
prerr_assoc(x0) =
fprint_assoc(stderr_ref, x0)
//
implement
fprint_assoc(out, x0) =
(
  case+ x0 of
  | ASSOCnon() => fprint!(out, "ASSOCnon")
  | ASSOClft() => fprint!(out, "ASSOClft")
  | ASSOCrgt() => fprint!(out, "ASSOCrgt")
) // end of [fprint_assoc]
//
(* ****** ****** *)

local

absimpl
prcdv_tflt = int

#define
MINPRCDV ~1000000000 // HX: low enough
#define
MAXPRCDV  1000000000 // HX: high enough

in (* in-of-local *)

implement
int2prcdv(x) =
(
ifcase
| x <= MINPRCDV => MINPRCDV
| x >= MAXPRCDV => MAXPRCDV | _ (*else*) => x
)
implement
prcdv2int(x) = x

(* ****** ****** *)
//
implement
app_prcdv = 70
implement
imp_prcdv = 10
//
implement
app_assoc = ASSOClft()
implement
imp_assoc = ASSOCrgt()
//
implement
app_fixty =
FIXTYinf(app_prcdv, app_assoc)
implement
imp_fixty =
FIXTYinf(imp_prcdv, imp_assoc)
//
(* ****** ****** *)
//
implement
brack_prcdv =
add_prcdv_int(app_prcdv, 10)
implement
dtsel_prcdv =
add_prcdv_int(app_prcdv, 10)
//
implement
brack_fixty = FIXTYpos(brack_prcdv)
implement
dtsel_fixty = FIXTYpos(dtsel_prcdv)
//
(* ****** ****** *)
//
(*
implement
raise_prcdv =
pred(prcdv2int(app_prcdv))
//
implement
raise_fixty = FIXTYpre(raise_prcdv)
*)
//
(* ****** ****** *)
//
implement
forall_prcdv = (0)
implement
exists_prcdv = (0)
//
implement
forall_fixty = FIXTYpre(forall_prcdv)
implement
exists_fixty = FIXTYpre(exists_prcdv)
//
(* ****** ****** *)

implement
backslash_prcdv =
succ(prcdv2int(app_prcdv))
implement
infixtemp_prcdv = 0 // for temporary infix status

(* ****** ****** *)

implement
postplus_fixty = FIXTYpos(0)
implement
postmnus_fixty = FIXTYpos(0)

(* ****** ****** *)

implement
backslash_fixty =
FIXTYpre
(backslash_prcdv)
implement
infixtemp_fixty =
FIXTYinf
(infixtemp_prcdv, ASSOCnon)

(* ****** ****** *)

implement
the_neginf_prcdv = MINPRCDV
implement
the_posinf_prcdv = MAXPRCDV

end // end of [local]

(* ****** ****** *)
//
implement
add_prcdv_int(p, i) =
int2prcdv(g0int_add_int(prcdv2int(p), i))
implement
sub_prcdv_int(p, i) =
int2prcdv(g0int_sub_int(prcdv2int(p), i))
//
(* ****** ****** *)
//
implement
compare_prcdv_prcdv
  (x0, x1) =
  compare(prcdv2int(x0), prcdv2int(x1))
//
(* ****** ****** *)
//
implement
print_prcdv(x0) =
fprint(stdout_ref, x0)
implement
prerr_prcdv(x0) =
fprint(stderr_ref, x0)
implement
fprint_prcdv(out, x0) = fprint(out, prcdv2int(x0))
//
(* ****** ****** *)
//
implement
print_fixty(x0) =
fprint_fixty(stdout_ref, x0)
implement
prerr_fixty(x0) =
fprint_fixty(stderr_ref, x0)
//
implement
fprint_fixty
  (out, x0) =
(
  case+ x0 of
  | FIXTYnon() => begin
    fprint!(out, "FIXTYnon()")
    end // end of [FIXTYnon]
  | FIXTYpre(p) =>
    fprint!(out, "FIXTYpre(", p, ")")
  | FIXTYpos(p) =>
    fprint!(out, "FIXTYpos(", p, ")")
  | FIXTYinf(p, a) =>
    fprint!(out, "FIXTYinf(", p, ", ", a, ")")
  | FIXTYpreinf(p1, p2, a) =>
    fprint!
    (out, "FIXTYpreinf(", p1, ", ", p2, ", ", a, ")")
(*
  | FIXTYposinf(p1, p2, a) =>
    fprint!
    (out, "FIXTYposinf(", p1, ", ", p2, ", ", a, ")")
*)
) (* end of [fprint_fixty] *)
//
(* ****** ****** *)

(*
implement
{a}(*tmp*)
fxitm_make
  (x0) = let
//
val fx = fixty(x0)
//
in
//
case+ fx of
| FIXTYnon() => FXITMatm(x0)
| _(*non-FIXTYnon*) => FXITMopr(x0, x0)
//
end // end of [let]
*)

(* ****** ****** *)

implement
fixty_prcdv
  (fx) =
(
  case- fx of
//
  | FIXTYinf
    (p0, a0) => p0
//
  | FIXTYpre(p0) => p0
  | FIXTYpos(p0) => p0
//
(*
  | FIXTYnon() => (0)
  | FIXTYpreinf(p0, p1, _) => p0
  | FIXTYposinf(p0, p1, _) => p0
*)
//
) // end of [fxopr_prcdv]

implement
fxopr_prcdv(x0) = let
//
val-FXITMopr(_, fx) = x0 in fixty_prcdv(fx)
//
end // end of [fxopr_prcdv]

(* ****** ****** *)

implement
fixty_assoc
  (fx) =
(
  case- fx of
//
  | FIXTYinf
    (p0, a0) => a0
//
  | FIXTYpre(p0) => ASSOCnon()
  | FIXTYpos(p0) => ASSOCnon()
//
(*
  | FIXTYnon() => (0)
  | FIXTYpreinf(p0, p1, _) => p0
  | FIXTYposinf(p0, p1, _) => p0
*)
//
) // end of [fixty_assoc]

implement
fxopr_assoc(x0) = let
//
val-FXITMopr(_, fx) = x0 in fixty_assoc(fx)
//
end // end of [fxopr_assoc]

(* ****** ****** *)

implement
{a}(*tmp*)
fxitmlst_resolve
(loc0, xs) = let
//
#define nil list_nil
#define :: list_cons
#define cons list_cons
//
typedef itm = fxitm(a)
typedef itmlst = fxitmlst(a)
//
fun
itmloc
( itm
: fxitm(a)): loc_t =
  fxitm_get_loc<a>(itm)
//
fun
auxerr_opr
  (y0: itm): a = let
  val () = prerr (itmloc(y0))
  val () = prerr (": error(1)")
//
  val () =
  prerr ": operator fixity cannot be resolved."
(*
  val () =
  prerr ": auxerr_opr: operator fixity cannot be resolved."
*)
//
  val () = prerr_newline((*void*))
in
  $raise($ERR.XATSOPT_FIXITY_EXN(*void*))
end // end of [auxerr_opr]
//
fun
auxerr_red
  (ys: itmlst): a = let
  val () = prerr (loc0)
  val () = prerr (": error(1)")
//
  val () =
  prerr ": operator fixity cannot be resolved."
(*
  val () =
  prerr ": auxerr_red: operator fixity cannot be resolved."
*)
//
  val () = prerr_newline((*void*))
in
  $raise($ERR.XATSOPT_FIXITY_EXN(*void*))
end // end of [auxerr_red]
//
fun
auxerr_app
  (y0: itm): a = let
  val-FXITMatm atm = y0
  val () = prerr (itmloc(y0))
  val () = prerr (": error(1)")
//
  val () =
  prerr ": application fixity cannot be resolved."
(*
  val () =
  prerr ": auxerr_app: application fixity cannot be resolved."
*)
//
  val () = prerr_newline((*void*))
in
  $raise($ERR.XATSOPT_FIXITY_EXN(*void*))
end // end of [auxerr_app]
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

(* end of [xats_fixity.dats] *)
