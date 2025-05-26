# [ATS3-Xanadu](http://www.ats-lang.org/)/srcgen1

[comment]: # HX-2025-05-24: Let's document ATS3-Xanadu/srcgen1!

I probably started to think about designing and implementing ATS3, the
third edition of ATS, in the middle of 2016. By April of 2018, I finally
made up my mind to go ahead with the project ATS3/Xanadu.

ATS3-Xanadu/srcgen1 is the first implementation of ATS3, and
therefore, this implementation cannot be done in ATS3 itself. Instead,
the implementation language for ATS3-Xanadu/srcgen1 is ATS2
(ATS2/Postiats). ATS3 advocates a programming paradigm that heavily
rely on the use of (function) templates to support code sharing and
code reuse. Fortunately, ATS2 already supports a limited form of
function templates, providing a great opportunity for experimenting
with so-called template-based programming in ATS3-Xanadu/srcgen1.

<!--
########################################################################
-->