(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
ERR = "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
FP0 = "./../SATS/filpath.sats"
//
  typedef
  fpath_t = $FP0.filpath
  macdef
  dirbase =
  $FP0.filpath_dirbase
  macdef
  fpath_make = $FP0.filpath_make
//
#staload
FS0 = "./../SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/parsing.sats"
//
#staload "./../SATS/synread.sats"
//
#staload "./../SATS/trans01.sats"
//
#staload "./../SATS/trans12.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
  "./../DATS/staexp0_print.dats"
#staload
_(*TMP*) =
  "./../DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
  "./../DATS/staexp1_print.dats"
#staload
_(*TMP*) =
  "./../DATS/dynexp1_print.dats"
//
#staload
_(*TMP*) =
  "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) =
  "./../DATS/dynexp2_print.dats"
//
#staload
_(*TMP*) =
  "./../DATS/dynexp3_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
  "./../DATS/trans12_envmap.dats"
//
(* ****** ****** *)
//
#staload
STDIO = "libats/libc/SATS/stdio.sats"
//
(* ****** ****** *)
//
local
//
#include
"./../../xutl/DATS/cblist.dats"
#include
"./../../xutl/DATS/Posix/cblist.dats"
//
#include
"./../../xutl/DATS/Posix/mylibc.dats"
//
in
  // nothing
end // end of [local]
//
(* ****** ****** *)
//
#dynload "./basics.dats"
//
#dynload "./stamp0.dats"
//
#dynload "./symbol.dats"
#dynload "./symmap.dats"
#dynload "./symenv.dats"
//
#dynload "./label0.dats"
//
#dynload "./fixity.dats"
//
#dynload "./xerrory.dats"
//
#dynload "./filpath.dats"
#dynload "./filsrch.dats"
//
#dynload "./locinfo.dats"
//
// HX-2018-10:
// The following
// order is significant!
#dynload "./lexbuf.dats"
#dynload "./lexing_token.dats"
#dynload "./lexing_kword.dats"
#dynload "./lexing_util0.dats"
//
#dynload "./staexp0.dats"
#dynload "./dynexp0.dats"
#dynload "./staexp0_print.dats"
#dynload "./dynexp0_print.dats"
//
#dynload "./parsing_basics.dats"
//
#dynload "./parsing_tokbuf.dats"
//
#dynload "./parsing_staexp.dats"
#dynload "./parsing_dynexp.dats"
//
#dynload "./synread_basics.dats"
#dynload "./synread_staexp.dats"
#dynload "./synread_dynexp.dats"
//
#dynload "./staexp1.dats"
#dynload "./dynexp1.dats"
#dynload "./staexp1_print.dats"
#dynload "./dynexp1_print.dats"
//
#dynload "./trans01_basics.dats"
#dynload "./trans01_envmap.dats"
#dynload "./trans01_staexp.dats"
#dynload "./trans01_dynexp.dats"
//
#dynload "./effect.dats"
//
#dynload "./staexp2.dats"
#dynload "./dynexp2.dats"
//
#dynload "./staexp2_init0.dats"
//
#dynload "./staexp2_util1.dats"
#dynload "./staexp2_util2.dats"
//
#dynload "./staexp2_print.dats"
#dynload "./dynexp2_print.dats"
//
#dynload "./nmspace.dats"
//
#dynload "./trans12_basics.dats"
#dynload "./trans12_envmap.dats"
#dynload "./trans12_staexp.dats"
#dynload "./trans12_dynexp.dats"
//
#dynload "./dynexp3.dats"
//
#dynload "./dynexp3_print.dats"
//
(* ****** ****** *)
//
datatype
commarg =
| COMMARG of (int, string)
//
typedef
commarglst
  (n:int) = list(commarg, n)
//
(* ****** ****** *)
//
extern
fun
parse_commarg
( string
) :<> commarg
and
parse_commarglst
  {n:nat}
( argc: int(n)
, argv: !argv(n)
) :<!wrt> commarglst(n)
//
(* ****** ****** *)

implement
parse_commarg
  (inp) = let
//
fun
loop
{n,i:nat|i <= n} .<n-i>.
(
  inp: string n, n: int n, i: int i
) :<> commarg = 
(
if
(i < n)
then (
if (inp[i] != '-')
  then COMMARG(i, inp) else loop(inp, n, i+1)
) else COMMARG(n, inp)
// end of [if]
) (* end of [if] *)  
// end of [loop]
//
in
//
if
(inp = "-")
then
(
COMMARG(0, inp)
)
else
(
  loop(inp, sz2i(len), 0)
) where
{
  val inp = g1ofg0(inp); val len = string_length(inp)
}
//
end // end of [parse_commarg]
//
(* ****** ****** *)

implement
parse_commarglst
  {n}(argc, argv) = let
//
vtypedef
arglst(n:int) = list_vt(commarg, n)
//
fun
loop
{i:nat | i <= n}{l:addr} .<n-i>.
( pf0: arglst(0) @ l
| argv: !argv(n), i: int i, p0: ptr l
) :<!wrt> (arglst(n-i) @ l | void) =
(
//
if
i < argc
then let
  val+~list_vt_nil() = !p0
  val x = parse_commarg(argv[i])
  val () =
  ( !p0 :=
    list_vt_cons(x, list_vt_nil())
  ) (* end of [val] *)
  val+@list_vt_cons(_, xs) = !p0
  val (pf | ()) =
    loop (view@xs | argv, i+1, addr@xs) // tail-call
  // end of [val]
in
  fold@(!p0); (pf0 | ())
end // end of [then]
else (pf0 | ()) // end of [else]
//
) (* end of [loop] *)
//
in
//
list_vt2t
(
res where
{
var res: ptr?
//
val () =
res := list_vt_nil{commarg}()
val
(pf | ()) =
loop
(view@res | argv, 0, addr@res)
// end of [val]
prval ((*void*)) = view@res := pf
//
}
) (* end of [list_vt2t] *)
//
end // end of [parse_commarglst]

(* ****** ****** *)
//
extern
fun
print_commarg(commarg): void
extern
fun
prerr_commarg(commarg): void
extern
fun
fprint_commarg
(out: FILEref, x0: commarg): void
//
(* ****** ****** *)
//
implement
print_commarg(x0) =
fprint_commarg(stdout_ref, x0)
implement
prerr_commarg(x0) =
fprint_commarg(stderr_ref, x0)
implement
fprint_commarg(out, x0) =
(
case+ x0 of
| COMMARG(i, k) =>
  fprint!(out, "COMMARG(", i, ", ", k, ")")
) (* end of [fprint_commarg] *)
//
(* ****** ****** *)
//
extern
fun
xatsopt_usage
( out: FILEref
, arg0: commarg): void
implement
xatsopt_usage
  (out, arg0) = let
//
val+COMMARG(_, cmdname) = arg0
//
in
//
fprintln!
(out, "Usage: ", cmdname, " <command> ... <command>\n");
fprintln!
(out, "where a <command> is of one of the following forms:\n");
//
fprintln! (out, "  -h (for printing out this help usage)");
fprintln! (out, "  --help (for printing out this help usage)");
//
fprintln! (out, "  -v (for printing out the version)");
fprintln! (out, "  --version (for printing out the version)");
//
fprintln! (out, "  -s <filenames> (for compiling static filenames individually)");
fprintln! (out, "  --static <filenames> (for compiling static filenames individually)");
//
fprintln! (out, "  -d <filenames> (for compiling dynamic filenames individually)");
fprintln! (out, "  --dynamic <filenames> (for compiling dynamic filenames individually)");
//
fprintln! (out, "  -dd <filenames> (for compiling dynamic filenames in a combined manner)");
fprintln! (out, "  --dynamics <filenames> (for compiling dynamic filenames in a combined manner)");
//
fprintln! (out, "  -o <filename> (output into filename)");
fprintln! (out, "  --output <filename> (output into filename)");
fprintln! (out, "  --output-w <filename> (output-write into filename)");
fprintln! (out, "  --output-a <filename> (output-append into filename)");
//
(*
fprintln! (out, "  -cc (for compiling into C)");
fprintln! (out, "  --compile (for compiling into C)");
*)
//
(*
fprintln! (out, "  -tc (for typechecking only)");
fprintln! (out, "  --typecheck (for typechecking only)");
*)
//
fprint_newline (out); // HX: needed for flushing out the output
//
end // end of [xatsopt_usage]
//
(* ****** ****** *)
//
extern
fun
xatsopt_version
  (out: FILEref): void
implement
xatsopt_version
  (out) = let
  val MAJOR = 0
  val MINOR = 0
  val MICRO = 0
in
  fprint!(out, "ATS/Xanadu version ");
  fprint!(out, MAJOR, ".", MINOR, ".", MICRO);
  fprintln!(out, " Copyright (c) 2018-20?? Hongwei Xi")
end // end of [xatsopt_version]
//
(* ****** ****** *)
//
extern
fun
the_fixity_load
(
XATSHOME: string
) : void =
  "ext#libxatsopt_the_fixity_load"
extern
fun
the_basics_load
(
XATSHOME: string
,
stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_basics_load"
//
extern
fun
the_prelude_load
(
XATSHOME: string
,
stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_prelude_load"
//
extern
fun
the_preludes_load
(
  XATSHOME: string
) : void =
  "ext#libxatsopt_the_preludes_load"
extern
fun
the_preludes_load_if
(
  XATSHOME: string, flag: &int
) : void =
  "ext#libxatsopt_the_preludes_load_if"
//
(* ****** ****** *)
//
extern
fun
xatsopt_main0
{n:int | n >= 1}
(int(n), !argv(n)): void
//
(* ****** ****** *)
//
datatype
waitknd =
  | WTKnone of ()
  | WTKoutput of () // -o ...
  | WTKinpsta of () // -s ...
  | WTKinpdyn of () // -d ...
(*
  | WTKinpdyns of () // -dd ...
*)
  | WTKdefine of () // -DATS ...
  | WTKinclude of () // -IATS ...
// end of [waitkind]
//
fun
waitknd_get_stadyn
(knd: waitknd): int =
(
case+ knd of
| WTKinpsta() => 0
| WTKinpdyn() => 1
(*
| WTKinpdyns() => 2
*)
| _ (*rest-of-WTK*) => ~1
) // end of [waitkind_get_stadyn]
//
(* ****** ****** *)
//
datatype
outchan =
| OUTCHANref of (FILEref)
| OUTCHANptr of (FILEref)
// end of [outchan]

fun
outchan_get_filref
  (x0: outchan): FILEref =
(
case+ x0 of
| OUTCHANref(filr) => filr
| OUTCHANptr(filr) => filr
) (* end of [outchan_get_filref] *)
//
(* ****** ****** *)
//
typedef
cmdstate = @{
//
arg0= commarg
,
wtk0= waitknd
,
ATSHOME= string
,
prelude= int
,
inpfil0=fpath_t
,
// the number of inputs
ninpfil= int // processed
//
, outmode= fmode
, outchan= outchan
//
// the number of caught
, nxerror= int // errors
//
} (* end of [cmdstate] *)
//
(* ****** ****** *)
//
fun
isinpwait
(
  st0: cmdstate
) : bool =
(
case+
st0.wtk0
of // case+
 | WTKinpsta() => true
 | WTKinpdyn() => true
(*
 | WTKinpdyns() => true
*)
 | _ (*non-WTKinput*) => false
) // end of [isinpwait]

fun
isoutwait
  (st0: cmdstate): bool =
(
case+
st0.wtk0 of
| WTKoutput() => true
| _(*non-WTKoutput*) => false
) (* end of [isoutwait] *)

fun
isdatswait
  (st0: cmdstate): bool =
(
case+
st0.wtk0 of
| WTKdefine() => true
| _(*non-WTKdefine*) => false
) (* end of [isdatswait] *)

fun
isiatswait
  (st0: cmdstate): bool =
(
case+
st0.wtk0 of
| WTKinclude() => true
| _(*non-WTKinclude*) => false
) (* end of [isiatswait] *)
//
(* ****** ****** *)

local

extern
praxi
vbox_make_view_ptr
{a:vt0ype}{l:addr}
// statically allocated reference
(a @ l | ptr(l)):<> vbox(a @ l)

var
theOutFname: Stropt = stropt_none()
//
prval pf0 =
vbox_make_view_ptr
{Stropt}{..}
(view@theOutFname | addr@theOutFname)
// end of [val]

in (* in-of-local *)

fun
theOutFname_get
(
// argless
) : Stropt = out where
{
//
prval vbox(pf) = pf0
//
  val out = theOutFname
//
  val ((*void*)) =
  theOutFname := stropt_none()
//
} // end of [theOutFname_get]

fun
theOutFname_set
 (fname: Stropt) = () where
{
//
prval vbox(pf) = pf0
//
  val () = theOutFname := fname
//
} // end of [theOutFname_set]

end // end of [local]

(* ****** ****** *)

fun
cmdstate_set_outchan
(
st0: &cmdstate >> _, out1: outchan
) : void = let
  val out0 = st0.outchan
  val ((*void*)) = st0.outchan := out1
in
//
case+ out0 of
| OUTCHANref _ => ()
| OUTCHANptr(filr) => let
    val err = $STDIO.fclose0(filr) in (*nothing*)
  end // end of [OUTCHANptr]
//
end // end of [cmdstate_set_outchan]

(* ****** ****** *)
//
extern
fun
outchan_make_fname
( st0
: &cmdstate, fname: string
) : outchan // end-of-fun
implement
outchan_make_fname
  (st0, fname) =
(
case+ fname of
| "-" => OUTCHANref(stdout_ref)
//
| _(*unspecial*) => auxmain(st0, fname)
//
) where
{
fun
auxmain
( st0
: &cmdstate, fname: string
) : outchan = let
//
val
filp =
$STDIO.fopen(fname, st0.outmode)
//
in
//
if
$STDIO.iseqz(filp)
then
(
  OUTCHANref(stderr_ref)
) where
{
prval () =
$STDIO.FILEptr_free_null(filp)
} (* end of [then] *)
else
(
  OUTCHANptr
  ($UN.castvwtp0{FILEref}(filp))
) (* end of [else] *)
//
end // end of [auxmain]
//
} (* end of [outchan_make_path] *)

(* ****** ****** *)
//
extern
fun
xatsopt_commarg_warning
  (out: FILEref, arg: string): void
implement
xatsopt_commarg_warning
  (out, arg) = () where
{
//
val () =
fprint(out, "WARNING(ATS)")
val () =
fprintln!
( out
, ": unrecognized command-line argument [", arg, "] is ignored."
) (* end of [val] *)
//
} (* end of [xatsopt_commarg_warning] *)
//
(* ****** ****** *)

local
//
static
fun
process_nil
(st0: &cmdstate >> _): void
static
fun
process_given
( st0
: &cmdstate >> _, given: string): void
//
static
fun
process_cmdline
  {n:nat}
( st0: &cmdstate >> _
, args: commarglst(n)): void
and
process_cmdline2
  {n:nat}
( st0: &cmdstate >> _
, arg0: commarg, args: commarglst(n)): void
//
implement
process_nil
  (st0) = let
//
val
wtk0 = st0.wtk0
val
stadyn =
waitknd_get_stadyn(wtk0)
//
val
XATSHOME = st0.ATSHOME
//
val () =
$FP0.the_dirpathlst_ppush_cwd()
//
in
//
if
(
stadyn >= 0
) then
{
//
val () =
the_preludes_load_if
(XATSHOME, st0.prelude)
// end of [val]
//
val
fp0 =
$FP0.the_filpath_stdin 
val
(pf0 | ()) =
$FP0.the_filpathlst_push
  (fp0)
val
d0cs =
parse_from_stdin_toplevel
  (stadyn)
prval () = $UN.castview0{void}(pf0)
(*
val
((*popped*)) =
$FP0.the_filpathlst_pout(pf0 | (*none*))
*)
//
(*
val () =
println!
("process_nil: d0cs = ", d0cs)
*)
//
val () = synread_top(d0cs)
//
val
d1cs = trans01_declist(d0cs)
val () =
println!
("process_nil: d1cs = ", d1cs)
//
val
d2cs = trans12_declist(d1cs)
val () =
println!
("process_nil: d2cs = ", d2cs)
//
val () =
println!
("process_nil: the_sortenv =")
val () =
(
  the_sortenv_println((*void*))
)
//
val () =
println!
("process_nil: the_sexpenv =")
val () =
(
  the_sexpenv_println((*void*))
)
//
val () =
println!
("process_nil: the_dexpenv =")
val () =
(
  the_dexpenv_println((*void*))
)
//
} (* end of [if] *)
//
end // end of [process_nil]
//
implement
process_given
  (st0, arg0) = let
//
val () =
println!
("process_given: arg0 = ", arg0)
//
in
//
// HX-2018-10-08:
// IT-IS-YET-TO-BE-IMPLEMENTED!!!
//
end // end of [process_give]
//
implement
process_cmdline
  (st0, args) = let
in
//
case+ args of
//
| list_nil() =>
  (
    if
    st0.ninpfil = 0
    then process_nil(st0) else ()
  )
//
| list_cons
    (arg0, args) =>
  (
    process_cmdline2(st0, arg0, args)
  )
//
end // end of [process_cmdline]
//
implement
process_cmdline2
  (st0, arg0, args) = let
//
(*
val () =
println!
("process_cmdline2: arg0 = ", arg0)
*)
//
fun
auxkey1
( st0:
 &cmdstate >> _
, key: string): void = let
//
val () =
(st0.wtk0 := WTKnone())
//
val () =
(
case+ key of
//
| "-o" =>
  {
    val () =
    (st0.wtk0 := WTKoutput())
  } (* end of [-o] *)
| "-s" =>
  {
    val () =
    (st0.ninpfil := 0)
    val () =
    (st0.wtk0 := WTKinpsta())
  } (* end of [-s] *)
| "-d" =>
  {
    val () =
    (st0.ninpfil := 0)
    val () =
    (st0.wtk0 := WTKinpdyn())
  } (* end of [-d] *)
(*
| "-dd" =>
  {
    val () =
    (st0.ninpfil := 0)
    val () =
    (st0.waitknd := WTKinpdyns())
  } (* end of [-dd] *)
*)
//
(*
| "-cc" => (st0.tcflag := 0)
| "-tc" => (st0.tcflag := 1)
*)
//
(*
| "-dep" => (st0.depgen := 1)
| "-tag" => (st0.taggen := 1)
*)
//
(*
| _ when
    is_DATS_flag(key) => let
    val def = DATS_extract(key)
    val issome = stropt_is_some(def)
  in
    if
    issome
    then
    (
      process_DATS_def(def) where
      {
        val def = stropt_unsome(def)
      }
    )
    else let
      val () =
        (st0.wtk0 := WTKdefine(*void*))
      // end of [val]
    in
      // nothing
    end // end of [else] // end of [if]
  end // end of [is_DATS_flag]
*)
(*
| _ when
    is_IATS_flag(key) => let
    val path = IATS_extract(key)
    val issome = stropt_is_some(path)
  in
    if
    issome
    then
    (
      process_IATS_dir(path) where
      {
        val path = stropt_unsome(path)
      }
    )
    else let
      val () =
        (st0.wtk0 := WTKinclude(*void*))
      // end of [val]
    in
        // nothing
    end // end of [else] // end of [if]
  end // end of [is_IATS_flag]
*)
//
| "-h" =>
  (
    xatsopt_usage
      (stdout_ref, st0.arg0)
    // xatsopt_usage
  )
| "-v" =>
  (
    xatsopt_version(stdout_ref)
  )
//
| _ (*rest*) =>
  ( //
    // HX: unrecognized key
    //
    xatsopt_commarg_warning(stderr_ref, key)
  ) (* end of [rest] *)
//
) : void // end of [val]
//
in
  process_cmdline(st0, args)
end // end of [auxkey1]
//
fun
auxkey2
( st0:
 &cmdstate >> _
, key: string): void = let
//
val () =
  (st0.wtk0 := WTKnone())
//
val () =
(
case+ key of
//
| "--output" =>
  (
    st0.wtk0 := WTKoutput()
  )
| "--output-w" =>
  {
    val () = st0.wtk0 := WTKoutput()
    val () = st0.outmode := file_mode_w
  } // end of [--output-w]
| "--output-a" =>
  {
    val () = st0.wtk0 := WTKoutput()
    val () = st0.outmode := file_mode_a
  } // end of [--output-a]
//
| "--static" =>
  {
    val () = st0.wtk0 := WTKinpsta()
  } // end of [--static]
| "--dynamic" =>
  {
    val () = st0.wtk0 := WTKinpdyn()
  } // end of [--dynamic]
//
(*
| "--dynamics" =>
  {
    val () = st0.wtk0 := WTKinpdyns()
  } // end of [--dynamics]
*)
//
(*
| "--compile" => (st0.typecheckflag := 0)
| "--typecheck" => (st0.typecheckflag := 1)
*)
//
(*
| "--gline" =>
  {
    val () =
    $GLOB.the_DEBUGATS_dbgline_set(1)
  } // end of [--gline] // mostly for debugging
*)
//
(*
| "--debug1" =>
  {
    val () = debug_flag_set(1)
  } // end of [--debug] // more informative errmsgs
| "--debug2" => {
    val () = debug_flag_set(1)
    val () = $GLOB.the_DEBUGATS_dbgflag_set(1)
  } // end of [--debug2] // for generating debugging info
*)
//
(*
| "--depgen" => (st0.depgen := 1)
| "--taggen" => (st0.taggen := 1)
*)
//
(*
| "--codegen-2" =>
  {
    val () = st0.codegen2 := 2
  }
| "--jsonize-2" =>
  {
    val () = st0.jsonize2 := 2
  }
*)
//
(*
| "--no-tailcallopt" =>
  {
    val () =
    $GLOB.the_CCOMPATS_tailcallopt_set(0)
  }
*)
//
(*
| "--constraint-export" =>
  {
    val () = st0.constraint := 1
  }
| "--constraint-ignore" =>
  {
    val () = st0.constraint := ~1
  }
*)
//
| "--help" =>
  (
    xatsopt_usage
      (stdout_ref, st0.arg0)
    // xatsopt_usage
  )
| "--version" =>
  (
    xatsopt_version(stdout_ref)
  )
//
| _ (*rest-of-key2*) =>
  ( //
    // HX: unrecognized key
    //
    xatsopt_commarg_warning(stderr_ref, key)
  ) (* end of [rest-of-key2] *)
//
) : void // end of [val]
//
in
  process_cmdline(st0, args)
end // end of [auxkey2]
//
in
//
case+ arg0 of
| _ when
    isinpwait(st0) => let
    val
    stadyn =
    waitknd_get_stadyn(st0.wtk0)
    val nif = st0.ninpfil
  in
    case+ arg0 of
//
    | COMMARG(1, key)
        when nif > 0 =>
      (
        auxkey1(st0, key)
      )
    | COMMARG(2, key)
        when nif > 0 =>
      (
        auxkey2(st0, key)
      )
//
    | COMMARG(_, "-") =>
      (
      process_cmdline(st0, args)
      ) where
      {
        val () =
        (st0.ninpfil := nif+1)
        val () = process_nil(st0)
      } (* end of [COMMARG(_,-)] *)
//
    | COMMARG(_, given) =>
      (
      process_cmdline(st0, args)
      ) where
      {
        val () =
        (st0.ninpfil := nif+1)
        val () =
        (
          process_given(st0, given)
        )
      } (* end of [COMMARG(_,_)] *)
  end // end of [isinpwait]
//
| _ when
    isoutwait(st0) => let
    val () =
    st0.wtk0 := WTKnone()
//
    val+COMMARG(_, given) = arg0
//
    val ((*void*)) =
    (
      theOutFname_set(opt)
    ) where
    {
      val opt = stropt_some(given)
    }
//
    val _new_ =
    outchan_make_fname(st0, given)
    val ((*void*)) =
    cmdstate_set_outchan(st0, _new_)
//
  in
    process_cmdline(st0, args)
  end // end of [_ when isoutwait]
//
| COMMARG(1, key) => auxkey1(st0, key)
| COMMARG(2, key) => auxkey2(st0, key)
//
| COMMARG(_, key) =>
  (
    process_cmdline(st0, args)
  ) where
  {
    val () =
    st0.wtk0 := WTKnone()
    val () =
    xatsopt_commarg_warning(stderr_ref, key)
  } (* end of [COMMARG] *)
//
end // end of [process_cmdline2]
//
in (* in-of-local *)

implement
xatsopt_main0
  (argc, argv) = let
//
val
XATSHOME =
"/home/hwxi/Research/ATS-Xanadu"
//
val () = 
$FP0.the_includes_push(XATSHOME)
//
val+
list_cons
(arg0, args) = args where
{
  val
  args =
  parse_commarglst(argc, argv)
} (* end of [val] *)
//
var
st0: cmdstate =
@{
  arg0= arg0
, wtk0= WTKnone()
//
, ATSHOME= XATSHOME
//
, prelude= 0(*~loaded*)
//
, inpfil0=
  $FP0.the_filpath_dummy
//
, ninpfil= 0(*initset*)
//
// load status of prelude files
//
, outmode= file_mode_w
, outchan= OUTCHANref(stdout_ref)
//
, nxerror= 0(*initset*)
//
} (* end of [var] *)
//
val () =
process_cmdline(st0, args)
//
in
//
if (st0.nxerror > 0) then $ERR.abort()
//
end // end of [xatsopt_main0]

end // end of [local]

(* ****** ****** *)
//
#ifndef
XATSOPT_MAIN_NONE
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then xatsopt_main0(argc, argv)
else prerrln! ("Hello from ATS3(ATS/Xanadu)!")
// end of [if]
) (* end of [main] *)
//
#endif // ifndef(XATSOPT_MAIN_NONE)
//
(* ****** ****** *)
//
implement
the_fixity_load
  (XATSHOME) = let
//
  val given =
    "prelude/fixity.sats"
//
  val fname =
    dirbase(XATSHOME, given)
  val fpath =
    fpath_make(given, fname)  
//
  val
  (pf0 | ()) =
  $FP0.the_filpathlst_push(fpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt(fname, file_mode_r)
  in
    case+ opt of
    | ~None_vt() => list_nil()
    | ~Some_vt(filr) => d0cs where
      {
        val d0cs =
        parse_from_fileref_toplevel
        (
          0(*static*), filr(*input*)
        )
        val ((*void*)) = fileref_close(filr)
      }
   end : d0eclist // end of [val]
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf0 | (*none*))
//
  val
  (pf0 | ()) =
  the_fxtyenv_push((*void*))
  val d1cs = trans01_declist(d0cs)
  val map =
  the_fxtyenv_pout(pf0 | (*none*))
//
  val ((*joined*)) = the_fxtyenv_pjoinwth0(map)
//
// (*
  val () = println! "the_fxtyenv = "
  val () = the_fxtyenv_println((*void*))
  val () = println! "[the_fixity_load] is finished."
// *)
//
in
  // empty
end // end of [the_fixity_load]

(* ****** ****** *)
//
implement
the_basics_load
(XATSHOME, stadyn, given) = let
//
  val
  d1cs = trans01_declist(d0cs)
//
  val
  (pf0|()) =
  the_trans12_pushnil((*void*))
  val d2cs = trans12_declist(d1cs)
  val
  ((*joined*)) =
  the_trans12_pjoinwth0(pf0 | (*void*))
//
in (* nothing *) end where
{
//
val () =
println!
("the_basics_load: ", given)
//
  val fname =
    dirbase(XATSHOME, given)
  val fpath =
    fpath_make(given, fname)  
//
  val
  (pf0 | ()) =
  $FP0.the_filpathlst_push(fpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt(fname, file_mode_r)
  in
    case+ opt of
    | ~None_vt() =>
       list_nil(*void*)
    | ~Some_vt(filr) =>
      (
        fileref_close(filr); d0cs
      ) where
      {
        val
        d0cs =
        parse_from_fileref_toplevel(stadyn, filr)
      } (* end of [Some_vt] *)
   end : d0eclist // end-of-let
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf0 | (*none*))
//
} (* the_basics_load *)
//
(* ****** ****** *)
//
implement
the_prelude_load
(XATSHOME, stadyn, given) = let
//
  val
  d1cs = trans01_declist(d0cs)
//
  val
  (pf0|()) =
  the_trans12_pushnil((*void*))
  val d2cs = trans12_declist(d1cs)
  val
  ((*joined*)) =
  the_trans12_pjoinwth1(pf0 | fpath, d2cs)
//
in (* nothing *) end where
{
//
val () =
println!
("the_prelude_load: ", given)
//
  val fname =
    dirbase(XATSHOME, given)
  val fpath =
    fpath_make(given, fname)  
//
  val
  (pf0 | ()) =
  $FP0.the_filpathlst_push(fpath)
//
  val d0cs = let
    val
    opt =
    fileref_open_opt(fname, file_mode_r)
  in
    case+ opt of
    | ~None_vt() =>
       list_nil(*void*)
    | ~Some_vt(filr) =>
      (
        fileref_close(filr); d0cs
      ) where
      {
        val
        d0cs =
        parse_from_fileref_toplevel(stadyn, filr)
      } (* end of [Some_vt] *)
   end : d0eclist // end-of-let
//
  val
  ((*popped*)) =
  $FP0.the_filpathlst_pout(pf0 | (*none*))
//
} (* the_prelude_load *)
//
(* ****** ****** *)

implement
the_preludes_load
  (XATSHOME) =
{
//
val () =
the_fixity_load
  (XATSHOME)
//
val () =
the_basics_load
( XATSHOME
, 0(*static*)
, "prelude/basics.sats")
//
val () =
the_prelude_load
( XATSHOME
, 0(*static*), "prelude/SATS/gint.sats")
val () =
the_prelude_load
( XATSHOME
, 0(*static*), "prelude/SATS/list.sats")
//
(*
val () =
println! "[the_preludes_load] is finished."
*)
//
} (* end of [the_preludes_load] *)

(* ****** ****** *)
//
implement
the_preludes_load_if
  (XATSHOME, flag) =
(
//
if
(flag = 0)
then let
  val () =
  (flag := flag + 1) in the_preludes_load(XATSHOME)
end // end of [then]
//
) (* end of [the_preludes_load_if] *)

(* ****** ****** *)

(* end of [xatsopt.dats] *)
