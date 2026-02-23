# XSYNCPY/srcgen1

[comment]: # HX-2025-08-01: Let's document!

The name *XSYNCPY* refers to the act of copying abstract syntax
trees. The purpose of copying is to ensure that no changes are made
to the output of XATSOPT (which is a level-3 abstract syntax tree).
And trxltck (linear type-checking) is performed on the copy returned
by trx3cpy.

The style of implementation of type-checking here adopts what we
call "feature-based" modularization. Note that type-checking performed
in XATSOPT is *forgetful* in the sense that it completely *ignores* the
issue of linearity, and it is here that linearity-checking is performed.

[comment]: # HX-2026-02-22: Compiling to C!

I have just started the phase of compiling to C in the development of
ATS3. Compared to compiling to JS, compiling to C additionally
requires handling of types (for data) and closure formation (for
functions).
