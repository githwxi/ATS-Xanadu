/* ****** ****** */
/* ****** ****** */
/*
Basics for XATS2JS/NODE
*/
/* ****** ****** */
/* ****** ****** */
//
const
XATS2JS_NODE_fs =
require(  'fs'  );
/*
HX: Please do not:
require('node:fs');
*/
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_g_stdin()
{ return process.stdin ; }
function
XATS2JS_NODE_g_stdout()
{ return process.stdout ; }
function
XATS2JS_NODE_g_stderr()
{ return process.stderr ; }
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_g_fprint
  (obj, out)
{
  out.write(obj.toString());
  return; // XATS2JS_NODE_g_fprint
}
//
/* ****** ****** */
//
function
XATS2JS_NODE_bool_fprint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_bool_fprint
}
function
XATS2JS_NODE_char_fprint
  (obj, out)
{
  let
  rep = String.fromCharCode(obj);
  XATS2JS_NODE_g_fprint(rep, out);
  return ; // XATS2JS_NODE_char_fprint
}
function
XATS2JS_NODE_strn_fprint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_strn_fprint
}
//
/* ****** ****** */
//
function
XATS2JS_NODE_sint_fprint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_sint_fprint
}
function
XATS2JS_NODE_uint_fprint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_uint_fprint
}
//
function
XATS2JS_NODE_gint_fprint$sint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_gint_fprint$sint
}
function
XATS2JS_NODE_gint_fprint$uint
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_gint_fprint$uint
}
//
/* ****** ****** */
//
function
XATS2JS_NODE_gflt_fprint$sflt
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_gflt_fprint$sflt
}
function
XATS2JS_NODE_gflt_fprint$dflt
  (obj, out)
{
  XATS2JS_NODE_g_fprint(obj, out);
  return ; // XATS2JS_NODE_gflt_fprint$dflt
}
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_fs_rexists
  (fpx)
{
  let // local var
  R_OK = XATS2JS_NODE_fs.constants.R_OK;
  try {
    XATS2JS_NODE_fs.accessSync(fpx, R_OK)
    return 1; // HX: [fpx] is R-available
  } catch(err) {
    return 0; // HX: [fpx] is R-unavailable
  }
} // end-of-[XATS2JS_NODE_fs_rexists(fpx)]
//
/* ****** ****** */
//
function
XATS2JS_NODE_fs_readFileSync
  (fpx)
{
  return String(XATS2JS_NODE_fs.readFileSync(fpx));
}
//
/* ****** ****** */
/* ****** ****** */
//
/***********************************************************************/
// end of
// [ATS3/XANADU_srcgen1_xatslib_githwxi_DATS_CATS_JS_NODE_basics0.cats]
/***********************************************************************/
