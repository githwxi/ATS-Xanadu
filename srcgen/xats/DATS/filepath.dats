(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
#staload
SYM = "./../SATS/symbol.sats"
  typedef symbol = $SYM.symbol
//
(* ****** ****** *)

#staload "./../SATS/filepath.sats"

(* ****** ****** *)

local

absimpl
filepath_type = $rec
{
  filepath_kind= int
, filepath_givename= string
, filepath_partpath= string
, filepath_fullpath= symbol
} (* end of [filepath_type] *)

in (* nothing *) end // end-of-local

(* ****** ****** *)
//
implement
filepath_get_full(fp) =
  fp.filepath_fullpath
  where { absreimpl filepath_type }
//
(* ****** ****** *)

local
//
#include
"./../sysparams.hats"
//
#if SYSTEM_IS_UNIX_LIKE #then
//
val theDirSep: char = '/'
val theCurDir: string = "./"
val theParDir: string = "../"
//
#endif

in (* in of [local] *)

implement theDirSep_get() = theDirSep
implement theCurDir_get() = theCurDir
implement theParDir_get() = theParDir

end // end of [local]

(* ****** ****** *)
//
implement
eq_filepath_filepath
  (x, y) = (compare(x, y) = 0)
implement
neq_filepath_filepath
  (x, y) = (compare(x, y) != 0)
//
(* ****** ****** *)

implement
compare_filepath_filepath
  (x1, x2) = let
//
val f1 =
$SYM.symbol_get_name(x1.full())
//
val f2 =
$SYM.symbol_get_name(x2.full())
//
in
  compare_string_string(f1, f2)
end // end of [compare_filepath_filepath]

(* ****** ****** *)

local

absreimpl filepath_type

in (* in-of-local *)

implement
the_filepath_dummy = $rec{
  filepath_kind= 0
, filepath_givename= ""
, filepath_partpath= ""
, filepath_fullpath= $SYM.symbol_nil
} // end of [the_filepath_dummy]

implement
the_filepath_stdin = $rec{
  filepath_kind= 0
, filepath_givename= "__STDIN__"
, filepath_partpath= "__STDIN__"
, filepath_fullpath= $SYM.symbol__STDIN__
} // end of [the_filepath_stdin]

implement
the_filepath_string = $rec{
  filepath_kind= 0
, filepath_givename= "__STRING__"
, filepath_partpath= "__STRING__"
, filepath_fullpath= $SYM.symbol__STRING__
} // end of [the_filepath_string]

end // end of [local]

(* ****** ****** *)

local

val
the_filepath =
ref<filepath>(the_filepath_dummy)

in (* in-of-local *)

implement
filepath_get_current((*void*)) = the_filepath[]

end // end of [local]

(* ****** ****** *)

(* end of [xats_filepath.dats] *)
