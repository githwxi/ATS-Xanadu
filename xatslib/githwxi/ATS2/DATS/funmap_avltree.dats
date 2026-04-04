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
E(key,itm,0) of ((*0*))
|
{hl,hr:nat |
 hl <= hr+HTDF;
 hr <= hl+HTDF}
B(key,itm,1+max(hl,hr)) of
(
  sint(1+max(hl,hr)), key, itm
, avltree(key,itm,hl), avltree(key,itm,hr))
// end of [datatype avltree(key,itm)]
//
(* ****** ****** *)
//
#typedef
avltree
(key:t0,itm:t0) = [h:nat] avltree(key,itm,h)
// end of [avltree]
//
#typedef
avltree_inc
(key:t0,itm:t0,h:int) =
[h1:nat | h <= h1; h1 <= h+1] avltree(key,itm,h1)
// end of [avltree_inc]
//
#typedef
avltree_dec
(key:t0,itm:t0,h:int) =
[h1:nat | h1 <= h; h <= h1+1] avltree(key,itm,h1)
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
: avltree(key,itm,h)): sint(h) =
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
, hl: sint(hl)
, tl: avltree(key,itm,hl)
, hr: sint(hr)
, tr: avltree(key,itm,hr)
) : avltree_inc(key,itm,hr) =
let
//
val+
B{hrl:i0,hrr:i0}
(_, kr, xr, trl, trr) = tr
//
val hrl =
(
avltht<key><itm>(trl)): sint(hrl)
and hrr =
(
avltht<key><itm>(trr)): sint(hrr)
//
in//let
//
if // if
(hrl <= hrr+HTDFm1)
then
(
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
)
else
(
let//else
// HX: [hrl=hrr+2]: deep rotation
val+
B{hrll:i0,hrlr:i0}
(_, krl, xrl, trll, trlr) = trl
val hrll =
(
avltht<key><itm>(trll)): sint(hrll)
and hrlr =
(
avltht<key><itm>(trlr)): sint(hrlr)
//
in//let//else
//
B(
hr, krl, xrl,
B(1+imax(hl  ,hrll), k0, x0, tl, trll ),
B(1+imax(hrlr,hrr ), kr, xr, trlr, trr))
//
end//let//else
)
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
, hl: sint(hl)
, tl: avltree(key,itm,hl)
, hr: sint(hr)
, tr: avltree(key,itm,hr)
) : avltree_inc(key,itm,hr) =
let
//
val+
B{hll:i0,hlr:i0}
(_, kl, xl, tll, tlr) = tl
val hll =
(
avltht<key><itm>(tll)): sint(hll)
and hlr =
(
avltht<key><itm>(tlr)): sint(hlr)
//
in//let
//
if // if
(hll+HTDFm1 >= hlr)
then
(
let//then
//
val hlr1 = (hlr + 1)
//
in//let//then
B(
1+imax(hll,hlr1), kl, xl,
tll, B(hlr1, k0, x0, tlr, tr))
end//let//then
)
else
(
let//else
// HX: [hlr=hll+2]: deep rotation
val+
B{hlrl:i0,hlrr:i0}
(_, klr, xlr, tlrl, tlrr) = tlr
val hlrl =
(
avltht<key><itm>(tlrl)): sint(hlrl)
and hlrr =
(
avltht<key><itm>(tlrr)): sint(hlrr)
//
in//let//else
//
B(
hl, klr, xlr,
B(1+imax(hll ,hlrl), kl, xl, tll , tlrl),
B(1+imax(hlrr,hr  ), k0, x0, tlrr, tr  ))
//
end//let//else
)
//
end(*let*)//end-of-[avltree_rrotate<key><itm>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
avlmaxout{h:pos}
(
tx0:
avltree(key,itm,h)):
(
avltree_dec(key,itm,h), key, itm) =
(
  fnself( tx0 ) )
where
{
//
fun
fnself{h:pos} .<h>.
(
tx0:
avltree(key,itm,h)):
(
avltree_dec(key,itm,h), key, itm) =
let
val-
B{hl:i0,hr:i0}
(h, k1, x1, tl1, tr2) = tx0
//
in//let
//
case+ tr2 of
|E() => (tl1, k1, x1)
|B _ =>
(
let
val//[hr:int]
(
tr2,
k0,x0) = fnself(tr2)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
//
if // if
(hl - hr <= HTDF)
then//then
(
tx0, k0, x0) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2) }
else//else
(
tx0, k0, x0) where
{
val tx0 =
avltree_rrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2) }
//
end(*let*)//end-of-[B _]
)
end(*let*)//end-of-[fnself(tx0):(_,_,_)]
//
}(*where*)//end-of-[avlmaxout<key><itm>(tx0):(_,_,_)]
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
avlminout{h:pos}
(
tx0:
avltree(key,itm,h)):
(
avltree_dec(key,itm,h), key, itm) =
(
  fnself( tx0 ) )
where
{
//
fun
fnself{h:pos} .<h>.
(
tx0:
avltree(key,itm,h)):
(
avltree_dec(key,itm,h), key, itm) =
let
val-
B{hl:i0,hr:i0}
(h, k1, x1, tl1, tr2) = tx0
//
in//let
//
case+ tl1 of
|E() => (tr2, k1, x1)
|B _ =>
(
let
val//[hl:int]
(
tl1,
k0,x0) = fnself(tl1)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
//
if // if
(hr - hl <= HTDF)
then//then
(
tx0, k0, x0) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2) }
else//else
(
tx0, k0, x0) where
{
val tx0 =
avltree_lrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2) }
//
end(*let*)//end-of-[B _]
)
end(*let*)//end-of-[fnself(tx0):(_,_,_)]
//
}(*where*)//end-of-[avlminout<key><itm>(tx0):(_,_,_)]
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
(key,itm)): strm_vt(k0) =
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
#typedef kx = (key,itm)
//
fun
auxmain
(
tx0:
avltree
(key,itm)): strm_vt(kx) =
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
avltree(key,itm,h)):
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
compare_key_key<key>(k0, k1)
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
(tx0, opt) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2)
}
else // hl = hr+HTDFp1
(tx0, opt) where
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
(
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
)
else//!if(sgn>0)//assert(sgn=0)
(
B(h, k0, x0, tl1, tr2), optn_vt_cons(x1))
//
)
end(*let*)//end(B{hl,hr}(h,k1,x1,tl1,tr2))
//
)(*case+*)//endof(insert(map):(map,optn_vt))
//
}(*where*)//end-of-[funmap_insert$opt(map,k0,x0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_getout$opt
 (  map, k0  ) =
(
  getout( map ) )
where
{
fun
getout{h:nat} .<h>.
(
tx0:
avltree(key,itm,h)):
(
avltree_dec
(key,itm,h), optn_vt(itm)) =
(
//
case+ tx0 of
//
|E((*void*)) =>
(
E((*void*)), optn_vt_nil())
//
|
B{hl:i0,hr:i0}
(h, k1, x1, tl1, tr2) =>
let
val sgn =
compare_key_key<key>(k0, k1)
in//let
//
if // if
(sgn < 0)
then
(
let
val//[hl:int]
( tl1
, opt) = getout(tl1)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
if
(hr - hl <= HTDF)
then
(tx0, opt) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2)
}
else
(tx0, opt) where
{
val tx0 =
avltree_lrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2)
}
end//let//then
)
else//!if(sgn<0)
(
if
(sgn > 0)
then
(
let
val//[hr:int]
( tr2
, opt) = getout(tr2)
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
//
if // if
(hl - hr <= HTDF)
then
(tx0, opt) where
{
val tx0 =
B(1+imax(hl,hr), k1, x1, tl1, tr2)
}
else
(tx0, opt) where
{
val tx0 =
avltree_rrotate
< key >< itm >(k1, x1, hl, tl1, hr, tr2)
}
end//let//then
)
else//!if(sgn>0)//assert(sgn=0)
(
case+ tr2 of
|E() =>
(
tl1, optn_vt_cons(x1))
|B _ =>
let
val//[hr:int]
(
tr2,
km,xm) =
(
  avlminout( tr2 ) )
val hl = avltht(tl1)//:sint(hl)
and hr = avltht(tr2)//:sint(hr)
in//let
if // if
(hl - hr <= HTDF)
then
(
tx0,
optn_vt_cons(x1)) where
{
val tx0 =
B(1+imax(hl,hr), km, xm, tl1, tr2)
}
else
(
tx0,
optn_vt_cons(x1)) where
{
val tx0 =
avltree_rrotate
< key >< itm >(km, xm, hl, tl1, hr, tr2)
}
end // end of [B]
)
)
//
end // end of [B]
//
)(*case+*)//end-of-[getout(tx0):(map,opt]
//
}(*where*)//end-of-[funmap_getout$opt( map, k0 )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$forall
  (    map    ) =
(
  fnself( map ) )
where
{
//
fun
fnself{h:nat} .<h>.
(
tx0:
avltree
(key,itm,h)): bool =
(
//
case+ tx0 of
|
E((*void*)) => (true)
|
B(_, k1, x1, tl1, tr2) =>
(
if(
fnself(tl1))
then
(
if // if
(
forall$test
<(key,itm)>( @(k1, x1) ))
then fnself(tr2) else false) else false)
//
)(*case+*)//end-of-[fnself(tx0):bool]
}(*where*)//end-of-[funmap_keyval$forall(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<key:t0>
<itm:t0>
funmap_keyval$foritm
  (    map    ) =
(
  fnself( map ) )
where
{
//
fun
fnself{h:nat} .<h>.
(
tx0:
avltree
(key,itm,h)): void =
(
//
case+ tx0 of
|
E((*void*)) => ((*0*))
|
B(_, k1, x1, tl1, tr2) =>
(
fnself(tl1);
(
foritm$work
<(key,itm)>(@(k1, x1)); fnself(tr2)))
//
)(*case+*)//end-of-[fnself(tx0):bool]
}(*where*)//end-of-[funmap_keyval$foritm(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmap_avltree.dats] *)
(***********************************************************************)
