(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: July, 2020
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
#staload "./../SATS/xbasics.sats"
//
#staload "./../SATS/xstamp0.sats"
//
(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/trcmp30.sats"

(* ****** ****** *)

implement
htcst_make_scst
  (s2c) = let
//
val loc = s2c.loc()
val sym = s2c.sym()
val s2t = s2c.sort()
//
val hst = trcmp30_sort(s2t)
//
in
htcst_make_idst(loc, sym, hst)
end // end of [htcst_make_scst]

(* ****** ****** *)

implement
htvar_make_svar
  (s2v0) = let
//
val sym = s2v0.sym()
//
val s2t0 = s2v0.sort()
//
in
let
val
hst0 = trcmp30_sort(s2t0)
in
  htvar_make_idst(sym, hst0)
end
end // end of [htvar_make_svar]

(* ****** ****** *)

implement
h0con_make_dcon
  (d2c0) = let
//
val loc = d2c0.loc()
val sym = d2c0.sym()
//
val tqas = d2c0.tqas()
val t2p0 = d2c0.type()
//
val htqs = trcmp30_tqas(tqas)
val htp0 = trcmp30_type(t2p0)
//
//
in
let
val
hdc0 =
h0con_make_idtp
(loc, sym, htqs, htp0)
val () =
hdc0.ctag(d2c0.ctag()) in hdc0 end
end(*let*)//end-of-[h0con_make_dcon]

(* ****** ****** *)

implement
h0cst_make_dcst
  (d2c0) = let
//
val loc = d2c0.loc()
val sym = d2c0.sym()
val knd = d2c0.kind()
//
val tqas = d2c0.tqas()
val t2p0 = d2c0.type()
//
val xkd1 = d2c0.xknd()
val xnm2 = d2c0.xnam()
//
val htqs = trcmp30_tqas(tqas)
val htp0 = trcmp30_type(t2p0)
//
in
h0cst_make_idtp
( loc
, sym
, knd, htqs, htp0, xkd1, xnm2)
end(*let*)//end-of-[h0cst_make_dcst]

(* ****** ****** *)

implement
h0var_make_dvar
  (d2v0) = let
//
val loc = d2v0.loc()
val sym = d2v0.sym()
val knd = d2v0.kind()
//
val t2p0 = d2v0.type()
//
val htp0 = trcmp30_type(t2p0)
//
in
h0var_make_idtp(loc, sym, knd, htp0)
end(*let*)//end-of-[h0var_make_dvar]

(* ****** ****** *)

local // local(0)

(* ****** ****** *)
#staload
"libats/SATS/linmap_avltree.sats"
#staload _ =
"libats/DATS/linmap_avltree.dats"
(* ****** ****** *)

extern
prfun
lemma_p2tr_param
{a:vt0p}
{l:addr}(cp: p2tr(a, l)): [l >= null] void

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

local

(* ****** ****** *)

typedef
key = s2cst
and
itm = htcst
vtypedef
scstmap = map(key, itm)

var
the_scstmap =
linmap_make_nil<>{key,itm}()
val
the_scstmap = addr@the_scstmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
the_scstmap_search_ref
  (s2c0) = let
//
val
map =
$UN.ptr0_get<scstmap>(the_scstmap)
val ref =
linmap_search_ref<key,itm>(map,s2c0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end(*let*)//[the_scstmap_search_ref]

(* ****** ****** *)

implement
the_scstmap_search_opt
  (s2c0) = let
//
val
ref = the_scstmap_search_ref(s2c0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end(*let*)//[the_scstmap_search_opt]

(* ****** ****** *)

implement
the_scstmap_insert_any
  (s2c0, htc1) = let
//
var
map =
$UN.ptr0_get<scstmap>(the_scstmap)
//
in
(
$UN.ptr0_set<scstmap>(the_scstmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, s2c0, htc1)
}
end(*let*)//[the_scstmap_insert_any]

(* ****** ****** *)

implement
the_scstmap_insert_exn
  (s2c0, htc1) = let
//
var
map =
$UN.ptr0_get<scstmap>(the_scstmap)
//
in
(
$UN.ptr0_set<scstmap>(the_scstmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, s2c0, htc1)
}
end(*let*)//[the_scstmap_insert_exn]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

typedef
key = s2var
and
itm = htvar
vtypedef
svarmap = map(key, itm)

var
the_svarmap =
linmap_make_nil<>{key,itm}()
val
the_svarmap = addr@the_svarmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
the_svarmap_search_ref
  (s2v0) = let
//
val
map =
$UN.ptr0_get<svarmap>(the_svarmap)
val ref =
linmap_search_ref<key,itm>(map,s2v0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end(*let*)//[the_svarmap_search_ref]

implement
the_svarmap_search_opt
  (s2v0) = let
//
val
ref = the_svarmap_search_ref(s2v0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end(*let*)//[the_svarmap_search_opt]

(* ****** ****** *)

implement
the_svarmap_insert_any
  (s2v0, htv1) = let
//
var
map =
$UN.ptr0_get<svarmap>(the_svarmap)
//
in
(
$UN.ptr0_set<svarmap>(the_svarmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, s2v0, htv1)
}
end(*let*)//[the_svarmap_insert_any]

implement
the_svarmap_insert_exn
  (s2v0, htv1) = let
//
var
map =
$UN.ptr0_get<svarmap>(the_svarmap)
//
in
(
$UN.ptr0_set<svarmap>(the_svarmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, s2v0, htv1)
}
end(*let*)//[the_svarmap_insert_exn]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

typedef
key = d2con
and
itm = h0con
vtypedef
dconmap = map(key, itm)

var
the_dconmap =
linmap_make_nil<>{key,itm}()
val
the_dconmap = addr@the_dconmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
the_dconmap_search_ref
  (d2c0) = let
//
val
map =
$UN.ptr0_get<dconmap>(the_dconmap)
val ref =
linmap_search_ref<key,itm>(map,d2c0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end(*let*)//[the_dconmap_search_ref]

implement
the_dconmap_search_opt
  (d2c0) = let
//
val
ref = the_dconmap_search_ref(d2c0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end(*let*)//[the_dconmap_search_opt]

(* ****** ****** *)

implement
the_dconmap_insert_any
  (d2c0, hdc1) = let
//
var
map =
$UN.ptr0_get<dconmap>(the_dconmap)
//
in
(
$UN.ptr0_set<dconmap>(the_dconmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, d2c0, hdc1)
}
end(*let*)//[the_dconmap_insert_any]

implement
the_dconmap_insert_exn
  (d2c0, hdc1) = let
//
var
map =
$UN.ptr0_get<dconmap>(the_dconmap)
//
in
(
$UN.ptr0_set<dconmap>(the_dconmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, d2c0, hdc1)
}
end(*let*)//[the_dconmap_insert_exn]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

typedef
key = d2cst
and
itm = h0cst
vtypedef
dcstmap = map(key, itm)

var
the_dcstmap =
linmap_make_nil<>{key,itm}()
val
the_dcstmap = addr@the_dcstmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
the_dcstmap_search_ref
  (d2c0) = let
//
val
map =
$UN.ptr0_get<dcstmap>(the_dcstmap)
val ref =
linmap_search_ref<key,itm>(map,d2c0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end(*let*)//[the_dcstmap_search_ref]

implement
the_dcstmap_search_opt
  (d2c0) = let
//
val
ref = the_dcstmap_search_ref(d2c0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end(*let*)//[the_dcstmap_search_opt]

(* ****** ****** *)

implement
the_dcstmap_insert_any
  (d2c0, hdc1) = let
//
var
map =
$UN.ptr0_get<dcstmap>(the_dcstmap)
//
in
(
$UN.ptr0_set<dcstmap>(the_dcstmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, d2c0, hdc1)
}
end(*let*)//[the_dcstmap_insert_any]

implement
the_dcstmap_insert_exn
  (d2c0, hdc1) = let
//
var
map =
$UN.ptr0_get<dcstmap>(the_dcstmap)
//
in
(
$UN.ptr0_set<dcstmap>(the_dcstmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, d2c0, hdc1)
}
end(*let*)//[the_dcstmap_insert_exn]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

typedef
key = d2var
and
itm = h0var
vtypedef
dvarmap = map(key, itm)

var
the_dvarmap =
linmap_make_nil<>{key,itm}()
val
the_dvarmap = addr@the_dvarmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in cmp_stamp_stamp(x1, x2) end

(* ****** ****** *)
in(*in-of-local*)
(* ****** ****** *)

implement
the_dvarmap_search_ref
  (d2v0) = let
//
val
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
val ref =
linmap_search_ref<key,itm>(map,d2v0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end(*let*)//[the_dvarmap_search_ref]

(* ****** ****** *)

implement
the_dvarmap_search_opt
  (d2v0) = let
//
val
ref = the_dvarmap_search_ref(d2v0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end(*let*)//[the_dvarmap_search_opt]

(* ****** ****** *)

implement
the_dvarmap_insert_any
  (d2v0, hdv1) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
//
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, d2v0, hdv1)
}
end(*let*)//[the_dvarmap_insert_any]

(* ****** ****** *)

implement
the_dvarmap_insert_exn
  (d2v0, hdv1) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
//
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, d2v0, hdv1)
}
end(*let*)//[the_dvarmap_insert_exn]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

end (*local(0)*) // end of [local(0)]

(* ****** ****** *)

(* end of [xats_trcmp30_util0.dats] *)
