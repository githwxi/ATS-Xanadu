(* ****** ****** *)
(*
Sat Jul  9 19:33:25 EDT 2022
*)
(* ****** ****** *)
#include
"./xats2js_test.hats"
(* ****** ****** *)
(*
(*
The following Haskell code was sent
to the ats-lang google-group by Dambaev. Please see:
https://groups.google.com/u/1/g/ats-lang-users/c/z-QbPs7JWgg
*)
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
gseq_filter_strm
<strx(sint)><sint>(thePrimes) where
{
#impltmp
filter$test<sint>(p) =
(if x % p = 0 then true else p*p > x)
}
val-
~strmcon_vt_cons
 (  p1  ,   ps ) = !ps in free(ps); p1*p1 > x
end (*let*) // end of [isPrime]

(* ****** ****** *)
//
val
thePrimes2 =
let
#impltmp
filter0$test<sint> = isPrime
in
strm_vt_filter0<sint>(strm_vt_from(2)) end
//
val
thePrimes2 = 
strm_vt_takeif<sint>(thePrimes2) where
{
#impltmp
takeif0$test<sint>(p0) = (p0 <= 16*1024*1024)
}
//
(* ****** ****** *)

(*
//
real	1m6.470s
user	1m6.824s
system	0m0.904s
//
output: |thePrimes2| = 1077871
//
The time info is obtained from
running on the machine: hwxi@hongwei-t440p
the JS code produced by compiling the ATS3
source via the Xats2js-H0 compiler (ATS->JS).
It is about *30* times slower than the C code
generated from some comparable ATS2 code.
//
*)
val () =
prerrln0("|thePrimes2| = ", length(thePrimes2))

(* ****** ****** *)

(* end of [test02_isPrime.dats] *)
