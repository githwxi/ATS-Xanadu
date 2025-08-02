# XSYNCPY

[comment]: # HX-2025-05-18: Let's start syntax-copying!

XSYNCPY makes copies of many kinds of abstract syntax trees used
in XATSOPT. In this way, various features of ATS3 that were not
present for the development of XATSOPT in the first few years can
be readily employed for its future development.  If we had to
frequently alter the abstract syntax trees used in XATSOPT directly,
it would run a very high risk of messing up the current implementation
of XATSOPT.  This is a fear that one often does not see clearly until
one's codebase becomes large and complex. So many software projects
have collapsed under their own complexity for the need of further
development!
