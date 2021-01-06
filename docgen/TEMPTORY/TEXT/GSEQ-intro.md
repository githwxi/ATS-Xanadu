# GSEQ for Sequential Batch-Processing

When teaching functional programming, I often receive a question like
this one: How can one access an element in a list when given the index
of the element? Of course, I could answer the question by simply
mentioning the name of a library function that does precisely what is
asked. But why is such a question being frequently asked in the first
place?  It is mostly likely that the person who asks this question is
still of a mentality that focuses on what I call individual-processing
(in contrast with batch-processing), which just processes one element
at a time. I suppose that a big part of this mentality comes from the
ubiquity of for-loops and while-loops in imperative programming. As
far as I can see, it would be nearly impossible for a programmer to
break out of this mentality if there was no support at the level of
programming language to greatly facilitate batch-processing, which
processes a sequence of elements at a time.

In functional programming, batch-processing is commonly associated
with the use of combinators (which are often higher-order functions of
relatively small bodies). ATS3 strongly advocates batch-processing by
providing support at the language level as well as at the library
level.

## Common Verbs

I list as follows some commonly used verbs and their variations in the
context of batch-processing elements sequentially. Note that an
implementation of a verb for a particular datatype is often referred
to as a combinator. Also, the full name of each listed verb in the
package GSEQ always starts with the prefix `gseq_`, which is omitted
here for simplicity.

------

* **forall**:
  It is for processing a given sequence
  until the processing function returns false.
* **exists**:
  It is for processing a given sequence
  until the processing function returns true.

* **foreach**:
  It is for processing a given sequence in its entirety.
  
* **foldl**:
  It is for processing a given sequence in its entirety and returning
  the accumulated result at the end.

* **filter**: It is for filtering out the elements in a given sequence
  that satisfy certain predicate.

* **listize**:
  It is for turning a given sequence into a linear list.
* **streamize**:
  It is for turning a given sequence into a linear stream.
  
* **map_list**: It is for applying a given function to each element in a
  given sequence and returning a linear list consisting of the results
  of these applications in the order as they are produced.
  
* **map_rlist**: It is for applying a given function to each element in a
  given sequence and returning a linear list consisting of the results
  of these applications in the reverse order as they are produced.

* **map_stream**:
  It is for lazily applying a given function to each element in a given
  sequence and returning a linear stream consisting of the results of
  these applications in the order as they are produced.

------

* **rforall**:
  It is like `forall` but processing in done in the reverse order.
* **rexists**:
  It is like `exists` but processing in done in the reverse order.
* **rforeach**:
  It is like `foreach` but processing in done in the reverse order.

* **foldr**:
  It is like `foldl` but processing in done in the reverse order.

* **rlistize**:
  It is for turning a given sequence into a linear list
  in the reverse order.
  
* **rmap_list**:
  It is like `map_list` but processing in done in the reverse order.
* **rmap_rlist**:
  It is like `map_rlist` but processing in done in the reverse order.

------

Given a sequence, the i-version of the sequence consists of pairs
where each pair is the index of an element coupled with the element
itself. For instance, the i-version of the list `(a, b, c)` is simply
`((0, a), (1, b), (2, c))`.

Given a verb, the i-version of the verb is often named `i{verb}`,
where `{verb}` refers to the name of the verb.  Basically, applying
the i-version of a verb to a given sequence is like applying the verb
to the i-version of the sequence.

* **iforall**: It is the i-version of `forall`
* **iexists**: It is the i-version of `exists`
* **iforeach**: It is the i-version of `foreach`

* **ifoldl**: It is the i-version of `foldl`

* **ifilter**: It is the i-version of `filter`.

* **imap_list**: It is the i-version of `map_list`.
* **imap_rlist**: It is the i-version of `map_rlist`.
* **imap_stream**: It is the i-version of `map_stream`.

------

Given two sequences `xs` and `ys`, let `zip(xs, ys)` be the result of
zipping `xs` and `ys`. Given a verb, the z-version of the verb is
often named `z{verb}` where `{verb}` refers to the name of the
verb. Basically, applying the z-version of a verb to two given
sequences `xs` and `ys` is like applying the verb to `zip(xs, ys)`.
  
* **zfoldl**: It is the z-version of `foldl`.

* **zforall**: It is the z-version of `forall`.
* **zexists**: It is the z-version of `exists`.
* **zforeach**: It is the z-version of `foreach`.

* **zmap_list**: It is the z-version of `map_list`.
* **zmap_rlist**: It is the z-version of `map_rlist`.
* **zmap_stream**: It is the z-version of `map_stream`.

------

Given two sequences `xs` and `ys`, let `cross(xs, ys)` be the result
of crossing `xs` by `ys`. Given a verb, the x-version of the verb is
often named `x{verb}` where `{verb}` refers to the name of the
verb. Basically, applying the z-version of a verb to two given
sequences `xs` and `ys` is like applying the verb to `cross(xs, ys)`.

* **xfoldl**: It is the x-version of `foldl`.

* **xforall**: It is the x-version of `forall`.
* **xexists**: It is the x-version of `exists`.
* **xforeach**: It is the x-version of `foreach`.

* **xmap_list**: It is the x-version of `map_list`.
* **xmap_rlist**: It is the x-version of `map_rlist`.
* **xmap_stream**: It is the x-version of `map_stream`.

------

I will be introducing more verbs elsewhere. My own experience
indicates that the above list of verbs are already adequate for
average programming needs.

## Verb Dependencies in GSEQ

Given two verbs `verb1` and `verb2`, I write `verb1 < verb2` to mean
that there is an implementation of `verb2` that depends on `verb1`. In
other words, `verb2` is available for use as long as `verb1` is
implemented. While there are a lot of fine details in terms of
implementation, one thing worth remembering is that each of the listed
verbs for sequential batching-processing is available as long as
`streamize` is implemented. For instance, an implementation of `forall`
is given as follows that is based on `streamize`:

```ats
impltmp
<xs><x0>
gseq_forall(xs) =
(
auxloop
(gseq_streamize<xs><x0>(xs))
) where
{
fun
auxloop(xs) =
(
  case+ !xs of
  | ~
  strmcon_vt_nil() => true
  | ~
  strmcon_vt_cons(x0, xs) =>
  let
    val
    test =
    forall$test<x0>(x0)
  in
    if
    test
    then auxloop(xs)
    else let val () = free(xs) in false end
  end // end of [strmcon_vt_cons]
) (* end of [auxloop] *)
} (*where*) // end of [gseq_forall]
```

Clearly, we can also implemented `exists` based on `streamize`.
However, it is a lot easier to implement `exists` based on `forall`
as is shown below:

```ats
impltmp
<xs><x0>
gseq_exists(xs) =
(
  not(gseq_forall<xs><x0>(xs))) where
{
  impltmp
  forall$test<x0>(x0) = not(exists$test<x0>(x0))
} (* end of [gseq_exists] *)
```
  
## Let's see some verbs in action!

The famous 8-queen puzzle asks the player to find ways to put eight
queen pieces on a chess board such that no queen piece can attack any
other ones. In other words, no two queen pieces can be put on the same
row, the same column, or the same diagnal. Please click
[here](https://xanadu-lang.github.io/contrib/githwxi/StreamDemo2/TEST/QueenPuzzle/2020-12-12/.)
for a demo.

Let us first declare an abstract type `board` for values representing
board configurations and then implement it as a list:

```ats
(* ****** ****** *)

abstype board == p1tr

(* ****** ****** *)

#extern
fun
board_nil(): board
#extern
fun
board_cons
(x0: int, xs: board): board

(* ****** ****** *)

local

absimpl board = list(int)

in(* in-of-local *)

implfun
board_nil
((*void*)) = list_nil()
implfun
board_cons
( x0, xs ) = list_cons(x0, xs)

impltmp
gseq_streamize
<board><int>(xs) = list_streamize<int>(xs)

end (* end of [local] *)

```

Note that the verb `streamize` is implemented for `board`, which
immidiately makes all of the other verbs listed above available for
use.

For instance, the following function `board_check` can be called to
check if putting a queen piece at column `x0` on the next row can
cause a conflict with the queen pieces on the current board `xs`:

```ats
fun
board_check
(x0: int, xs: board): bool =
(
gseq_iforall<board><int>(xs)
) where
{
impltmp
iforall$test<int>(i1, x1) =
if (x0 != x1) then (abs(x0 - x1) != i1 + 1) else false
}
```

Note that `abs` stands for the absolute value function.
The next function `board_print` is for printing out a given board:


```ats
fun
board_print
(xs: board): void =
(
gseq_rforeach
<board><int>(xs)
) where
{
impltmp
rforeach$work<int>(x0) =
(
  loop(0) ) where
{
fun
loop(i0: int): void =
if
i0 >= N
then
println((*void*))
else
(
if i0 = x0 then print "Q " else print ". "; loop(i0+1)
)
}
} (* end of [board_print *)
```

Note that the verb `rforeach` is used because the list representation
of a board actually represents the board in the reverse order: the
first element in the list represents the column position of the last
queen piece and the last element in the list represents the column
position of the first queen piece. For instance, Solution#1 is printed
out as follows:


```
Solution#1:
Q . . . . . . . 
. . . . Q . . . 
. . . . . . . Q 
. . . . . Q . . 
. . Q . . . . . 
. . . . . . Q . 
. Q . . . . . . 
. . . Q . . . . 
```

Please find the entirety of the implementation [here](./CODE/QueenPuzzle.dats).
