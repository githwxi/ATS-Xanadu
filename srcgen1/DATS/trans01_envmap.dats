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
SYM = "./../SATS/xsymbol.sats"
#staload
FIX = "./../SATS/xfixity.sats"
//
#staload
MAP = "./../SATS/xsymmap.sats"
#staload
ENV = "./../SATS/xsymenv.sats"
//
(* ****** ****** *)
#staload
FP0 = "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
//
vtypedef
symenv(itm:type) = $ENV.symenv(itm)
//
(* ****** ****** *)
//
static
fun
the_fxtyenv_savecur(): void
and
the_fxtyenv_restore(): void
//
(* ****** ****** *)

local

(* ****** ****** *)
//
#staload $FIX(*open*)
//
(* ****** ****** *)
//
absimpl
fxtyenv_view = unit_v
//
(* ****** ****** *)
//
val
[l0:addr]
(pf | p0) =
$ENV.symenv_make_nil()
val r0 =
ref_make_viewptr(pf | p0)
val
(pfbox | p0) = ref_get_viewptr(r0)
//
(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

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
in//let
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
} (*where*) // end of [the_fxtyenv_search]

(* ****** ****** *)

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
|
FIXTYpre(p0) =>
( case+ x1 of
  | FIXTYinf
    (p1, a1) =>
    FIXTYpreinf(p0, p1, a1) | _ => x0
) (* end of [FIXTYinf] *)
|
FIXTYinf(p0, a0) =>
( case+ x1 of
  | FIXTYpre(p1) =>
    FIXTYpreinf(p1, p0, a0) | _ => x0
) (* end of [FIXTYinf] *)
| _ (* non-FIXTYpre-FIXTYinf *) => x0
)
//
in//let
//
$effmask_ref
($ENV.symenv_insert2(!p0, k0, x0, mix))
//
end (*let*) // end of [the_fxtyenv_insert]

(* ****** ****** *)

implement
the_fxtyenv_pop
(
  pfenv | (*none*)
) = let
  prval vbox(pf) = pfbox
  prval unit_v() = pfenv
in
  $effmask_ref
  ($ENV.symenv_pop{fixty}(!p0))
end // end of [the_fxtyenv_pop]

implement
the_fxtyenv_popfree
(
  pfenv | (*none*)
) = 
$effmask_ref
(
$MAP.symmap_free
(the_fxtyenv_pop(pfenv|(*void*)))
) (* end of [the_fxtyenv_popfree] *)

(* ****** ****** *)

implement
the_fxtyenv_pushnil
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
} (* end of [the_fxtyenv_pushnil] *)

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

implement
the_fxtyenv_savecur
  ((*void*)) =
let
prval
vbox(pf) = pfbox
in
$effmask_ref($ENV.symenv_savecur(!p0))
end // end of [the_fxtyenv_savecur]

implement
the_fxtyenv_restore
  ((*void*)) =
let
prval
vbox(pf) = pfbox
in
$effmask_ref
(
$MAP.symmap_free($ENV.symenv_restore(!p0))
)
end // end of [the_fxtyenv_restore]

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
//
static
fun
the_xnamenv_savecur(): void
and
the_xnamenv_restore(): void
//
(* ****** ****** *)

local

(* ****** ****** *)
//
absimpl
xnamenv_view = unit_v
//
(* ****** ****** *)
//
val
[l0:addr]
(pf | p0) =
$ENV.symenv_make_nil()
val r0 =
ref_make_viewptr(pf | p0)
val
(pfbox | p0) = ref_get_viewptr(r0)
//
(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

implement
the_xnamenv_search
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
} (*end of [the_xnamenv_search]*)

(* ****** ****** *)

implement
the_xnamenv_insert
  (key, itm) = let
  prval
  vbox(pf) = pfbox
//
(*
val () =
$effmask_all
(
println!
(
"the_xnamenv_insert: key = ", key
) ;
println!
(
"the_xnamenv_insert: itm = ", itm
)
) where
{
  overload
  print with $S1E.print_g1exp
  overload
  print with $SYM.print_symbol
}
*)
//
in
  $ENV.symenv_insert(!p0, key, itm)
end // end of [the_xnamenv_insert]

(* ****** ****** *)

implement
the_xnamenv_pop
(
  pfenv | (*none*)
) = let
  prval vbox(pf) = pfbox
  prval unit_v() = pfenv
in
  $effmask_ref
  ($ENV.symenv_pop{g1exp}(!p0))
end // end of [the_xnamenv_pop]

implement
the_xnamenv_popfree
(
  pfenv | (*none*)
) = 
$effmask_ref
(
$MAP.symmap_free
(the_xnamenv_pop(pfenv|(*void*)))
) (* end of [the_xnamenv_popfree] *)

(* ****** ****** *)

implement
the_xnamenv_pushnil
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
  ($ENV.symenv_pushnil{g1exp}(!p0))
//
} (* end of [the_xnamenv_pushnil] *)

(* ****** ****** *)

implement
the_xnamenv_locjoin
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
  ($ENV.symenv_locjoin{g1exp}(!p0))
//
} (* end of [the_xnamenv_locjoin] *)

(* ****** ****** *)

implement
the_xnamenv_savecur
  ((*void*)) =
let
prval
vbox(pf) = pfbox
in
$effmask_ref($ENV.symenv_savecur(!p0))
end // end of [the_xnamenv_savecur]

implement
the_xnamenv_restore
  ((*void*)) =
let
prval
vbox(pf) = pfbox
in
$effmask_ref
(
$MAP.symmap_free($ENV.symenv_restore(!p0))
)
end // end of [the_xnamenv_restore]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
trans01_view = unit_v

(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

implement
the_trans01_popfree
  (pfenv | (*void*)) =
{
//
prval
unit_v() = pfenv
//
local
extern
prfun _assert_{vw:view}(): vw
in(* in-of-local *)
//
val ((*void*)) =
the_fxtyenv_popfree(_assert_() | (*void*))
val ((*void*)) =
the_xnamenv_popfree(_assert_() | (*void*))
//
end // end of [local]
//
} (* end of [the_trans01_popfree] *)

(* ****** ****** *)

implement
the_trans01_pushnil
  ((*void*)) =
  (pf | ()) where
{
//
prval pf = unit_v
//
val
(
pf0_|()) = the_fxtyenv_pushnil()
val
(
pf1_|()) = the_xnamenv_pushnil()
//
prval( ) = $UN.castview0{void}(pf0_)
prval( ) = $UN.castview0{void}(pf1_)
//
} (* end of [the_trans01_pushnil] *)

(* ****** ****** *)

implement
the_trans01_locjoin
(pf1, pf2| (*void*)) =
{
//
prval unit_v() = pf1
prval unit_v() = pf2
//
local
extern
prfun _assert_{vw:view}(): vw
in // in-of-local
//
val ((*void*)) =
the_fxtyenv_locjoin
(_assert_(), _assert_() | (*void*))
val ((*void*)) =
the_xnamenv_locjoin
(_assert_(), _assert_() | (*void*))
//
end // end of [local]
//
} // end of [the_trans01_locjoin]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
trans01_save_view = unit_v

in (* in-of-local *)

(* ****** ****** *)

implement
the_trans01_savecur
  ((*void*)) =
(
  (pf | ())
) where
{
//
prval pf = unit_v(*void*)
//
  val () = the_fxtyenv_savecur()
  val () = the_xnamenv_savecur()
//
} (* end of [the_trans01_savecur] *)

(* ****** ****** *)

implement
the_trans01_restore
  (pf | (*void*)) =
let
//
prval unit_v() = pf
//
in
{
//
  val () = the_fxtyenv_restore()
  val () = the_xnamenv_restore()
//
}
end (* end of [the_trans01_restore] *)

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

(* ****** ****** *)
//
implement
trans01_staload_add
  (fp0, d1cs) = let
//
(*
HX-2020:
Using cached if available!
*)
//
val sym =
$FP0.filpath_get_full2(fp0)
//
in
let
prval
vbox(pf) = pf0
in
$MAP.symmap_insert
( !p0(*global*), sym, d1cs )
end // end of [let]
end // end of [let]
// end of [trans01_staload_add]
//
(* ****** ****** *)
//
implement
trans01_staload_find
  (fp0) = let
//
(*
HX-2020:
Using cached if available!
*)
//
val sym =
$FP0.filpath_get_full2(fp0)
//
in
let
  prval vbox(pf) = pf0
in
  $MAP.symmap_search(!p0, sym)
end // end of [let]
end // end of [let]
// end of [trans01_staload_find]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)
//
overload
print with
$FP0.print_dirpath
//
(*
overload
print with
$FP0.print_filpath_full1
*)
//
overload
print with
$FP0.print_filpath_full2
//
(* ****** ****** *)

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
dparsed =
parse_from_filpath_toplevel
  (knd, fp0)
//
val
d1csopt =
let
//
val
d0csopt =
dparsed.parsed()
//
in
case+
d0csopt of
|
None() => None_vt(*void*)
|
Some(d0cs) =>
Some_vt(trans01_declist(d0cs))
end : Option_vt(d1eclist)
//
val () =
$FP0.the_filpathlst_pout(pf1|(*void*))
val () =
$FP0.the_dirpathlst_pout(pf2|(*void*))
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
val
knd =
(
  case+ opt of
  | None_vt _ => 0 | Some_vt _ => 1
) : int // end of [val]
in(*in-of-let*)
(*
println!
("trans01_staload_from_filpath: knd = ", knd)
*)
end // end of [let]
//
in
//
case+ opt of
| @
Some_vt(d1cs) =>
let
  prval () =
  fold@(opt) in (1, opt) 
end (* Some_vt *)
| ~
None_vt((*void*)) =>
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
end (* None_vt *)
//
end // end of [trans01_staload_from_filpath]

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_envmap.dats] *)
