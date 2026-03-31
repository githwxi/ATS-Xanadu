(***********************************************************************)
(*
//
HX-2026-03-29: Porting ATS2!!!
Sun Mar 29 01:37:30 AM EDT 2026
//
*)
(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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

(* Author: Hongwei Xi *)
(* Authoremail:
   gmhwxiATgmailDOTcom *)
(* Start time: August, 2013 *)

(* ****** ****** *)
(*
#define
ATS_PACKNAME
"ATSLIB.libats.funmap_avltree"
#define
ATS_DYNLOADFLAG 0
// no need for dynloading at run-time
*)
(* ****** ****** *)
(* ****** ****** *)

#staload "./../SATS/funmap.sats"

(* ****** ****** *)
(* ****** ****** *)
//
fun<>
imax{x,y:i0}
( x: sint(x)
, y: sint(y)): sint(max(x,y)) =
(
  if (x >= y) then (x) else (y))
//
fun<>
imin{x,y:i0}
( x: sint(x)
, y: sint(y)): sint(max(x,y)) =
(
  if (x <= y) then (x) else (y))
//
(* ****** ****** *)
//
(*
HX: maximal height
difference of two siblings
*)
//
#define HTDF = 1
#define HTDFp1 = (HTDF+1)
#define HTDFm1 = (HTDF-1)
//
#sexpdef HTDF = 1
#sexpdef HTDFp1 = (HTDF+1)
#sexpdef HTDFm1 = (HTDF-1)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype avltree
( key:type
, itm:type+, int(*height*)
) =
|
E (key, itm, 0) of ((*0*))
|
{hl,hr:nat |
 hl <= hr+HTDF;
 hr <= hl+HTDF}
B (key, itm, 1+max(hl,hr)) of
(
  sint(1+max(hl,hr)), key, itm
, avltree(key, itm, hl), avltree(key, itm, hr))
// end of [datatype avltree(key,itm)]
//
(* ****** ****** *)
//
#typedef
avltree
(key:t0, itm:t0) = [h:nat] avltree(key, itm, h)
// end of [avltree]
//
#typedef
avltree_inc
(key:t0, itm:t0, h:int) =
[h1:nat | h <= h1; h1 <= h+1] avltree(key, itm, h1)
// end of [avltree_inc]
//
#typedef
avltree_dec
(key:t0, itm:t0, h:int) =
[h1:nat | h1 <= h; h <= h1+1] avltree(key, itm, h1)
// end of [avltree_dec]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX-2026-03-29:
Should this kind of macro
support be made available in ATS3?
*)
macdef
avlht(tx0) =
(
case+ ,(tx0) of
| B(h, _, _, _, _) => h | E() => 0)
*)
//
fun
<key:t0>
<itm:t0>
avltht{h:nat}
( tx0
: avltree(key, itm, h)): sint(h) =
(
case+ tx0 of
| B(h, _, _, _, _) => h | E() => 0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
left rotation
for restoring height invariant
*)
fun
<key:t0>
<itm:t0>
avltree_lrotate
{hl,hr:nat | hl+HTDFp1=hr}
(
  k0: key
, x0: itm
, hl: sint hl
, tl: avltree(key, itm, hl)
, hr: sint hr
, tr: avltree(key, itm, hr)
) : avltree_inc(key, itm, hr) =
let
//
val+
B{hrl:i0,hrr:i0}
(_, kr, xr, trl, trr) = tr
//
val hrl =
(
avltht<key><itm>(trl)): sint hrl
and hrr =
(
avltht<key><itm>(trr)): sint hrr
//
in//let
//
if // if
(hrl <= hrr+HTDFm1)
then
let//then
//
val hrl1 = (hrl + 1)
//
in//let//then
//
B(
1+imax(hrl1,hrr), kr, xr,
B(hrl1, k0, x0, tl, trl), trr)
end//let//then
else let//else
// HX: [hrl=hrr+2]: deep rotation
val+
B{hrll:i0,hrlr:i0}
(_, krl, xrl, trll, trlr) = trl
val hrll =
(
avltht<key><itm>(trll)): sint hrll
and hrlr =
(
avltht<key><itm>(trlr)): sint hrlr
//
in//let//else
//
B(
hr, krl, xrl,
B(1+imax(hl  ,hrll), k0, x0, tl, trll ),
B(1+imax(hrlr,hrr ), kr, xr, trlr, trr))
//
end//let//else
//
end(*let*)//end-of-[avltree_lrotate<key><itm>(...)]
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
avltree_rrotate
{hl,hr:nat | hl=hr+HTDFp1}
(
  k0: key
, x0: itm
, hl: sint hl
, tl: avltree(key, itm, hl)
, hr: sint hr
, tr: avltree(key, itm, hr)
) : avltree_inc(key, itm, hr) =
let
//
val+
B{hll:i0,hlr:i0}
(_, kl, xl, tll, tlr) = tl
val hll =
(
avltht<key><itm>(tll)): sint hll
and hlr =
(
avltht<key><itm>(tlr)): sint hlr
//
in//let
//
if // if
(hll+HTDFm1 >= hlr)
then
let//then
//
val hlr1 = (hlr + 1)
//
in//let//then
B(
1+imax(hll,hlr1), kl, xl,
tll, B(hlr1, k0, x0, tlr, tr))
end//let//then
else let//else
// HX: [hlr=hll+2]: deep rotation
val+
B{hlrl:i0,hlrr:i0}
(_, klr, xlr, tlrl, tlrr) = tlr
val hlrl =
(
avltht<key><itm>(tlrl)): sint hlrl
and hlrr =
(
avltht<key><itm>(tlrr)): sint hlrr
//
in//let//else
//
B(
hl, klr, xlr,
B(1+imax(hll ,hlrl), kl, xl, tll , tlrl),
B(1+imax(hlrr,hr  ), k0, x0, tlrr, tr  ))
//
end//let//else
//
end(*let*)//end-of-[avltree_rrotate<key><itm>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
fmap_tbox
(key:t0, itm:t0) = avltree(key, itm)
// end of [fmap_tbox]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nil() = E()
#impltmp
<(*tmp*)>
funmap_make_nil() = E()
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmap_nilq(kxs) =
(
case+
kxs of E _ => true | B _ => false)
// end of [funmap_nilq]
//
#impltmp
<(*tmp*)>
funmap_consq(kxs) =
(
case+
kxs of B _ => true | E _ => false)
// end of [funmap_consq]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-03-29:
This one is O(n) time!
*)
#impltmp
<key:t0>
<itm:t0>
funmap_size(kxs) =
(
auxmain(kxs, 0(*res*))
) where
{
//
fun
auxmain
(
tx0:
avltree
(key,itm), res: nint): nint =
(
case+ tx0 of
|
E((*0*)) => res
|
B(_, _, _, tl1, tr2) =>
(
auxmain(tr2, res)) where
{
  val res = suc(res)
  val res = auxmain(tl1, res) }
)(*case+*)//end-of-[auxmain(tx0,res)]
//
}(*where*)//end-of-[funmap_size(kxs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_key$strmize
  (   kxs   ) =
(
  auxmain(kxs)) where
{
//
#typedef k0 = key
//
fun
auxmain
(
tx0:
avltree
(key, itm)): strm_vt(k0) =
$llazy(
//
case+ tx0 of
//
|
E((*0*)) =>
(
strmcon_vt_nil())
//
|
B(h, k, x, tl1, tr2) => !
(
strm_vt_append00<k0>
(
auxmain(tl1), $llazy(
  strmcon_vt_cons(k, auxmain(tr2)))))
//
)(*llazy*)//end-of-[auxmain(tx0):strm_vt]
//
}(*where*)//end-of-[funmap_key$strmize(kxs)]
//
(* ****** ****** *)
//
#impltmp
{key:t0}
{itm:t0}
gseq_strmize
<fmap(key,itm)>
<t0up(key,itm)>(*kxs*) =
funmap_keyval$strmize<key><itm>(*kxs*)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$strmize
  (   kxs   ) =
(
  auxmain(kxs)) where
{
//
#typedef kx = @(key, itm)
//
fun
auxmain
(
tx0:
avltree
(key, itm)): strm_vt(kx) =
$llazy(
//
case+ tx0 of
//
|
E((*0*)) =>
(
strmcon_vt_nil())
//
|
B(h, k, x, tl1, tr2) => !
(
strm_vt_append00<kx>
(
auxmain(tl1), $llazy(
  strmcon_vt_cons((k, x), auxmain(tr2)))))
//
)(*llazy*)//end-of-[auxmain(tx0):strm_vt(kx)]
//
}(*where*)//end-of-[funmap_keyval$strmize(kxs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$tst
  ( map, k0 ) =
(
  search(map)) where
{
//
fun
search{h:nat} .<h>.
(
tx0:
avltree
(key,itm,h)): bool =
(
//
case+ tx0 of
|
E((*0*)) => false
|
B(_, k1, x1, tl1, tr2) =>
let
val sgn =
compare_key_key<key>(k0, k1)
in//let
//
if // if
(sgn < 0)
then search(tl1) else
( if // if
  (sgn > 0)
  then search(tr2) else true)
//
end(*let*)//end-of-[B(h,k1,x1,tl1,tr2)]
//
)(*case+*)//end-of-[search( tx0 ):bool]
}(*where*)//end-of-[funmap_search$tst(map,k0)]
//
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_search$opt
  ( map, k0 ) =
(
  search(map)) where
{
//
fun
search{h:nat} .<h>.
(
tx0:
avltree
(key,itm,h)): optn_vt(itm) =
(
//
case+ tx0 of
|
E((*0*)) =>
(
  optn_vt_nil(*void*))
|
B(_, k1, x1, tl1, tr2) =>
let
val sgn =
compare_key_key<key>(k0, k1)
in//let
//
if // if
(sgn < 0)
then
(
search(tl1))
else
(
if // if
(sgn > 0) then
(
search(tr2)) else optn_vt_cons(x1))
//
end(*let*)//end-of-[B(h,k1,x1,tl1,tr2)]
//
)(*case+*)//end-of-[search( tx0 ):optn_vt]
}(*where*)//end-of-[funmap_search$opt(map,k0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_insert$opt
  (map, k0, x0) =
(
  insert( map ) )
where
{
//
fun
insert{h:nat} .<h>.
(
tx0:
avltree(key, itm, h)):
(
avltree_inc
(key,itm,h), optn_vt(itm)) =
(
//
case+ tx0 of
|
E((*void*)) =>
(
B(1//ht
, k0, x0
, E(), E()), optn_vt_nil())
|
B{hl:i0,hr:i0}
(h, k1, x1, tl1, tr2) =>
let
val sgn =
compare_key_key<key> (k0, k1)
in//let
//
if // if
(sgn < 0)
then
(
let//then
val//[hl:int]
( tl1
, opt) = insert(tl1)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let//then
//
if // if
(hl - hr) <= HTDF
then
( tx0, opt) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2)
}
else // hl = hr+HTDFp1
( tx0, opt) where
{
val tx0 =
avltree_rrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2)
}
//
end//let//then
)
else//!if(sgn<0)
(
//
if // if
(sgn > 0)
then
let//then
val//[hr:int]
( tr2
, opt) = insert(tr2)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
if // if
(hr - hl) <= HTDF
then
( tx0, opt) where
{
val tx0 =
B(1+imax(hl, hr), k1, x1, tl1, tr2)
}
else // hl+HTDFp1 = hr
( tx0, opt) where
{
val tx0 =
avltree_lrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2)
}
//
end//let//then
else//!if(sgn>0)//assert(sgn=0)
(
B(h, k0, x0, tl1, tr2), optn_vt_cons(x1))
//
)
end(*let*)//end(B{hl,hr}(h,k1,x1,tl1,tr2))
//
)(*case+*)//endof(insert(map):(map,optn_vt))
//
}(*where*)//end-of-[funmap_insert(map,k0,x0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap_avltree.dats] *)
(***********************************************************************)
////
(* ****** ****** *)

fun{
key,itm:t0
} avlmaxout{h:pos} .<h>.
(
  t: avltree (key, itm, h)
, k0: &key? >> key, x0: &itm? >> itm
) :<!wrt> avltree_dec (key, itm, h) = let
//
val+B{..}{hl,hr}(h, k, x, tl, tr) = t
//
in
//
case+ tr of
| B _ => let
    val [hr:int]
      tr = avlmaxout<key,itm> (tr, k0, x0)
    val hl = avlht(tl) : int(hl)
    and hr = avlht(tr) : int(hr)
  in
    if hl - hr <= HTDF
      then B{key,itm}(1+max(hl,hr), k, x, tl, tr)
      else avltree_rrotate<key,itm> (k, x, hl, tl, hr, tr)
    // end of [if]
  end // end of [B]
| E () => (k0 := k; x0 := x; tl)
//
end // end of [avlmaxout]

(* ****** ****** *)

fun{
key,itm:t0
} avlminout{h:pos} .<h>.
(
  t: avltree (key, itm, h)
, k0: &key? >> key, x0: &itm? >> itm
) :<!wrt> avltree_dec (key, itm, h) = let
//
val+B{..}{hl,hr}(h, k, x, tl, tr) = t
//
in
//
case+ tl of
| B _ => let
    val [hl:int]
      tl = avlminout<key,itm> (tl, k0, x0)
    val hl = avlht(tl) : int(hl)
    and hr = avlht(tr) : int(hr)
  in
    if hr - hl <= HTDF
      then B{key,itm}(1+max(hl,hr), k, x, tl, tr)
      else avltree_lrotate<key,itm> (k, x, hl, tl, hr, tr)
    // end of [if]
  end // end of [B]
| E () => (k0 := k; x0 := x; tr)
//
end // end of [avlminout]

(* ****** ****** *)

(*
** left join: height(tl) >= height(tr)
*)
fun{
key,itm:t0
} avltree_ljoin
  {hl,hr:nat | hl >= hr} .<hl>.
(
  k: key, x: itm
, tl: avltree (key, itm, hl)
, tr: avltree (key, itm, hr)
) :<> avltree_inc (key, itm, hl) = let
  val hl = avlht(tl) : int hl
  and hr = avlht(tr) : int hr
in
//
if hl >= hr + HTDFp1 then let
  val+B{..}{hll, hlr}(_, kl, xl, tll, tlr) = tl
  val [hlr:int] tlr = avltree_ljoin<key,itm> (k, x, tlr, tr)
  val hll = avlht(tll) : int hll
  and hlr = avlht(tlr) : int hlr
in
  if hlr <= hll + HTDF
    then B{key,itm}(1+max(hll,hlr), kl, xl, tll, tlr)
    else avltree_lrotate<key,itm> (kl, xl, hll, tll, hlr, tlr)
  // end of [if]
end else B{key,itm}(hl+1, k, x, tl, tr) // end of [if]
//
end // end of [avltree_ljoin]

(* ****** ****** *)

(*
** right join: height(tl) <= height(tr)
*)
fun{
key,itm:t0
} avltree_rjoin
  {hl,hr:nat | hl <= hr} .<hr>.
(
  k: key, x: itm
, tl: avltree (key, itm, hl)
, tr: avltree (key, itm, hr)
) :<> avltree_inc (key, itm, hr) = let
  val hl = avlht(tl) : int hl
  and hr = avlht(tr) : int hr
in
//
if hr >= hl + HTDFp1 then let
  val+B{..}{hrl,hrr}(_, kr, xr, trl, trr) = tr
  val [hrl:int] trl = avltree_rjoin<key,itm> (k, x, tl, trl)
  val hrl = avlht(trl) : int hrl
  and hrr = avlht(trr) : int hrr
in
  if hrl <= hrr + HTDF
    then B{key,itm}(1+max(hrl,hrr), kr, xr, trl, trr)
    else avltree_rrotate<key,itm> (kr, xr, hrl, trl, hrr, trr)
  // end of [if]
end else B{key,itm}(hr+1, k, x, tl, tr) // end of [if]
//
end // end of [avltree_rjoin]

(* ****** ****** *)

fn{
key,itm:t0
} avltree_join3
  {hl,hr:nat}
(
  k: key, x: itm
, tl: avltree (key, itm, hl)
, tr: avltree (key, itm, hr)
) :<> [
  h:int
| hl <= h
; hr <= h
; h <= 1+max(hl,hr)
] avltree (key, itm, h) = let
  val hl = avlht(tl) : int hl
  and hr = avlht(tr) : int hr
in
  if hl >= hr then
    avltree_ljoin<key,itm> (k, x, tl, tr) else avltree_rjoin<key,itm> (k, x, tl, tr)
  // end of [if]
end // end of [avltree_join3]

(* ****** ****** *)

fn{
key,itm:t0
} avltree_join2
  {hl,hr:nat}
(
  tl: avltree (key, itm, hl)
, tr: avltree (key, itm, hr)
) :<> [
  h:nat
| h <= 1+max(hl,hr)
] avltree (key, itm, h) =
(
case+
  (tl, tr) of
| (E (), _) => tr
| (_, E ()) => tl
| (_, _) =>> let
    var kmin: key // uninitialized
    var xmin: itm // uninitialized
    val tr = $effmask_wrt
      (avlminout<key,itm> (tr, kmin, xmin))
    // end of [val]
  in
    avltree_join3<key,itm> (kmin, xmin, tl, tr)
  end // end of [_, _]
) // end of [avltree_join2]

(* ****** ****** *)

implement
{key,itm}
funmap_takeout
(
  map, k0, res2
) = res where {
//
fun takeout
  {h:nat} .<h>. (
  t0: avltree (key, itm, h)
, res: &bool? >> bool(b)
, res2: &itm? >> opt(itm, b)
) :<!wrt> #[b:bool]
  avltree_dec (key, itm, h) = let
in
//
case+ t0 of
| B {..}{hl,hr}
    (h, k, x, tl, tr) => let
    val sgn = compare_key_key<key> (k0, k)
  in
    case+ 0 of
    | _ when sgn < 0 => let
        val [hl:int] tl = takeout (tl, res, res2)
        val hl = avlht(tl) : int hl
        and hr = avlht(tr) : int hr
      in
        if hr - hl <= HTDF
          then B{key,itm}(1+max(hl,hr), k, x, tl, tr)
          else avltree_lrotate<key,itm> (k, x, hl, tl, hr, tr)
        // end of [if]
      end // end of [sgn < 0]
    | _ when sgn > 0 => let
        val [hr:int] tr = takeout (tr, res, res2)
        val hl = avlht(tl) : int hl
        and hr = avlht(tr) : int hr
      in
        if hl - hr <= HTDF
          then B{key,itm}(1+max(hl,hr), k, x, tl, tr)
          else avltree_rrotate<key,itm> (k, x, hl, tl, hr, tr)
        // end of [if]
      end // end of [sgn > 0]
    | _ (* sgn = 0 *) => let
        val () = res := true // found
        val () = res2 := x
        prval () = opt_some{itm}(res2)
      in
        case+ tr of
        | B _ => let
            var kmin: key?
            var xmin: itm?
            val [hr:int] tr = avlminout<key,itm> (tr, kmin, xmin)
            val hl = avlht(tl) : int (hl)
            and hr = avlht(tr) : int (hr)
          in
            if hl - hr <= HTDF
              then B{key,itm}(1+max(hl,hr), kmin, xmin, tl, tr)
              else avltree_rrotate<key,itm> (kmin, xmin, hl, tl, hr, tr)
            // end of [if]
          end // end of [B]
        | E _ => tl
      end // end of [sgn = 0]
  end // end of [B]
| E ((*void*)) => let
    val () = res := false
    prval () = opt_none{itm}(res2) in t0 
  end // end of [E]
//
end // end of [takeout]
//
var res: bool
val ((*void*)) = map := takeout (map, res, res2)
//
} // end of [funmap_takeout]

(* ****** ****** *)

implement
{key,itm}{env}
funmap_foreach_env
  (xs, env) = let
//
val p_env = addr@ (env)
//
fun foreach
  {h:nat} .<h>.
(
  t: avltree (key, itm, h), p_env: ptr
) : void = let
in
//
case+ t of
| B (_, k, x, tl, tr) => let
//
    val () = foreach (tl, p_env)
//
    val (
      pf, fpf | p_env
    ) = $UN.ptr_vtake (p_env)
    val ((*void*)) =
      funmap_foreach$fwork<key,itm><env> (k, x, !p_env)
    prval ((*void*)) = fpf (pf)
//
    val () = foreach (tr, p_env)
//
  in
    // nothing
  end // end of [B]
| E ((*void*)) => ()
//
end // end of [foreach]
//
in
  foreach (xs, p_env)
end // end of [funmap_foreach_env]

(* ****** ****** *)
(* ****** ****** *)
//
implement
{key,itm}
funmap_avltree_height (map) = avlht (map)
//
(* ****** ****** *)

(* end of [funmap_avltree.dats] *)
