# [ATS3-Xanadu](http://www.ats-lang.org/)/srcgen2

[comment]: # HX-2025-05-24: Let's document ATS3-Xanadu/srcgen2!

My original plan was first implementing in ATS2 a compiler from ATS3
to C and then using this compiler to bootstrap ATS3. Starting
somewhere in the summer of 2018, I was able to implement in ATS2 a
running compiler from ATS3 to JS by the end of 2020. Unfortunately, I
was still not able to obtain a running compiler from ATS3 to C after
spending the following year (2021), and I became quite anxious.

Around May of 2022, I decided to go forward with my plan of
bootstrapping ATS3: I should instead use the compiler from ATS3 to JS
to do it. While this compiler compiles quite slowly, I felt that it
should be adequate for the task of bootstrapping ATS3. After a long
struggle of nearly three years in length, I finally succeeded in
bootstrapping ATS3 on the 29th of March of 2025. This was a big
exciting moment for me, which is comparable to the moment when I
succeeded in bootstrapping ATS1 (ATS-Anairiats) in May of 2008, almost
17 years ago.

## The structure of ATS3-Xanadu/srcgen2

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

- SATS/lexbuf0.sats: For creating buffers of characters from text sources
- SATS/lexing0.sats: For tokenization, handling key words, error-reporting, etc.

### Parsing

### Fixity Resolution

### Binding Resolution

### Simple Type-Checking

### Template Resolution
