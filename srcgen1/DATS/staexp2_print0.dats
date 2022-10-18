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

#staload
STM = "./../SATS/xstamp0.sats"
#staload
SYM = "./../SATS/xsymbol.sats"
#staload
LOC = "./../SATS/locinfo.sats"

overload
fprint with $STM.fprint_stamp
overload
fprint with $SYM.fprint_symbol
overload
fprint with $LOC.fprint_location

(* ****** ****** *)

#staload
LAB = "./../SATS/xlabel0.sats"

overload
fprint with $LAB.fprint_label

(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"

(* ****** ****** *)

implement
fprint_val<sort1> = fprint_sort1

(* ****** ****** *)

implement
fprint_val<sort2> = fprint_sort2

(* ****** ****** *)

implement
fprint_val<s2cst> = fprint_s2cst

implement
fprint_val<s2var> = fprint_s2var

implement
fprint_val<s2txt> = fprint_s2txt

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
implement
fprint_val<s2exp> = fprint_s2exp
//
(* ****** ****** *)
//
implement
fprint_val<s2itm> = fprint_s2itm
//
(* ****** ****** *)
//
(*
implement
fprint_val<s2eff> = fprint_s2eff
*)
implement
fprint_val<labs2exp> = fprint_labs2exp
//
(* ****** ****** *)

implement
print_k2xtv(x0) =
fprint_k2xtv(stdout_ref, x0) 
implement
prerr_k2xtv(x0) =
fprint_k2xtv(stderr_ref, x0) 

implement
fprint_k2xtv(out, x0) =
(
case+ x0 of
|
K2XTVnon() => fprint!(out, "K2XTVnon")
|
K2XTVtmp() => fprint!(out, "K2XTVtmp")
|
K2XTVuni() => fprint!(out, "K2XTVuni")
|
K2XTVjoin() => fprint!(out, "K2XTVjoin")
|
K2XTVopen(s2e) => fprint!(out, "K2XTVopen(...)")
) (* end of [fprint_k2xtv] *)

(* ****** ****** *)

implement
print_sort2(x0) =
fprint_sort2(stdout_ref, x0) 
implement
prerr_sort2(x0) =
fprint_sort2(stderr_ref, x0) 

local

(*
implement
fprint_val<sort2> = fprint_sort2
*)

in (* in-of-local *)

implement
fprint_sort2
( out, s2t0 ) =
(
case+ s2t0 of
//
| S2Tid0(id0) =>
  fprint!(out, "S2Tid0(", id0, ")")
| S2Tint(int) =>
  fprint!(out, "S2Tint(", int, ")")
//
| S2Tbas(s2tb) =>
  fprint!(out, "S2Tbas(", s2tb, ")")
//
(*
| S2Txtv(s2tx) =>
  fprint!(out, "S2Txtv(", s2tx, ")")
*)
//
| S2Ttup() =>
  fprint!(out, "S2Ttup(", ")")
| S2Ttup(s2ts) =>
  fprint!(out, "S2Ttup(", s2ts, ")")
//
| S2Tfun() =>
  fprint!(out, "S2Tfun(", ")")
| S2Tfun(s2ts, s2t1) =>
  fprint!
  ( out
  , "S2Tfun(", s2ts, "; ", s2t1, ")")
//
| S2Tapp(s2t1, s2ts) =>
  fprint!
  ( out
  , "S2Tapp(", s2t1, "; ", s2ts, ")")
//
|
S2Tnone0() =>
(
  fprint!(out, "S2Tnone0(", ")")
)
|
S2Tnone1(s1tsrc) =>
(
fprintln!(out, "S2Tnone1(", s1tsrc, ")")
)
//
(*
| _ (* S2T... *) =>
  fprint!(out, "S2T...(", "...", ")")
*)
//
) where
{
(*
val () =
fprintln!
( out
, "fprint_sort2: s2t0 = ", $UN.cast{ptr}(s2t0))
*)
} (* case *) // end of [fprint_sort2]

end // end of [local]

(* ****** ****** *)

implement
fprint_t2bas
( out, s2tb ) =
(
case+ s2tb of
|
T2BASpre(sym) =>
fprint!(out, "T2BASpre(", sym, ")")
|
T2BASabs(abs) =>
fprint!(out, "T2BASabs(", abs, ")")
|
T2BASdat(dat) =>
fprint!(out, "T2BASdat(", dat, ")")
|
T2BASimp(knd, sym) =>
fprint!(out, "T2BASimp(", knd, "; ", sym, ")")
)

(* ****** ****** *)
//
implement
print_t2abs(x0) =
fprint_t2abs(stdout_ref, x0)
implement
prerr_t2abs(x0) =
fprint_t2abs(stderr_ref, x0)
implement
fprint_t2abs(out, x0) =
$SYM.fprint_symbol(out, x0.sym())
//
(* ****** ****** *)
//
implement
print_t2dat(x0) =
fprint_t2dat(stdout_ref, x0)
implement
prerr_t2dat(x0) =
fprint_t2dat(stderr_ref, x0)
implement
fprint_t2dat(out, x0) =
$SYM.fprint_symbol(out, x0.sym())
//
(* ****** ****** *)
(*
//
implement
print_t2xtv(x0) =
fprint_t2xtv(stdout_ref, x0)
implement
prerr_t2xtv(x0) =
fprint_t2xtv(stderr_ref, x0)
implement
fprint_t2xtv(out, x0) =
$STM.fprint_stamp(out, x0.stamp())
//
*)
(* ****** ****** *)
//
implement
print_s2cst(x0) =
fprint_s2cst(stdout_ref, x0) 
implement
prerr_s2cst(x0) =
fprint_s2cst(stderr_ref, x0) 
//
implement
fprint_s2cst
  (out, x0) =
{
//
val () =
fprint!(out, x0.sym())
val () =
fprint!
(out, "(", x0.stamp(), ")")
//
(*
val () =
fprint!
( out, "(", x0.sort(), ")" )
*)
//
} (* end of [fprint_s2cst] *)
//
(* ****** ****** *)
//
implement
print_s2var(x0) =
fprint_s2var(stdout_ref, x0) 
implement
prerr_s2var(x0) =
fprint_s2var(stderr_ref, x0) 
//
implement
fprint_s2var
  (out, x0) =
{
//
val () =
fprint!(out, x0.sym())
val () =
fprint!
(out, "(", x0.stamp(), ")")
(*
val () =
fprint!
( out, "(", x0.sort(), ")" )
*)
//
} (* end of [fprint_s2var] *)
//
(* ****** ****** *)
//
implement
print_s2xtv(x0) =
fprint_s2xtv(stdout_ref, x0) 
implement
prerr_s2xtv(x0) =
fprint_s2xtv(stderr_ref, x0) 
//
implement
fprint_s2xtv
  (out, x0) = let
//
val knd = x0.kind()
val stm = x0.stamp()
//
in
//
fprint!
(out, "XTV(", stm, ")")
//
(*
fprint!
( out
, "XTV(", stm, ")[", knd, "]")
*)
end
//
(* ****** ****** *)
//
(*
implement
print_s2eff(x0) =
fprint_s2eff(stdout_ref, x0) 
implement
prerr_s2eff(x0) =
fprint_s2eff(stderr_ref, x0) 
*)
//
(*
local
//
implement
fprint_val<s2eff> = fprint_s2eff
//
in (* in-of-local *)
//
implement
fprint_s2eff
  (out, s2f0) =
(
case+ s2f0 of
| S2EFFnil() =>
  fprint!(out, "S2EFFnil(", ")")
| S2EFFall() =>
  fprint!(out, "S2EFFall(", ")")
| S2EFFexp(s2e) =>
  fprint!(out, "S2EFFexp(", s2e, ")")
| S2EFFset(efs) =>
  fprint!(out, "S2EFFset(", "...", ")")
| S2EFFjoin(s2fs) =>
  fprint!(out, "S2EFFjoin(", s2fs, ")")
)
//
end // end of [local]
*)
//
(* ****** ****** *)
//
implement
print_abstdf2
  (x0) =
(
fprint_abstdf2(stdout_ref, x0)
)
implement
prerr_abstdf2
  (x0) =
(
fprint_abstdf2(stderr_ref, x0)
)
implement
fprint_abstdf2
  (out, x0) =
(
case+ x0 of
|
ABSTDF2none() =>
fprint!(out, "ABSTDF2none(", ")")
|
ABSTDF2some() =>
fprint!(out, "ABSTDF2some(", ")")
|
ABSTDF2lteq(t2p) =>
fprint!(out, "ABSTDF2lteq(", t2p, ")")
|
ABSTDF2eqeq(s2e, t2p) =>
fprint!
(out, "ABSTDF2eqeq(", s2e, "; ", t2p, ")")
)
//
(* ****** ****** *)

implement
print_effs2expopt
  (x0) =
(
fprint_effs2expopt(stdout_ref, x0)
)
implement
prerr_effs2expopt
  (x0) =
(
fprint_effs2expopt(stderr_ref, x0)
)
implement
fprint_effs2expopt
  (out, x0) =
(
case+ x0 of
|
EFFS2EXPnone() =>
fprint!(out, "EFFS2EXPnone(", ")")
|
EFFS2EXPsome(s2e) =>
fprint!(out, "EFFS2EXPsome(", s2e, ")")
(*
|
EFFS2EXPsome(s2f, s2e) =>
fprint!
(out, "EFFS2EXPsome(", s2f, "; ", s2e, ")")
*)
) (* end of [fprint_effs2expopt] *)

(* ****** ****** *)

implement
print_s2txt(x0) =
fprint_s2txt(stdout_ref, x0) 
implement
prerr_s2txt(x0) =
fprint_s2txt(stderr_ref, x0) 

local

implement
fprint_val<s2txt> = fprint_s2txt

in (* in-of-local *)

implement
fprint_s2txt
  (out, s2tx) =
(
case+ s2tx of
|
S2TXTsrt(s2t) =>
fprint!(out, "S2TXTsrt(", s2t, ")")
|
S2TXTsub(s2v, s2ps) =>
fprint!(out, "S2TXTsub(", s2v, "; ", s2ps, ")")
//
(*
|
S2TXTerr(loc0) => fprint!(out, "S2TXTerr(...)")
*)
//
) (* end of [fprint_s2txt] *)

end // end of [local]

(* ****** ****** *)
//
implement
{a}
fprint_slabeled(out, lx0) =
(
fprint(out, l0);
fprint(out, "=");
fprint_val<a>(out, x0)
) where
{
  val+SLABELED(l0, x0) = lx0
} (*where*)//end of [fprint_slabeled]
//
(* ****** ****** *)

implement
print_tyrec(x0) =
fprint_tyrec(stdout_ref, x0) 
implement
prerr_tyrec(x0) =
fprint_tyrec(stderr_ref, x0) 

implement
fprint_tyrec
  (out, knd) =
(
case+ knd of
//
| TYRECbox0() =>
  fprint!(out, "TYRECbox0(", ")")
| TYRECbox1() =>
  fprint!(out, "TYRECbox1(", ")")
//
| TYRECflt0() =>
  fprint!(out, "TYRECflt0(", ")")
(*
| TYRECflt1(stm) =>
  fprint!(out, "TYRECflt1(", stm, ")")
*)
| TYRECflt2(nam) =>
  fprint!(out, "TYRECflt2(", nam, ")")
//
) (* end of [fprint_tyrec] *)

(* ****** ****** *)

implement
print_s2exp(x0) =
fprint_s2exp(stdout_ref, x0) 
implement
prerr_s2exp(x0) =
fprint_s2exp(stderr_ref, x0) 

local

implement
fprint_val<s2exp> = fprint_s2exp

in (* in-of-local *)

implement
fprint_s2exp
  (out, s2e0) =
(
case+
s2e0.node() of
//
| S2Eint(i0) =>
  fprint!(out, "S2Eint(", i0, ")")
(*
| S2Eirp(rep) =>
  fprint!(out, "S2Eirp(", rep, ")")
*)
//
| S2Ebtf(b0) =>
  fprint!(out, "S2Ebtf(", b0, ")")
| S2Echr(c0) =>
  fprint!(out, "S2Echr(", c0, ")")
//
| S2Estr(str) =>
  fprint!(out, "S2Estr(", str, ")")
//
| S2Ecst(s2c) =>
  fprint!(out, "S2Ecst(", s2c, ")")
(*
  fprint!
  (out, "S2Ecst(", s2c, "; ", s2c.sort(), ")")
*)
| S2Evar(s2v) =>
  fprint!(out, "S2Evar(", s2v, ")")
(*
  fprint!
  (out, "S2Evar(", s2v, "; ", s2v.sort(), ")")
*)
//
| S2Extv(xtv) =>
  let
(*
    val s2e = "..."
*)
  val stm = xtv.stamp()
  val s2e = s2xtv_get_sexp(xtv)
  in
  fprint!
  ( out
  , "S2Extv(", stm, ")[", s2e, "]")
  end
//
| S2Eany(knd) =>
  fprint!( out, "S2Eany(", knd, ")" )
//
| S2Etop(s2e) =>
  fprint!( out, "S2Etop(", s2e, ")" )
(*
  fprint!( out, "S2Etop(", s2e, "):", s2e0.sort())
*)
| S2Etpz(s2e) =>
  fprint!( out, "S2Etpz(", s2e, ")" )
(*
  fprint!( out, "S2Etpz(", s2e, "):", s2e0.sort())
*)
//
| S2Eapp
  (s2fn, s2es) =>
  fprint!
  ( out
  , "S2Eapp(", s2fn, "; ", s2es, ")")
| S2Elam
  (s2vs, body) =>
  fprint!
  ( out
  , "S2Elam(", s2vs, "; ", body, ")")
//
| S2Earg(knd, s2e) =>
  fprint!
  (out, "S2Earg(", knd, "; ", s2e, ")")
(*
  fprint!
  (out, "S2Earg(", knd, "; ", s2e, "):", s2e0.sort())
*)
| S2Eatx(bef, aft) =>
  fprint!
  (out, "S2Eatx(", bef, "; ", aft, ")")
(*
  fprint!
  (out, "S2Eatx(", bef, "; ", aft, "):", s2e0.sort())
*)
//
| S2Efun
  (fc2, npf, arg, res) =>
  fprint!
  ( out, "S2Efun("
  , fc2, "; ", npf, "; ", arg, "; ", res, ")"
  )
//
| S2Ecimp(loc, s2e) =>
  fprint!
  ( out
  , "S2Ecimp(", s2e, ":", s2e.sort(), ")")
| S2Ecprf(loc, s2e) =>
  fprint!
  ( out
  , "S2Ecprf(", s2e, ":", s2e.sort(), ")")
| S2Ectcd(loc, s2e) =>
  fprint!
  ( out
  , "S2Ectcd(", s2e, ":", s2e.sort(), ")")
| S2Ecast(loc, s2e, s2t) =>
  fprint!
  ( out
  , "S2Ecast(", s2e, ":", s2e.sort(), "; ", s2t, ")")
(*
  fprint!
  ( out
  , "S2Ecast("
  , loc, "; ", s2e, "; ", s2t, ")")
*)
//
| S2Emet
  (s2es, body) =>
  fprint!
  ( out, "S2Emet("
  , s2es, "; ", body, ")")
//
| S2Eexi
  (s2vs, s2ps, body) =>
  fprint!
  ( out, "S2Eexi("
  , s2vs, "; ", s2ps, "; ", body, ")")
| S2Euni
  (s2vs, s2ps, body) =>
  fprint!
  ( out, "S2Euni("
  , s2vs, "; ", s2ps, "; ", body, ")")
//
(*
| S2Elist(s2es) =>
  fprint!(out, "S2Elist(", s2es, ")")
*)
//
| S2Etyrec
  (knd, npf, ls2es) =>
  fprint!
  ( out, "S2Etyrec("
  , knd, "; ", npf, "; ", ls2es, ")")
//
| S2Et2ype(t2p1) =>
  fprint!(out, "S2Et2ype(", t2p1, ")")
//
| S2Etyext(tnm1, s2es) =>
  fprint!
  ( out
  , "S2Etyext(", tnm1, "; ", s2es, ")")
//
| S2Enone0() =>
  fprint!(out, "S2Enone0(", ")")
//
| S2Enone1(loc, s1e) =>
  fprint!( out, "S2Enone1(", s1e, ")" )
(*
  fprint!
  (out, "S2Enone1(", loc, "; ", s1e, ")")
*)
//
| S2Eg1mac(loc, g1m) =>
  fprint!( out, "S2Eg1mac(", g1m, ")" )
(*
  fprint!
  (out, "S2Eg1mac(", loc, "; ", g1m, ")")
*)
//
| S2Enone2(loc, s2e) =>
  fprint!( out, "S2Enone2(", s2e, ")" )
(*
  fprint!
  (out, "S2Enone2(", loc, "; ", s2e, ")")
*)
//
) (* end of [fprint_s2exp] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_labs2exp(x0) =
fprint_labs2exp(stdout_ref, x0) 
implement
prerr_labs2exp(x0) =
fprint_labs2exp(stderr_ref, x0) 
//
(*
implement
fprint_labs2exp
  (out, lx0) =
let
implement
fprint_val<s2exp> = fprint_s2exp
in
  fprint_slabeled<s2exp>(out, lx0)
end(*let*)//end of [fprint_labs2exp]
*)
//
implement
fprint_labs2exp
  (out, lx0) =
(
case+ lx0 of
|
SLABELED
(l0, x0) => fprint!(out, l0, "=", x0)
) (*case*)//end of [fprint_labs2exp]
//
(* ****** ****** *)
//
implement
print_s2itm(x0) =
fprint_s2itm(stdout_ref, x0) 
implement
prerr_s2itm(x0) =
fprint_s2itm(stderr_ref, x0) 
//
implement
fprint_s2itm
  (out, x0) =
(
case+ x0 of
//
| S2ITMvar(s2v) =>
  fprint!(out, "S2ITMvar(", s2v, ")")
//
| S2ITMcst(s2cs) =>
  fprint!(out, "S2ITMcst(", s2cs, ")")
//
| S2ITMfmodenv(fmod) =>
  fprint!(out, "S2ITMfmodenv(", "...", ")")
)
//
(* ****** ****** *)

(* end of [xats_staexp2_print.dats] *)
