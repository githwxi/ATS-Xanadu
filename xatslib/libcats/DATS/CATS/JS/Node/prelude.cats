/* ****** ****** */
/*
Basics for Xats2js/Node
*/
/* ****** ****** */

const
XATS2JS_NODE_fs =
require( 'fs' ) ;

/* ****** ****** */

function
XATS2JS_NODE_fs_readFileSync
  (path)
{
  return String(
    XATS2JS_NODE_fs.readFileSync(path)
  ); // end of [return]
}

/* ****** ****** */

/* end of [xatslib_libcats_XATS2JS_NODE_prelude.cats] */
