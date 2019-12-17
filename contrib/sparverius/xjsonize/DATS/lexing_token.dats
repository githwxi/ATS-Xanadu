#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/lexing.sats"
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/basics.sats"

#staload SYM_J = "./../SATS/symbol.sats"

overload jsonize with $SYM_J.jsonize_symbol


implement
jsonize_tnode(tnd) = //labval2(jsonize("tnode"), res) where
//jsonval_labval1("tnode", res) where
(* res where *)
node("tnode", res) where
val res =
(
case+ tnd of
//
| T_EOF() => jsonize("EOF")
| T_ERR() => jsonize("ERR")
//
| T_EOL() => jsonize("EOL")
//
| T_BLANK(x) =>
  jsonify("BLANK", "x", jsonize(x))
//
| T_CLNLT(x) =>
  jsonify("CLNLT", "x", jsonize(x))
| T_DOTLT(x) =>
  jsonify("DOTLT", "x", jsonize(x))
//
| T_IDENT_alp(x) =>
  jsonify("IDENT_alp", "x", jsonize(x))
| T_IDENT_sym(x) =>
  jsonify("IDENT_sym", "x", jsonize(x))
//
| T_IDENT_srp(x) =>
  jsonify("IDENT_srp", "x", jsonize(x))
| T_IDENT_dlr(x) =>
  jsonify("IDENT_dlr", "x", jsonize(x))
//
| T_IDENT_qual(x) =>
  jsonify("IDENT_qual", "x", jsonize(x))
//
| T_INT1(rep) =>
  jsonify("INT1", "rep", jsonize(rep))
| T_INT2(base, rep) =>
  jsonify("INT3", ("base", "rep"), (jsonize(base), jsonize(rep)))
| T_INT3(base, rep, k0(*sfx*)) =>
  jsonify("INT3", ("base", "rep", "k0"),
    (jsonize(base), jsonize(rep), jsonize(k0)))
//
| T_FLOAT1(rep) =>
  jsonify("FLOAT1", "rep", jsonize(rep))
| T_FLOAT2(base, rep) =>
  jsonify("FLOAT2", ("base", "rep"), (jsonize(base), jsonize(rep)))

| T_FLOAT3(base, rep, k0(*sfx*)) =>
  jsonify("FLOAT3", ("base", "rep", "k0"),
    (jsonize(base), jsonize(rep), jsonize(k0)))
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    jsonify("CHAR"), jnul()) // chr, ")")
  end
*)
| T_CHAR_nil(rep) =>
  jsonify("CHAR_nil", "rep", jsonize(rep))
| T_CHAR_char(rep) =>
  jsonify("CHAR_char", "rep", jsonize(rep))
| T_CHAR_slash(rep) =>
  jsonify("CHAR_slash", "rep", jsonize(rep))
//
| T_STRING_closed(str) =>
  jsonify("STRING_closed", "str", jsonize(str))
| T_STRING_unclsd(str) =>
  jsonify("STRING_unclsd", "str", jsonize(str))
//
(*
| T_CDATA(cdata, asz) => jsonify(("CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  jsonify("SPECHAR", "c", jsonize(int2char0(c)))
//
| T_COMMENT_line
    (init, content) =>
    jsonify("T_COMMENT_line", ("init", "content"),
      (jsonize(init), jsonize(content)))
| T_COMMENT_rest
    (init, content) =>
    jsonify("T_COMMENT_rest", ("init", "content"),
      (jsonize(init), jsonize(content)))
| T_COMMENT_cblock
    (level, content) =>
    jsonify("T_COMMENT_cblock", ("level", "content"),
      (jsonize(level), jsonize(content)))
| T_COMMENT_mlblock
    (level, content) =>
    jsonify("T_COMMENT_mlblock", ("level", "content"),
      (jsonize(level), jsonize(content)))
//
| T_AT() => jsonize("AT")
//
| T_BAR() => jsonize("BAR")
| T_CLN() => jsonize("CLN")
| T_DOT() => jsonize("DOT")
//
| T_EQ() => jsonize("EQ")
//
| T_LT() => jsonize("LT")
| T_GT() => jsonize("GT")
//
| T_DLR() => jsonize("DLR")
| T_SRP() => jsonize("SRP")
//
| T_EQLT() => jsonize("EQLT")
| T_EQGT() => jsonize("EQGT")
//
| T_LTGT() => jsonize("LTGT")
| T_GTLT() => jsonize("GTLT")
//
| T_MSLT() => jsonize("MSLT")
(*
| T_MSGT() => jsonize("MSGT")
| T_MSLTGT() => jsonize("MSLTGT")
*)
//
(*
| T_DOTLT() => jsonize("DOTLT")
*)
| T_GTDOT() => jsonize("GTDOT")
//
| T_COMMA() => jsonize("COMMA")
| T_SMCLN() => jsonize("SMCLN")
//
| T_BSLASH() => jsonize("BSLASH")
//
| T_LPAREN() => jsonize("LPAREN")
| T_RPAREN() => jsonize("RPAREN")
| T_LBRACE() => jsonize("LBRACE")
| T_RBRACE() => jsonize("RBRACE")
//
| T_LBRACK() => jsonize("LBRACK")
| T_RBRACK() => jsonize("RBRACK")
//
| T_EXISTS(knd) =>
  jsonify("EXISTS", "knd", jsonize(knd))
//
| T_TUPLE(knd) =>
  jsonify("TUPLE", "knd", jsonize(knd))
| T_RECORD(knd) =>
  jsonify("RECORD", "knd", jsonize(knd))
(*
| T_STRUCT() => jsonize("STRUCT")
*)
//
| T_AS() => jsonize("AS")
//
| T_OF() => jsonize("OF")
//
| T_OP() => jsonize("OP")
//
| T_OP_par() =>
  jsonify("OP_par")
| T_OP_sym(id) =>
  jsonify("OP_sym", "id",jsonize(id))
//
| T_IN() => jsonify("IN")
//
| T_AND() => jsonify("AND")
| T_END() => jsonify("END")
//
| T_IF() => jsonify("IF")
| T_SIF() => jsonify("SIF")
| T_THEN() => jsonify("THEN")
| T_ELSE() => jsonify("ELSE")
//
| T_WHEN() => jsonify("WHEN")
| T_WITH() => jsonify("WITH")
//
| T_CASE(k0) =>
  jsonify("CASE", "k0", jsonize(k0))
//
| T_SCASE() => jsonify("SCASE")
//
| T_ENDIF() => jsonify("ENDIF")
| T_ENDSIF() => jsonify("ENDSIF")
| T_ENDCASE() => jsonify("ENDCASE")
| T_ENDSCASE() => jsonify("ENDSCASE")
//
| T_LAM(knd) =>
  jsonify("LAM", "knd", jsonize(knd))
| T_FIX(knd) =>
  jsonify("FIX", "knd", jsonize(knd))
//
| T_LET() => jsonify("LET")
| T_WHERE() => jsonify("WHERE")
| T_LOCAL() => jsonify("LOCAL")
//
| T_ENDLAM() => jsonify("ENDLAM")
| T_ENDLET() => jsonify("ENDLET")
| T_ENDWHERE() => jsonify("ENDWHERE")
| T_ENDLOCAL() => jsonify("ENDLOCAL")
//
| T_VAL(vlk) =>
  jsonify("VAL", "vlk", jsonize(vlk))
| T_VAR() => jsonify("VAR")
//
| T_FUN(fnk) =>
  jsonify("FUN", "fnk", jsonize(fnk))
//
| T_IMPLMNT(knd) =>
  jsonify("IMPLMNT", "knd", jsonize(knd))
//
| T_ABSSORT() =>
  jsonify("ABSSORT")
//
| T_SORTDEF() =>
  jsonify("SORTDEF")
//
| T_SEXPDEF(srt) =>
  jsonify("SEXPDEF", "srt", jsonize(srt))
//
| T_ABSTYPE(srt) =>
  jsonify("ABSTYPE", "srt", jsonize(srt))
//
| T_ABSIMPL() =>
  jsonify("ABSIMPL")
| T_ABSOPEN() =>
  jsonify("ABSOPEN")
//
| T_DATASORT() =>
  jsonify("DATASORT")
| T_DATATYPE(srt) =>
  jsonify("DATATYPE", "srt", jsonize(srt))
//
| T_WITHTYPE(srt) =>
  jsonify("WITHTYPE", "srt", jsonize(srt))
//
| T_SRP_NONFIX() =>
  jsonify("#NONFIX")
| T_SRP_FIXITY(knd) =>
  jsonify("#FIXIXTY", "knd", jsonize(knd))
//
| T_SRP_STACST() => jsonify("#STACST")
//
| T_SRP_STATIC() => jsonify("#STATIC")
| T_SRP_EXTERN() => jsonify("#EXTERN")
//
| T_SRP_DEFINE() => jsonify("#DEFINE")
| T_SRP_MACDEF() => jsonify("#MACDEF")
//
| T_SRP_INCLUDE() => jsonify("#INCLUDE")
//
| T_SRP_STALOAD() => jsonify("#STALOAD")
| T_SRP_DYNLOAD() => jsonify("#DYNLOAD")
//
| T_SRP_SYMLOAD() => jsonify("#SYMLOAD")
//
) (* end of [jsonize_tnode] *)
end

implement
jsonize_token(tok) =
  (* labval2(jsonize("token"), jsonize_tnode(tok.node())) *)
  (* jsonval_labval1("token", jsonize_tnode(tok.node())) *)
  (* jsonify("token", ("loc", "tok"), (jsonize(tok.loc()), jsonize_tnode(tok.node()))) *)
(*
  node("token", JSONlist(
    $list{jsonval}(
      jsonize_location(tok.loc()),
      jsonize_tnode(tok.node())
    )
  ))
*)

node2("token", jsonize_location(tok.loc()), jsonize_tnode(tok.node()))
