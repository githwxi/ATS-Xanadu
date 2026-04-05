# XSYNCPY/srcgen2

<!--
Type-checking for linearly dependent types (LDTK) is to be
implemented here.
-->

The name *XSYNCPY* refers to the act of copying abstract syntax
trees. The purpose of copying is to ensure that no changes are made
to the output of XATSOPT (which is a level-3 abstract syntax tree).
And trxltck (linear type-checking) is performed on the copy returned
by trx3cpy.

XSYNCPY only applies the level-3 syntax obtained BEFORE template
resolution is performed. Technically, D3Etimp and D3Etimq are not
handled (as they only occur after template resolution).

The style of implementation of type-checking here adopts what we call
"feature-based" modularization. Note that type-checking performed in
XATSOPT is *forgetful*; it is here that both linearity-checking and
dependency-checking are performed.
