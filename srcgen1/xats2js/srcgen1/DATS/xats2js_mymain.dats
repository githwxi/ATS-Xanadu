(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
HX: Implementation in ATS2
Sun Nov 12 12:16:50 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
%{^
//
extern
void
libxatsopt_dynloadall();
//
%} (* %{^ *)
val () =
$extfcall
(void, "libxatsopt_dynloadall")
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN="prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
#staload $XATSOPT(*open-it*)
//
(* ****** ****** *)
//
#staload
STDIO =
"libats/libc/SATS/stdio.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/js1comp.sats"
//
#staload "./../SATS/js1emit.sats"
//
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
implement
the_XATSHOME_get() =
$GLO.the_XATSHOME_get((*void*))
(* ****** ****** *)
//
#staload
_(*TMP*) = "./intrep1_print0.dats"
#staload
_(*TMP*) = "./js1emit_dynexp.dats"
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
( pf0
: arglst(0)@l
| argv: !argv(n)
, i0: int i, p0: ptr l
) :<!wrt> (arglst(n-i) @ l | void) =
(
//
if
i0 < argc
then
(
fold@(!p0); (pf0 | res)
) where
{
  val+ ~
  list_vt_nil() = !p0
  val x0 =
  parse_commarg(argv[i0])
  val () =
  ( !p0 :=
    list_vt_cons
    (x0, list_vt_nil((*void*)))
  ) (* end of [val] *)
  val+@list_vt_cons(_, xs) = !p0
  val
  (pf1 | res) =
  loop // tail-call
  (view@xs | argv, i0+1, addr@xs)
  // end of [val]
} else (pf0 | ((*void*))) // end of [else]
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
res :=
list_vt_nil{commarg}()
val
(pf | ()) =
loop
( view@res
| argv, 0(*i0*), addr@res)
// end of [val]
prval ((*void*)) = (view@res := pf)
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
|
COMMARG(i, k) =>
fprint!
(out, "COMMARG(", i, ", ", k, ")")
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
fprintln! (out, "  -s <filenames> (for compiling static filenames)");
fprintln! (out, "  --static <filenames> (for compiling static filenames)");
//
fprintln! (out, "  -d <filenames> (for compiling dynamic filenames)");
fprintln! (out, "  --dynamic <filenames> (for compiling dynamic filenames)");
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
fprintln! (out, "  --tycheck (for typechecking only)");
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
the_fixity_load
(
XATSENV: string
) : void =
  "ext#libxatsopt_the_fixity_load"
extern
fun
the_basics_load
(
XATSENV: string
,
stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_basics_load"
//
extern
fun
the_prelude_load
(
XATSENV: string
,
stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_prelude_load"
//
extern
fun
the_preludes_load
(
 XATSENV: string
) : void =
  "ext#libxatsopt_the_preludes_load"
//
(* ****** ****** *)

fun
the_preludes_load_if
( XHOME
: string, flag: &(int)) : void =
(
//
if
(flag = 0)
then
{
val () =
(flag := flag + 1)
val () =
the_preludes_load(XHOME)
//
(*
HX-2020-03-08:
The runtime for primitive functions
*)
//
(*
//
// HX-2020-10-31:
// This should be loaded last!
//
val () =
the_prelude_load
( XHOME
, 1(*dynamic*)
, "prelude/DATS/CATS/JS/basics.dats")
*)
//
} (* end of [then] *) // end-of-if
) (* end of [the_preludes_load_if] *)

(* ****** ****** *)
typedef
filpath = $FP0.filpath
(* ****** ****** *)
datatype
waitknd =
| WTKnone of ()
| WTKoutput of () // -o ...
| WTKinpsta of () // -s ...
| WTKinpdyn of () // -d ...
| WTKdefine of () // -DATS ...
| WTKinpath of () // -IATS ...
// end of [waitkind]
(* ****** ****** *)
datatype
outchan =
// no-closing
| OUTCHANref of (FILEref)
 // to-be-closed
| OUTCHANptr of (FILEref)
// end of [outchan]
(* ****** ****** *)
//
fun
waitknd_get_stadyn
(knd: waitknd): int =
(
case+ knd of
| WTKinpsta() => 0
| WTKinpdyn() => 1
| _ (*rest-of-WTK*) => ~1
) // end of [waitkind_get_stadyn]
//
(* ****** ****** *)
//
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
, wtk0= waitknd
, XATSENV= string
, prelude= int
, inpfil0= filpath
(*
the number of processed
*)
, ninpfil= int // inputs
//
, outmode= fmode
, outchan= outchan
//
(*
// the number of caught
*)
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
| WTKinpath() => true
| _(*non-WTKinpath*) => false
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
( st0:
& cmdstate >> _, out1: outchan
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
( st0:
& cmdstate
, fname: string
) : outchan // end-of-fun
implement
outchan_make_fname
  (st0, fname) =
(
ifcase
|
("_" = fname) =>
OUTCHANref(stdout_ref)
| _(* else *) =>
(
  auxmain(st0, fname)
)
//
) where
{
fun
auxmain
( st0:
& cmdstate
, fname: string
) : outchan = let
//
val
filp =
$STDIO.fopen
(fname, st0.outmode)
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
  ( out
  : FILEref
  , arg: string): void
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
, ": unrecognized command-line argument [", arg, "] is skipped."
) (* end of [val] *)
//
} (* end of [xatsopt_commarg_warning] *)
//
(* ****** ****** *)

local
//
static
fun
process_stdin
(st0: &cmdstate >> _): void
static
fun
process_fpath
( st0:
& cmdstate >> _, fp0: filpath): void
static
fun
process_given
( st0:
& cmdstate >> _, given: string): void
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
process_stdin
  (st0) =
(
process_fpath(st0, fp0)
) where
{
  val
  fp0 = $FP0.the_filpath_stdin
}
implement
process_fpath
  (st0, fp0) = let
//
//
val
wtk0 = st0.wtk0
val
stadyn =
waitknd_get_stadyn(wtk0)
//
val XATSENV = st0.XATSENV
//
val () =
ifcase
|
$FP0.filpath_is_stdin(fp0) =>
$FP0.the_dirpathlst_ppush_cwd()
| _ (* regular filename *) =>
let
val
dp0 =
$FP0.dirpath_make
($FP0.filpath_get_dirname(fp0))
(*
val () =
let
val out = stdout_ref
in
fprint(out, "dirpath = ");
$FP0.fprintln_dirpath(out, dp0)
end
*)
in
  $FP0.the_filpathlst_ppush(fp0);
  $FP0.the_dirpathlst_ppush(dp0);
end (* let *) // end of [ifcase]
//
in
//
if
(
stadyn >= 0
)
then
{
//
val () =
the_preludes_load_if
(XATSENV, st0.prelude)
// end of [val]
//
val () =
( st0.inpfil0 := fp0 )
val
(pf0 | ()) =
$FP0.the_filpathlst_push(fp0)
//
val
p0kg =
$PAR.parse_from_filpath_toplevel
  (stadyn, fp0)
//
prval () = $UN.castview0{void}(pf0)
//
(*
val
((*popped*)) =
$FP0.the_filpathlst_pout(pf0 | (*none*))
*)
(*
val () =
println!("//process_fpath: d0cs = ", d0cs)
*)
(*
val () =
println!("//process_fpath: d1cs = ", d1cs)
*)
(*
val () =
println!("//process_fpath: d2cs = ", d2cs)
*)
(*
val () =
println!("//process_fpath: d3cs = ", d3cs)
*)
(*
val () =
println!("//process_fpath: d3cs = ", d3cs)
*)
(*
val () =
println!("//process_fpath: d3cs = ", d3cs)
*)
//
(* ****** ****** *)
//
val
h0pkg =
auxmain(p0kg) where
{
//
fun
auxmain
( p0kg
: d0parsed): h0comped =

(
$TRP30.trcmp30_package(p3kg)
) where
{
//
val
p3kg = trans03_package(p0kg)
//
// HX: for type-errors
val () = $TRD33.tread33_package(p3kg)
// HX: for timp-errors
val () = $TRD3X.tread3x_package(p3kg)
//
} (*where*) // end of [auxmain]
}
//
(* ****** ****** *)
//
val
l1pkg =
let
  val
  l1pkg =
  js1comp_package(h0pkg)
in
l1pkg where
{
//
val () =
let
val out =
outchan_get_filref
(st0.outchan)
in
  js1emit_package(out, l1pkg)
end // end of [let]
//
(*
val () =
{
val+
L1PKG(ldcls) = l1pkg
val () =
fprintln!
( stderr_ref
, "//process_fpath: ldcls = ")
val () =
loop(ldcls) where
{
//
fun
loop
( ldcls
: l1dclist): void =
(
case+
ldcls of
|
list_nil() => ()
fprint_newline(stderr_ref)
|
list_cons
(ldcl1, ldcls) =>
loop(ldcls) where
{
  val () =
  fprintln!
  (stderr_ref, "//", ldcl1) 
} (* end-of-where *)
) (* end of [val] *)
//
} // end of [where]
} // end of [where]
*)
//
} // end of [where]
//
end // end of [val l1pkg]
//
} (* end of [then] *)
else
{
// ~(stadyn >= 0) // not for loading code
} (* end of [else] *)
//
end // end of [process_fpath]

(* ****** ****** *)

implement
process_given
  (st0, arg0) = let
//
val fp0 =
let
val given = arg0
val fname = arg0
in
$FP0.filpath_make(given, fname)
end
//
(*
val () =
println!
("process_given: arg0 = ", arg0)
*)
//
in
  process_fpath(st0, fp0)
end // end of [process_given]
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
    then process_stdin(st0) else ()
  )
//
| list_cons
    (arg0, args) =>
  (
    process_cmdline2(st0, arg0, args)
  )
//
end // end of [process_cmdline]

(* ****** ****** *)

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
& cmdstate >> _
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
| "--compile" => (st0.tycheckflag := 0)
| "--tycheck" => (st0.tycheckflag := 1)
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
        val () = process_stdin(st0)
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
xats2js_main0
  (argc, argv) = let
//
val
XATSENV =
$GLO.the_XATSHOME_get((*void*))
//
val () = 
$FP0.the_includes_push(XATSENV)
//
val+
list_cons
(arg0, args) = args where
{
  val args =
    parse_commarglst(argc, argv)
  // end of [val]
} (* end of [val] *)
//
var
st0: cmdstate =
@{
  arg0= arg0
, wtk0= WTKnone()
//
, XATSENV= XATSENV
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
val () = process_cmdline(st0, args)
//
in
//
if (st0.nxerror > 0) then $ERR.abort()
//
end // end of [xats2js_main0]

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_xats2js_mymain.dats] *)
