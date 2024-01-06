(* ****** ****** *)
(* ****** ****** *)
(*
// HX:
// for disj unions
(*
//
// HX-2024-01-06:
// Note that
// C-flat-unions are
// difficult to support;
// they are likely to be
// added in an extension.
//
*)
*)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
utpl1_t0
( a0: t0 ) =
| utpl1_t0_inj0 of (a0)
//
datatype
utpl2_t0
( a0: t0
, a1: t0 ) =
| utpl2_t0_inj0 of (a0)
| utpl2_t0_inj1 of (a1)
//
datatype
utpl3_t0
( a0: t0
, a1: t0
, a2: t0 ) =
| utpl3_t0_inj0 of (a0)
| utpl3_t0_inj1 of (a1)
| utpl3_t0_inj2 of (a2)
//
datatype
utpl4_t0
( a0: t0
, a1: t0
, a2: t0
, a3: t0 ) =
| utpl4_t0_inj0 of (a0)
| utpl4_t0_inj1 of (a1)
| utpl4_t0_inj2 of (a2)
| utpl4_t0_inj3 of (a3)
//
datatype
utpl5_t0
( a0: t0
, a1: t0
, a2: t0
, a3: t0
, a4: t0 ) =
| utpl5_t0_inj0 of (a0)
| utpl5_t0_inj1 of (a1)
| utpl5_t0_inj2 of (a2)
| utpl5_t0_inj3 of (a3)
| utpl5_t0_inj4 of (a4)
//
datatype
utpl6_t0
( a0: t0
, a1: t0
, a2: t0
, a3: t0
, a4: t0
, a5: t0 ) =
| utpl6_t0_inj0 of (a0)
| utpl6_t0_inj1 of (a1)
| utpl6_t0_inj2 of (a2)
| utpl6_t0_inj3 of (a3)
| utpl6_t0_inj4 of (a4)
| utpl6_t0_inj4 of (a5)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_utpl000.sats] *)
