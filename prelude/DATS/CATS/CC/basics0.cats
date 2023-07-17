/* ****** ****** */
/*
Basics for Xats2cc
*/
/* ****** ****** */

typedef void void_t;

typedef char char_t;

typedef char *cstr_t;

typedef float sflt_t;
typedef double dflt_t;

typedef size_t usize_t;

typedef signed int sint_t;
typedef signed long slint_t;
typedef signed long long sllint_t;

typedef unsigned int bool_t;
typedef unsigned int uint_t;
typedef unsigned long ulint_t;
typedef unsigned long long ullint_t;

/* ****** ****** */
#define xcmp_btf0_v 0
#define xcmp_btf1_v 1
/* ****** ****** */
typedef sint_t xcmp_ctag_t;
typedef sint_t xcmp_tcas_t;
/* ****** ****** */

typedef void_t xats_void_t;

typedef sint_t xats_sint_t;
typedef uint_t xats_uint_t;

typedef bool_t xats_bool_t;
typedef char_t xats_char_t;

typedef sflt_t xats_sflt_t;
typedef dflt_t xats_dflt_t;

typedef cstr_t xats_cstr_t;

/* ****** ****** */

typedef slint_t xats_slint_t;
typedef ulint_t xats_ulint_t;

typedef usize_t xats_usize_t;
typedef ssize_t xats_ssize_t;

typedef sllint_t xats_sllint_t;
typedef ullint_t xats_ullint_t;

/* ****** ****** */
//
#include <string.h>
/*
extern
size_t strlen(char *str);
extern
int strcmp(char *x1, char *x2);
*/
//
/* ****** ****** */
//
// prelude/bool.sats
//
/* ****** ****** */
bool_t
XATS2CC_bool_neg
( bool_t b0 )
{ return ~b0 ; }
/* ****** ****** */
#define \
XATS2CC_btf1 1 // tt1
#define \
XATS2CC_btf0 0 // ff0
/* ****** ****** */
bool_t
XATS2CC_bool_add
(bool_t b1, bool_t b2)
{ return (b1 || b2); }
bool_t
XATS2CC_bool_mul
(bool_t b1, bool_t b2)
{ return (b1 && b2); }
/* ****** ****** */
//
// prelude/char.sats
//
/* ****** ****** */
bool_t
XATS2CC_char_lt
(char_t x1, char_t x2)
{
  return (x1 < x2); // lt0
}
bool_t
XATS2CC_char_gt
(char_t x1, char_t x2)
{
  return (x1 > x2); // gt0
}
bool_t
XATS2CC_char_eq
(char_t x1, char_t x2)
{
  return (x1 == x2); // eq0
}
bool_t
XATS2CC_char_lte
(char_t x1, char_t x2)
{
  return (x1 <= x2); // lte
}
bool_t
XATS2CC_char_gte
(char_t x1, char_t x2)
{
  return (x1 >= x2); // gte
}
bool_t
XATS2CC_char_neq
(char_t x1, char_t x2)
{
  return (x1 != x2); // neq
}
/* ****** ****** */
sint_t
XATS2CC_char_cmp
(char_t x1, char_t x2)
{
if
(x1 < x2)
{
  return (-1);
}
else
{
  return (x1 <= x2 ? 0 : 1);
} // end of [if]
}
/* ****** ****** */
//
// prelude/gint.sats
//
/* ****** ****** */
sint_t
XATS2CC_gint_abs_sint
  (sint_t x0)
{
return \
(x0 >= 0)?(x0):(-x0) ;
}
/* ****** ****** */
sint_t
XATS2CC_gint_neg_sint
  (sint_t x0)
{
  return (-x0); // neg
}
/* ****** ****** */
sint_t
XATS2CC_gint_succ_sint
  (sint_t x0)
{
  return (x0 + 1); // +1
}
sint_t
XATS2CC_gint_pred_sint
  (sint_t x0)
{
  return (x0 - 1); // -1
}
/* ****** ****** */
bool_t
XATS2CC_gint_lt_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 < x2); // lt0
}
bool_t
XATS2CC_gint_gt_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 > x2); // gt0
}
bool_t
XATS2CC_gint_eq_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 == x2); // eq0
}
bool_t
XATS2CC_gint_lte_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 <= x2); // lte
}
bool_t
XATS2CC_gint_gte_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 >= x2); // gte
}
bool_t
XATS2CC_gint_neq_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 != x2); // neq
}
/* ****** ****** */
sint_t
XATS2CC_gint_cmp_sint_sint
(sint_t x1, sint_t x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
/* ****** ****** */
sint_t
XATS2CC_gint_add_sint_sint
(sint_t x1, sint_t x2)
{
   return (x1 + x2); // add
}
/* ****** ****** */
sint_t
XATS2CC_gint_sub_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 - x2); // sub
}
/* ****** ****** */
sint_t
XATS2CC_gint_mul_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 * x2); // mul
}
/* ****** ****** */
sint_t
XATS2CC_gint_mod_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 % x2); // mod
}
/* ****** ****** */
sint_t
XATS2CC_gint_div_sint_sint
(sint_t x1, sint_t x2)
{
  return (x1 / x2); // div
}
/* ****** ****** */
//
// prelude/gflt.sats
//
/* ****** ****** */
sflt_t
XATS2CC_gflt_si_sflt
  (sint_t x0)
{
  return x0; // sint
}
dflt_t
XATS2CC_gflt_si_dflt
  (sint_t x0)
{
  return x0; // sint
}
/* ****** ****** */
sflt_t
XATS2CC_gflt_abs_sflt
  (sflt_t x0)
{
return \
(x0 >= 0)?(x0):(-x0);
}
dflt_t
XATS2CC_gflt_abs_dflt
  (dflt_t x0)
{
return \
(x0 >= 0)?(x0):(-x0);
}
/* ****** ****** */
sflt_t
XATS2CC_gflt_neg_sflt
  (sflt_t x0)
{
  return (-x0); // neg
}
dflt_t
XATS2CC_gflt_neg_dflt
  (dflt_t x0)
{
  return (-x0); // neg
}
/* ****** ****** */
sflt_t
XATS2CC_gflt_succ_sflt
  (sflt_t x0)
{
return (x0 + 1); // +1
}
sflt_t
XATS2CC_gflt_pred_sflt
  (sflt_t x0)
{
return (x0 - 1); // -1
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_succ_dflt
  (dflt_t x0)
{
return (x0 + 1); // +1
}
dflt_t
XATS2CC_gflt_pred_dflt
  (dflt_t x0)
{
return (x0 - 1); // -1
}
/* ****** ****** */
bool_t
XATS2CC_gflt_lt_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 < x2); // lt0
}
bool_t
XATS2CC_gflt_gt_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 > x2); // gt0
}
bool_t
XATS2CC_gflt_eq_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 == x2); // eq0
}
bool_t
XATS2CC_gflt_lte_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 <= x2); // lte
}
bool_t
XATS2CC_gflt_gte_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 >= x2); // gte
}
bool_t
XATS2CC_gflt_neq_dflt_dflt
(dflt_t x1, dflt_t x2)
{
return (x1 != x2); // neq
}
/* ****** ****** */
sint_t
XATS2CC_gflt_cmp_dflt_dflt
(dflt_t x1, dflt_t x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_add_dflt_dflt
(dflt_t x1, dflt_t x2)
{
   return (x1 + x2); // add
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_sub_dflt_dflt
(dflt_t x1, dflt_t x2)
{
   return (x1 - x2); // sub
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_mul_dflt_dflt
(dflt_t x1, dflt_t x2)
{
   return (x1 * x2); // mul
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_div_dflt_dflt
(dflt_t x1, dflt_t x2)
{
   return (x1 / x2); // div
}
/* ****** ****** */
// HX: comparison ops
/* ****** ****** */
//
bool_t
XATS2CC_gflt_lt_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_lt_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_gt_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_gt_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_eq_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_eq_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_lte_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_lte_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_gte_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_gte_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_neq_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_neq_dflt_dflt(x0, y0);
}
//
/* ****** ****** */
sint_t
XATS2CC_gflt_cmp_dflt_sint
(dflt_t x0, sint_t y0)
{
return \
XATS2CC_gflt_cmp_dflt_dflt(x0, y0);
}
/* ****** ****** */
//
bool_t
XATS2CC_gflt_lt_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_lt_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_gt_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_gt_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_eq_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_eq_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_lte_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_lte_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_gte_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_gte_dflt_dflt(x0, y0);
}
bool_t
XATS2CC_gflt_neq_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_neq_dflt_dflt(x0, y0);
}
//
/* ****** ****** */
sint_t
XATS2CC_gflt_cmp_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_cmp_dflt_dflt(x0, y0);
}
/* ****** ****** */
// HX: arithmetic ops
/* ****** ****** */
dflt_t
XATS2CC_gflt_add_dflt_sint
( dflt_t x0 , sint_t y0 )
{
return \
XATS2CC_gflt_add_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_sub_dflt_sint
( dflt_t x0 , sint_t y0 )
{
return \
XATS2CC_gflt_sub_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_mul_dflt_sint
( dflt_t x0 , sint_t y0 )
{
return \
XATS2CC_gflt_mul_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_div_dflt_sint
( dflt_t x0 , sint_t y0 )
{
return \
XATS2CC_gflt_div_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_add_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_add_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_sub_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_sub_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_mul_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_mul_dflt_dflt(x0, y0);
}
/* ****** ****** */
dflt_t
XATS2CC_gflt_div_sint_dflt
( sint_t x0 , dflt_t y0 )
{
return \
XATS2CC_gflt_div_dflt_dflt(x0, y0);
}
/* ****** ****** */
//
// prelude/string.sats
//
/* ****** ****** */
//
// HX-2022-01-08:
// Please note that:
// A string is a CC-string
//
/* ****** ****** */
//
bool_t
XATS2CC_string_nilq
  (cstr_t opt)
{
return(opt == "");
}
bool_t
XATS2CC_string_consq
  (cstr_t opt)
{
return(opt != "");
}
/* ****** ****** */
//
bool_t
XATS2CC_stropt_nilq
  (cstr_t opt)
{
return(opt == (cstr_t)0);
}
bool_t
XATS2CC_stropt_consq
  (cstr_t opt)
{
return(opt != (cstr_t)0);
}
//
/* ****** ****** */
sint_t
XATS2CC_string_length
  (cstr_t str)
{
return (sint_t)(strlen(str));
}
/* ****** ****** */
bool_t
XATS2CC_string_lt
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) < 0);
}
bool_t
XATS2CC_string_gt
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) < 0);
}
bool_t
XATS2CC_string_eq
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) == 0);
}
bool_t
XATS2CC_string_lte
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) <= 0);
}
bool_t
XATS2CC_string_gte
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) >= 0);
}
bool_t
XATS2CC_string_neq
(cstr_t x1, cstr_t x2)
{
  return (strcmp(x1, x2) != 0);
}
/* ****** ****** */
sint_t
XATS2CC_string_cmp
(cstr_t x1, cstr_t x2)
{
return strcmp(x1, x2); // string.h
}
/* ****** ****** */

/* end of [prelude_DATS_CATS_CC_basics0.cats] */
