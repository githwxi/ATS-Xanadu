/* ****** ****** */
/*
G_print for Xats2js/Node
*/
/* ****** ****** */
//
function
XATS2JS_NODE_g_print(obj)
{
let
rep = obj.toString();
process.stdout.write(rep);
return; // XATS2JS_NODE_g_print
}
//
/* ****** ****** */
function
XATS2JS_NODE_bool_print
  (b0)
{
if(b0)
{
XATS2JS_NODE_g_print("true");
}
else
{
XATS2JS_NODE_g_print("false");
}
return; // XATS2JS_NODE_bool_print
}
/* ****** ****** */
function
XATS2JS_NODE_char_print
  (c0)
{
// c0: number
XATS2JS_NODE_g_print
(String.fromCharCode(c0));
return; // XATS2JS_NODE_char_print
}
/* ****** ****** */
function
XATS2JS_NODE_gint_print$sint
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gint_print$sint<>
}
function
XATS2JS_NODE_gint_print$uint
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gint_print$uint<>
}
/* ****** ****** */
function
XATS2JS_NODE_gflt_print$sflt
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gflt_print$sflt<>
}
function
XATS2JS_NODE_gflt_print$dflt
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gflt_print$dflt<>
}
/* ****** ****** */
function
XATS2JS_NODE_strn_print(cs)
{
  return XATS2JS_NODE_g_print(cs);
}
/* ****** ****** */

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_g_print.cats] */
