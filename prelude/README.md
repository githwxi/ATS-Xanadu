# The ATS3-prelude library

[comment]: # HX-2025-05-15: Let's start documenting!

What is presented here should be seen as a set of comments aiming at
helping someone understand the design and implementation of the
prelude library for ATS3. These comments are made selectively and are
not meant to be thorough.

## Special Files

### fixity0.sats

ATS3 supports prefix, infix and postfix operators.
The file `fixity0.sats` contains fixity declarations for
various commonly used symbols.

For instance, the following lines declare the 5 common arithmetic
operators as being left-associative; addition (+) and substraction (-)
are given the precedence value 50 while the other three are given the
precedence value 60. In general, these precedence values should not be
altered for otherwise a great deal of confusion is likely to be
introduced.

```
#infixl + of 50 (*add*)
#infixl - of 50 (*sub*)
#infixl * of 60 (*mul*)
#infixl / of 60 (*div*)
#infixl % of 60 (*mod*)
```

Note that `infixl` and `infixr` are for left-associativity and
right-associativity respectively. And `infix0` (which can also
be written as `infix`) is for non-associative infix operators.

In a case like `1+2-3`, the expression is parsed as `(1+2)-3` instead
of `1+(2-3)` due to the fact that addition and subtraction are given
the same precedence value while they are left-associative.

In a case like `1+2*3`, the expression is parsed as `1+(2*3)` instead
of `(1+2)*3` due to multiplication being given a higher precedence
value than addition.

In ATS3, a symbol can be given an infix status as well as a prefix
status. For instance, we have the following declarations:

```
#prefix + of +(+1) (*uplus*)
#prefix - of -(+1) (*uminus*)
```

As a prefix operator, the precedence value of `+` (resp. `-`) is 1 higher
than the precedence value of `+` (resp. `-`) as an infix operator.

### basics0.sats

The file `basics0.sats` contains the declarations of various
basic constants in ATS3.

For instance, the following lines introduce some aliases for
the 4 basic predicative sorts `int0`, `bool`, `addr`, and `char`
in ATS3:

```
#sortdef i0 = int0 // integers // (-inf, +inf)
#sortdef a0 = addr // addresses // 0 <= a < +inf
#sortdef b0 = bool // booleans  // true | false
#sortdef c0 = char // characters // 0 <= c < 256
```

And the following lines introduce some aliases for the 6 basic
impredicative sorts `prop`, `view`, `type`, `tbox`, `vwtp`, and `vtbx`
in ATS3:

```
#sortdef p0 = prop // proof
#sortdef t0 = type // dynexp
#sortdef tx = tbox // boxed dynexp
#sortdef v0 = view // linear proof
#sortdef vw = view // linear proof
#sortdef vt = vwtp // linear dynexp
#sortdef vx = vtbx // linear boxed dynexp
```

There are also some subset sorts:

```
#sortdef nat = {n: i0 | n >= 0}
#sortdef pos = {n: i0 | n >= 1}
#sortdef neg = {n: i0 | n <= -1}
```

After sort definitions, there are various declared static constants in
`basics0.sats`.  For instance, the following lines introduce
some static constants for the two boolean values `true` and `false` and also
the disjunction (`add_b0_b0`) and the conjunction (`mul_b0_b0`):

```
#stacst0 tt_b0 : b0 // true
#stacst0 ff_b0 : b0 // false
#stacst0 add_b0_b0: (b0, b0)->b0
#stacst0 mul_b0_b0: (b0, b0)->b0

```

Furthermore, some aliases are introduced as follows:

```
#sexpdef tt = tt_b0 // overloading
#sexpdef ff = ff_b0 // overloading
#sexpdef + = add_b0_b0 // overloading
#sexpdef * = mul_b0_b0 // overloading
#sexpdef || = add_b0_b0 // overloading
#sexpdef && = mul_b0_b0 // overloading
```

For instance, we can write `true+false` or `true||false` for
`add_b0_b0(true, false)`, `true*false` or `true&&false` for
`mul_b0_b0(true, false)`, etc. Please note that the fixity
declarations for `+`, `*`, `||`, and `&&` are given in `fixity0.sats`.


### xparam0.hats

This file is largely empty as of now.  It is supposed to contain
various system-related constants.  For instance, the the forward slash
symbol is used in UNIX-like systems for separating components in a
file path; and the backward slash symbol is used for this purpose in
Windows.

## Handling of Partial Functions

Handling of partial functions is an issue of crucial importance in
programming. The convention followed in the prelude library for
handling partial functions can be illustrated through a simple
example.  For instance, `gseq_head`, which returns the head (that is,
the first elememnt) of a given sequence is given the following
interface:

```
fun
<xs:t0>
<x0:t0>
gseq_head(xs: xs): x0
```

Clearly, `gseq_head` is a partial function as the head of an empty
sequence is undefined. When applied to an empty sequence, the behavior
of `gseq_head` is unspecified; it may return some value or it may raise
an exception.

The following declared function `gseq_head$exn` is a variant of
`gseq_head`:

```
fun
<xs:t0>
<x0:t0>
gseq_head$exn(xs: xs): x0
```

which, when applied to an empty sequence, should raise an exception to
indicate that the head of an empty sequence is undefined.

The following declared function `gseq_head$opt` is another variant of
`gseq_head`:

```
fun
<xs:t0>
<x0:t0>
gseq_head$opt(xs: xs): optn_vt(x0)
```

which returns a (linear) option value to indicate whether the head of
a given sequence is well-defined.

There is yet another variant of `gseq_head`, which is declared as follows:

```
fun
<xs:t0>
<x0:t0>
gseq_head$raw(xs): x0
```

Like `gseq_head`, the behavior of `gseq_head$raw` on an empty sequence
is unspecified. However, unlike the function `gseq_head`,
`gseq_head$raw` may even behave unsafely when applied to an empty
sequence. For instance, `gseq_head$raw` may do something like
out-of-bounds array access, which can be taken advantage of by a
malicious program. Therefore, when applying `gseq_head$raw` to a
sequence, one must possess, formally or informally, a proof of some
kind that attests to the non-emptiness of the sequence.

## Naming Convention for Combinators

Let us take `map` as an example to illustrate some conventional rules
employed for naming various combinators in the prelude library of
ATS3.  In general, `map` means to apply some function `fopr` to each
value in a collection to form another collection of values (where each
value is a result of `fopr`). For instance, a sequence of values of
type `X` can be "mapped" to another sequence of values of type `Y`,
where each value of type `X` is mapped to a value of type `Y`. The
`fopr` function for `map` is declared as follows in
`prelude/SATS/gbas001.sats`:

```
fun
<x0:t0>
<y0:vt>
map$fopr(itm: x0): (y0)
```

We use `gseq_map` for an operation that traverses a given sequence and
applies `map$fopr` to the value of each encountered item; the sequence
traversal performed by `gseq_map` is referred to as the default or
standard traversal of the sequence.

The output sequence of performing `gseq_map` on an input sequence may be
represented differently from the input sequence. For instance, the
input sequence can be an array-based string (representing a sequence
of characters) while the output sequence can be a linked list of some
kind. The most generic sequence-based `map` is declared as follows:

```
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares(xs: xs): (ys)
```

where the (suffix) word `ares` indicates that the return value of
`gseq_map_ares` is the most generic (that is, threre is practically no
information revealed on the representation of the return value).

There are many variants of `gseq_map_ares`. For instance, the
following variant indicates that the return value is represented as
a linear list (given the type `list_vt`):

```
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_llist(xs: xs): list_vt(y0)
```

### Indexed Traversal

When traversing a sequence of items, `gseq_imap` applies the
following `fopr` function to each encountered item:

```
fun
<x0:t0>
<y0:vt>
imap$fopr(pos: ni, itm: x0): (y0)
```

Note that the first argument of `imap$fopr` is a natural number of
the type `ni` (a shorthand for `nint`) that indicates the position
of the encountered item in the given sequence while the second
argument is the value of the item.  The most generic sequence-based
`imap` is declared as follows:

```
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_imap_ares(xs: xs): (ys)
```

The naming convention we follow changes `map` into `imap` to indicate
that the (standard) sequence traversal (for `map`) is replaced with
the indexed sequence traversal (for `imap`) that records the position
of each encountered item.

### Reversed Traversal

There is a default or standard traversal associated with a given
sequence, and we refer to this traversal as the left-to-right
traversal of sequence. Then there also the right-to-left traversal
that is completely opposite to the left-to-right traversal, which we
refer to as the reversed traversal.

The naming convention we follow changes `map` into `rmap` to indicate
that the (standard) sequence traversal (for `map`) is replaced with
the reversed sequence traversal (for `rmap`).

### Z-Combined Traversal

### X-Combined Traversal

<!--
##############################(README.md)##############################
-->