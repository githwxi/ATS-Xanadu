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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define ATS_DYNLOADFLAG 0
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
ERR = "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
FP0 = "./../SATS/filpath.sats"
//
  typedef
  fpath_t = $FP0.filpath
  macdef
  dirbase =
  $FP0.filpath_dirbase
  macdef
  fpath_make = $FP0.filpath_make
  macdef
  dpath_make = $FP0.dirpath_make
  macdef
  fpath_dname = $FP0.filpath_get_dirname
//
#staload
GLO = "./../SATS/xglobal.sats"
#staload
FS0 = "./../SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"
#staload "./../SATS/synread.sats"
//
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/trans01.sats"
#staload "./../SATS/tread01.sats"
//
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/trans12.sats"
#staload "./../SATS/tread12.sats"
//
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/trans23.sats"
#staload "./../SATS/tread23.sats"
//
#staload "./../SATS/trans33.sats"
#staload "./../SATS/tread33.sats"
//
#staload "./../SATS/trans3t.sats"
#staload "./../SATS/trans3x.sats"
#staload "./../SATS/tread3x.sats"
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trcmp30.sats"
//
(* ****** ****** *)
#staload "./../SATS/xatsopt.sats"
(* ****** ****** *)

implement
trans01_package
  (p0kg) = let
//
val+
D0PARSED(rcd) = p0kg
//
val
d0csopt =
rcd.parsed where
{
  val () =
  synread_package(p0kg)
}
//
val () =
$GLO.the_global_fpiadd1
( rcd.source(*filpath*) )
//
val
d1csopt =
(
case+
d0csopt of
| None() =>
  None(*void*)
| Some(d0cs) =>
  Some(trans01_declist(d0cs))
) : Option(d1eclist) // end-val
//
val () =
assertloc
($GLO.the_global_level() = 0)
//
val p1kg =
D1TRANSD@{
  stadyn= rcd.stadyn
, source= rcd.source, transd= d1csopt
}
//
in
//
let
val () = tread01_package(p1kg) in p1kg
end
//
end // end of [trans01_package]

(* ****** ****** *)

implement
trans02_package
  (p0kg) = let
//
val
p1kg =
trans01_package(p0kg)
//
val+D1TRANSD(rcd) = p1kg
//
val
d2csopt =
(
case+
rcd.transd of
| None() =>
  None(*void*)
| Some(d1cs) =>
  Some(trans12_declist(d1cs))
) : Option(d2eclist) // end-val
//
val p2kg =
D2TRANSD@{
  stadyn= rcd.stadyn
, source= rcd.source, transd= d2csopt
}
//
in
let
val () = tread12_package(p2kg) in p2kg
end
end // end of [trans02_package]

(* ****** ****** *)

implement
trans03_package
  (p0kg) = let
//
val
p2kg =
trans02_package(p0kg)
//
local
val+D2TRANSD(rcd) = p2kg
in
val stadyn = rcd.stadyn
val source = rcd.source
val d2csopt = rcd.transd
end // end of [local]
//
val
d3csopt =
(
case+
d2csopt of
| None() =>
  None(*void*)
| Some(d2cs) =>
  Some
  (trans23_declist(d2cs))
) : Option(d3eclist) // end-val
//
val () =
tread23_package(p3kg) where
{
val p3kg =
D3TRANSD@{
stadyn= stadyn
,
source= source, transd= d3csopt
}
}
//
val
d3csopt =
(
case+
d3csopt of
| None() =>
  None(*void*)
| Some(d3cs) =>
  Some
  (trans33_envless(d3cs))
) : Option(d3eclist) // end-val
//
val
d3csopt =
(
case+
d3csopt of
| None() =>
  None(*void*)
| Some(d3cs) =>
  Some(trans3t_envless(d3cs))
) : Option(d3eclist) // end-val
//
val
d3csopt =
(
case+
d3csopt of
| None() =>
  None(*void*)
| Some(d3cs) =>
  Some(trans3x_envless(d3cs))
) : Option(d3eclist) // end-val
//
in
//
D3TRANSD@{
  stadyn= stadyn
, source= source, transd= d3csopt
} (* D3TRANSD *)
//
end // end of [trans03_package]

(* ****** ****** *)
//
implement
trs03cmp30_package
  (p0kg) =
(
  trcmp30_package(p3kg)
) where
{
val p3kg = trans03_package(p0kg)
} // end of [trs03cmp30_package]
//
(* ****** ****** *)
//
implement
xatsopt_version
  (out) = let
//
val MAJOR = 0
and MINOR = 0
and MICRO = 0
//
in
//
fprint!
(out, "ATS/Xanadu version ");
fprint!
(out, MAJOR, ".", MINOR, ".", MICRO);
fprintln!
(out, " Copyright (c) 2018-20?? Hongwei Xi")
//
end // end of [xatsopt_version]
//
(* ****** ****** *)
//
implement
the_fixity_load
  (XATSENV) = let
//
  val given =
    "prelude/fixity.sats"
//
  val fname =
    dirbase(XATSENV, given)
  val fpath =
    fpath_make(given, fname)  
//
  val
  (pf0 | ()) =
  $FP0.the_filpathlst_push(fpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt(fname, file_mode_r)
  in
    case+ opt of
    | ~None_vt() => list_nil()
    | ~Some_vt(filr) => d0cs where
      {
        val d0cs =
        parse_from_fileref_toplevel
        (
          0(*static*), filr(*input*)
        )
        val ((*void*)) = fileref_close(filr)
      }
   end : d0eclist // end of [val]
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf0 | (*none*))
//
  val
  (pf0 | ()) =
  the_fxtyenv_pushnil((*void*))
  val d1cs = trans01_declist(d0cs)
  val map0 = the_fxtyenv_pop(pf0 | (*none*))
//
  val ((*joined*)) = the_fxtyenv_pjoinwth0(map0)
//
(*
  val () = println! "the_fxtyenv = "
  val () = the_fxtyenv_println((*void*))
  val () = println! "[the_fixity_load] is finished."
*)
//
in
  // empty
end // end of [the_fixity_load]

(* ****** ****** *)
//
implement
the_basics_load
(XATSENV, stadyn, given) = let
//
  val
  d1cs = trans01_declist(d0cs)
//
  val
  (pf0|()) =
  the_trans12_pushnil((*void*))
  val d2cs = trans12_declist(d1cs)
  val
  ((*joined*)) =
  the_trans12_pjoinwth0(pf0 | (*void*))
//
in (* nothing *) end where
{
//
(*
val () =
println!
("//the_basics_load: ", given)
*)
//
  val
  fname =
  dirbase(XATSENV, given)
  val
  fpath =
  fpath_make( given, fname )  
//
  val
  (pf0 | ()) =
  $FP0.the_filpathlst_push(fpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt(fname, file_mode_r)
  in
    case+ opt of
    | ~None_vt() =>
       list_nil(*void*)
    | ~Some_vt(filr) =>
      (
        fileref_close(filr); d0cs
      ) where
      {
        val
        d0cs =
        parse_from_fileref_toplevel(stadyn, filr)
      } (* end of [Some_vt] *)
   end : d0eclist // end-of-let
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf0 | (*none*))
//
} (* end of [the_basics_load] *)
//
(* ****** ****** *)
//
implement
the_prelude_load
(XATSENV, stadyn, given) =
let
//
  val
  (pf0|()) =
  the_trans12_pushnil((*void*))
  val d2cs = trans12_declist(d1cs)
  val
  ((*joined*)) =
  the_trans12_pjoinwth1(pf0 | fpath, d2cs)
//
in (* nothing *) end where
{
//
(*
val () =
println!
("//the_prelude_load: ", given)
*)
//
  val
  fname =
  dirbase(XATSENV, given)
  val
  fpath =
  fpath_make(given, fname)  
  val
  dpath =
  dpath_make(fpath_dname(fpath))
//
  val
  (pf1 | ()) =
  $FP0.the_filpathlst_push(fpath)
  val
  (pf2 | ()) =
  $FP0.the_dirpathlst_push(dpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt
    (fname, file_mode_r)
  in
    case+ opt of
    |
    ~None_vt() =>
     (
     list_nil(*void*)
     ) // None_vt
    |
    ~Some_vt(filr) =>
     let
       val
       d0cs =
       parse_from_fileref_toplevel
         (stadyn, filr)
       val () = fileref_close(filr)
     in
       d0cs
     end // end of [Some_vt]
   end : d0eclist // end-of-let
//
  val d1cs = trans01_declist(d0cs)
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf1 | (*none*))
  val
  ((*popped*)) =
  $FP0.the_dirpathlst_pout(pf2 | (*none*))
//
} (* end of [the_prelude_load] *)
//
(* ****** ****** *)

implement
the_preludes_load
  (XATSENV) =
{
//
val () =
the_fixity_load
  (XATSENV)
//
val () =
the_basics_load
( XATSENV
, 0(*static*)
, "prelude/basics.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/xsetup.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/excptn.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gbas000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gnum000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gord000.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gfor000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gfun000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gseq000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gmap000.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/bool000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/char000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gint000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/gflt000.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/optn000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/list000.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/arrn000.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/string0.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/stream0.sats")
//
(*
HX-2020-10-31:
This one also needs to be loaded
externally for template resolution!
*)
//
val () =
the_prelude_load
( XATSENV
, 1(*dynamic*)
, "prelude/DATS/synoug0.dats")
// the_prelude_load
//
(* ****** ****** *)
//
// HX: for linear stuff
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/gseq000_vt.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/optn000_vt.sats")
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/list000_vt.sats")
//
(*
//
// HX: array contains arrn000_vt
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/arrn000_vt.sats")
*)
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/string0_vt.sats")
//
val () =
the_prelude_load
( XATSENV
, 0(*static*)
, "prelude/SATS/VT/stream0_vt.sats")
//
(* ****** ****** *)
//
(*
val () =
println!
("//[the_preludes_load] is finished.")
*)
//
} (* end of [the_preludes_load] *)

(* ****** ****** *)
//
implement
the_preludes_load_if
  (XATSENV, flag) =
(
//
if
(flag = 0)
then let
  val () =
  (flag := flag + 1) in the_preludes_load(XATSENV)
end // end of [then]
//
) (* end of [the_preludes_load_if] *)

(* ****** ****** *)

(* end of [xats_xatsopt_util0.dats] *)
