/* ****** ****** */
/* ****** ****** */
//
// SRCGEN1_PRELUDE_BROWSER
//
/* ****** ****** */
/* ****** ****** */
/*
//
Browser replacement for srcgen1_prelude_node.js;
load this instead of it.
Note that the NODE function names are retained for
existing generated programs.
//
Printing requires a
<pre id="xats2js-browser-stdout"></pre> element.
Optional browser configuration (set before running the program):
  globalThis.XATS2JS_BROWSER = {
    argv:
    ["XATS2JS_NODE_argv[0]", "XATS2JS_NODE_argv[1]"],
    XATSHOME: "",
    readFile: function(path) { return "file contents"; }
  };
[argv] retains Node's two leading runtime/program entries.
readFile must synchronously return text and throw for unavailable files.
If omitted, the global readFile helper from prelude/InBrowser is used.
Preload files before running; browsers cannot read local paths directly.
//
*/
/* ****** ****** */
//////////////////////////////////////////////////////////////////.
/*
G_print for Xats2js/Browser
*/
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_g_print
  (obj)
{
let
rep = obj.toString();
const stdout =
document.getElementById("xats2js-browser-stdout");
if (stdout === null)
{
  throw new Error
    ('XATS2JS_NODE_g_print: missing #xats2js-browser-stdout element');
}
return stdout.appendChild(document.createTextNode(rep));
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_bool_print
  ( b0 )
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
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_char_print
  ( c0 )
{
  // c0: number
  XATS2JS_NODE_g_print
  (String.fromCharCode(c0));
  return; // XATS2JS_NODE_char_print
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_gint_print$sint
  ( x0 )
{
XATS2JS_NODE_g_print(x0);
return;//XATS2JS_NODE_gint_print$sint
}
function
XATS2JS_NODE_gint_print$uint
  ( x0 )
{
XATS2JS_NODE_g_print(x0);
return;//XATS2JS_NODE_gint_print$uint
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_gflt_print$sflt
  ( x0 )
{
XATS2JS_NODE_g_print(x0);
return;//XATS2JS_NODE_gflt_print$sflt
}
function
XATS2JS_NODE_gflt_print$dflt
  ( x0 )
{
XATS2JS_NODE_g_print(x0);
return;//XATS2JS_NODE_gflt_print$sflt
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_strn_print
  ( cs )
{
  return XATS2JS_NODE_g_print(  cs  );
}
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
/*
Arguments for Xats2js/Browser
*/
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_NODE_argv$get
  (/*void*/)
{
const config = globalThis.XATS2JS_BROWSER;
return (
config && config.argv !== undefined ?
config.argv : ["XATS2JS_NODE_argv[0]", "XATS2JS_NODE_argv[1]"]);
}
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
/*
HX-2025-05-01:
JS/NODE code for xatsopt
Thu May  1 12:40:57 AM EDT 2025
*/
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
function
XATSOPT_argv$get
  (/*void*/)
{
  return XATS2JS_NODE_argv$get();
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATSOPT_XATSHOME_get
  (/*void*/)
{
const config =
globalThis.XATS2JS_BROWSER;
const xhm =
(
config ? config.XATSHOME : undefined);
return ((xhm===undefined) ? "" : xhm); // XATSOPT_XATSHOME_get()
}
//
//////////////////////////////////////////////////////////////////.
//
/*
Browser file access
uses a synchronous, preloaded text-file provider.
Existence checks retain the Node runtime's integer 1/0 result.
*/
//
function
XATSOPT_fpath_rexists
  (fpx)
{
  try
  {
    XATSOPT_fpath_full$read(fpx);
    return 1;
  }
  catch (err)
  {
    return 0;
  }
}
//
function
XATSOPT_fpath_full$read
  (fpx)
{
const
config = globalThis.XATS2JS_BROWSER;
let text;
if (
config &&
typeof config.readFile === "function")
{
  text = config.readFile(fpx);
}
else if (
typeof globalThis.readFile === "function")
{
  text = globalThis.readFile(fpx);
}
else
{
  throw new
    Error("XATSOPT_fpath_full$read: no browser readFile provider");
}
if (typeof text !== "string")
{
  throw new TypeError("Browser readFile must return text: " + fpx);
}
//
return text;
//
}
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.  
// end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_xatsopt.cats]
////////////////////////////////////////////////////////////////////////.  
