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

/* end of [ATS3/XANADU_xatslib_githwxi_DATSCATS_NODE_basics0.cats] */
