# The ATS3-prelude library

## Special Files

### fixity0.sats

ATS3 supports prefix, infix and postfix operators.
The file `fixity0.sats` contains fixity declarations for
various commonly used symbols.

For instance, the following lines declare the 5 common arithmetic
operators as being left-associative; addition (+) and substraction (-)
are given the precedence value 50 while the other three are given the
precedence value 60.

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
the same precedence value (while they are left-associative).

In a case like `1+2*3`, the expression is parsed as `1+(2*3)` instead
of `(1+2)*3` due to multiplication being given a higher precedence
value than addition.

### basics0.sats

The file `basics0.sats` contains the declarations of various
basic constants in ATS3.

For instance, the following lines introduce some aliases for
the 4 basic predicative sorts `int0`, `bool`, `addr`, and `char`
in ATS3:

```
#sortdef i0 = int0 // integers
#sortdef b0 = bool // booleans
#sortdef a0 = addr // addresses
#sortdef c0 = char // characters
```

And the following lines introduce some aliases for the 6 basic
impredicative sorts `prop`, `view`, `type`, `tbox`, `vwtp`, and `vtbx`
in ATS3:

```
#sortdef p0 = prop
#sortdef v0 = view
#sortdef vw = view
#sortdef t0 = type
#sortdef tx = tbox
#sortdef vt = vwtp
#sortdef vx = vtbx
```

## Handling of Partial Functions
