datatype
jsonval =
//
  | JSONnul of ()
  | JSONint of (int)
  | JSONbool of (bool)
  | JSONfloat of (double)
  | JSONstring of (string)
//
  | JSONlist of (jsonvalist)
  | JSONlablist of labjsonvalist
  | JSONoption of (jsonvalopt)
//
  (* | JSONintinf of (intinf) *)
//
// end of [jsonval]
where
jsonvalist = List (jsonval)
and
labjsonval = @(string, jsonval)
and
labjsonvalist = List0 (labjsonval)
and
jsonvalopt = Option (jsonval)

typedef jsonize_type(a:t@ype) = a -> jsonval
typedef labify_type(a:t@ype) = a -> (string, jsonval)

(* ****** ****** *)
//
fun jsonval_int (x: int): jsonval
(* fun jsonval_intinf (x: intinf): jsonval *)
//
fun jsonval_bool (x: bool): jsonval
fun jsonval_double (x: double): jsonval
fun jsonval_string (x: string): jsonval
//
(* ****** ****** *)
//
fun jsonval_nil (): jsonval
fun jsonval_sing (x: jsonval): jsonval
fun jsonval_pair (x1: jsonval, x2: jsonval): jsonval
//
(* ****** ****** *)
//
fun jsonval_labval1
  (l1: string, x1: jsonval): jsonval
//
fun jsonval_labval2
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
) : jsonval // end of [jsonval_labval2]
//
fun
jsonval_labval3
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
) : jsonval // end of [jsonval_labval3]
//
fun
jsonval_labval4
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
, l4: string, x4: jsonval
) : jsonval // end of [jsonval_labval4]
//
fun
jsonval_labval5
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
, l4: string, x4: jsonval
, l5: string, x5: jsonval
) : jsonval // end of [jsonval_labval5]
//
fun
jsonval_labval6
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
, l4: string, x4: jsonval
, l5: string, x5: jsonval
, l6: string, x6: jsonval
) : jsonval // end of [jsonval_labval6]
//
fun
jsonval_labval7
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
, l4: string, x4: jsonval
, l5: string, x5: jsonval
, l6: string, x6: jsonval
, l7: string, x7: jsonval
) : jsonval // end of [jsonval_labval7]
//
fun
jsonval_labval8
(
  l1: string, x1: jsonval
, l2: string, x2: jsonval
, l3: string, x3: jsonval
, l4: string, x4: jsonval
, l5: string, x5: jsonval
, l6: string, x6: jsonval
, l7: string, x7: jsonval
, l8: string, x8: jsonval
) : jsonval // end of [jsonval_labval8]
//
(* ****** ****** *)
//
fun
jsonval_conarglst
  (con: string, arglst: jsonvalist): jsonval
//
(* ****** ****** *)
//
fun
jsonval_conarg0 (con: string): jsonval
fun
jsonval_conarg1 (con: string, arg: jsonval): jsonval
fun
jsonval_conarg2
  (con: string, arg1: jsonval, arg2: jsonval): jsonval
//
fun
jsonval_conarg3
(
  con: string, arg1: jsonval, arg2: jsonval, arg3: jsonval
) : jsonval // end of [jsonval_conarg3]
fun
jsonval_conarg4
(
  con: string
, arg1: jsonval, arg2: jsonval, arg3: jsonval, arg4: jsonval
) : jsonval // end of [jsonval_conarg4]
//
(* ****** ****** *)
//
fun jsonval_none (): jsonval
fun jsonval_some (x: jsonval): jsonval
//
(* ****** ****** *)
//
fun fprint_jsonval
  (out: FILEref, x: jsonval): void
fun fprint_jsonvalist
  (out: FILEref, xs: jsonvalist): void
fun fprint_labjsonvalist
  (out: FILEref, lxs: labjsonvalist): void
//
overload fprint with fprint_jsonval
overload fprint with fprint_jsonvalist
overload fprint with fprint_labjsonvalist
//
(*
fun print_jsonval(x: jsonval): void
fun print_jsonvalist(xs: jsonvalist): void
fun print_labjsonvalist(lxs: labjsonvalist): void
*)
//
(* ****** ****** *)

typedef
jsonize_ftype (a:t@ype) = (a) -> jsonval
typedef
labify_ftype (a:t@ype) = (a) -> @()

(* ****** ****** *)

fun jsonize_ignored{a:type} (x: a): jsonval

(* ****** ****** *)
//
fun{a:t@ype}
jsonize_list_fun
  (* (xs: List0 (a), f: jsonize_ftype (a)): jsonval *)
  (xs: List (a), f: jsonize_ftype (a)): jsonval
// end of [jsonize_list_fun]
//
fun{a:t@ype}
jsonize_option_fun
  (xs: Option (a), f: jsonize_ftype (a)): jsonval

(* ****** ****** *)

symintr jsonize
symintr labify
(* symintr jsonize_list *)

fun{a:t@ype} jsonize_val: (a) -> jsonval

fun{a:t@ype} jsonize_list: (List(a)) -> jsonval
fun{a:t@ype} jsonize_option: (Option(a)) -> jsonval
fun{a:t@ype} jsonize_option_vt: (Option_vt(a)) -> jsonval

fun jsonize_int(x:int): jsonval

fun jsonize_char(x:char): jsonval

fun jsonize_string(x:string): jsonval

fun jsonize_bool(x:bool): jsonval

fun jsonize_double(x:double): jsonval

(* fun jsonize_float(x:float): jsonval = JSONstring(tostring_val<float>(x)) *)

overload jsonize with jsonize_int

overload jsonize with jsonize_char

overload jsonize with jsonize_string

overload jsonize with jsonize_bool

overload jsonize with jsonize_double

(* overload jsonize with jsonize_float *)

fun lab(x:string, rst:jsonval): jsonval

fun jnul(): jsonval

fun jint(x:int): jsonval

fun jbool(x:bool): jsonval

fun jfloat(x:double): jsonval

fun jstr(x:string): jsonval

fun listj(x: jsonval): jsonval

fun listj2(x: jsonval, y: jsonval): jsonval


fun labval2(x: jsonval, y: jsonval): jsonval


fun fprintf {ts:types} (
  out: FILEref,
  fmt: string,
  args: ts
): void = "mac#fprintf"


typedef str_arg2 = (string, string)
typedef str_arg3 = (string, string, string)
typedef str_arg4 = (string, string, string, string)
typedef str_arg5 = (string, string, string, string, string)
typedef str_arg6 = (string, string, string, string, string, string)
typedef str_arg7 = (string, string, string, string, string, string, string)
typedef str_arg8 = (string, string, string, string, string, string, string, string)
typedef str_arg9 = (string, string, string, string, string, string, string, string, string)
typedef str_arg10 = (string, string, string, string, string, string, string, string, string, string)

typedef json_arg2 = (jsonval, jsonval)
typedef json_arg3 = (jsonval, jsonval, jsonval)
typedef json_arg4 = (jsonval, jsonval, jsonval, jsonval)
typedef json_arg5 = (jsonval, jsonval, jsonval, jsonval, jsonval)
typedef json_arg6 = (jsonval, jsonval, jsonval, jsonval, jsonval, jsonval)
typedef json_arg7 = (jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval)
typedef json_arg8 = (jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval)
typedef json_arg9 = (jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval)
typedef json_arg10 = (jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval, jsonval)

fun jsonify0 (guard_name: string): jsonval
fun jsonify1 (guard_name: string, arg_name: string, arg_json: jsonval): jsonval
fun jsonify2 (guard_name: string, arg_names: str_arg2, arg_json: json_arg2): jsonval
fun jsonify3 (guard_name: string, arg_names: str_arg3, arg_json: json_arg3): jsonval
fun jsonify4 (guard_name: string, arg_names: str_arg4, arg_json: json_arg4): jsonval
fun jsonify5 (guard_name: string, arg_names: str_arg5, arg_json: json_arg5): jsonval
fun jsonify6 (guard_name: string, arg_names: str_arg6, arg_json: json_arg6): jsonval
fun jsonify7 (guard_name: string, arg_names: str_arg7, arg_json: json_arg7): jsonval
fun jsonify8 (guard_name: string, arg_names: str_arg8, arg_json: json_arg8): jsonval
fun jsonify9 (guard_name: string, arg_names: str_arg9, arg_json: json_arg9): jsonval
fun jsonify10 (guard_name: string, arg_names: str_arg10, arg_json: json_arg10): jsonval

overload jsonify with jsonify0
overload jsonify with jsonify1
overload jsonify with jsonify2
overload jsonify with jsonify3
overload jsonify with jsonify4
overload jsonify with jsonify5
overload jsonify with jsonify6
overload jsonify with jsonify7
overload jsonify with jsonify8
overload jsonify with jsonify9
overload jsonify with jsonify10
(* fun jsonify(guard_name: string, List(@(string, json))): jsonval *)
