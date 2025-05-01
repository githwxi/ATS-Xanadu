/* ****** ****** */
// XATS2JS_PRELUDE_NODE
/* ****** ****** */
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
XATS2JS_NODE_gint_print_sint
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gint_print_sint<>
}
function
XATS2JS_NODE_gint_print_uint
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gint_print_uint<>
}
/* ****** ****** */
function
XATS2JS_NODE_gflt_print_sflt
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gflt_print_sflt<>
}
function
XATS2JS_NODE_gflt_print_dflt
  (x0)
{
  XATS2JS_NODE_g_print(x0);
  return; // gflt_print_dflt<>
}
/* ****** ****** */
function
XATS2JS_NODE_strn_print(cs)
{
  return XATS2JS_NODE_g_print(cs);
}
/* ****** ****** */

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_g_print.cats] */
/* ****** ****** */
/*
Process for Xats2js/Node
*/
/* ****** ****** */
//
function
XATS2JS_NODE_argv$get
  (/*void*/)
{
  return process.argv; }
//
/* ****** ****** */

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_process.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
HX-2025-05-01:
JS/NODE code for xatsopt
Thu May  1 12:40:57 AM EDT 2025
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
function
XATSOPT_XATSHOME_get
  (/*void*/)
{
  let xhm =
  process.env['XATSHOME']
  return (
    (xhm===undefined) ? "" : xhm
  ) // XATSOPT_XATSHOME_get(/*void*/)
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_xatsopt.cats]
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
