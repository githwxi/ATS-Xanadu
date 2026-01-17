//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
/*
Basics3 for XATS2JS
*/
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_jsobj_get$at
  (obj, key)
{
  return obj[key];
} // [XATS2JS_jsobj_get$at]
//
function
XATS2JS_jsobj_set$at
  (obj, key, itm)
{
  return (obj[key] = itm);
} // [XATS2JS_jsobj_set$at]
//
//////////////////////////////////////////////////////////////////.
//
// HX-2020-11-09:
// Native array for XATS2JS
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_jsa1sz_size
  ( xs )
{
  return ( xs.length );
} // [XATS2JS_jsa1sz_size]
function
XATS2JS_jsa1sz_length
  ( xs )
{
  return ( xs.length );
} // [XATS2JS_jsa1sz_length]
//
/* ****** ****** */
//
function
XATS2JS_jsa1sz_get$at
  (xs, i0)
{
  return xs[i0];
} // [XATS2JS_jsa1sz_get$at]
function
XATS2JS_jsa1sz_set$at
  (xs, i0, x0)
{
  return ( xs[i0] = x0 );
} // [XATS2JS_jsa1sz_set$at]
//
//////////////////////////////////////////////////////////////////.
//
// HX-2020-11-28:
// Native hashmap for XATS2JS
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_jshmap_keyq
   (map, key)
{
  return map.hasOwnProperty(key);
} // [XATS2JS_jshmap_keyq(map,key)]
//
/* ****** ****** */
//
function
XATS2JS_jshmap_get_keys
   (map)
{
  return Object.keys(map);
} // [XATS2JS_jshmap_get_keys(map)]
//
/* ****** ****** */
//
function
XATS2JS_jshmap_make_nil
  ()
{
  return {} ;
} // [XATS2JS_jshmap_make_nil()]
//
/* ****** ****** */
//
function
XATS2JS_jshmap_search$opt
   (map, key)
{
//
  var itm0 = map[key];
//
  if(itm0===undefined)
  {
    return XATS2JS_optn_vt_nil();
  } else {
    return XATS2JS_optn_vt_cons(itm0);
  } // else // end of [if]
//
} // [XATS2JS_jshmap_search$opt(map,key)]
//
/* ****** ****** */
//
function
XATS2JS_jshmap_remove$any
   (map, key)
{
  delete map[key]; return ;
} // [XATS2JS_jshmap_remove$any(map,key)]
//
function
XATS2JS_jshmap_insert$any
   (map, key, itm1)
{
  map[key] = itm1; return;
} // [XATS2JS_jshmap_insert$any(map,key,itm1)]
//
/* ****** ****** *//* ****** ****** *//* ****** ****** */
//
function
XATS2JS_jshmap_remove$opt
   (map, key)
{
//
  var itm0 = map[key];
//
  if(itm0===undefined)
  {
    return XATS2JS_optn_vt_nil();
  } else {
    delete map[key];
    return XATS2JS_optn_vt_cons(itm0);
  } // else // end of [if]
//
} // [ XATS2JS_jshmap_remove$opt(map,key)]
//
/* ****** ****** *//* ****** ****** *//* ****** ****** */
//
function
XATS2JS_jshmap_insert$opt
   (map, key, itm1)
{
//
  var itm0 = map[key];
//
  if(itm0===undefined)
  {
    map[key] = itm1;
    return XATS2JS_optn_vt_nil();
  } else {
    map[key] = itm1;
    return XATS2JS_optn_vt_cons(itm0);
  } // else // end of [if]
//
} // [XATS2JS_jshmap_insert$opt(map,key,itm1)]
//
/* ****** ****** *//* ****** ****** *//* ****** ****** */
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics3.cats]
////////////////////////////////////////////////////////////////////////.
