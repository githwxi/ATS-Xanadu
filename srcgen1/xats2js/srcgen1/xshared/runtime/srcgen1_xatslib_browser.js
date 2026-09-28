/* ****** ****** */
/* ****** ****** */
//
// SRCGEN1_XATSLIB_BROWSER
//
/* ****** ****** */
/* ****** ****** */
//
/*
Browser replacement for srcgen1_xatslib_node.js;
load this instead of it.
Note that the NODE function names are retained for
existing generated programs.

Standard streams are DOM elements, for example:
<textarea
id="xats2js-browser-stdin"></textarea>
<pre id="xats2js-browser-stdout"></pre>
<pre id="xats2js-browser-stderr"></pre>
Create each element before requesting its stream. Read stdin through the
returned textarea's value property; these elements are not Node streams.
fprint appends literal text to its destination without adding newlines.
It also accepts custom destinations with a write(text) method.

File access uses globalThis.XATS2JS_BROWSER.readFile(path), or the global
readFile(path) helper from prelude/InBrowser when no provider is configured.
The provider must synchronously return text and throw for unavailable files.
Preload files before running; browsers cannot read local paths directly.
*/
/* ****** ****** */
/* ****** ****** */
/*
Basics for XATS2JS/Browser
*/
/* ****** ****** */
/* ****** ****** */
//
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_g_stdin()
{
  const stream =
  document.getElementById("xats2js-browser-stdin");
  if (stream === null)
  {
    throw new Error
      ("XATS2JS_NODE_g_stdin: missing #xats2js-browser-stdin element");
  }
  return stream;
}
function
XATS2JS_NODE_g_stdout()
{
  const stream =
  document.getElementById("xats2js-browser-stdout");
  if (stream === null)
  {
    throw new Error
      ("XATS2JS_NODE_g_stdout: missing #xats2js-browser-stdout element");
  }
  return stream;
}
function
XATS2JS_NODE_g_stderr()
{
  const stream =
  document.getElementById("xats2js-browser-stderr");
  if (stream === null)
  {
    throw new Error
      ("XATS2JS_NODE_g_stderr: missing #xats2js-browser-stderr element");
  }
  return stream;
}
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_NODE_g_fprint
  (obj, out)
{
  const rep = obj.toString();
  if (typeof out.write === "function")
  {
    out.write(rep);
  }
  else
  {
    out.appendChild(out.ownerDocument.createTextNode(rep));
  }
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
  try {
    XATS2JS_NODE_fs_readFileSync(fpx);
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
  const config = globalThis.XATS2JS_BROWSER;
  let text;
  if (config && typeof config.readFile === "function")
  {
    text = config.readFile(fpx);
  }
  else if (typeof globalThis.readFile === "function")
  {
    text = globalThis.readFile(fpx);
  }
  else
  {
    throw new Error
      ("XATS2JS_NODE_fs_readFileSync: no browser readFile provider");
  }
  if (typeof text !== "string")
  {
    throw new TypeError("Browser readFile must return text: " + fpx);
  }
  return text;
}
//
/* ****** ****** */
/* ****** ****** */
//
/***********************************************************************/
/***********************************************************************/
// end of
// [ATS3/XANADU_srcgen1_xatslib_githwxi_DATS_CATS_JS_NODE_basics0.cats]
/***********************************************************************/
/***********************************************************************/
