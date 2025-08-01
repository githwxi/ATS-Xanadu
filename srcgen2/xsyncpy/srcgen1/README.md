# XSYNCPY/srcgen1

[comment]: # HX-2025-08-01: Let's document!

The name *XSYNCPY* refers to the act of copying abstract syntax
trees. The purpose of copying is to ensure that no changes are made
to the output of XATSOPT (which is a level-3 abstract syntax tree).
And trxltck (linear type-checking) is performed on the copy returned
by trx3cpy.
