(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024-2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Author: Codex
Sun Oct 18 11:21:38 AM EDT 2026
*)
(*
Author: Hongwei Xi
(*
Sat Sep  5 08:00:29 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/rb1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/rb1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload lctn with token_get_lctn
#symload node with token_get_node
//
(* ****** ****** *)
//
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
#symload lctn with d2var_get_lctn
//
#symload name with d2con_get_name
#symload name with d2cst_get_name
#symload name with d2var_get_name
//
(* ****** ****** *)
//
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
sintfpr
( filr: FILR
, sint: sint): void =
(
gint_fprint$sint(sint, filr))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX-2026-09-05:
Perl identifier
names should not use '$'
//
*)
fun
xsymrb1
( filr: FILR
, xsym: symbl): void =
let
(
  strn_foritm(name)
) where
{
//
val
name =
symbl_get_name(xsym)
//
#impltmp
foritm$work<char>(c0) =
let
val c0 =
(
case+ c0 of
|
'$' => '_'
|
'\'' => '_' | _ => c0)
in//let
(
  char_fprint(c0, filr)) end
}
end // end of [xsymrb1(filr,xsym)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
d2conrb1
(filr, dcon) =
(*
d2confpr(filr, dcon)
*)
let
//
val name = dcon.name((*0*))
//
in//let
(
xsymrb1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dcon.lctn((*void*))))
end(*let*)//end-of-[d2conrb1(env0,dcon)]
*)
//
(* ****** ****** *)
//
#implfun
d2cstrb1
(filr, dcst) =
(*
d2cstfpr(filr, dcst)
*)
let
//
val stmp =
d2cst_get_stmp(dcst)
val xopt =
the_d2cstmap_xnmfind(stmp)
//
in//let
(
case+
xopt of
| ~
optn_vt_nil
 ( (*0*) ) =>
(
  f0_none(dcst))
| ~
optn_vt_cons
 (  xnam  ) =>
(
case+ xnam of
|X2NAMnone
(  (*0*)  ) =>
(
  f0_none(dcst))
|X2NAMsome
(   dexp   ) =>
(
  f0_some(dcst, dexp)))
) where
{
//
fun
f0_some
(dcst: d2cst
,dexp: d2exp): void =
let
//
val name = dcst.name((*0*))
//
val-
D2Eextnam
(tknd, gnam) = dexp.node((*0*))
//
in//let
//
case+ gnam of
| G1Nid0(xsym) =>
( strnfpr(filr, "$");
  xsymrb1(filr, xsym))
| G1Nstr(xname) =>
( strnfpr(filr, "$");
  strn_fprint(xname, filr))
| _(* otherwise *) =>
(
  strnfpr(filr, "$"); xsymrb1(filr, name))
end(*let*)//end-of-[f0_some()]
//
fun
f0_none
(dcst: d2cst): void =
let
//
val tlvl =
the_timplvl_get((*void*))
//
val lctn = dcst.lctn((*0*))
val name = dcst.name((*0*))
//
in//let
(
strnfpr
(filr, "dcst");
(
if (tlvl >= 1)
then sintfpr(filr, tlvl));
strnfpr(filr, "_");xsymrb1(filr, name);
strnfpr(filr, "_");fprint_loctn_as_stamp(filr, lctn))
end(*let*)//end-of-[f0_none()]
//
}(*where*)
end(*let*)//end-of-[d2cstrb1(env0,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varrb1
(filr, dvar) =
let
//
val tlvl =
the_timplvl_get((*void*))
//
val lctn = dvar.lctn((*0*))
val name = dvar.name((*0*))
//
in//let
(
strnfpr
(filr, "dvar");
(
if (tlvl >= 1)
then sintfpr(filr, tlvl));
strnfpr(filr, "_");xsymrb1(filr, name);
strnfpr(filr, "_");fprint_loctn_as_stamp(filr, lctn))
end(*let*)//end-of-[d2varrb1(env0,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0i00rb1
(filr, i00) =
(
prints
("XATSINT0(", i00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0i00rb1(...)]
//
#implfun
i0b00rb1
(filr, b00) =
(
prints
("XATSBTF0(", b00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0b00rb1(...)]
//
(* ****** ****** *)
//
(*
Emit one decoded character inside a Ruby double-quoted literal.
Escape every #, covering #{...}, #@ivar and #$global interpolation.
Fixed-width octal escapes keep control bytes separate from following digits.
*)
fun
rb1emit_char_content
(filr: FILR, c0: char): void =
(
case+ c0 of
| '"' => strn_fprint("\\\"", filr)
| '\\' => strn_fprint("\\\\", filr)
| '#' => strn_fprint("\\#", filr)
| '\n' => strn_fprint("\\n", filr)
| '\t' => strn_fprint("\\t", filr)
| '\r' => strn_fprint("\\r", filr)
| '\b' => strn_fprint("\\b", filr)
| '\f' => strn_fprint("\\f", filr)
| '\v' => strn_fprint("\\v", filr)
| _ =>
let
val code = char_code(c0)
in//let
if // if
(code < 32)
then//then
(
prints
( "\\"
, code / 64
, (code / 8) % 8, code % 8))
else//else
(
if code = 127
then//then
(
prints
( "\\"
, code / 64
, (code / 8) % 8, code % 8)
) else char_fprint(c0, filr))
end//let
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[rb1emit_char_content]
//
#implfun
i0c00rb1
(filr, c00) =
(
strn_fprint
("XATSCHR0(\"", filr);
rb1emit_char_content(filr, c00);
char_fprint
('"', filr); char_fprint(')', filr))
//end-of-[i0c00rb1(filr,c00)]//implfun(...)
//
(* ****** ****** *)
//
#implfun
i0f00rb1
(filr, f00) =
(
prints
("XATSFLT0(", f00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0f00rb1(filr,f00)]
//
(* ****** ****** *)
//
#implfun
i0s00rb1
(filr, s00) =
(
strn_fprint("XATSSTR0(\"", filr);
f0_strn(s00);
char_fprint('"', filr); char_fprint(')', filr)
) where
{
fun
f0_strn(cs: strn): void =
(
strn_foritm(cs)
) where
{
#impltmp
foritm$work<char>(c0) = rb1emit_char_content(filr, c0)
}
}(*where*)//end-of-[i0s00rb1(filr,s00)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0intrb1
(filr, tint) =
(
case-
tint.node() of
|T_INT01
(  rep  ) => prints
("XATSINT1(", rep, ")")
|T_INT02
(bas,rep) => prints
("XATSINT2(",bas,",",rep,")")
|T_INT03
(bas
,rep,sfx) => prints
("XATSINT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0intrb1(filr,tint)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0btfrb1
(filr, btf0) =
(
if
(btf0 = TRUE_symbl)
then print("XATSBOOL(true)")
else print("XATSBOOL(false)")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0btfrb1(filr,btf0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0chrrb1
(filr, tchr) =
(
case- tchr.node() of
| T_CHAR1_nil0 _ => i0c00rb1(filr, '\0')
| T_CHAR2_char(rep) => i0c00rb1(filr, rep[1])
| T_CHAR3_blsh(rep) =>
let
val c0 = rep[2]
val c1 =
(
case+ c0 of
| 'n' => '\n'
| 't' => '\t'
| 'r' => '\r'
| 'b' => '\b'
| 'f' => '\f'
| 'v' => '\v'
| 'a' => char_make_code(7)
| _ =>
if c0 >= '0'
then (if c0 <= '7' then token2dchr(tchr) else c0)
else c0
)
in//let
i0c00rb1(filr, c1)
end//let
)//end-of-[i0chrrb1(filr,tchr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0fltrb1
(filr, tflt) =
(
//
case-
tflt.node() of
|T_FLT01
(  rep  ) => prints
("XATSFLT1(", rep, ")")
|T_FLT02
(bas,rep) => prints
("XATSFLT2(",bas,",",rep,")")
|T_FLT03
(bas
,rep,sfx) => prints
("XATSFLT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0fltrb1(filr,tflt)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmrb1
( filr,itnm ) =
(
prints
("rbx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_stmp$get(itnm)
//
}(*where*)//end-of-[i1tnmrb1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0strrb1
(filr, tstr) =
(
case- tstr.node() of
| T_STRN1_clsd(rep, len) => f0_strn(rep, len-1)
| T_STRN2_ncls(rep, len) => f0_strn(rep, len)
) where
{
//
(*
Token strings retain source escapes, unlike I1Vs00 decoded strings.
Do not double-escape \n, numeric escapes, etc.; protect literal Ruby
metacharacters separately. Use the token length, including embedded NULs.
*)
fun
f0_strn(rep: strn, stop: sint): void =
let
fnx
loop1(i0: nint): void =
if i0 >= stop
then ()
else
let
val c0 = rep[i0]
in//let
if c0 = '\\'
then loop2(i0+1)
else
(
rb1emit_char_content(filr, c0); loop1(i0+1))
end//let
//
and
loop2(i0: nint): void =
if i0 >= stop
then
(* Preserve a trailing backslash in an unclosed token. *)
rb1emit_char_content(filr, '\\')
else
let
val c0 = rep[i0]
val () =
(
case+ c0 of
| '\n' => () // ATS backslash-newline continuation
| '\\' => rb1emit_char_content(filr, c0)
| '"' => rb1emit_char_content(filr, c0)
| '#' => rb1emit_char_content(filr, c0)
| _ =>
if char_code(c0) < 32
then rb1emit_char_content(filr, c0)
else (if char_code(c0) = 127
then rb1emit_char_content(filr, c0)
else
(
char_fprint('\\', filr); char_fprint(c0, filr)))
)
in//let
loop1(i0+1)
end//let
in//let
strn_fprint("XATSSTRN(", filr); char_fprint('"', filr);
loop1(1); // skip the opening quote
char_fprint('"', filr); char_fprint(')', filr)
end//let
//
}(*where*)//end-of-[i0strrb1(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
val mylvl =
(
a0ref_make_1val(0))
//
in//local
//
#implfun
the_timplvl_get
(  (*mylvl*)  ) = a0ref_get(mylvl)
//
#implfun
the_timplvl_inc
(  (*mylvl*)  ) =
let
val lvl =
  a0ref_get(mylvl) in a0ref_set(mylvl, lvl+1)
end
//
#implfun
the_timplvl_dec()
(  (*mylvl*)  ) =
let
val lvl =
  a0ref_get(mylvl) in a0ref_set(mylvl, lvl-1)
end
//
end//local//end-of-[the_timplvl_get/inc/dec(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2rb_srcgen1_DATS_rb1emit_utils0.dats] *)
(***********************************************************************)
(***********************************************************************)
