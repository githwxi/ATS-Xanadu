(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 08th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)

local
(* ****** ****** *)
#symload
lctn with token_get_lctn
#symload
node with token_get_node
(* ****** ****** *)
in//local
(* ****** ****** *)
#implfun
t0int_get_lctn(int) =
(
case+ int of
|
T0INTnone(tok) => tok.lctn()
|
T0INTsome(tok) => tok.lctn()
)
#implfun
t0chr_get_lctn(chr) =
(
case+ chr of
|
T0CHRnone(tok) => tok.lctn()
|
T0CHRsome(tok) => tok.lctn()
)
#implfun
t0flt_get_lctn(flt) =
(
case+ flt of
|
T0FLTnone(tok) => tok.lctn()
|
T0FLTsome(tok) => tok.lctn()
)
#implfun
t0str_get_lctn(str) =
(
case+ str of
|
T0STRnone(tok) => tok.lctn()
|
T0STRsome(tok) => tok.lctn()
)
(* ****** ****** *)
endloc (*local*) // end of [local]
(* ****** ****** *)

local
//
datatype
i0dnt =
I0DNT of
(
loctn, i0dnt_node)
#absimpl
i0dnt_tbox = i0dnt
//
in (* in-of-local *)

(* ****** ****** *)
#implfun
i0dnt_none(tok) = let
val
loc = token_get_lctn(tok)
in
I0DNT(loc, I0DNTnone(tok))
end (*let*)// end of [i0dnt_none]
(* ****** ****** *)
#implfun
i0dnt_some(tok) = let
val
loc = token_get_lctn(tok)
in
I0DNT(loc, I0DNTsome(tok))
//
end (*let*) // end of [i0dnt_some]
(* ****** ****** *)
#implfun
i0dnt_get_lctn(lab) =
let
val+I0DNT(loc,nod) = lab in loc end
#implfun
i0dnt_get_node(lab) =
let
val+I0DNT(loc,nod) = lab in nod end
(* ****** ****** *)

endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
l0abl =
L0ABL of
(
loctn, l0abl_node)
#absimpl
l0abl_tbox = l0abl
//
in (* in-of-local *)
//
#implfun
l0abl_make_node
(   loc,nod   ) = L0ABL(loc,nod)
//
#implfun
l0abl_get_lctn(lab) =
let
  val+L0ABL(loc,nod) = lab in loc
end
#implfun
l0abl_get_node(lab) =
let
  val+L0ABL(loc,nod) = lab in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)
//
#implfun
l0abl_make_none
  (  tok  ) =
(
l0abl_make_node
(loc, L0ABLnone(tok))) where
{
val loc = token_get_lctn(tok)
}(*where*)//end-of-[l0abl_make_none]
//
(* ****** ****** *)
//
#implfun
l0abl_make_int1
  (  tok  ) = let
//
val
loc =
token_get_lctn(tok)
val-
T_INT01(rep) =
token_get_node(tok)
//
val int = g_parse<sint>(rep)
//
in//let
//
l0abl_make_node(loc, L0ABLsome(LABint(int)))
//
end // end of [l0abl_make_int1]
//
#implfun
l0abl_make_name
  (  tok  ) = let
//
val
loc =
token_get_lctn(tok)
val-
T_IDALP(rep) =
token_get_node(tok)
//
val sym = symbl_make_name(rep)
//
(*
val () =
prerrln
("l0abl_make_name: sym = ", sym)
*)
//
in
//
l0abl_make_node(loc, L0ABLsome(LABsym(sym)))
//
end // end of [l0abl_make_name]
//
(* ****** ****** *)

local
//
datatype
s0ymb =
S0YMB of
(
loctn, s0ymb_node)
#absimpl
s0ymb_tbox = s0ymb
//
in (* in-of-local *)
//
#implfun
s0ymb_make_node
(   loc,nod   ) = S0YMB(loc,nod)
//
#implfun
s0ymb_get_lctn(sym) =
let
  val+S0YMB(loc,nod) = sym in loc
end
#implfun
s0ymb_get_node(sym) =
let
  val+S0YMB(loc,nod) = sym in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
g0nam =
G0NAM of
(
loctn, g0nam_node)
#absimpl
g0nam_tbox = g0nam
//
in (* in-of-local *)
//
#implfun
g0nam_make_node
(   loc,nod   ) = G0NAM(loc,nod)
//
#implfun
g0nam_get_lctn(g0n) =
let
  val+G0NAM(loc,nod) = g0n in loc
end
#implfun
g0nam_get_node(g0n) =
let
  val+G0NAM(loc,nod) = g0n in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
g0exp =
G0EXP of
(
loctn, g0exp_node)
#absimpl
g0exp_tbox = g0exp
//
in (* in-of-local *)
//
#implfun
g0exp_make_node
(   loc,nod   ) = G0EXP(loc,nod)
//
#implfun
g0exp_get_lctn(g0e) =
let
  val+G0EXP(loc,nod) = g0e in loc
end
#implfun
g0exp_get_node(g0e) =
let
  val+G0EXP(loc,nod) = g0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
g0mag =
G0MAG of
(
loctn, g0mag_node)
#absimpl
g0mag_tbox = g0mag
//
in (* in-of-local *)
//
#implfun
g0mag_make_node
(   loc,nod   ) = G0MAG(loc,nod)
//
#implfun
g0mag_get_lctn(gma) =
let
  val+G0MAG(loc,nod) = gma in loc
end
#implfun
g0mag_get_node(gma) =
let
  val+G0MAG(loc,nod) = gma in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
sort0 =
SORT0 of
(
loctn, sort0_node)
#absimpl
sort0_tbox = sort0
//
in (* in-of-local *)
//
#implfun
sort0_make_node
(   loc,nod   ) = SORT0(loc,nod)
//
#implfun
sort0_get_lctn(s0t) =
let
  val+SORT0(loc,nod) = s0t in loc
end
#implfun
sort0_get_node(s0t) =
let
  val+SORT0(loc,nod) = s0t in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0tcn =
S0TCN of
(
loctn, s0tcn_node)
#absimpl
s0tcn_tbox = s0tcn
//
in (* in-of-local *)
//
#implfun
s0tcn_make_node
(   loc,nod   ) = S0TCN(loc,nod)
//
#implfun
s0tcn_get_lctn(tcn) =
let
  val+S0TCN(loc,nod) = tcn in loc
end
#implfun
s0tcn_get_node(tcn) =
let
  val+S0TCN(loc,nod) = tcn in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0tst =
D0TST of
(
loctn, d0tst_node)
#absimpl
d0tst_tbox = d0tst
//
in (* in-of-local *)
//
#implfun
d0tst_make_node
(   loc,nod   ) = D0TST(loc,nod)
//
#implfun
d0tst_get_lctn(dst) =
let
  val+D0TST(loc,nod) = dst in loc
end
#implfun
d0tst_get_node(dst) =
let
  val+D0TST(loc,nod) = dst in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0arg =
S0ARG of
(
loctn, s0arg_node)
#absimpl
s0arg_tbox = s0arg
//
in (* in-of-local *)
//
#implfun
s0arg_make_node
(   loc,nod   ) = S0ARG(loc,nod)
//
#implfun
s0arg_get_lctn(sag) =
let
  val+S0ARG(loc,nod) = sag in loc
end
#implfun
s0arg_get_node(sag) =
let
  val+S0ARG(loc,nod) = sag in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0mag =
S0MAG of
(
loctn, s0mag_node)
#absimpl
s0mag_tbox = s0mag
//
in (* in-of-local *)
//
#implfun
s0mag_make_node
(   loc,nod   ) = S0MAG(loc,nod)
//
#implfun
s0mag_get_lctn(smg) =
let
  val+S0MAG(loc,nod) = smg in loc
end
#implfun
s0mag_get_node(smg) =
let
  val+S0MAG(loc,nod) = smg in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0arg =
T0ARG of
(
loctn, t0arg_node)
#absimpl
t0arg_tbox = t0arg
//
in (* in-of-local *)
//
#implfun
t0arg_make_node
(   loc,nod   ) = T0ARG(loc,nod)
//
#implfun
t0arg_get_lctn(tag) =
let
  val+T0ARG(loc,nod) = tag in loc
end
#implfun
t0arg_get_node(tag) =
let
  val+T0ARG(loc,nod) = tag in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0mag =
T0MAG of
(
loctn, t0mag_node)
#absimpl
t0mag_tbox = t0mag
//
in (* in-of-local *)
//
#implfun
t0mag_make_node
(   loc,nod   ) = T0MAG(loc,nod)
//
#implfun
t0mag_get_lctn(tmg) =
let
  val+T0MAG(loc,nod) = tmg in loc
end
#implfun
t0mag_get_node(tmg) =
let
  val+T0MAG(loc,nod) = tmg in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0qua =
S0QUA of
(
loctn, s0qua_node)
#absimpl
s0qua_tbox = s0qua
//
in (* in-of-local *)
//
#implfun
s0qua_make_node
(   loc,nod   ) = S0QUA(loc,nod)
//
#implfun
s0qua_get_lctn(s0q) =
let
  val+S0QUA(loc,nod) = s0q in loc
end
#implfun
s0qua_get_node(s0q) =
let
  val+S0QUA(loc,nod) = s0q in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
(* ****** ****** *)
//
#symload
lctn with token_get_lctn
#symload
lctn with i0dnt_get_lctn
//
#symload + with add_loctn_loctn
(* ****** ****** *)
//
in//local
//
#implfun
s0qid_get_lctn
(   qid   ) =
(
case+ qid of
|
S0QIDnone
(  id0  ) => id0.lctn()
|
S0QIDsome
(tok,id0) => tok.lctn()+id0.lctn()
)
#implfun
d0qid_get_lctn
(   qid   ) =
(
case+ qid of
|
D0QIDnone
(  id0  ) => id0.lctn()
|
D0QIDsome
(tok,id0) => tok.lctn()+id0.lctn()
)
//
endloc (*local*) // end-of-[local]

(* ****** ****** *)

local
//
datatype
s0tdf =
S0TDF of
(
loctn, s0tdf_node)
#absimpl
s0tdf_tbox = s0tdf
//
in (* in-of-local *)
//
#implfun
s0tdf_make_node
(   loc,nod   ) = S0TDF(loc,nod)
//
#implfun
s0tdf_get_lctn(stdf) =
let
 val+S0TDF(loc,nod) = stdf in loc
end
#implfun
s0tdf_get_node(stdf) =
let
 val+S0TDF(loc,nod) = stdf in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

#implfun
s0exp_anno_opt
( s0e1, opt2 ) =
(
case+ opt2 of
|
optn_nil() => s0e1
|
optn_cons(s0t2) =>
let
  val
  loc0 = s0e1.lctn()+s0t2.lctn()
in
  s0exp(loc0, S0Eanno(s0e1, s0t2))
end//let
)(*case*)//end(s0exp_anno_opt(s0e1,opt2))

(* ****** ****** *)

local
//
datatype
s0exp =
S0EXP of
(
loctn, s0exp_node)
#absimpl
s0exp_tbox = s0exp
//
in (* in-of-local *)
//
#implfun
s0exp_make_node
(   loc,nod   ) = S0EXP(loc,nod)
//
#implfun
s0exp_get_lctn(s0e) =
let
  val+S0EXP(loc,nod) = s0e in loc
end
#implfun
s0exp_get_node(s0e) =
let
  val+S0EXP(loc,nod) = s0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)
//
#implfun
l0s0e_get_lctn
(   lx   ) = s0exp_get_lctn(lx.itm())
#implfun
l0s0e_get_node
(   lx   ) = s0exp_get_node(lx.itm())
//
(* ****** ****** *)

local
//
datatype
s0uni =
S0UNI of
(
loctn, s0uni_node)
#absimpl
s0uni_tbox = s0uni
//
in (* in-of-local *)
//
#implfun
s0uni_make_node
(   loc,nod   ) = S0UNI(loc,nod)
//
#implfun
s0uni_get_lctn(s0e) =
let
  val+S0UNI(loc,nod) = s0e in loc
end
#implfun
s0uni_get_node(s0e) =
let
  val+S0UNI(loc,nod) = s0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0tcn =
D0TCN of
(
loctn, d0tcn_node)
#absimpl
d0tcn_tbox = d0tcn
//
in (* in-of-local *)
//
#implfun
d0tcn_make_node
(   loc,nod   ) = D0TCN(loc,nod)
//
#implfun
d0tcn_get_lctn(s0e) =
let
  val+D0TCN(loc,nod) = s0e in loc
end
#implfun
d0tcn_get_node(s0e) =
let
  val+D0TCN(loc,nod) = s0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0typ =
D0TYP of
(
loctn, d0typ_node)
#absimpl
d0typ_tbox = d0typ
//
in (* in-of-local *)
//
#implfun
d0typ_make_node
(   loc,nod   ) = D0TYP(loc,nod)
//
#implfun
d0typ_get_lctn(s0e) =
let
  val+D0TYP(loc,nod) = s0e in loc
end
#implfun
d0typ_get_node(s0e) =
let
  val+D0TYP(loc,nod) = s0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp0.dats] *)
