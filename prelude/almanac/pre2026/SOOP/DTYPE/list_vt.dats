(* ****** ****** *)
(* ****** ****** *)
#staload "./../FACE/gxs.dats"
(* ****** ****** *)
#staload "./../FACE/gseq.dats"
(* ****** ****** *)
#staload "./../FACE/gstack.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:x0 }
gseq_nilq1
<LIST_VT><list_vt(x0)><(x0)> = list_vt_nilq1<x0>
#impltmp
{ x0:x0 }
gseq_consq1
<LIST_VT><list_vt(x0)><(x0)> = list_vt_consq1<x0>
//
(* ****** ****** *)
//
#impltmp
{ x0:x0 }
gseq_forall0
<LIST_VT><list_vt(x0)><(x0)> = list_vt_forall0<x0>
#impltmp
{ x0:x0 }
gseq_forall1
<LIST_VT><list_vt(x0)><(x0)> = list_vt_forall1<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:x0 }
gstack_nilq1
<LIST_VT><list_vt(x0)><(x0)> = list_vt_nilq1<x0>
#impltmp
{ x0:x0 }
gstack_fullq1<LIST_VT><list_vt(x0)><(x0)>(xs) = false
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU/prelude/almanac/pre2026/SOOP/DTYPE/list_vt.dats] *)
(***********************************************************************)
(***********************************************************************)
