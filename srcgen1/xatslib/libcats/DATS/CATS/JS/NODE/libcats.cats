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
require('node:fs') ;
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_g_stdin()
{
  return process.stdin ; }
function
XATS2JS_NODE_g_stdout()
{
  return process.stdout ; }
function
XATS2JS_NODE_g_stderr()
{
  return process.stderr ; }
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
/* ****** ****** *//* ****** ****** *//* ****** ****** */
/* ****** ****** *//* ****** ****** *//* ****** ****** */

/* end of [ATS3/XANADU_srcgen1_xatslib_libcats_DATS_CATS_JS_NODE_libcats.cats] */
