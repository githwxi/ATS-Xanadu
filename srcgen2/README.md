# [ATS3-Xanadu](http://www.ats-lang.org/)/srcgen2

[comment]: # HX-2025-05-24: Let's document ATS3-Xanadu/srcgen2!

My original plan was first implementing in ATS2 a compiler from ATS3
to C and then using this compiler to bootstrap ATS3. Starting
somewhere in the middle of 2018, I was able to implement in ATS2 a
running compiler from ATS3 to JS by the end of 2020. Unfortunately, I
was still not able to obtain a running compiler from ATS3 to C after
spending the following year (2021), and I became quite anxious.

Around May 2022, I decided to go forward with my plan of bootstrapping
ATS3: I should instead use the compiler from ATS3 to JS to do
it. While this compiler compiles quite slowly, I felt that it should
be adequate for the task of bootstrapping ATS3. After a long struggle
of nearly three years in length, I finally succeeded in bootstrapping
ATS3 on the 29th of March of 2025. This was a big exciting moment for
me, which is comparable to the moment when I succeeded in
bootstrapping ATS1 (ATS-Anairiats) in May of 2008, almost 17 years ago!
