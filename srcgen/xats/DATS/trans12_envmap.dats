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
//
(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

vtypedef
fmodenv_struct =
@{
//
  path= fpath
//
, s2txt= s2tmap
, s2itm= s2imap
, d2itm= d2imap
, d2ecl= d2eclist
//
} // end of [fmodenv_struct]

absimpl
fmodenv_tbox = ref(fmodenv_struct)

in (* in-of-local *)

implement
fmodenv_make
( fp0
, s2ts, s2is, d2is, d2cs
) = let
//
val
(pfat, pfgc | p0) =
ptr_alloc<fmodenv_struct>()
//
prval () = mfree_gc_v_elim(pfgc)
//
  val () = p0->path := fp0
//
  val () = p0->s2txt := s2ts
  val () = p0->s2itm := s2is
  val () = p0->d2itm := d2is
  val () = p0->d2ecl := d2cs
//
in
//
  ref_make_viewptr(pfat | p0)
//
end // end of [fmodenv_make]

(* ****** ****** *)

implement
fmodenv_get_path
  (menv) =
  (p0->path) where
{
  val
  (vbox(pf) | p0) = ref_get_viewptr(menv)
} (* end of [filenv_get_path] *)

(* ****** ****** *)

local

extern
prfun
myassert
{a:vt0p}{l:addr}
(pf: !a@l): (a@l, minus_v(fmodenv, a@l))

in (* in-of-local *)

implement
fmodenv_get_s2tmap
  (menv) = let
  val
  (vbox(pf) | p0) = ref_get_viewptr(menv)
  prval (pf1, fpf1) = myassert(view@(p0->s2txt))
in
  (pf1, fpf1 | addr@(p0->s2txt))
end // end of [filenv_get_s2tmap]

implement
fmodenv_get_s2imap
  (menv) = let
  val
  (vbox(pf) | p0) = ref_get_viewptr(menv)
  prval (pf1, fpf1) = myassert(view@(p0->s2itm))
in
  (pf1, fpf1 | addr@(p0->s2itm))
end // end of [filenv_get_s2imap]

implement
fmodenv_get_d2imap
  (menv) = let
  val
  (vbox(pf) | p0) = ref_get_viewptr(menv)
  prval (pf1, fpf1) = myassert(view@(p0->d2itm))
in
  (pf1, fpf1 | addr@(p0->d2itm))
end // end of [filenv_get_d2imap]

end // end of [local]

(* ****** ****** *)

implement
fmodenv_get_d2eclist
  (menv) =
  (p0 -> d2ecl) where
{
  val (vbox(pf) | p0) = ref_get_viewptr(menv)
} (* end of [filenv_get_d2eclist] *)

(* ****** ****** *)

end // end of [local] *)

(* ****** ****** *)

(* end of [xats_trans12_envmap.dats] *)
