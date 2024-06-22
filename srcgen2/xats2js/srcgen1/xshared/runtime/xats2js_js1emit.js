////////////////////////////////////////////////////////////////////////////////////
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////////////////

'use strict';

////////////////////////////////////////////////////////////////////////////////////

let XATSINT1 = (i) => i
let XATSCHAR = (c) => c
let XATSSFLT = (sflr) => sflt
let XATSDFLT = (dflt) => dflt
let XATSSTRN = (strn) => strn

////////////////////////////////////////////////////////////////////////////////////

let XATSVAR0 = () => [null]
let XATSVAR1 = (init) => [init]
let XATSFLAT = (addr) => addr[0]

////////////////////////////////////////////////////////////////////////////////////

let XATSADDR = (x) => [0, x]
let XATSLPFT = (i, x) => [1+0, x, i]
let XATSLPBX = (i, x) => [1+1, x, i]

////////////////////////////////////////////////////////////////////////////////////

let XATSCTAG = (_, t) => t
let XATS000_ctgeq = (v, t) => (v[0] == t)

////////////////////////////////////////////////////////////////////////////////////

let XATS000_casef = function()
  {
    throw new Error("XATS000_casef");
  }

let XATS000_patck = function(pck)
  {
    if (!pck) {
      throw new Error("XATS000_patck");
    } // end-of-[if]
  }

////////////////////////////////////////////////////////////////////////////////////

let XATS000_assgn =
  (lval, rval) => XATS000_lvset(lval, rval)

let XATS000_lvget = function(lval)
  {
    let ctag = lval[0]
    if (ctag === 0)
      return lval[1][0]
    if (ctag === 1+0)
      return XATS000_lvget(lval[1])[lval[2]]
    if (ctag === 1+1)
      return lval[1][lval[2]]
  }

let XATS000_lvset = function(lval, rval)
  {
    let ctag = lval[0]
    if (ctag === 0) return ( lval[1][0] = rval )
    if (ctag === 1+0)
    {
      return XATS000_lvset
	(lval[1], XATS000_ftset(XATS000_lvget(lval[1]), lval[2], rval))
    }
    if (ctag === 1+1) return ( lval[1][lval[2]] = rval )
  }

////////////////////////////////////////////////////////////////////////////////////
//
// end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_js1emit.js]
//
////////////////////////////////////////////////////////////////////////////////////
