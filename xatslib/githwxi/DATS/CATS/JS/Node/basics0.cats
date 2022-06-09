/* ****** ****** */
/*
Basics for Xats2js/Node
*/
/* ****** ****** */

const
XATS2JS_NODE_fs =
require( 'fs' ) ;

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
//
function
XATS2JS_NODE_g_fprint
  (out, obj)
{
out.write(obj.toString());
return; // XATS2JS_NODE_bool_fprint
}
//
/* ****** ****** */
function
XATS2JS_NODE_bool_fprint
  (out, obj)
{
XATS2JS_NODE_g_fprint(out, obj);
return ; // XATS2JS_NODE_bool_fprint
}
function
XATS2JS_NODE_char_fprint
  (out, obj)
{
let
rep = String.fromCharCode(obj);
XATS2JS_NODE_g_fprint(out, rep);
return ; // XATS2JS_NODE_char_fprint
}
function
XATS2JS_NODE_strn_fprint
  (out, obj)
{
XATS2JS_NODE_g_fprint(out, obj);
return ; // XATS2JS_NODE_strn_fprint
}
/* ****** ****** */
function
XATS2JS_NODE_gint_fprint_sint
  (out, obj)
{
XATS2JS_NODE_g_fprint(out, obj);
return ; // XATS2JS_NODE_gint_fprint_sint
}
function
XATS2JS_NODE_gint_fprint_uint
  (out, obj)
{
XATS2JS_NODE_g_fprint(out, obj);
return ; // XATS2JS_NODE_gint_fprint_uint
}
/* ****** ****** */
//
function
XATS2JS_NODE_fs_readFileSync
  (path)
{
  return String(XATS2JS_NODE_fs.readFileSync(path));
}
//
/* ****** ****** */

/* end of [ATS3/XANADU_xatslib_githwxi_DATSCATS_NODE_basics0.cats] */
