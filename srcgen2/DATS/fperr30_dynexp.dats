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
Thu 27 Jul 2023 12:39:57 PM EDT
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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/fperr30.sats"
(* ****** ****** *)
#define FPERR30_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d3p: d3pat): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d3p.node() of
//
(* ****** ****** *)
//
|
D3Pdap1(d3f0) =>
let
val () =
fperr30_d3pat(out, d3f0) end
|
D3Pdapp
( d3f0
, npf1, d3ps) =>
let
val () =
fperr30_d3pat(out, d3f0)
val () =
fperr30_d3patlst(out, d3ps) end
//
(* ****** ****** *)
//
|
D3Prfpt
( d3p1
, tkas, d3p2) =>
let
val () =
(
  fperr30_d3pat(out, d3p1))
val () =
(
  fperr30_d3pat(out, d3p2)) end
//
(* ****** ****** *)
//
|D3Pnone0 _ => (  (*void*)  )
|D3Pnone1 _ => () | D3Pnone2 _ => ()
//
|D3Perrck _ => fperr30_d3pat(out, d3p)
//
|
_(*otherwise*) =>
let
//
  val loc = d3p.lctn((*void*))
  val t2p = d3p.styp((*void*))
  val ( ) = prerrsln
  ("fperr30_d3pat: auxmain: loc = ", loc)
  val ( ) = prerrsln
  ("fperr30_d3pat: auxmain: t2p = ", t2p)
  val ( ) = prerrsln
  ("fperr30_d3pat: auxmain: d3p = ", d3p)
//
endlet
//
end (*let*) // end-of-[ auxmain(out, d3p) ]

in//local
//
#implfun
fperr30_d3pat
( out, d3p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d3p0.lctn()
in//let
(*
prerrsln
("fperr30_d3pat: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr30_d3pat: d3p0 = ", d3p0)
*)
//
in//let
//
case+
d3p0.node() of
|
D3Perrck(lvl, d3p1) =>
(
auxmain( out, d3p1 ); 
if
(lvl
>FPERR30_ERRVL)
then ((*void*)) else
let
val
loc0 = d3p0.lctn((*0*))
in//let
printsln();
printsln("\
FPERR30-ERROR:", loc0, ":", d3p0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr30_d3pat(out,d3p0))
//
(* ****** ****** *)
//
endloc(*local*)//end-of(local(fperr30_d3pat))

(* ****** ****** *)
//
#implfun
fperr30_l3d3p
(out, ld3p) =
(
case+ ld3p of
|
D3LAB(lab,d3p1) => fperr30_d3pat(out,d3p1)
) (*case+*)//end-of-(fperr30_d3pat(out,ld3p))
//
(* ****** ****** *)

local

(* ****** ****** *)
//
fun
auxdexp
( out: FILR
, d3e: d3exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d3e.node() of
//
(* ****** ****** *)
//
|D3Eint _ => print(d3e)
|D3Ebtf _ => print(d3e)
|D3Echr _ => print(d3e)
|D3Eflt _ => print(d3e)
|D3Estr _ => print(d3e)
//
|D3Ei00 _ => print(d3e)
|D3Eb00 _ => print(d3e)
|D3Ec00 _ => print(d3e)
|D3Ef00 _ => print(d3e)
|D3Es00 _ => print(d3e)
//
(* ****** ****** *)
//
|D3Etop _ => print(d3e)
//
(* ****** ****** *)
//
|D3Evar _ => print(d3e)
//
|D3Econ _ => print(d3e)
|D3Ecst _ => print(d3e)
//
(* ****** ****** *)
//
|D3Etimp _ =>
prints("D3Etimp(", "...", ")")
//
(* ****** ****** *)
//
|D3Esapp _ =>
prints("D3Esapp(", "...", ")")
|D3Esapq _ =>
prints("D3Esapq(", "...", ")")
//
(* ****** ****** *)
//
|D3Etapp _ =>
prints("D3Etapp(", "...", ")")
|D3Etapq _ =>
prints("D3Etapq(", "...", ")")
//
(* ****** ****** *)
//
|D3Edap0 _ =>
prints("D3Edap0(", "...", ")")
|D3Edapp _ =>
prints("D3Edapp(", "...", ")")
//
(* ****** ****** *)
//
|D3Epcon _ =>
prints("D3Epcon(", "...", ")")
|D3Eproj _ =>
prints("D3Eproj(", "...", ")")
//
(* ****** ****** *)
//
|D3Elet0 _ =>
prints("D3Elet0(", "...", ")")
//
(* ****** ****** *)
//
|D3Eift0 _ =>
prints("D3Eift0(", "...", ")")
|D3Ecas0 _ => 
prints("D3Ecas0(", "...", ")")
//
(* ****** ****** *)
//
|D3Eseqn _ =>
prints("D3Eseqn(", "...", ")")
//
(* ****** ****** *)
//
|D3Etup0 _ =>
prints("D3Etup0(", "...", ")")
|D3Etup1 _ =>
prints("D3Etup1(", "...", ")")
|D3Ercd2 _ =>
prints("D3Ercd2(", "...", ")")
//
(* ****** ****** *)
//
|D3Elam0 _ =>
prints("D3Elam0(", "...", ")")
|D3Efix0 _ =>
prints("D3Efix0(", "...", ")")
//
(* ****** ****** *)
//
|D3Etry0 _ =>
prints("D3Etry0(", "...", ")")
//
(* ****** ****** *)
//
|D3Eaddr _ =>
prints("D3Eaddr(", "...", ")")
|D3Eview _ =>
prints("D3Eview(", "...", ")")
|D3Eflat _ =>
prints("D3Eflat(", "...", ")")
//
|D3Eeval _ =>
prints("D3Eeval(", "...", ")")
//
|D3Efold _ =>
prints("D3Efold(", "...", ")")
//
|D3Efree _ =>
prints("D3Efree(", "...", ")")
//
(* ****** ****** *)
//
|D3Ewhere _ =>
prints("D3Ewhere(", "...", ")")
//
(* ****** ****** *)
//
|D3Edp2tr _ =>
prints("D3Edp2tr(", "...", ")")
//
|D3Edl0az _ =>
prints("D3Edl0az(", "...", ")")
|D3Edl1az _ =>
prints("D3Edl1az(", "...", ")")
//
(* ****** ****** *)
//
|D3Eassgn _ =>
prints("D3Eassgn(", "...", ")")
//
(* ****** ****** *)
//
|D3Eraise _ =>
prints("D3Eraise(", "...", ")")
//
(* ****** ****** *)
//
|D3El0azy _ =>
prints("D3El0azy(", "...", ")")
|D3El1azy _ =>
prints("D3El1azy(", "...", ")")
//
(* ****** ****** *)
//
|D3Eannot _ =>
prints("D3Eannot(", "...", ")")
//
(* ****** ****** *)
//
|D3Elabck
(d3e1, lab2) =>
( print("D3Elabck(")
; auxdexp(out, d3e1)
; print(";"); prints(lab2, ")"))
//
|D3Et2pck
(d3e1, t2p2) =>
let
val
t2p1 = d3e1.styp()
in//let
( print("D3Et2pck(")
; auxdexp(out, d3e1)
; print(";"); print(t2p1)
; print(";"); prints(t2p2, ")"))
end//let//end-of-[D3Et2pck(...)]
|D3Et2ped _ =>
(
prints("D3Et2ped(", "...", ")"))
//
(* ****** ****** *)
//
|D3Enone0() =>
(
 prints("D3Enone0(", ")"))
//
|D3Enone1(d2e1) =>
(
 prints("D3Enone1(", d2e1, ")"))
//
|D3Enone2(d3e1) =>
(
 prints("D3Enone2(", d3e1, ")"))
//
(* ****** ****** *)
//
|D3Eerrck
(lvl0, d3e1) =>
( print("D3Eerrck(")
; print(lvl0); print(";")
; auxdexp(out, d3e1); print(")"))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
  val
  loc = d3e.lctn((*0*))
  val () = prerrsln
  ("fperr30_d3exp:auxdexp: loc = ", loc)
  val () = prerrsln
  ("fperr30_d3exp:auxdexp: d3e = ", d3e)
endlet
//
end (*let*) // end-of-[ auxdexp(out, d3e) ]
//
(* ****** ****** *)
//
fun
auxmain
( out: FILR
, d3e: d3exp): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
d3e.node() of
//
|D3Esapp
(d3f0,s2es) =>
let
val () =
fperr30_d3exp(out, d3f0)
(*
val () =
fperr30_s2explst(out, s2es)
*)
endlet
//
|D3Etapp
(d3f0,s2es) =>
let
val () =
fperr30_d3exp(out, d3f0)
(*
val () =
fperr30_s2explst(out, s2es)
*)
endlet
//
|D3Edapp
(d3f0
,npf1, d3es) =>
let
val () =
fperr30_d3exp(out, d3f0)
val () =
fperr30_d3explst(out, d3es)
endlet//end-of-[D3Edapp]
//
|D3Epcon
(tknd
,lab1, d3e1) =>
let
val () =
fperr30_d3exp(out, d3e1)
endlet//end-of-[D3Epcon]
|D3Eproj
(tknd
,lab1, d3e1) =>
let
val () =
fperr30_d3exp(out, d3e1)
endlet//end-of-[D3Eproj]
//
|D3Elet0
(dcls, d3e1) =>
(
fperr30_d3exp(out, d3e1))
where
{
val () =
fperr30_d3eclist(out, dcls)
}(*where*)//end-of-[D3Elet0]
//
(* ****** ****** *)
//
|D3Eift0
(d3e1
,dthn, dels) =>
let
val () =
fperr30_d3exp(out, d3e1)
val () =
fperr30_d3expopt(out, dthn)
val () =
fperr30_d3expopt(out, dels)
endlet//end-of-[D3Eift0(...)]
//
|D3Ecas0
(tknd
,d3e1, dcls) =>
let
val () =
fperr30_d3exp(out, d3e1)
val () =
fperr30_d3clslst(out, dcls)
endlet//end-of-[D3Ecas0(...)]
//
(* ****** ****** *)
//
|D3Eseqn
(d3es, d3e1) =>
(
fperr30_d3exp(out, d3e1))
where
{
val () =
fperr30_d3explst(out, d3es)}
//(*where*)//end-of-[D3Eseqn]
//
(* ****** ****** *)
//
|D3Etry0
(tknd
,d3e1, dcls) =>
let
val () =
fperr30_d3exp(out, d3e1)
val () =
fperr30_d3clslst(out, dcls)
endlet//end-of-[D3Etry0(...)]
//
(* ****** ****** *)
//
|D3Edp2tr
(   d3e1   ) =>
let
val () =
(
  fperr30_d3exp(out, d3e1))
endlet//end-of-[D3Edp2tr(...)]
//
|D3Edl0az
(   d3e1   ) =>
let
val () =
(
  fperr30_d3exp(out, d3e1))
endlet//end-of-[D3Edl0az(...)]
|D3Edl1az
(   d3e1   ) =>
let
val () =
(
  fperr30_d3exp(out, d3e1))
endlet//end-of-[D3Edl1az(...)]
//
(* ****** ****** *)
//
|D3Ewhere
(d3e1, dcls) =>
(
  fperr30_d3exp(out, d3e1))
where
{val () =
 fperr30_d3eclist(out, dcls)}
//(*where*)//endof[D3Ewhere(...)]
//
(* ****** ****** *)
//
|D3Eassgn
(d3el, d3er) =>
let
val () =
(
  fperr30_d3exp(out, d3el) )
val () =
(
  fperr30_d3exp(out, d3er) )
end(*let*)//end-of-[D3Eassgn(...)]
//
(* ****** ****** *)
//
|D3Eraise
(tknd, d3e1) =>
let
val () =
(
  fperr30_d3exp(out, d3e1) )
end(*let*)//end-of-[D3Eraise(...)]
//
(* ****** ****** *)
//
|D3El0azy
(dknd, d3e1) =>
let
val () =
(
  fperr30_d3exp(out, d3e1) )
end(*let*)//end-of-[D3El0azy(...)]
|D3El1azy
(dknd
,d3e1, d3es) =>
let
val () =
  fperr30_d3exp(out, d3e1)
val () =
  fperr30_d3explst(out, d3es)
end(*let*)//end-of-[D3El1azy(...)]
//
(* ****** ****** *)
//
|D3Eannot
(d3e1
,s1e1, s2e2) =>
let
val () =
(
  fperr30_d3exp(out, d3e1) )
end(*let*)//end-of-[D3Eannot(...)]
//
(* ****** ****** *)
//
|D3Elabck
(d3e1, lab2) =>
let
val () =
(
  fperr30_d3exp(out, d3e1) )
(*
val () =
(
  fperr30_label(out, lab2) )
*)
end(*let*)//end-of-[D3Elabck(...)]
//
|D3Et2pck
(d3e1, t2p2) =>
let
val () =
(
  fperr30_d3exp(out, d3e1) )
(*
val () =
(
  fperr30_s2typ(out, t2p2) )
*)
end(*let*)//end-of-[D3Et2pck(...)]
//
(* ****** ****** *)
//
|D3Enone0 _ => (  (*void*)  )
|D3Enone1 _ => () | D3Enone2 _ => ()
|
D3Eerrck(_,_) => fperr30_d3exp(out, d3e)
//
|
_(*otherwise*) =>
let
//
val loc = d3e.lctn((*void*))
val t2p = d3e.styp((*void*))
//
val ( ) = prerrsln
("fperr30_d3exp: auxmain: loc = ", loc)
val ( ) = prerrsln
("fperr30_d3exp: auxmain: t2p = ", t2p)
val ( ) = prerrsln
("fperr30_d3exp: auxmain: d3e = ", d3e)
//
endlet
//
end (*let*) // end-of-[ auxmain(out, d3e) ]
//
(* ****** ****** *)
//
in//local
//
#implfun
fperr30_d3exp
( out, d3e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = d3e0.lctn()
in//let
(*
prerrsln
("fperr30_d3exp: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr30_d3exp: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
|
D3Eerrck(lvl, d3e1) =>
(
auxmain( out, d3e1 ); 
if
(lvl
>FPERR30_ERRVL)
then ((*void*)) else
let
//
val
loc0 = d3e0.lctn()
//
#impltmp
g_print
<d3exp>(d3e) = auxdexp(out, d3e)
//
in//let
printsln();
printsln("\
FPERR30-ERROR:", loc0, ":", d3e0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fperr30_d3exp(out,d3e0))
//
(* ****** ****** *)
//
endloc(*local*)//end-of(local(fperr30_d3exp))

(* ****** ****** *)
//
#implfun
fperr30_l3d3e
(out, ld3e) =
(
case+ ld3e of
|
D3LAB(lab,d3e1) => fperr30_d3exp(out,d3e1)
) (*case+*)//end-of-(fperr30_d3exp(out,ld3e))
//
(* ****** ****** *)
//
#implfun
fperr30_f3arg
(out, farg) =
(
case+
farg.node() of
//
|F3ARGdapp
(npf1, d3ps) =>
fperr30_d3patlst(out, d3ps)
//
|F3ARGsapp
(s2vs, s2es) => ( (*void*) )
|F3ARGmets
(   s2es   ) => ( (*void*) ) )//end-of-fun
//(*case+*)//end-of-(fperr30_f3arg(out,farg)]
//
(* ****** ****** *)
//
#implfun
fperr30_d3gua
(out, dgua) =
(
case+
dgua.node() of
|
D3GUAexp(d3e1) =>
fperr30_d3exp(out, d3e1)
|
D3GUAmat(d3e1,d3p2) =>
let
val () = fperr30_d3exp(out, d3e1)
val () = fperr30_d3pat(out, d3p2)
endlet // end of [D3GUAmat(_,_,_)]
) (*case*) // end-of(fperr30_d3gua(out,dgua))
//
(* ****** ****** *)
//
#implfun
fperr30_d3gpt
(out, dgpt) =
(
case+
dgpt.node() of
|
D3GPTpat(d3p1) =>
fperr30_d3pat(out, d3p1)
|
D3GPTgua(d3p1,d3gs) =>
let
val () = fperr30_d3pat(out, d3p1)
val () = fperr30_d3gualst(out, d3gs)
endlet // end of [ D3GPTgua(_,_,_) ]
) (*case*) // end-of(fperr30_d3gpt(out,dgpt))
//
(* ****** ****** *)
//
#implfun
fperr30_d3cls
(out, dcls) =
(
case+
dcls.node() of
|
D3CLSgpt(dgpt) =>
fperr30_d3gpt(out, dgpt)
|
D3CLScls(dgpt,d3e2) =>
let
val () = fperr30_d3gpt(out, dgpt)
val () = fperr30_d3exp(out, d3e2)
endlet // end of [ D3CLScls(_,_,_) ]
) (*case*) // end-of(fperr30_d3cls(out,dcls))
//
(* ****** ****** *)
//
#implfun
fperr30_d3patlst
  (out, d3ps) =
(
  list_fperr30_fnp(out, d3ps, fperr30_d3pat))
//
(* ****** ****** *)
//
#implfun
fperr30_l3d3plst
  (out, ldps) =
(
  list_fperr30_fnp(out, ldps, fperr30_l3d3p))
//
(* ****** ****** *)
//
#implfun
fperr30_d3explst
  (out, d3es) =
(
  list_fperr30_fnp(out, d3es, fperr30_d3exp))
//
#implfun
fperr30_d3expopt
  (out, dopt) =
(
  optn_fperr30_fnp(out, dopt, fperr30_d3exp))
//
(* ****** ****** *)
//
#implfun
fperr30_l3d3elst
  (out, ldes) =
(
  list_fperr30_fnp(out, ldes, fperr30_l3d3e))
//
(* ****** ****** *)
//
#implfun
fperr30_f3arglst
  (out, f3as) =
(
  list_fperr30_fnp(out, f3as, fperr30_f3arg))
//
(* ****** ****** *)
//
#implfun
fperr30_d3gualst
  (out, d3gs) =
(
  list_fperr30_fnp(out, d3gs, fperr30_d3gua))
//
(* ****** ****** *)
//
#implfun
fperr30_d3clslst
  (out, d3cs) =
(
  list_fperr30_fnp(out, d3cs, fperr30_d3cls))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr30_dynexp.dats] *)
