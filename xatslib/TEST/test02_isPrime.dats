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
//
The following Haskell code was sent to
the ats-lang-users google-group by Dambaev.
//
Please see:
https://groups.google.com/u/1/g/ats-lang-users/c/z-QbPs7JWgg
//
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

(*
fun
isPrime
(x: sint): bool =
let
val ps =
gseq_itakeif_strm
<strx(sint)><sint>
(   thePrimes   ) where
{
#impltmp
itakeif$test<sint>(i, p) = p * p <= x
}
in//let
strm_vt_forall0(ps) where
{ #impltmp forall0$test<sint>(p) = x % p > 0 }
end (*let*) // end of [isPrime(x)]
*)
fun
isPrime
(x: sint): bool =
let
val ps =
strx_filter_vt
(  thePrimes  ) where
{
#impltmp
filter$test<sint>(p) =
(if x % p = 0 then true else p*p > x)
}
val-
~strxcon_vt_cons
 (  p1  ,   ps ) = !ps in free(ps); p1*p1 > x
end (*let*) // end of [isPrime(x)]

(* ****** ****** *)
//
val
thePrimes2 =
let
#impltmp
filter0$test<sint> = isPrime
in
strm_vt_filter0(strm_vt_from(2)) end
//
val
thePrimes2 = 
strm_vt_takeif0<sint>(thePrimes2) where
{
#impltmp
takeif0$test<sint>(p0) = (p0 <= 16*1024*1024)
}
//
(* ****** ****** *)

(*
//
real	0m23.060s
user	0m23.380s
system	0m00.188s
//
output: |thePrimes2| = 1077871
//
The time info is obtained from
running on the machine: hwxi@hongwei-t440p
the JS code produced by compiling the ATS3
source via the Xats2js-H0 compiler (ATS->JS).
It is about *10* times slower than the C code
generated from some comparable ATS2 code.
//
// HX: More runs:
//
|thePrimes2| = 1077871
21.64user 0.10system 0:21.30elapsed 102%CPU (0avgtext+0avgdata 139628maxresident)k
0inputs+0outputs (0major+29154minor)pagefaults 0swaps
|thePrimes2| = 1077871
22.54user 0.16system 0:22.40elapsed 101%CPU (0avgtext+0avgdata 139372maxresident)k
0inputs+0outputs (0major+29181minor)pagefaults 0swaps
//
*)
val () =
prerrln0("|thePrimes2| = ", length0(thePrimes2))

(* ****** ****** *)

(* end of [ATS3/xatslib/TEST/test02_isPrime.dats] *)
