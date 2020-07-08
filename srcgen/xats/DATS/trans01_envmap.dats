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
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
FIX = "./../SATS/fixity.sats"
//
#staload
MAP = "./../SATS/symmap.sats"
#staload
ENV = "./../SATS/symenv.sats"
//
(* ****** ****** *)
//
#staload
FP0 = "./../SATS/filpath.sats"
//
(* ****** ****** *)

#staload "./../SATS/parsing.sats"
#staload "./../SATS/trans01.sats"

(* ****** ****** *)
//
vtypedef
symenv(itm:type) = $ENV.symenv(itm)
//
(* ****** ****** *)

local

#staload $FIX

absimpl
fxtyenv_view = unit_v

val
[l0:addr]
(pf | p0) =
$ENV.symenv_make_nil()
val r0 =
ref_make_viewptr(pf | p0)
val
(pfbox | p0) = ref_get_viewptr(r0)

in (* in-of-local *)

(*
implement
the_fxtyenv_search
  (k0) =
(
  $effmask_ref
  ($ENV.symenv_search(!p0, k0))
) where
{
  prval vbox(pf) = pfbox
} (* end of [the_fxtyenv_search] *)
*)
implement
the_fxtyenv_search
  (k0) =
(
$effmask_ref
(
let
val opt =
$ENV.symenv_search(!p0, k0)
in
//
case+ opt of
| @Some_vt _ =>
  (fold@(opt); opt)
| ~None_vt _ =>
  $ENV.symenv_psearch(!p0, k0)
//
end // end of [let]
)
) where
{
prval vbox(pf) = pfbox
} (* end of [the_fxtyenv_search] *)


implement
the_fxtyenv_insert
  (k0, x0) = let
//
prval vbox(pf) = pfbox
//
fun
mix .<>.
(x0: fixty, x1: fixty):<> fixty =
(
case+ x0 of
| FIXTYpre(p0) =>
  ( case+ x1 of
  | FIXTYinf
    (p1, a1) =>
    FIXTYpreinf(p0, p1, a1) | _ => x0
  ) (* end of [FIXTYinf] *)
| FIXTYinf(p0, a0) =>
  ( case+ x1 of
  | FIXTYpre(p1) =>
    FIXTYpreinf(p1, p0, a0) | _ => x0
  ) (* end of [FIXTYinf] *)
| _ (* non-FIXTYpre-FIXTYinf *) => x0
)
//
in
//
$effmask_ref
($ENV.symenv_insert2(!p0, k0, x0, mix))
//
end (* end of [the_fxtyenv_insert] *)

(* ****** ****** *)

implement
the_fxtyenv_pout
(
  pfenv | (*none*)
) = let
  prval vbox(pf) = pfbox
  prval unit_v() = pfenv
in
  $effmask_ref
  ($ENV.symenv_pop{fixty}(!p0))
end // end of [the_fxtyenv_pout]

implement
the_fxtyenv_push
  () = (pfenv | ()) where
{
//
  prval
  pfenv = unit_v()
//
  prval vbox(pf) = pfbox
//
  val () =
  $effmask_ref
  ($ENV.symenv_pushnil{fixty}(!p0))
//
} // end of [the_fxtyenv_push]

implement
the_fxtyenv_popfree
(
  pfenv | (*none*)
) = 
$effmask_ref
(
  $MAP.symmap_free
  (the_fxtyenv_pout(pfenv | (*void*)))
) (* end of [the_fxtyenv_popfree] *)

(* ****** ****** *)

implement
the_fxtyenv_locjoin
(pf1, pf2| (*void*) ) =
{
//
  prval unit_v() = pf1
  prval unit_v() = pf2
//
  prval vbox(pf) = pfbox
//
  val () =
  $effmask_ref
  ($ENV.symenv_locjoin{fixty}(!p0))
//
} // end of [the_fxtyenv_locjoin]

(* ****** ****** *)

implement
the_fxtyenv_pjoinwth0
  (map) = let
//
  prval vbox(pf) = pfbox
//
in
  $effmask_ref
  ($ENV.symenv_pjoinwth0(!p0, map))
end // end of [the_fxtyenv_pjoinwth0]

(* ****** ****** *)
//
implement
the_fxtyenv_fprint
  (out) = let
//
prval vbox(pf) = pfbox
//
in
$effmask_ref
(
$ENV.fprint_symenv_ptop
( out, !p0
, lam(out, x) => fprint_fixty(out, x))
)
end // end of [the_fxtyenv_fprint]
//
implement
the_fxtyenv_println
  ((*void*)) =
(
  fprint_newline(stdout_ref)
) where
{
  val () =  
  the_fxtyenv_fprint(stdout_ref)
}
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

vtypedef
map =
$MAP.symmap(d1eclist)
val r0 =
ref<map>
($MAP.symmap_make_nil())
val
(pf0 | p0) = ref_get_viewptr(r0)

in (* in-of-local *)
//
implement
trans01_staload_add
  (fp0, d1cs) =
let
//
val sym =
$FP0.filpath_get_full2(fp0)
//
in
let
prval vbox(pf) = pf0
in
$MAP.symmap_insert(!p0, sym, d1cs)
end
end
//
implement
trans01_staload_find
  (fp0) = let
//
val sym =
$FP0.filpath_get_full2(fp0)
//
in
let
  prval vbox(pf) = pf0
in
  $MAP.symmap_search(!p0, sym)
end
end
//
end // end of [local]

(* ****** ****** *)

local

overload
print with
$FP0.print_dirpath
(*
overload
print with
$FP0.print_filpath_full1
*)
// (*
overload
print with
$FP0.print_filpath_full2
// *)

fun
aux_parse
( knd: int
, fp0: filpath)
: Option_vt(d1eclist) =
let
//
val
dp0 =
$FP0.dirpath_make
(
$FP0.filpath_get_dirname(fp0)
)
//
val
( pf1
| ()) =
$FP0.the_filpathlst_push(fp0)
val
( pf2
| ()) =
$FP0.the_dirpathlst_push(dp0)
//
val
d0csopt =
parse_from_filpath_toplevel(knd, fp0)
//
val
d1csopt =
(
case+ d0csopt of
|
~None_vt() => None_vt()
|
~Some_vt(d0cs) => Some_vt(trans01_declist(d0cs))
) : Option_vt(d1eclist)
//
val () = $FP0.the_filpathlst_pout(pf1|(*void*))
val () = $FP0.the_dirpathlst_pout(pf2|(*void*))
//
in
  d1csopt
end // end of [aux_parse]

in(* in-of-local *)

implement
trans01_staload_from_filpath
  (knd, fp0) = let
//
val opt = 
  trans01_staload_find(fp0)
//
val
((*void*)) =
let
  val
  fp0 = $FP0.filpath_get_full1(fp0)
in
(*
println!
("trans01_staload_from_filpath: fp0 = ", fp0)
*)
end
val
((*void*)) =
let
  val knd =
  (
  case+ opt of
  | None_vt _ => 0 | Some_vt _ => 1
  ) : int // end of [val]
in
(*
println!
("trans01_staload_from_filpath: knd = ", knd)
*)
end
//
in
//
case+ opt of
| @Some_vt(d1cs) =>
  let
    prval () =
    fold@(opt) in (1, opt) 
  end
| ~None_vt((*void*)) =>
  let
    val opt = aux_parse(knd, fp0)
  in
    case+ opt of
    | None_vt() =>
      (
        (0, opt)
      )
    | Some_vt(d1cs) =>
      (
        (0, opt)
      ) where
      {
        val ((*void*)) =
        trans01_staload_add(fp0, d1cs)
      } (* end of [Some_vt] *)
  end
//
end // end of [trans01_staload_from_filpath]

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_envmap.dats] *)
