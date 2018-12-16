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
#staload
MAP = "./../SATS/symmap.sats"
#staload
ENV = "./../SATS/symenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
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

absimpl
$NMS.nmitm_tbox = fmodenv

(* ****** ****** *)

vtypedef
symenv(a:type) = $ENV.symenv(a)

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

local
//
absimpl
sortenv_push_v = unit_v
//
vtypedef s2tenv = symenv(s2txt)
//
extern
prfun
vbox_make_viewptr
{a:vt0p}{l:addr}
( pf: a @ l
| p0: ptr(l)):<> vbox(a @ l)
//
val
(pf | p0) =
$ENV.symenv_make_nil((*void*))
//
prval
pfbox =
vbox_make_viewptr{s2tenv}(pf | p0)
//
fun
the_nmspace_find
  (tid: sym_t): s2txtopt_vt = let
  fun
  fopr
  (menv: fmodenv): s2txtopt_vt =
    ans where
  {
    val (pf, fpf | p0) =
      fmodenv_get_s2tmap(menv)
    val ans =
      $MAP.symmap_search(!p0, tid)
    prval () =
      minus_v_addback(fpf, pf | menv)
    // end of [prval]
  }
in
  $NMS.the_nmspace_find(lam(x) => fopr(x))
end // end of [the_nmspace_find]
//
in (* in-of-local *)

implement
the_sortenv_add
  (tid, s2txt) = let
  prval
  vbox(pf) = pfbox in $ENV.symenv_insert(!p0, tid, s2txt)
end // end of [the_sortenv_add]

(* ****** ****** *)

implement
the_sortenv_find
  (tid) = let
  val ans = let
    prval
    vbox(pf) = pfbox
  in
    $ENV.symenv_search{s2txt}(!p0, tid)
  end // end of [val]
in
//
case+ ans of
//
| Some_vt _ => ans
//
| ~None_vt() => let
    val ans = the_nmspace_find(tid)
  in
    case+ ans of
    | Some_vt _ => ans
    | ~None_vt() => let
        prval
        vbox(pf) = pfbox
      in
        $ENV.symenv_psearch{s2txt}(!p0, tid)
      end // end of [None_vt]
  end // end of [None_vt]
//
end // end of [the_sortenv_find]

(* ****** ****** *)

implement
the_sortenv_pop (
  pfenv | (*none*)
) = let
  prval vbox(pf) = pfbox
  prval unit_v() = pfenv
in
  $effmask_ref
  ($ENV.symenv_pop{s2txt}(!p0))
end // end of [the_sortenv_pop]

implement
the_sortenv_popfree
  (pfenv | (*none*)) =
{
  prval vbox(pf) = pfbox
  prval unit_v() = pfenv
  val () =
  $effmask_ref
  ($ENV.symenv_popfree{s2txt}(!p0))
} // end of [the_sortenv_popfree]

implement
the_sortenv_pushnil
  () = (pfenv | ()) where
{
//
  prval pfenv = unit_v()
  prval vbox(pf) = pfbox
//
  val () =
  $effmask_ref
  ($ENV.symenv_pushnil{s2txt}(!p0))
//
} // end of [the_sortenv_pushnil]

(* ****** ****** *)

implement
the_sortenv_pjoinwth0(map) = let
  prval
  vbox(pf) = pfbox in
  $effmask_ref($ENV.symenv_pjoinwth0(!p0, map))
end // end of [the_sortenv_pjoinwth0]
implement
the_sortenv_pjoinwth1(map) = let
  prval
  vbox(pf) = pfbox in
  $effmask_ref($ENV.symenv_pjoinwth1(!p0, map))
end // end of [the_sortenv_pjoinwth1]

(* ****** ****** *)
//
implement
the_sortenv_fprint
  (out) = let
//
prval vbox(pf) = pfbox
//
in (* let *)
//
$effmask_ref
(
  $ENV.fprint_symenv_top
  ( out, !p0
  , lam(out, x) => fprint_s2txt(out, x))
)
//
end // end of [the_sortenv_print]

implement
the_sortenv_println
  ((*void*)) = let
  val out = stdout_ref
in
  the_sortenv_fprint(out); fprint_newline(out)
end // end of [the_sortenv_println]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
absimpl
sexpenv_push_v = unit_v
//
vtypedef s2ienv = symenv(s2itm)
//
extern
prfun
vbox_make_viewptr
{a:vt0p}{l:addr}
( pf: a @ l
| p0: ptr(l)):<> vbox(a @ l)
//
val
(pf | p0) =
$ENV.symenv_make_nil((*void*))
//
prval
pfbox =
vbox_make_viewptr{s2ienv}(pf | p0)
//
in (* in-of-local *)

(* ****** ****** *)
//
implement
the_sexpenv_fprint
  (out) = let
//
prval vbox(pf) = pfbox
//
in (* let *)
//
$effmask_ref
(
  $ENV.fprint_symenv_top
  ( out, !p0
  , lam(out, x) => fprint_s2itm(out, x))
)
//
end // end of [the_sexpenv_print]

implement
the_sexpenv_println
  ((*void*)) = let
  val out = stdout_ref
in
  the_sexpenv_fprint(out); fprint_newline(out)
end // end of [the_sexpenv_println]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans12_envmap.dats] *)
