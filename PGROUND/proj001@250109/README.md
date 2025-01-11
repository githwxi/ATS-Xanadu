# How to program a project in ATS3?

## Build Status

(For CI testing)

## Project Description

(What is this project about?)

## The Standard Project Setup

Of course, you can set up your project in whatever way you
like. However, I suggest that you follow the convention outlined
below. By doing so, you can make it a great deal easier for other
people to access the implementation of your project.

Let ROOT be the root directory of some project PROJ.  We first create
a directory ROOT/srcgen1 for containing the source code of PROJ, and
then create a link ROOT/srcgenx to ROOT/srcgen1.  Later, we may want
to do another implementation of PROJ; we create a directory
ROOT/srcgen2 for containing the source code of this new
implementation. When we have more than one implementations of PROJ, we
can set the link ROOT/srcgenx to the directory containing the default
implementation.
