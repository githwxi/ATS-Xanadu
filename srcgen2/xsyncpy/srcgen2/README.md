# XSYNCPY/srcgen2

Type-checking for linearly dependent types (LDTK) is planned to be
implemented here. But it will probably wait for some time.  The
priority for now is to obtain a compiler from ATS3 to CC (i.e., C/C++)
ready to work.

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
