(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July 02, 2020
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
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
#staload
"./../../../SATS/tread23.sats"
(* ****** ****** *)

extern
fun{}
my_tread23_d3ecl_D3Clocal: treader23(d3ecl)

(* ****** ****** *)
  
implement
{}(*tmp*)
my_tread23_d3ecl_D3Clocal
  (d3c0) =
{
//
val-
D3Clocal
(head, body) = d3c0.node()
//
val () = tread23_d3eclist(head)
val () = tread23_d3eclist(body)
//
} // end of [my_tread23_d3ecl_D3Clocal]

(* ****** ****** *)

(* end of [tread23_dynexp.dats] *)
