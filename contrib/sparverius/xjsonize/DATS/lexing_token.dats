#include "share/atspre_staload.hats"
#staload UN = "prelude/SATS/unsafe.sats"

#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/json.sats"
#staload _ = "./json.dats"

#staload "./../SATS/lexing.sats"

#staload SYM_J = "./../SATS/symbol.sats"

overload jsonize with $SYM_J.jsonize_symbol


implement
jsonize_tnode(tnd) = //labval2(jsonize("tnode"), res) where
jsonval_labval1("tnode", res) where
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
  labval2(jsonize("BLANK"), jnul()) // x, ")")
//
| T_CLNLT(x) =>
  labval2(jsonize("CLNLT"), jnul()) // x, ")")
| T_DOTLT(x) =>
  labval2(jsonize("DOTLT"), jnul()) // x, ")")
//
| T_IDENT_alp(x) =>
  labval2(jsonize("IDENT_alp"), jnul()) // x, ")")
| T_IDENT_sym(x) =>
  labval2(jsonize("IDENT_sym"), jnul()) // x, ")")
//
| T_IDENT_srp(x) =>
  labval2(jsonize("IDENT_srp"), jnul()) // x, ")")
| T_IDENT_dlr(x) =>
  labval2(jsonize("IDENT_dlr"), jnul()) // x, ")")
//
| T_IDENT_qual(x) =>
  labval2(jsonize("IDENT_qual"), jnul()) // x, ")")
//
| T_INT1(rep) =>
  labval2(jsonize("INT1"), jnul()) // rep, ")")
| T_INT2(base, rep) =>
  labval2(jsonize("INT3"), jnul()) // base, ", ", rep, ")")
| T_INT3(base, rep, k0(*sfx*)) =>
  labval2(jsonize("INT3"), jnul()) // base, ", ", rep, ", ", k0, ")")
//
| T_FLOAT1(rep) =>
  labval2(jsonize("FLOAT1"), jnul()) // rep, ")")
| T_FLOAT2(base, rep) =>
  labval2(jsonize("FLOAT2"), jnul()) // base, ", ", rep, ")")
| T_FLOAT3(base, rep, k0(*sfx*)) =>
  labval2(jsonize("FLOAT3"), jnul()) // base, ", ", rep, ", ", k0, ")")
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    labval2(jsonize("CHAR"), jnul()) // chr, ")")
  end
*)
| T_CHAR_nil(rep) =>
  labval2(jsonize("CHAR_nil"), jnul()) // rep, ")")
| T_CHAR_char(rep) =>
  labval2(jsonize("CHAR_char"), jnul()) // rep, ")")
| T_CHAR_slash(rep) =>
  labval2(jsonize("CHAR_slash"), jnul()) // rep, ")")
//
| T_STRING_closed(str) =>
  labval2(jsonize("STRING_closed"), jnul()) // str, ")")
| T_STRING_unclsd(str) =>
  labval2(jsonize("STRING_unclsd"), jnul()) // str, ")")
//
(*
| T_CDATA(cdata, asz) => labval2(jsonize("CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  labval2(jsonize("SPECHAR"), jnul()) // int2char0(c), ")")
//
| T_COMMENT_line
    (init, content) =>
    labval2(jsonize("T_COMMENT_line"), jnul()) // init, "; ", "...)")
| T_COMMENT_rest
    (init, content) =>
    labval2(jsonize("T_COMMENT_rest"), jnul()) // init, "; ", "...)")
| T_COMMENT_cblock
    (level, content) =>
    labval2(jsonize("T_COMMENT_cblock"), jnul()) // level, "; ", "...)")
| T_COMMENT_mlblock
    (level, content) =>
    labval2(jsonize("T_COMMENT_mlblock"), jnul()) // level, "; ", "...)")
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
  labval2(jsonize("EXISTS"), jnul()) // knd, ")")
//
| T_TUPLE(knd) =>
  labval2(jsonize("TUPLE"), jnul()) // knd, ")")
| T_RECORD(knd) =>
  labval2(jsonize("RECORD"), jnul()) // knd, ")")
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
  jsonize("OP_par()")
| T_OP_sym(id) =>
  labval2(jsonize("OP_sym"), jnul()) // id, ")")
//
| T_IN() => jsonize("IN")
//
| T_AND() => jsonize("AND")
| T_END() => jsonize("END")
//
| T_IF() => jsonize("IF")
| T_SIF() => jsonize("SIF")
| T_THEN() => jsonize("THEN")
| T_ELSE() => jsonize("ELSE")
//
| T_WHEN() => jsonize("WHEN")
| T_WITH() => jsonize("WITH")
//
| T_CASE(k0) =>
  labval2(jsonize("CASE"), jnul()) // k0, ")")
//
| T_SCASE() => jsonize("SCASE()")
//
| T_ENDIF() => jsonize("ENDIF")
| T_ENDSIF() => jsonize("ENDSIF")
| T_ENDCASE() => jsonize("ENDCASE")
| T_ENDSCASE() => jsonize("ENDSCASE")
//
| T_LAM(knd) =>
  labval2(jsonize("LAM"), jnul()) // knd, ")")
| T_FIX(knd) =>
  labval2(jsonize("FIX"), jnul()) // knd, ")")
//
| T_LET() => jsonize("LET")
| T_WHERE() => jsonize("WHERE")
| T_LOCAL() => jsonize("LOCAL")
//
| T_ENDLAM() => jsonize("ENDLAM")
| T_ENDLET() => jsonize("ENDLET")
| T_ENDWHERE() => jsonize("ENDWHERE")
| T_ENDLOCAL() => jsonize("ENDLOCAL")
//
| T_VAL(vlk) =>
  labval2(jsonize("VAL"), jnul()) // vlk, ")")
| T_VAR() => jsonize("VAR")
//
| T_FUN(fnk) =>
  labval2(jsonize("FUN"), jnul()) // fnk, ")")
//
| T_IMPLMNT(knd) =>
  labval2(jsonize("IMPLMNT"), jnul()) // knd, ")")
//
| T_ABSSORT() =>
  jsonize("ABSSORT")
//
| T_SORTDEF() =>
  labval2(jsonize("SORTDEF"), jnul()) // ")")
//
| T_SEXPDEF(srt) =>
  labval2(jsonize("SEXPDEF"), jnul()) // srt, ")")
//
| T_ABSTYPE(srt) =>
  labval2(jsonize("ABSTYPE"), jnul()) // srt, ")")
//
| T_ABSIMPL() =>
  jsonize("ABSIMPL")
| T_ABSOPEN() =>
  jsonize("ABSOPEN")
//
| T_DATASORT() =>
  jsonize("DATASORT")
| T_DATATYPE(srt) =>
  labval2(jsonize("DATATYPE"), jnul()) // srt, ")")
//
| T_WITHTYPE(srt) =>
  labval2(jsonize("WITHTYPE"), jnul()) // srt, ")")
//
| T_SRP_NONFIX() =>
  jsonize("#NONFIX")
| T_SRP_FIXITY(knd) =>
  labval2(jsonize("#FIXIXTY"), jnul()) // knd, ")")
//
| T_SRP_STACST() => jsonize("#STACST")
//
| T_SRP_STATIC() => jsonize("#STATIC")
| T_SRP_EXTERN() => jsonize("#EXTERN")
//
| T_SRP_DEFINE() => jsonize("#DEFINE")
| T_SRP_MACDEF() => jsonize("#MACDEF")
//
| T_SRP_INCLUDE() => jsonize("#INCLUDE")
//
| T_SRP_STALOAD() => jsonize("#STALOAD")
| T_SRP_DYNLOAD() => jsonize("#DYNLOAD")
//
| T_SRP_SYMLOAD() => jsonize("#SYMLOAD")
//
) (* end of [jsonize_tnode] *)
end

implement
jsonize_token(tok) =
  (* labval2(jsonize("token"), jsonize_tnode(tok.node())) *)
  jsonval_labval1("token", jsonize_tnode(tok.node()))
