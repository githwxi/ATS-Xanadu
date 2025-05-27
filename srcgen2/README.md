# [ATS3-Xanadu](http://www.ats-lang.org/)/srcgen2

[comment]: # HX-2025-05-24: Let's document ATS3-Xanadu/srcgen2!

My original plan was first implementing in ATS2 a compiler from ATS3
to C and then using this compiler to bootstrap ATS3. Starting
somewhere in the summer of 2018, I was able to implement in ATS2 a
running compiler from ATS3 to JS by the end of 2020. Unfortunately, I
was still not able to obtain a running compiler from ATS3 to C after
spending the following year (2021), and I became quite anxious about
the prospect of ATS3 going forward.

Around May of 2022, I decided to go forward with a modified plan of
bootstrapping ATS3: I should instead use the compiler from ATS3 to JS
to do it. While this compiler compiles quite slowly, I felt that it
should be adequate for the task of bootstrapping ATS3. Yes, it was
barely adequate. After a long struggle of nearly three years in
length, I finally succeeded in bootstrapping ATS3 on the 29th of March
of 2025. This was a big exciting moment for me, which is comparable to
the moment when I succeeded in bootstrapping ATS1 (ATS-Anairiats) in
May of 2008, almost 17 years ago.

Unlike previous implementations of ATS, which were all of extreme
experimental nature, I could finally afford some luxury to actually
think, sometimes, in depth about the structure of ATS3-Xanadu/srcgen2.

## The structure of ATS3-Xanadu/srcgen2

After lexing and parsing, the compiler obtains an abstract syntax tree
(AST), which is referred to as level-0 AST. There are many a
translation function in the compiler that translates one form of AST
into another form. And each translation function is often paired with
a so-call proofread function, which traverses an AST to look for
errors; the errors found are stored in the AST returned by the
proofread function, which can be reported later during another AST
traveral.

In earlier (experimental) implementations of ATS (ATS0, ATS1, and
ATS2), type-errors are reported immediately after they are found. This
style yields very poor quality of type-error messages, resulting in so
steep a learning curve for ATS that most programmers find learning ATS
daunting or even a _mission impossible_ :)
  
### Lexing

The code for lexing (that is, lexical analysis) is manually written.
Maybe it is okay for a small project to use a tool to generate code
that does lexing. In this case, I wanted to write more code in ATS3 so as
to better test its design.

When I started implementing my first "real" compiler for Dependent ML
(DML) in 1997, I immediately _assumed_ that I should use a tool to
generate lexing code. I soon realized that implementing a lexer is
actually very little work, and I have since manually implemented
nearly every lexer I need.  It is entirely possible that the code for
lexing (in ATS3-Xanadu) will be rewritten in the future so as to make
it more efficient.

- `SATS/lexbuf0.sats`:
  For creating buffers of characters from text sources
- `SATS/lexing0.sats`:
  For tokenization, handling key words, error-reporting, etc.

### Parsing

The (current) concrete syntax of ATS3 (for writing source code) is
quite complex. This complexity is largely due to the need for
supporting numerous forms of type annotations, which are essential for
practical programming with advanced types. Without proper annotations,
it often becomes very difficult or even impractical to understand the
cause of a type-error, which is most likely required before any fixes
can be attempted.

- `SATS/pread00.sats`:
  For detecting errors in the level-0 AST.

### Fixity Resolution

- `SATS/trans01.sats`:
  For translating the level-0 AST into the level-1 AST.
- `SATS/tread01.sats`:
  For detecting errors in the level-1 AST and reporting them.

### Binding Resolution

- `SATS/trans12.sats`:
  For translating the level-1 AST into the level-2 AST.
- `SATS/tread12.sats`:
  For detecting errors in the level-2 AST and reporting them.

### Simple Type-Checking

- `SATS/trans2a.sats`:
  For a form of type-checking referred to as pre-type-checking,
  which is done to synthesize type information needed for resolving
  overloaded symbols.

- `SATS/trsym2b.sats`:
  For resolving overloaded symbols with the help of the type information
  synthesized during pre-type-checking (trans2a).

- `SATS/tread20.sats`: For detecting errors in the level-2 AST. This is
  performed after trans2a and trsym2b.

- `SATS/fperr20.sats`: For reporting errors in the AST after tread20 is done.

- `SATS/trans23.sats`:
  For a form of type-checking referred to as simple type-checking.
  It is very close to the kind of type-checking in ML minus so-called
  let-generalization (of inferred types). In short, polymorphic types
  are never synthesized in simple type-checking; they must be
  explicitly given via some forms of annotation in the source.  My own
  opinion is that let-generalization performed in the type inference
  invented by Robin Milner is largely a hindrance in programming
  language design; it is in direct conflict with symbol overloading
  and often leads to poor quality of type-error messages.
  
- `SATS/tread23.sats`:
  For reporting errors in level-3 AST after trans23 is done.

### Template Resolution

- `SATS/trans3a.sats`:
  For normalizing template arguments as well as tabling
  top-level template implementations.
- `SATS/tread3a.sats`:
  For detecting errors in the level-3 AST after trans3a is done.

- `SATS/trtmp3b.sats`:
  For performing the first phase of template resolution, which is non-recursive
  in the sense that the templates in the body of a template instance is not resolved.

- `SATS/trtmp3c.sats`
  For performing the second phase of template resolution, which is a recursive procedure
  as the templates in the body of a template instance are handled by the same algorithm
  for resolving the original template.

- `SATS/fperr30.sats`: For reporting errors in the AST after trtmp3b and trtmp3c are done.

<!--
########################################################################
-->