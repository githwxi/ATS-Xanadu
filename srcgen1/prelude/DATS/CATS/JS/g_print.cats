//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
/*
G_print for Xats2js
*/
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
var
XATS2JS_the_print_store =
[      /*empty*/      ] ;
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
/* ****** ****** */
//
function
XATS2JS_g_print
  (obj)
{
XATS2JS_the_print_store.push
(      obj.toString()      );
return;//XATS2JS_g_print(...)
}
//
/* ****** ****** */
//
function
XATS2JS_bool_print
  ( b0 )
{
if(b0)
{
  XATS2JS_g_print("true");
}
else
{
  XATS2JS_g_print("false");
}
return;//XATS2JS_bool_print()
}
//
/* ****** ****** */
//
function
XATS2JS_char_print
  ( c0 )
{
// c0: number
XATS2JS_g_print
(String.fromCharCode(c0));
return;//XATS2JS_char_print()
}
//
/* ****** ****** */
//
function
XATS2JS_gint_print$sint
  ( x0 )
{
  return XATS2JS_g_print(x0);
}
function
XATS2JS_gint_print$uint
  ( x0 )
{
  return XATS2JS_g_print(x0);
}
//
/* ****** ****** */
//
function
XATS2JS_gflt_print$sflt
  ( x0 )
{
  return XATS2JS_g_print(x0);
}
function
XATS2JS_gflt_print$dflt
  ( x0 )
{
  return XATS2JS_g_print(x0);
}
//
/* ****** ****** */
//
function
XATS2JS_strn_print
  ( cs )
{
  return XATS2JS_g_print(cs);
}
//
/* ****** ****** */
/* ****** ****** */
//
function
XATS2JS_the_print_store_join
  ( /*void*/ )
{
var
rep =
XATS2JS_the_print_store.join("");
return rep;
}//XATS2JS_the_print_store_join(...)
//
/* ****** ****** */
//
function
XATS2JS_the_print_store_clear
  ( /*void*/ )
{
XATS2JS_the_print_store = []; return;
}//XATS2JS_the_print_store_clear(...)
//
/* ****** ****** */
/* ****** ****** */
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_g_print.cats] */
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
