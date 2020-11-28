/* ****** ****** */
/*
JSBasics for Xats2js
*/
/* ****** ****** */
// HX-2020-11-09:
// Native arrays for Xats2js
/* ****** ****** */

function
XATS2JS_jsarray_size
  (xs)
{
  return ( xs.length );
}
function
XATS2JS_jsarray_length
  (xs)
{
  return ( xs.length );
}

/* ****** ****** */

function
XATS2JS_jsarray_get_at
  (xs, i0)
{
  return xs[i0];
}
function
XATS2JS_jsarray_set_at
  (xs, i0, x0)
{
  return ( xs[i0] = x0 );
}

/* ****** ****** */
//
// HX-2020-11-28:
// Native objmaps for Xats2js
/* ****** ****** */

/* ****** ****** */

/* end of [XATS2JS_jsbasics.cats] */
