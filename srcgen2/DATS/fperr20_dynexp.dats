(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 29 Jan 2023 11:33:55 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/fperr20.sats"
(* ****** ****** *)
(* ****** ****** *)
(*
#define FPERR20_ERRLVL 2
*)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
#symload lctn with f2arg_get_lctn
#symload node with f2arg_get_node
(* ****** ****** *)
#symload lctn with d2gua_get_lctn
#symload node with d2gua_get_node
#symload lctn with d2gpt_get_lctn
#symload node with d2gpt_get_node
#symload lctn with d2cls_get_lctn
#symload node with d2cls_get_node
(* ****** ****** *)
(* ****** ****** *)

local
//
(* ****** ****** *)
#define ERRLVL 2
(* ****** ****** *)
//
fun
auxmain
( out: FILR
, d2p: d2pat): void =
let
//
#impltmp
g_print$out<>() = out
//
val () =
(
prerrs
("fperr20_d2pat:");
prerrsln
("auxmain: d2p = ", d2p))
//
in//let
//
case+
d2p.node() of
//
(*
|
D2Psym0
(drpt,d1p1,dpis) =>
let
val () =
fperr20_d2pat
(out, drpt.dpat((*void*))) end
*)
//
|
D2Pdapp
( d2f0
, npf1, d2ps) =>
let
val () =
fperr20_d2pat(out, d2f0)
val () =
fperr20_d2patlst(out, d2ps) end
//
|
D2Prfpt
( d2p1
, tkas, d2p2) =>
let
val () =
(
  fperr20_d2pat(out, d2p1))
val () =
(
  fperr20_d2pat(out, d2p2)) end
//
|
D2Ptup0
( npf1, d2ps) =>
let
val () =
fperr20_d2patlst(out, d2ps) end
|
D2Ptup1
( tknd
, npf1, d2ps) =>
let
val () =
fperr20_d2patlst(out, d2ps) end
|
D2Prcd2
( tknd
, npf1, ldps) =>
let
val () =
fperr20_l2d2plst(out, ldps) end
//
|
D2Pannot
(d2p1,s1e2,s2e2) =>
let
val () = fperr20_d2pat(out, d2p1)
(*
val () = fperr20_s2exp(out, s2e2)
*)
endlet
//
|
D2Pt2pck
(d2p1, t2p2) =>
let
val () = fperr20_d2pat(out, d2p1)
endlet
//
|D2Pnone0 _ => (   (*void*)   )
|D2Pnone1 _ => () | D2Pnone2 _ => ()
|
D2Perrck(_,_) => fperr20_d2pat(out, d2p)
//
|
_(*otherwise*) =>
let
  val
  loc = d2p.lctn()
  val () = prerrsln
  ("fperr20_d2pat:auxmain: loc = ", loc)
  val () = prerrsln
  ("fperr20_d2pat:auxmain: d2p = ", d2p)
endlet
//
end (*let*) // end-of-[ auxmain(out, d2p) ]
//
in//local
//
#implfun
fperr20_d2pat
( out, d2p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
// (*
val () =
let
val loc0 = d2p0.lctn((*0*))
in//let
prerrsln
("fperr20_d2pat: loc0 = ", loc0)
end//let
val () =
prerrsln
("fperr20_d2pat: d2p0 = ", d2p0)
// *)
//
in//let
//
case+
d2p0.node() of
|
D2Perrck(lvl, d2p1) =>
(
auxmain( out, d2p1 ); 
if
(lvl>=ERRLVL)
then ((*void*)) else
let
val loc0 = d2p0.lctn()
in//let
printsln();
printsln("\
FPERR20-ERROR:", loc0, ":", d2p0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr20_d2pat(out,d2p0))
//
endloc(*local*)//end-of(local(fperr20_d2pat))

(* ****** ****** *)
//
#implfun
fperr20_l2d2p
(out, ld2p) =
(
case+ ld2p of
|
D2LAB(lab,d2p1) => fperr20_d2pat(out,d2p1)
) (*case+*)//end-of-(fperr20_d2pat(out,ld2p))
//
(* ****** ****** *)

local

(* ****** ****** *)
#define ERRLVL 3
(* ****** ****** *)
//
fun
auxdexp
( out: FILR
, d2e: d2exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d2e.node() of
|D2Eint _ => print(d2e)
|D2Ebtf _ => print(d2e)
|D2Echr _ => print(d2e)
|D2Eflt _ => print(d2e)
|D2Estr _ => print(d2e)
//
|D2Ei00 _ => print(d2e)
|D2Eb00 _ => print(d2e)
|D2Ec00 _ => print(d2e)
|D2Ef00 _ => print(d2e)
|D2Es00 _ => print(d2e)
//
(* ****** ****** *)
//
|D2Etop _ => print(d2e)
//
(* ****** ****** *)
//
|D2Evar _ => print(d2e)
//
|D2Econ _ => print(d2e)
|D2Ecst _ => print(d2e)
//
(* ****** ****** *)
//
|D2Econs _ => print(d2e)
|D2Ecsts _ => print(d2e)
//
(* ****** ****** *)
//
|D2Esym0 _ =>
prints("D2Esym0(", "...", ")")
//
(* ****** ****** *)
//
|D2Esapp _ =>
prints("D2Esapp(", "...", ")")
|D2Etapp _ =>
prints("D2Etapp(", "...", ")")
//
(* ****** ****** *)
//
|D2Edap0 _ =>
prints("D2Edap0(", "...", ")")
|D2Edapp _ =>
prints("D2Edapp(", "...", ")")
//
(* ****** ****** *)
//
|D2Eproj _ =>
prints("D2Eproj(", "...", ")")
//
(* ****** ****** *)
//
|D2Elet0 _ =>
prints("D2Elet0(", "...", ")")
//
(* ****** ****** *)
//
|D2Eift0 _ =>
prints("D2Eift0(", "...", ")")
|D2Ecas0 _ => 
prints("D2Ecas0(", "...", ")")
//
(* ****** ****** *)
//
|D2Eseqn _ =>
prints("D2Eseqn(", "...", ")")
//
(* ****** ****** *)
//
|D2Etup0 _ =>
prints("D2Etup0(", "...", ")")
|D2Etup1 _ =>
prints("D2Etup1(", "...", ")")
|D2Ercd2 _ =>
prints("D2Ercd2(", "...", ")")
//
(* ****** ****** *)
//
|D2Elam0 _ =>
prints("D2Elam0(", "...", ")")
|D2Efix0 _ =>
prints("D2Efix0(", "...", ")")
//
(* ****** ****** *)
//
|D2Etry0 _ =>
prints("D2Etry0(", "...", ")")
//
(* ****** ****** *)
//
|D2Eaddr _ =>
prints("D2Eaddr(", "...", ")")
|D2Eview _ =>
prints("D2Eview(", "...", ")")
//
|D2Eeval _ =>
prints("D2Eeval(", "...", ")")
//
|D2Efold _ =>
prints("D2Efold(", "...", ")")
//
|D2Efree _ =>
prints("D2Efree(", "...", ")")
//
(* ****** ****** *)
//
|D2Ewhere _ =>
prints("D2Ewhere(", "...", ")")
//
(* ****** ****** *)
//
|D2Eassgn _ =>
prints("D2Eassgn(", "...", ")")
|D2Exazgn _ =>
prints("D2Exazgn(", "...", ")")
|D2Exchng _ =>
prints("D2Exchng(", "...", ")")
//
(* ****** ****** *)
//
|D2Ebrget _ =>
prints("D2Ebrget(", "...", ")")
|D2Ebrset _ =>
prints("D2Ebrset(", "...", ")")
//
(* ****** ****** *)
//
|D2Edtsel _ =>
prints("D2Edtsel(", "...", ")")
//
(* ****** ****** *)
//
|D2El0azy _ =>
prints("D2El0azy(", "...", ")")
|D2El1azy _ =>
prints("D2El1azy(", "...", ")")
//
(* ****** ****** *)
//
|D2Eannot _ =>
prints("D2Eannot(", "...", ")")
//
(* ****** ****** *)
//
|D2Elabck
(d2e1, lab2) =>
( print("D2Elabck(")
; auxdexp(out, d2e1)
; print(";"); prints(lab2, ")"))
//
|D2Et2pck
(d2e1, t2p2) =>
( print("D2Et2pck(")
; auxdexp(out, d2e1)
; print(";"); prints(t2p2, ")"))
//
(* ****** ****** *)
//
|D2Enone0() =>
(
 prints("D2Enone0(", ")"))
//
|D2Enone1(d1e1) =>
(
 prints("D2Enone1(", d1e1, ")"))
//
|D2Enone2(d2e1) =>
(
 prints("D2Enone2(", d2e1, ")"))
//
(* ****** ****** *)
//
|D2Eerrck
(lvl0, d2e1) =>
( print("D2Eerrck(")
; print(lvl0); print(";")
; auxdexp(out, d2e1); print(")"))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
  val
  loc = d2e.lctn((*0*))
  val () = prerrsln
  ("fperr20_d2exp:auxdexp: loc = ", loc)
  val () = prerrsln
  ("fperr20_d2exp:auxdexp: d2e = ", d2e)
endlet
//
end (*let*) // end-of-[ auxdexp(out, d2e) ]
//
(* ****** ****** *)
//
fun
auxmain
( out: FILR
, d2e: d2exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d2e.node() of
//
(* ****** ****** *)
//
|D2Esym0
(drxp,d1e1,dpis) =>
let
val () =
fperr20_d2exp
(out, drxp.dexp((*0*)))
endlet
//
(* ****** ****** *)
//
|D2Esapp
(d2f0,s2es) =>
let
val () =
fperr20_d2exp(out, d2f0)
(*
val () =
fperr20_s2explst(out, s2es)
*)
endlet
|D2Etapp
(d2f0,s2es) =>
let
val () =
fperr20_d2exp(out, d2f0)
(*
val () =
fperr20_s2explst(out, s2es)
*)
endlet
//
|D2Edapp
(d2f0
,npf1, d2es) =>
let
val () =
fperr20_d2exp(out, d2f0)
val () =
fperr20_d2explst(out, d2es)
endlet
//
(* ****** ****** *)
//
|D2Eproj
(tknd
,drxp
,dlab, dtup) =>
let
val () =
(
  fperr20_d2exp(out, dtup))
end(*let*)//end-of-[D2Eproj]
//
(* ****** ****** *)
//
|D2Elet0
(dcls, d2e1) =>
(
  fperr20_d2exp(out, d2e1))
where
{
val () =
fperr20_d2eclist(out, dcls)
}(*where*)//end-of-[D2Elet0]
|D2Ewhere
(d2e1, dcls) =>
(
  fperr20_d2exp(out, d2e1))
where
{
val () =
fperr20_d2eclist(out, dcls)
}(*where*)//end-of-[D2Ewhere]
//
(* ****** ****** *)
//
|D2Eift0
(d2e1,dthn,dels) =>
let
  val () =
  fperr20_d2exp(out, d2e1)
  val () =
  fperr20_d2expopt(out, dthn)
  val () =
  fperr20_d2expopt(out, dels)
endlet
//
|D2Ecas0
(tknd,d2e1,dcls) =>
let
  val () =
  fperr20_d2exp(out, d2e1)
  val () =
  fperr20_d2clslst(out, dcls)
endlet
//
(* ****** ****** *)
//
|D2Eseqn
(d2es, d2e1) =>
(
fperr20_d2exp
( out , d2e1 )) where
{
val () =
fperr20_d2explst(out, d2es) }
//
(* ****** ****** *)
//
|D2Etup0
(npf1, d2es) =>
let
val () =
fperr20_d2explst(out, d2es) end
|D2Etup1
( tknd
, npf1, d2es) =>
let
val () =
fperr20_d2explst(out, d2es) end
|D2Ercd2
( tknd
, npf1, ldes) =>
let
val () =
fperr20_l2d2elst(out, ldes) end
//
(* ****** ****** *)
//
|D2Elam0
( tknd
, f2as, sres
, arrw, dexp) =>
let
//
val () =
fperr20_f2arglst(out, f2as)
//
(*
val () = fperr20_s2res(out, sres)
*)
val () = fperr20_d2exp(out, dexp)
//
endlet
//
|D2Efix0
( tknd
, dpid
, f2as, sres
, arrw, dexp) =>
let
//
val () =
fperr20_f2arglst(out, f2as)
//
(*
val () = fperr20_s2res(out, sres)
*)
val () = fperr20_d2exp(out, dexp)
//
endlet
//
(* ****** ****** *)
//
|D2Etry0
(tknd,d2e1,dcls) =>
let
val () =
  fperr20_d2exp(out, d2e1)
val () =
(
  fperr20_d2clslst(out, dcls) )
endlet
//
(* ****** ****** *)
//
|D2Eaddr(d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
|D2Eview(d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
//
(* ****** ****** *)
//
|D2Eeval(d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
|D2Efree(d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
//
(* ****** ****** *)
//
|D2Eassgn
(d2el, d2er) =>
let
val () = fperr20_d2exp(out, d2el)
val () = fperr20_d2exp(out, d2er)
endlet//endof(D2Eassgn(d2el,d2er))
//
|D2Exazgn
(d2el, d2er) =>
let
val () = fperr20_d2exp(out, d2el)
val () = fperr20_d2exp(out, d2er)
endlet//endof(D2Exazgn(d2el,d2er))
//
|D2Exchng
(d2el, d2er) =>
let
val () = fperr20_d2exp(out, d2el)
val () = fperr20_d2exp(out, d2er)
endlet//endof(D2Exchng(d2el,d2er))
//
(* ****** ****** *)
//
|D2Ebrget
(dpis, d2es) =>
(
let
val () =
(
fperr20_d2explst(out, d2es)) end)
|D2Ebrset
(dpis, d2es) =>
(
let
val () =
(
fperr20_d2explst(out, d2es)) end)
//
(* ****** ****** *)
//
|
D2Eraise
(tknd, d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
//
(* ****** ****** *)
//
|
D2El0azy
(dsym, d2e1) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
|
D2El1azy
(dsym
,d2e1, d2es) =>
(
  fperr20_d2explst(out, d2es)
) where
{
val () = fperr20_d2exp(out, d2e1)
}
//
|
D2Elabck
(d2e1, lab2) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
|
D2Et2pck
(d2e1, t2p2) =>
let
val () = fperr20_d2exp(out, d2e1)
endlet
//
|D2Enone0 _ => (   (*void*)   )
|D2Enone1 _ => () | D2Enone2 _ => ()
//
|
D2Eerrck(_,_) => fperr20_d2exp(out, d2e)
//
|
_(*otherwise*) =>
let
  val
  loc = d2e.lctn((*0*))
  val () = prerrsln
  ("fperr20_d2exp:auxmain: loc = ", loc)
  val () = prerrsln
  ("fperr20_d2exp:auxmain: d2e = ", d2e)
endlet
//
end (*let*) // end-of-[ auxmain(out, d2e) ]

in//local
//
#implfun
fperr20_d2exp
( out, d2e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d2e0.lctn((*0*))
in//let
(*
prerrsln
("fperr20_d2exp: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr20_d2exp: d2e0 = ", d2e0)
*)
//
in//let
//
case+
d2e0.node() of
|
D2Eerrck(lvl, d2e1) =>
(
//
auxmain( out, d2e1 ); 
//
if
(lvl>=ERRLVL)
then ((*void*)) else
let
//
val
loc0 = d2e0.lctn((*0*))
//
#impltmp
g_print
<d2exp>(d2e) = auxdexp(out, d2e)
//
in//let
printsln();
printsln("\
FPERR20-ERROR:", loc0, ":", d2e0)
end//let
//
) (* end-of-[D2Eerrck(lvl, d2e1)] *)
| // non-D2Eerrck // ... // ... // ...
_ (* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr20_d2exp(out,d2e0))
//
endloc(*local*)//end-of(local(fperr20_d2exp))

(* ****** ****** *)
//
#implfun
fperr20_l2d2e
(out, ld2e) =
(
case+ ld2e of
|
D2LAB(lab,d2e1) => fperr20_d2exp(out,d2e1)
) (*case+*)//end-of-(fperr20_d2exp(out,ld2e))
//
(* ****** ****** *)
//
#implfun
fperr20_f2arg
(out, farg) =
(
case+
farg.node() of
//
|F2ARGdapp
(npf1, d2ps) =>
fperr20_d2patlst(out, d2ps)
//
|F2ARGsapp
(s2vs, s2es) => ( (*void*) )
|F2ARGmets
(   s2es   ) => ( (*void*) ) )//end-of-fun
//(*case+*)//end-of-(fperr20_f2arg(out,farg)]
//
(* ****** ****** *)
//
#implfun
fperr20_d2gua
(out, dgua) =
(
case+
dgua.node() of
|
D2GUAexp(d2e1) =>
fperr20_d2exp(out, d2e1)
|
D2GUAmat(d2e1,d2p2) =>
let
val () = fperr20_d2exp(out, d2e1)
val () = fperr20_d2pat(out, d2p2)
endlet // end of [D2GUAmat(_,_,_)]
) (*case*) // end-of(fperr20_d2gua(out,dgua))
//
(* ****** ****** *)
//
#implfun
fperr20_d2gpt
(out, dgpt) =
(
case+
dgpt.node() of
|
D2GPTpat(d2p1) =>
fperr20_d2pat(out, d2p1)
|
D2GPTgua(d2p1,d2gs) =>
let
val () = fperr20_d2pat(out, d2p1)
val () = fperr20_d2gualst(out, d2gs)
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case*) // end-of(fperr20_d2gpt(out,dgpt))
//
(* ****** ****** *)
//
#implfun
fperr20_d2cls
(out, dcls) =
(
case+
dcls.node() of
|
D2CLSgpt(dgpt) =>
fperr20_d2gpt(out, dgpt)
|
D2CLScls(dgpt,d2e2) =>
let
val () = fperr20_d2gpt(out, dgpt)
val () = fperr20_d2exp(out, d2e2)
endlet // end of [ D2CLScls(_,_,_) ]
) (*case*) // end-of(fperr20_d2cls(out,dcls))
//
(* ****** ****** *)
//
#implfun
fperr20_d2patlst
  (out, d2ps) =
(
  list_fperr20_fnp(out, d2ps, fperr20_d2pat))
#implfun
fperr20_d2patopt
  (out, dopt) =
(
  optn_fperr20_fnp(out, dopt, fperr20_d2pat))
//
#implfun
fperr20_l2d2plst
  (out, ldps) =
(
  list_fperr20_fnp(out, ldps, fperr20_l2d2p))
//
(* ****** ****** *)
//
#implfun
fperr20_d2explst
  (out, d2es) =
(
  list_fperr20_fnp(out, d2es, fperr20_d2exp))
#implfun
fperr20_d2expopt
  (out, dopt) =
(
  optn_fperr20_fnp(out, dopt, fperr20_d2exp))
//
#implfun
fperr20_l2d2elst
  (out, ldes) =
(
  list_fperr20_fnp(out, ldes, fperr20_l2d2e))
//
(* ****** ****** *)
//
#implfun
fperr20_f2arglst
  (out, f2as) =
(
  list_fperr20_fnp(out, f2as, fperr20_f2arg))
//
(* ****** ****** *)
//
#implfun
fperr20_d2gualst
  (out, d2gs) =
(
  list_fperr20_fnp(out, d2gs, fperr20_d2gua))
//
(* ****** ****** *)
//
#implfun
fperr20_d2clslst
  (out, d2cs) =
(
  list_fperr20_fnp(out, d2cs, fperr20_d2cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr20_dynexp.dats] *)
(***********************************************************************)
