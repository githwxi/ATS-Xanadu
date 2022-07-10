(* ****** ****** *)
(*
Sat Jul  9 19:33:25 EDT 2022
*)
(* ****** ****** *)
#include
"./xats2js_test.hats"
(* ****** ****** *)
(*
{-# LANGUAGE ScopedTypeVariables#-}
  module Main where

  primes::[Int]
  primes = 2:3:filter isPrime [5,7..] :: [Int]
  isPrime:: Int-> Bool
  isPrime x = foldr (&&) True map2
    where
      map2 = map (\n -> (x `rem` n) /= 0) take1
      take1 = takeWhile ( \n -> ((n^2) <= x)) primes
  main = print . length . takeWhile (<= 2^24) $ primes
*)
(* ****** ****** *)

val
thePrimes =
strx_sieve
(strx_from<sint>(2)) where
{
#impltmp
sieve$test<sint>(x1, x2) = (x2 % x1 > 0)
} (*where*) // end of [thePrimes]

(* ****** ****** *)

fun
isPrime(x: sint): bool =
let
val ps =
strm_filter_strm
( thePrimes
, lam(p) =>
  if x % p > 0 then true else p*p > x)
val-
~strm_vt_cons
 ( p1 ,  ps ) = ps in free(ps); p1*p1 > x
end (*let*) // end of [isPrime]

val thePrimes2 = strx_filter_strm(strx_from(2))

(* ****** ****** *)

val () = prerrln0("thePrimes2 = ", thePrimes2)

(* ****** ****** *)

(* end of [test02_isPrime.dats] *)
