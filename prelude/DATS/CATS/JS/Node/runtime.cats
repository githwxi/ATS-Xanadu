/* ****** ****** */
/*
Runtime for Xats2js/Node
*/
/* ****** ****** */
//
function
XATS2JS_NODE_g_print(obj)
{
var
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
return ; // XATS2JS_NODE_bool_print
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
XATS2JS_NODE_gint_print_sint
  (x0)
{
XATS2JS_NODE_g_print(x0);
return; // gint_print_sint
}
function
XATS2JS_NODE_gint_print_uint
  (x0)
{
XATS2JS_NODE_g_print(x0);
return; // gint_print_uint
}
/* ****** ****** */
function
XATS2JS_NODE_string_print
  (cs)
{
  return XATS2JS_NODE_g_print(cs);
}
/* ****** ****** */

/* end of [XATS2JS_NODE_runtime.cats] */
