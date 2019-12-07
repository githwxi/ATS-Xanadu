#staload "./../SATS/json.sats"

#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

implement
jsonval_int (i) = JSONint (i)

(* implement *)
(* jsonval_intinf (i) = JSONintinf (i) *)

implement
jsonval_bool (b) = JSONbool (b)

implement
jsonval_double (d) = JSONfloat (d)

implement
jsonval_string (str) = JSONstring (str)

(* ****** ****** *)
//
#define nil list_nil
//
#define :: list_cons
#define cons list_cons
//
(* ****** ****** *)

implement
jsonval_sing (x) = JSONlist (list_sing(x))
implement
jsonval_pair (x1, x2) = JSONlist (list_pair(x1, x2))

(* ****** ****** *)
//
implement
jsonval_labval1 (l, x) =
  JSONlablist (list_cons((l, x), list_nil))
implement
jsonval_labval2 (l1, x1, l2, x2) =
  JSONlablist (list_cons((l1, x1), list_cons((l2, x2), list_nil)))
implement
jsonval_labval3
(
  l1, x1, l2, x2, l3, x3
) = JSONlablist ((l1, x1) :: (l2, x2) :: (l3, x3) :: list_nil(*void*))
implement
jsonval_labval4
(
  l1, x1, l2, x2, l3, x3, l4, x4
) = JSONlablist ((l1, x1) :: (l2, x2) :: (l3, x3) :: (l4, x4) :: list_nil)
//
implement
jsonval_labval5
(
  l1, x1, l2, x2, l3, x3, l4, x4, l5, x5
) = JSONlablist
(
  (l1, x1) :: (l2, x2) :: (l3, x3) :: (l4, x4) :: (l5, x5) :: list_nil
)
implement
jsonval_labval6
(
  l1, x1, l2, x2, l3, x3, l4, x4, l5, x5, l6, x6
) = JSONlablist
(
  (l1, x1) :: (l2, x2) :: (l3, x3) :: (l4, x4) :: (l5, x5) :: (l6, x6) :: list_nil
)
implement
jsonval_labval7
(
  l1, x1, l2, x2, l3, x3, l4, x4, l5, x5, l6, x6, l7, x7
) = JSONlablist
(
  (l1, x1) :: (l2, x2) :: (l3, x3) :: (l4, x4) :: (l5, x5) :: (l6, x6) :: (l7, x7) :: list_nil
)
implement
jsonval_labval8
(
  l1, x1, l2, x2, l3, x3, l4, x4, l5, x5, l6, x6, l7, x7, l8, x8
) = JSONlablist
(
  (l1, x1) :: (l2, x2) :: (l3, x3) :: (l4, x4) :: (l5, x5) :: (l6, x6) :: (l7, x7) :: (l8, x8) :: list_nil
)
//
(* ****** ****** *)
//
implement
jsonval_conarg0
  (con) = jsonval_conarglst (con, list_nil)
implement
jsonval_conarg1
  (con, arg1) =
  jsonval_conarglst (con, list_sing (arg1))
implement
jsonval_conarg2
  (con, arg1, arg2) =
  jsonval_conarglst (con, list_pair (arg1, arg2))
implement
jsonval_conarg3
  (con, arg1, arg2, arg3) =
  jsonval_conarglst (con, arg1 :: arg2 :: arg3 :: list_nil)
implement
jsonval_conarg4
  (con, arg1, arg2, arg3, arg4) =
  jsonval_conarglst (con, arg1 :: arg2 :: arg3 :: arg4 :: list_nil())
//
implement
jsonval_conarglst
  (con, arglst) = jsonval_labval1 (con, JSONlist (arglst))
// end of [jsonval_conarglst]

(* ****** ****** *)
//
implement
jsonval_none () = JSONoption (None())
implement
jsonval_some (x) = JSONoption (Some(x))

local

fun
fprint_jsonval_string
(
  out: FILEref, str: string
) : void = let
//
fun
auxch
(
  out: FILEref, c: char
) : void = let
in
//
case+ c of
| '"' => fprint_string (out, "\\\"")
| '\\' => fprint_string (out, "\\\\")
| '\n' => fprint_string (out, "\\n")
| '\r' => fprint_string (out, "\\r")
| '\t' => fprint_string (out, "\\t")
| '\b' => fprint_string (out, "\\b")
| '\f' => fprint_string (out, "\\f")
| _ (*rest-of-char*) =>
  (
    if isprint_char(c)
      then fprint_char(out, c)
      else let
        (* val uc = uchar_of_char(c)  *)
      in
        (* fprintf (out, "\\u00%.2X", @($UN.cast2uint(uc))) *)
      exit(1);
      end // end of [else]
    // end of [if]
  ) (* end of [_] *)
//
end // end of [auxch]
//
fun
loop
(
  out: FILEref, p: ptr
) : void = let
//
val c = $UN.ptr0_get<char> (p)
//
in
//
if c != '\000'
(*
then (auxch(out, c); loop (out, p+sizeof<char>)) else ()
*)
  then (auxch(out, c); loop (out, nxtptr)) where
      val nxtptr = ptr0_add_guint<char>(p, sizeof<char>)
    end
  else ()
//
end // end of [loop]
//
in
//
fprint_char (out, '"');
loop (out, $UN.cast{ptr}(str));
fprint_char (out, '"');
//
end // end of [fprint_jsonval_string]

in (* in-of-local *)

implement
fprint_jsonval
  (out, x0) = let
//
macdef
prstr (str) = fprint_string (out, ,(str))
//
in
//
case+ x0 of
//
| JSONnul () => prstr "{}"
//
| JSONint (i) => fprint_int (out, i)
(* | JSONintinf (i) => *)
(*   { *)
(*     val () = fprint_char (out, '"') *)
(*     val () = $INTINF.fprint_intinf (out, i) *)
(*     val () = fprint_char (out, '"') *)
(*   } *)
//
| JSONbool (b) => fprint_bool (out, b)
| JSONfloat (d) => fprint_double (out, d)
//
| JSONstring (str) => fprint_jsonval_string (out, str)
| JSONlist (xs) =>
  {
    val () = prstr "["
    val () = fprint_jsonvalist (out, xs)
    val () = prstr "]"
  }
| JSONlablist (lxs) =>
  {
    val () = prstr "{"
    val () = fprint_labjsonvalist (out, lxs)
    val () = prstr "}"
  }
//
| JSONoption (opt) =>
  {
    val () = prstr "["
    val () =
    (
      case+ opt of
      | Some x => fprint_jsonval (out, x) | None () => ()
    ) : void // end of [val]
    val () = prstr "]"
  }
//
end // end of [fprint_jsonval]

end // end of [local]

(* ****** ****** *)

implement
fprint_jsonvalist
  (out, xs0) = let
//
fun aux
(
  out: FILEref
, xs0: jsonvalist, i: int
) : void = let
in
//
case+ xs0 of
| list_nil () => ()
| list_cons (x, xs) => let
    val () =
      if i > 0
        then fprint (out, ", ")
      // end of [if]
    val () = fprint_jsonval (out, x)
  in
    aux (out, xs, i+1)
  end // end of [list_cons]
//
end // end of [aux]
//
in
  aux (out, xs0, 0)
end // end of [fprint_jsonvalist]

(* ****** ****** *)

implement
fprint_labjsonvalist
  (out, lxs0) = let
//
fun aux
(
  out: FILEref
, lxs0: labjsonvalist, i: int
) : void = let
in
//
case+ lxs0 of
| list_nil () => ()
| list_cons
    (lx, lxs) => let
    val () =
      if i > 0
        then fprint (out, ", ")
      // end of [if]
    (*
    val () =
      fprintf (out, "\"%s\"", @(lx.0))
    *)
    val () =
      fprintf (out, "\"%s\"", $vararg(lx.0))

    val () = fprint_string (out, ": ")
    val () = fprint_jsonval (out, lx.1)
  in
    aux (out, lxs, i+1)
  end // end of [list_cons]
//
end // end of [aux]
//
in
  aux (out, lxs0, 0)
end // end of [fprint_labjsonvalist]

(* ****** ****** *)


(* ****** ****** *)
//
implement
jsonize_ignored(x0) = JSONnul((*void*))
//
(* ****** ****** *)

implement
{a}(*tmp*)
jsonize_list_fun(xs, f) = let
//
(*
val () =
  println! ("jsonize_list_fun")
*)
//
(*
val
jsvs = list_map_fun<a> (xs, f)
*)
val
jsvs = list_map<a><jsonval>(xs) where
  implement list_map$fopr<a><jsonval>(a) = f(a) end
val
jsvs = list_of_list_vt(jsvs)

in
  JSONlist (jsvs)
end // end of [jsonize_list_fun]

(* ****** ****** *)

implement
{a}(*tmp*)
jsonize_option_fun(opt, f) = let
//
(*
val () =
  println! ("jsonize_option_fun")
*)
//
in
//
case+ opt of
| None() => jsonval_none() | Some(x) => jsonval_some(f(x))
//
end // end of [jsonize_option_fun]


implement lab(x:string, rst:jsonval): jsonval = jsonval_labval1(x, rst)

implement jnul() = JSONnul()

implement jint(x:int) = JSONint(x)

implement jbool(x:bool) = JSONbool(x)

implement jfloat(x:double) = JSONfloat(x)

implement jstr(x:string) = JSONstring(x)

implement jsonize_int(x) = JSONint(x)

implement jsonize_string(x) = JSONstring(x)

implement jsonize_bool(x) = JSONbool(x)

implement jsonize_double(x) = JSONstring(tostring_val<double>(x))

implement jsonize_val<int>(x) = jsonize_int(x)

implement jsonize_val<string>(x) = jsonize_string(x)

implement jsonize_val<bool>(x) = jsonize_bool(x)

implement jsonize_val<double>(x) = jsonize_double(x)

(* implement jsonize_val<float>(x) = jsonize_float(x) *)

implement{a} jsonize_list(xs) = JSONlist(res) where
{
  (* val _ = $showtype(xs) *)
  val xys = list_map<a><jsonval>(xs) where
  {
    implement list_map$fopr<a><jsonval>(x) = jsonize_val<a>(x)
  }
  val res = list_of_list_vt{jsonval}(xys)
}

implement(a:t@ype) jsonize_val<List(a)>(xs) = jsonize_list<a>(xs)

implement listj(x) = JSONlist(list_sing(x))

implement listj2(x, y) = JSONlist(cons(x, cons(y, nil())))
