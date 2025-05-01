(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Apr 29 10:18:31 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_vt2t<> =
XATS000_strn_vt2t
where
{
#extern
fun
XATS000_strn_vt2t
(cs
:strn_vt):strn = $extnam()
}
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_get$at =
XATS000_strn_get$at
where
{
#extern
fun
XATS000_strn_get$at
( cs
: strn
, i0: sint): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strn_length<> =
XATS000_strn_length
where
{
#extern
fun
XATS000_strn_length
(cs : strn) : nint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_head$opt<> =
XATS000_strn_head$opt
where
{
#extern
fun
XATS000_strn_head$opt
(cs: strn): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
$UN.strn_head$raw =
XATS000_strn_head$raw
where
{
#extern
fun
XATS000_strn_head$raw
(cs: strn): char = $extnam()
}
//
#impltmp
<(*tmp*)>
$UN.strn_tail$raw =
XATS000_strn_tail$raw
where
{
#extern
fun
XATS000_strn_tail$raw
(cs: strn): strn = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
stropt_nilq<> =
XATS000_stropt_nilq
where
{
#extern
fun
XATS000_stropt_nilq
(opt: stropt): bool = $extnam()
}
#impltmp
stropt_consq<> =
XATS000_stropt_consq
where
{
#extern
fun
XATS000_stropt_consq
(opt: stropt): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_get$at =
XATS000_strn_vt_get$at
where
{
#extern
fun
XATS000_strn_vt_get$at
( cs
: strn_vt
, i0:sint(*ind*)): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_set$at =
XATS000_strn_vt_set$at
where
{
#extern
fun
XATS000_strn_vt_set$at
( cs:strn_vt
, i0:sint, c0:char): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_length0 =
XATS000_strn_vt_length0
where
{
#extern
fun
XATS000_strn_vt_length0
(cs : !strn_vt) : nint = $extnam()
}
#impltmp
<(*tmp*)>
strn_vt_length1 =
XATS000_strn_vt_length1
where
{
#extern
fun
XATS000_strn_vt_length1
(cs : !strn_vt) : nint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_forall0(cs) =
XATS000_strn_vt_forall$f1un
( cs
, lam(c0) =>
  forall$test0<cgtz>(c0) ) where
{
#extern
fun
XATS000_strn_vt_forall$f1un
( cs: ~strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall0]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_forall1(cs) =
XATS000_strn_vt_forall$f1un
( cs
, lam(c0) =>
  forall$test1<cgtz>(c0) ) where
{
#extern
fun
XATS000_strn_vt_forall$f1un
( cs: !strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_forall1]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_rforall0(cs) =
XATS000_strn_vt_rforall$f1un
( cs
, lam(c0) =>
  rforall$test0<cgtz>(c0) ) where
{
#extern
fun
XATS000_strn_vt_rforall$f1un
( cs: ~strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_rforall0]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_vt_rforall1(cs) =
XATS000_strn_vt_rforall$f1un
( cs
, lam(c0) =>
  rforall$test1<cgtz>(c0) ) where
{
#extern
fun
XATS000_strn_vt_rforall$f1un
( cs: !strn_vt
, f0:
  (cgtz) -> bool): bool = $extnam()
} (*where*) // end of [strn_vt_rforall1]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strtmp_vt_alloc<> =
XATS000_strtmp_vt_alloc
where
{
#extern
fun
XATS000_strtmp_vt_alloc
  (bsz:sint): strtmp_vt = $extnam()
}(*where*)//end-of-[impltmp(strtmp_vt_alloc)]
//
//
#impltmp
<(*tmp*)>
strtmp_vt_set$at =
XATS000_strtmp_vt_set$at
where
{
#extern
fun
XATS000_strtmp_vt_set$at
(cs:strtmp_vt,i0:sint,c0:char): void = $extnam()
}(*where*)//end-of-[impltmp(strtmp_vt_set$at(...))]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_strn000.dats] *)
(***********************************************************************)
