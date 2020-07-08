(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July 02, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
GITHWXI =
"./githwxi/my_tread33_dynexp.dats"
//
(* ****** ****** *)

implement
tread33_d3exp_D3Elcast
  (d3e0) =
{
val () =
$GITHWXI.my_tread33_d3exp_D3Elcast<>(d3e0)
} (* end of [tread33_d3exp_D3Elcast] *)

(* ****** ****** *)

implement
tread33_d3exp_D3Etcast
  (d3e0) =
{
val () =
$GITHWXI.my_tread33_d3exp_D3Etcast<>(d3e0)
} (* end of [tread33_d3exp_D3Etcast] *)

(* ****** ****** *)

(* end of [tread33_dynexp.dats] *)
