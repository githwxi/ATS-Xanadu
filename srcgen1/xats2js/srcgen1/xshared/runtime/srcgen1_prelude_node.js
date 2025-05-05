/* ****** ****** */
// SRCGEN1_PRELUDE_NODE
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
XATSOPT_argv$get
  (/*void*/)
{
  return XATS2JS_NODE_argv$get()
}
//
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
//
/*
These are implemented inside:
"srcgen1\
/xatslib/githwxi/DATS/CATS/JS/NODE/"
*/
//
function
XATSOPT_fpath_rexists
  (fpx)
{
  return XATS2JS_NODE_fs_rexists(fpx)
}
//
function
XATSOPT_fpath_full$read(fpx0)
{
  return XATS2JS_NODE_fs_readFileSync(fpx0)
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_xatsopt.cats]
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
